using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Tasks
{
    public partial class Tasks : Page
    {
        public string Operacion
        {
            get
            {
                object o = ViewState["Operacion"];
                if (o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["Operacion"] = value;
            }
        }
        public int TaskID
        {
            get
            {
                object o = ViewState["TaskID"];
                if (o == null)
                    return 0;
                return (int)o;
            }
            set
            {
                ViewState["TaskID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (User.Identity.Name != string.Empty)
                {
                    TasksLoad();
                }
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            TasksLoad();
        }

        protected void TasksListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Editar":
                        lblTitulo.Text = "editar tarea";
                        Operacion = "update";
                        GetTask(int.Parse(e.CommandArgument.ToString()));
                        ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModalTask();", true);
                        break;
                    case "Eliminar":
                        DeleteTask(int.Parse(e.CommandArgument.ToString()));

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

        private void DeleteTask(int taskID)
        {
            SqlConnection sqlConnection1 = new SqlConnection(TasksSqldataSource.ConnectionString);

            SqlCommand cmd = new SqlCommand();

            try
            {
                cmd.CommandText = "[task].[sp_delete_task_by_taskId]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@taskID", taskID);

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

            TasksLoad();

        }

        private void GetTask(int taskID)
        {
            SqlConnection sqlConnection1 = new SqlConnection(TasksSqldataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[task].[sp_get_task_by_taskId]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@taskID", taskID);

                da.SelectCommand = cmd;

                da.Fill(dt);

                if (dt?.Rows.Count > 0)
                {
                    TaskID = int.Parse(dt.Rows[0]["TaskID"].ToString());
                    txtTarea.Text = dt.Rows[0]["TaskName"].ToString();
                    txtDescripcion.Text = dt.Rows[0]["TaskDescription"].ToString();
                    txtFechaInicio.Value = dt.Rows[0]["StartDate"].ToString();
                    txtFechaVencimiento.Value = dt.Rows[0]["DueDate"].ToString();
                    ddlPrioridad.SelectedValue = dt.Rows[0]["TaskPriorityID"].ToString();
                    ddlEstado.SelectedValue = dt.Rows[0]["TaskStateID"].ToString();
                    ddlTipoTarea.SelectedValue = dt.Rows[0]["TaskTypeID"].ToString();
                    ddlUsuario.SelectedValue = dt.Rows[0]["UserID"].ToString();
                    txtPorcentaje.Text = dt.Rows[0]["PercentComplete"].ToString();
                }

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = "Error a ejecutar busqueda.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        void TasksLoad()
        {
            string find;
            int priorityID;
            int stateID;
            
            DateTime? startDate = null,
                     endDate = null;

            if (!string.IsNullOrEmpty(dpStart.Value))
            {
                startDate = DateTime.Parse(dpStart.Value);
            }

            if (!string.IsNullOrEmpty(dpEnd.Value))
            {
                endDate = DateTime.Parse(dpEnd.Value);
            }

            if (txtSearchTask.Text == string.Empty)
                find = string.Empty;
            else
            {
                find = txtSearchTask.Text;
            }

            priorityID = int.Parse(ddlTaskPriority.SelectedValue);
            stateID = int.Parse(ddlTaskState.SelectedValue);
            
            SqlConnection sqlConnection1 = new SqlConnection(TasksSqldataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[task].[sp_search_tasks]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@find", find);
                cmd.Parameters.AddWithValue("@user", User.Identity.Name);
                cmd.Parameters.AddWithValue("@priorityID", priorityID);
                cmd.Parameters.AddWithValue("@stateID", stateID);

                cmd.Parameters.Add("@startDate", SqlDbType.DateTime).Value = startDate;
                cmd.Parameters.Add("@endDate", SqlDbType.DateTime).Value = endDate;

                da.SelectCommand = cmd;
                
                da.Fill(dt);

                TasksListView.DataSourceID = string.Empty;
                TasksListView.DataSource = dt;
                TasksListView.DataBind();

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = "Error a ejecutar busqueda.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void btnNewTask_ServerClick(object sender, EventArgs e)
        {
            lblTitulo.Text = "Nueva tarea";
            Operacion = "new";
         
            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModalTask();", true);
        }


        void Clean()
        {
            txtTarea.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            ddlTipoTarea.SelectedIndex = 0;
            ddlUsuario.SelectedIndex = 0;
            txtFechaInicio.Value = string.Empty;
            txtFechaVencimiento.Value = string.Empty;
            ddlPrioridad.SelectedIndex = 0;
            ddlEstado.SelectedIndex = 0;
            txtPorcentaje.Text = string.Empty;
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            string taskName;
            string taskDescription;
            float percentComplete = 0;
            int taskPriorityID;
            int taskStateID;
            int taskTypeID;
            string userID;
            int rowsAffected;
            DateTime startDate,
                     dueDate;

            SqlConnection sqlConnection1 = new SqlConnection(TasksSqldataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlConnection1;

            try
            {

                taskName = txtTarea.Text;
                taskDescription = txtDescripcion.Text;
                taskPriorityID = int.Parse(ddlPrioridad.SelectedValue);
                taskStateID = int.Parse(ddlEstado.SelectedValue);
                taskTypeID = int.Parse(ddlTipoTarea.SelectedValue);
                userID = ddlUsuario.SelectedValue;
                startDate = DateTime.Parse(txtFechaInicio.Value);
                dueDate = DateTime.Parse(txtFechaVencimiento.Value);

                switch (Operacion)
                {
                    case "new":
                        cmd.CommandText = "[task].[sp_new_task]";
                        break;
                    case "update":
                        cmd.CommandText = "[task].[sp_update_task]";
                        percentComplete = float.Parse(txtPorcentaje.Text);
                        cmd.Parameters.AddWithValue("@taskID", TaskID);
                        break;
                    default:
                        break;
                }

                cmd.Parameters.AddWithValue("@taskName", taskName);
                cmd.Parameters.AddWithValue("@taskDescription", taskDescription);
                cmd.Parameters.AddWithValue("@user", User.Identity.Name);
                cmd.Parameters.AddWithValue("@taskPriorityID", taskPriorityID);
                cmd.Parameters.AddWithValue("@taskStateID", taskStateID);
                cmd.Parameters.AddWithValue("@taskTypeID", taskTypeID);
                cmd.Parameters.AddWithValue("@userID", userID);
                cmd.Parameters.Add("@startDate", SqlDbType.DateTime).Value = startDate;
                cmd.Parameters.Add("@dueDate", SqlDbType.DateTime).Value = dueDate;
                cmd.Parameters.AddWithValue("@percentComplete", percentComplete);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

            }
            catch (Exception exp)
            {
                sqlConnection1.Close();
                ErrorLabel.Text = "Error a ejecutar la operación.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }

            Clean();
            TasksLoad();
        }
    }
}