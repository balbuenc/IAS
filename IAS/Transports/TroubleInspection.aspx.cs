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

                        if (Request.QueryString["mode"] != null && Request.QueryString["mode"].Equals("insert"))
                        {

                        }

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
                    ClaimID = long.Parse(dt.Rows[0]["ClaimID"].ToString());
                    txtClaimNumber.Text = dt.Rows[0]["ClaimNumber"].ToString();
                    txtFailureCommissioner.Text = dt.Rows[0]["FailureCommissioner"].ToString();
                    txtFailureCertificateNumber.Text = dt.Rows[0]["FailureCertificateNumber"].ToString();
                    txtInsured.Text = dt.Rows[0]["Client"].ToString();
                    txtCertificateNumber.Text = dt.Rows[0]["CertificateNumber"].ToString();
                    txtDepositHandBook.Text = dt.Rows[0]["Location"].ToString();
                    txtDepositConsignee.Text = dt.Rows[0]["LocationBeneficiary"].ToString();
                }
                else
                {
                    ErrorLabel.Text = "No existen registros del reclamo";
                    ErrorLabel.Visible = true;
                }
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }

        }

        protected void registrarTroubleBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IASDBContext"].ToString());
            SqlCommand cmd = new SqlCommand();

            int troubleInspectionID;
            int rowsAffected;

            try
            {
                if (Request.QueryString["mode"]?.ToString() == "insert")
                {
                    cmd.CommandText = "[transport].[sp_insert_trouble_inspection]";
                    SqlParameter troubleInspectionIDOut = new SqlParameter("@troubleInspectionID", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };

                    cmd.Parameters.Add(troubleInspectionIDOut);
                }
                else
                {
                    cmd.CommandText = "[transport].[sp_update_trouble_inspection]";
                    cmd.Parameters.AddWithValue("@troubleInspectionID", int.Parse(Request.QueryString["troubleInspectionID"]));
                }

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection;

                cmd.Parameters.AddWithValue("@claimID", ClaimID);
                cmd.Parameters.AddWithValue("@inspectionDateHandBook", Convert.ToDateTime(txtInspectionDateHandBook.Value));
                cmd.Parameters.AddWithValue("@directionHandBook", txtDirectionHandBook.Text);
                cmd.Parameters.AddWithValue("@arrivalDateHandBook", Convert.ToDateTime(txtArrivalDateHandBook.Value));
                cmd.Parameters.AddWithValue("@downloadDateHandBook", Convert.ToDateTime(txtDownloadDateHandBook.Value));
                cmd.Parameters.AddWithValue("@presentInVerificationHandBook", txtPresentInVerificationHandBook.Text);
                cmd.Parameters.AddWithValue("@claimAmount", Convert.ToDecimal(txtClaimAmountHandBook.Text));
                cmd.Parameters.AddWithValue("@customsObservationHandBook", txtCustomsObservationHandBook.Text);
                cmd.Parameters.AddWithValue("@inspectionDateConsignee", Convert.ToDateTime(txtInspectionDateConsignee.Value));
                cmd.Parameters.AddWithValue("@directionConsignee", txtDirectionConsignee.Text);
                cmd.Parameters.AddWithValue("@retirementDateConsignee",Convert.ToDateTime(  txtRetirementDateConsignee.Value));
                cmd.Parameters.AddWithValue("@downloadDateConsignee", Convert.ToDateTime(txtDownloadDateConsignee.Value));
                cmd.Parameters.AddWithValue("@presentInVerificationConsignee", txtPresentInVerificationConsignee.Text);
                cmd.Parameters.AddWithValue("@claimAmountBeneficiary", Convert.ToDecimal(txtClaimAmountConsignee.Text));
                cmd.Parameters.AddWithValue("@customsObservationConsignee", txtCustomsObservationConsignee.Text);

                sqlConnection.Open();

                rowsAffected = cmd.ExecuteNonQuery();
              
                sqlConnection.Close();

            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}