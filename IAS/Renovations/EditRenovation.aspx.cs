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
    public partial class EditRenovation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!Page.IsPostBack)
                {
                    
                }

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private void RenovationLoad(int renovationId)
        {
            try
            {



            }
            catch (Exception ex)
            {
                throw;
            }

        }

        private void CommentsLoad()
        {

        }

        protected void TaskCommentsAcceptBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(TasksSqldataSource.ConnectionString);
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

            //ReloadTaskComments();

        }

        protected void btnCommentAdd_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(TasksSqldataSource.ConnectionString);
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

            //ReloadTaskComments();

        }

    }
}