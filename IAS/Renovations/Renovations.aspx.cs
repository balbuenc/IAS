using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Renovations
{
    public partial class Renovations : System.Web.UI.Page
    {
        public long PolicyNumber
        {
            get
            {
                object o = ViewState["PolicyNumber"];
                if (o == null)
                {
                    return 0;
                }
                return (int)o;
            }
            set
            {
                ViewState["PolicyNumber"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            {
                RenovationsLoad();
            }
        }

        void RenovationsLoad()
        {
            SqlConnection sqlConnection1 = new SqlConnection(RenovationsSqldataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {
                int status = (ddlStatus.SelectedValue == string.Empty) ? 1 : int.Parse(ddlStatus.SelectedValue);
                cmd.CommandText = "[commercial].[sp_get_policy_renovation]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;
                cmd.Parameters.AddWithValue("@PolicyRenovationStatusID", status);
                cmd.Parameters.AddWithValue("@PolicyNumber", PolicyNumber);

                da.SelectCommand = cmd;

                da.Fill(dt);

                RenovationsListView.DataSourceID = string.Empty;
                RenovationsListView.DataSource = dt;
                RenovationsListView.DataBind();

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = "Error a ejecutar busqueda.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            RenovationsLoad();
        }

        protected void btnSearchPolicy_ServerClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchPolicy.Text))
            {
                string[] data = txtSearchPolicy.Text.Split('|');
                PolicyNumber = long.Parse(data[3]);
            }
        }

        protected void RenovationsListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblStatus = (Label)e.Item.FindControl("lblStatus");
                LinkButton avanzarButton = (LinkButton)e.Item.FindControl("AvanzarButton");
                LinkButton rechazarButton = (LinkButton)e.Item.FindControl("RechazarButton");

                switch (lblStatus.Text.ToUpper())
                {
                  
                    case "APROBADO":
                    case "RECHAZADO":
                        avanzarButton.Visible = false;
                        rechazarButton.Visible = false;
                        break;
                    default:
                        avanzarButton.Visible = true;
                        rechazarButton.Visible = true;
                        break;
                }
            }
        }

        protected void RenovationsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Comentarios":
                        hf_TaskID.Value = e.CommandArgument.ToString();
                        ReloadTaskComments();
                        break;
                    case "Avanzar":
                        string[] data = e.CommandArgument.ToString().Split(';');

                        Avanzar(int.Parse(data[0]), int.Parse(data[1]), int.Parse(data[2]), data[3]);
                        break;
                    case "Rechazar":
                        string[] dataDelete = e.CommandArgument.ToString().Split(';');
                        Rechazar(int.Parse(dataDelete[0]), int.Parse(dataDelete[1]));
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = "Error a ejecutar la operación.. : " + ex.Message;
                ErrorLabel.Visible = true;
            }
        }

        private void Rechazar(int renovationID , int taskID)
        {
            lblSiguienteEstado.Text = "CERRADO";
            hf_RenovationID.Value = renovationID.ToString();
            hf_RenovationStatusID.Value = "0";
            hf_TaskID.Value = taskID.ToString();

            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModalNextStatus();", true);
        }

        private void Avanzar(int renovationID, int status, int taskID, string statusDescripcion)
        {
            SqlConnection sqlConnection1 = new SqlConnection(RenovationsSqldataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            hf_RenovationID.Value = renovationID.ToString();
            hf_RenovationStatusID.Value = status.ToString();
            hf_TaskID.Value = taskID.ToString();
            hf_status.Value = statusDescripcion;

            try
            {
               
                cmd.CommandText = "[commercial].[sp_get_nextStatus]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;
                cmd.Parameters.AddWithValue("@RenovationID", renovationID);

                da.SelectCommand = cmd;

                da.Fill(dt);

                if (dt != null && dt.Rows.Count > 0)
                {
                    lblSiguienteEstado.Text = dt.Rows[0]["Status"].ToString();
                }

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = "Error a ejecutar busqueda.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModalNextStatus();", true);
          
        }

        private void ReloadTaskComments()
        {
            txtComments.Text = "";
            grdTaskComments.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModalTaskComments();", true);
        }

        protected void btnCommentAdd_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(TaskCommentsDataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlConnection1;

            try
            {

                cmd.CommandText = "[task].[sp_insert_TaskComment]";

                cmd.Parameters.AddWithValue("@TaskID", hf_TaskID.Value);
                cmd.Parameters.AddWithValue("@UserName", User.Identity.Name);
                cmd.Parameters.AddWithValue("@Comment", txtComments.Text);

                cmd.Parameters.Add("@CommentDate", SqlDbType.DateTime).Value = DateTime.Now;
                sqlConnection1.Open();
                cmd.ExecuteNonQuery();
                sqlConnection1.Close();

            }
            catch (Exception exp)
            {
                sqlConnection1.Close();
                ErrorLabel.Text = "Error a ejecutar la operación.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }

            ReloadTaskComments();

        }

        protected void grdTaskComments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
                DeleteTaskComment(int.Parse(e.CommandArgument.ToString()));
        }

        private void DeleteTaskComment(int TaskCommentID)
        {
            SqlConnection sqlConnection1 = new SqlConnection(TaskCommentsDataSource.ConnectionString);

            SqlCommand cmd = new SqlCommand();

            try
            {
                cmd.CommandText = "[task].[sp_delete_TaskComment]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;


                cmd.Parameters.AddWithValue("@TaskCommentID", TaskCommentID);


                sqlConnection1.Open();
                cmd.ExecuteNonQuery();
                sqlConnection1.Close();

            }
            catch (Exception exp)
            {
                sqlConnection1.Close();
                ErrorLabel.Text = "Error a ejecutar busqueda.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }

            ReloadTaskComments();

        }

        protected void TaskCommentsAcceptBtn_Click(object sender, EventArgs e)
        {
            //Response.Redirect("/Tasks/Tasks.aspx");
        }

        protected void SiguienteEstadoButton_Click(object sender, EventArgs e)
        {

            SqlConnection sqlConnection1 = new SqlConnection(TaskCommentsDataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlConnection1;

            bool cerrar = false;

            if (hf_RenovationStatusID.Value == "0")
            {
                cerrar = true;
            }

            try
            {

                cmd.CommandText = "[commercial].[sp_update_nextStatus]";

                cmd.Parameters.AddWithValue("@RenovationID", hf_RenovationID.Value);
                cmd.Parameters.AddWithValue("@StatusID", hf_RenovationStatusID.Value);
                cmd.Parameters.AddWithValue("@Cerrar", cerrar);
             
                sqlConnection1.Open();
                cmd.ExecuteNonQuery();
                sqlConnection1.Close();


                cmd = new SqlCommand();
                sqlConnection1 = new SqlConnection(TaskCommentsDataSource.ConnectionString);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.CommandText = "[task].[sp_insert_TaskComment]";

                cmd.Parameters.AddWithValue("@TaskID", hf_TaskID.Value);
                cmd.Parameters.AddWithValue("@UserName", User.Identity.Name);
                cmd.Parameters.AddWithValue("@Comment", $"De estado {hf_status.Value} a {lblSiguienteEstado.Text} - Usuario: {User.Identity.Name}");

                cmd.Parameters.Add("@CommentDate", SqlDbType.DateTime).Value = DateTime.Now;
                sqlConnection1.Open();
                cmd.ExecuteNonQuery();
                sqlConnection1.Close();


                RenovationsLoad();

            }
            catch (Exception exp)
            {
                sqlConnection1.Close();
                ErrorLabel.Text = "Error a ejecutar la operación.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }
                      
        }
    }
}