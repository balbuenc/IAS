using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IAS.Transports
{
    public partial class TroubleInspection : Page
    {
        public long ClaimID
        {
            get
            {
                object o = ViewState["ClaimID"];
                if (o == null)
                    return 0;
                return (long)o;
            }
            set
            {
                ViewState["ClaimID"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)
            {
                try
                {
                    if (Request.QueryString["claimID"] != null)
                    {
                        ClaimID = long.Parse(Request.QueryString["claimID"].ToString());
                        LoadClaim();

                    }
                }
                catch (Exception ex)
                {

                    throw;
                }

            }


        }

        private void LoadClaim()
        {
            SqlConnection sqlConnection1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IASDBContext"].ToString());
            SqlCommand cmd = new SqlCommand();

            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[transport].[sp_get_claim_by_claimID]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@claimID", long.Parse(Request.QueryString["claimID"].ToString()));

                da.SelectCommand = cmd;

                da.Fill(dt);

                // Load claim
                if (dt?.Rows.Count > 0)
                {
                    txtClaimNumber.Text = dt.Rows[0]["ClaimID"].ToString();
                    txtFailureCommissioner.Text = dt.Rows[0]["FailureCommissioner"].ToString();
                    txtFailureCertificateNumber.Text = dt.Rows[0]["FailureCertificateNumber"].ToString();
                    txtInsured.Text = dt.Rows[0]["Client"].ToString();
                    txtCertificateNumber.Text = dt.Rows[0]["CertificateNumber"].ToString();

                }
                else
                {
                    ErrorLabel.Text = "No existen registros del certificado";
                    ErrorLabel.Visible = true;
                }
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }

        }
    }
}