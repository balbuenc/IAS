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

        public string Mode
        {
            get
            {
                object o = ViewState["Mode"];
                if (o == null)
                    return "insert";
                return (string)o;
            }
            set
            {
                ViewState["Mode"] = value;
            }
        }

        public long TroubleInspectionID
        {
            get
            {
                object o = ViewState["TroubleInspectionID"];
                if (o == null)
                    return 0;
                return (long)o;
            }
            set
            {
                ViewState["TroubleInspectionID"] = value;
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

                    throw ex;
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
                    txtDepositPort.Text = dt.Rows[0]["Location"].ToString();
                    txtDepositConsignee.Text = dt.Rows[0]["LocationBeneficiary"].ToString();
                }


                // Verificamos si ya tiene un registro
                cmd = new SqlCommand();
                da = new SqlDataAdapter();
                dt = new DataTable();

                cmd.CommandText = "[transport].[sp_get_trouble_inspection_by_claimID]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@claimID", long.Parse(Request.QueryString["claimID"].ToString()));

                da.SelectCommand = cmd;

                da.Fill(dt);
                if (dt?.Rows.Count > 0)
                {
                    Mode = "update";

                    TroubleInspectionID = long.Parse(dt.Rows[0]["TroubleInspectionID"].ToString());

                    // Portuario
                    txtInspectionDatePort.Value = dt.Rows[0]["InspectionDatePort"].ToString();
                    txtDirectionPort.Text = dt.Rows[0]["DirectionPort"].ToString();
                    txtArrivalDatePort.Value = dt.Rows[0]["ArrivalDatePort"].ToString();
                    txtDownloadDatePort.Value = dt.Rows[0]["DownloadDatePort"].ToString();
                    txtPresentInVerificationPort.Text = dt.Rows[0]["PresentInVerificationPort"].ToString();
                    txtClaimAmountPort.Text = dt.Rows[0]["ClaimAmount"].ToString();
                    txtCustomsObservationPort.Text = dt.Rows[0]["CustomsObservationPort"].ToString();

                    // Destinatario
                    txtInspectionDateConsignee.Value = dt.Rows[0]["InspectionDateConsignee"].ToString();
                    txtDirectionConsignee.Text = dt.Rows[0]["DirectionConsignee"].ToString();
                    txtRetirementDateConsignee.Value = dt.Rows[0]["RetirementDateConsignee"].ToString();
                    txtDownloadDateConsignee.Value = dt.Rows[0]["DownloadDateConsignee"].ToString();
                    txtPresentInVerificationConsignee.Text = dt.Rows[0]["PresentInVerificationConsignee"].ToString();
                    txtClaimAmountConsignee.Text = dt.Rows[0]["ClaimAmountBeneficiary"].ToString();
                    txtCustomsObservationConsignee.Text = dt.Rows[0]["CustomsObservationConsignee"].ToString();

                }
                else
                {
                    Mode = "insert";
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

            //int troubleInspectionID;
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
                    cmd.Parameters.AddWithValue("@troubleInspectionID", TroubleInspectionID);
                }

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection;

                cmd.Parameters.AddWithValue("@claimID", ClaimID);
                cmd.Parameters.AddWithValue("@inspectionDatePort", Convert.ToDateTime(txtInspectionDatePort.Value));
                cmd.Parameters.AddWithValue("@directionPort", txtDirectionPort.Text);
                cmd.Parameters.AddWithValue("@arrivalDatePort", Convert.ToDateTime(txtArrivalDatePort.Value));
                cmd.Parameters.AddWithValue("@downloadDatePort", Convert.ToDateTime(txtDownloadDatePort.Value));
                cmd.Parameters.AddWithValue("@presentInVerificationPort", txtPresentInVerificationPort.Text);
                cmd.Parameters.AddWithValue("@claimAmount", Convert.ToDecimal(txtClaimAmountPort.Text));
                cmd.Parameters.AddWithValue("@customsObservationPort", txtCustomsObservationPort.Text);
                cmd.Parameters.AddWithValue("@inspectionDateConsignee", Convert.ToDateTime(txtInspectionDateConsignee.Value));
                cmd.Parameters.AddWithValue("@directionConsignee", txtDirectionConsignee.Text);
                cmd.Parameters.AddWithValue("@retirementDateConsignee",Convert.ToDateTime(txtRetirementDateConsignee.Value));
                cmd.Parameters.AddWithValue("@downloadDateConsignee", Convert.ToDateTime(txtDownloadDateConsignee.Value));
                cmd.Parameters.AddWithValue("@presentInVerificationConsignee", txtPresentInVerificationConsignee.Text);
                cmd.Parameters.AddWithValue("@claimAmountBeneficiary", Convert.ToDecimal(txtClaimAmountConsignee.Text));
                cmd.Parameters.AddWithValue("@customsObservationConsignee", txtCustomsObservationConsignee.Text);

                sqlConnection.Open();

                rowsAffected = cmd.ExecuteNonQuery();
              
                sqlConnection.Close();

                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx");
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}