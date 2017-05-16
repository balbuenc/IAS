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
            if (!Page.IsPostBack)
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
                int status = (ddlStatus.SelectedValue == string.Empty) ? -1 : int.Parse(ddlStatus.SelectedValue);
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
    }
}