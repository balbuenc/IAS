using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Transports
{
    public partial class Certificates : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CertificateListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch(e.CommandName)
            {
                case "Edit":
                    Response.Redirect("Certificate.aspx?criteria=Client&mode=update&certificateID=" + e.CommandArgument);
                    break;
                case "Delete":
                    break;
                case "Collection":
                    Response.Redirect("Collection.aspx?criteria=Client&mode=update&certificateID=" + e.CommandArgument);
                    break;
                default:
                    break;
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            try
            {
                SearchCertificates();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void SearchCertificates()
        {

            string criteria,
                   myClaims,
                   claimStatusId;

            int certificateID = 0;
            string[] data; 

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

            if (txtSearchCertificate.Text.Length > 0)
            {
                data = txtSearchCertificate.Text.Split('|');
                if (data[1] != null)
                {
                    certificateID = int.Parse(data[1]);
                }
            }

            criteria = "Client";
            myClaims = ddlMyClaims.SelectedValue;
            claimStatusId = ddlStatus.SelectedValue;

            SqlConnection sqlConnection1 = new SqlConnection(CertificateDataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[transport].[sp_search_certificates]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@certificateID", certificateID);
                cmd.Parameters.AddWithValue("@criteria", criteria);
                cmd.Parameters.AddWithValue("@myClaims", myClaims);
                cmd.Parameters.AddWithValue("@claimStatusId", claimStatusId);

                cmd.Parameters.Add("@startDate", SqlDbType.DateTime).Value = startDate;
                cmd.Parameters.Add("@endDate", SqlDbType.DateTime).Value = endDate;

                da.SelectCommand = cmd;

                da.Fill(dt);

                CertificateListView.DataSourceID = string.Empty;
                CertificateListView.DataSource = dt;
                CertificateListView.DataBind();

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = "Error a ejecutar busqueda.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}