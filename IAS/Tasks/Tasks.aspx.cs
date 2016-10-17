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
        protected void Page_Init(object sender, EventArgs e)
        {

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
    }
}