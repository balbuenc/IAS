using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Transports
{
    public partial class Certificate : Page
    {
        public string NroPoliza
        {
            get
            {
                object o = ViewState["NroPoliza"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["NroPoliza"] = value;
            }
        }

        public string PersonaID
        {
            get
            {
                object o = ViewState["PersonaID"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["PersonaID"] = value;
            }
        }

        public string BeneficiaryID
        {
            get
            {
                object o = ViewState["BeneficiaryID"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["BeneficiaryID"] = value;
            }
        }

        public string CertificateNumber
        {
            get
            {
                object o = ViewState["CertificateNumber"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["CertificateNumber"] = value;
            }
        }

        public string CertificateID
        {
            get
            {
                object o = ViewState["CertificateID"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["CertificateID"] = value;
            }
        }

        public string Mode
        {
            get
            {
                object o = ViewState["Mode"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["Mode"] = value;
            }
        }

        private string criteria;
        private string find;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Request.QueryString["criteria"] != null)
                {
                    criteria = Request.QueryString["criteria"].ToString();
                    switch(criteria)
                    {
                        case "Client":
                            txtSearchClient.Attributes["placeholder"] = "Buscar por Cliente";
                            criteriaBtn.InnerText = "Cliente";
                            break;
                        case "ClientDocumentNumber":
                            txtSearchClient.Attributes["placeholder"] = "Buscar por Nro. Documento";
                            criteriaBtn.InnerText = "Nro. Documento";
                            break;

                        default:
                            txtSearchClient.Attributes["placeholder"] = "Buscar por Cliente";
                            criteriaBtn.InnerText = "Cliente";
                            criteria = "Client";
                            break;
                    }
                }
                else
                {
                    criteria = "Client";
                }

            }
            catch(Exception exp)
            {
                txtSearchClient.Attributes["placeholder"] = "Buscar por Nro. Póliza";
                criteriaBtn.InnerText = "Nro. Póliza";
                criteria = "PolicyNumber";
            }

            if(!Page.IsPostBack)
            {

                Mode = Request.QueryString["mode"]?.ToString();

                if(Mode.Equals("update"))
                {
                    //Load data to update

                }

                CertificateNumber = Request.QueryString["CertificateNumber"]?.ToString();
            }
        }

        protected void CertificateFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {


        }

        protected void CertificateFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {

        }

        protected void searchBox_ServerClick(object sender, EventArgs e)
        {

            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[transport].[sp_search_clients]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@find", txtSearchClient.Value);
                cmd.Parameters.AddWithValue("@criteria", criteria);

                da.SelectCommand = cmd;

                da.Fill(dt);

                gridClients.DataSource = dt;
                gridClients.DataBind();

                ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModalClients();", true);

            }
            catch(Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }

        }

        protected void gridClients_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            switch(e.CommandName)
            {
                case "seleccionar":
                    string[] values = e.CommandArgument.ToString().Split('|');

                    string numero_documento = values[0];
                    string cliente = values[1];
                    string razonSocial = values[2];
                    string personaID = values[3];

                    lblNroDocumento.Text = numero_documento;
                    lblCliente.Text = cliente;
                    lblRazonSocial.Text = razonSocial;
                    PersonaID = personaID;
                    BeneficiaryID = personaID;

                    divClientData.Visible = true;

                    break;
                default:
                    break;

            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            int rowsAffected;

            try
            {
                cmd.CommandText = "[transport].[sp_insert_certificate]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@CertificateNumber", txtCertificateNumber.Text);
                cmd.Parameters.AddWithValue("@PersonID", PersonaID);
                cmd.Parameters.AddWithValue("@InsuranceManagerID", ddlInsuranceManager.SelectedValue);
                cmd.Parameters.AddWithValue("@PolicyNumber", ddlPolicy.SelectedValue);
                cmd.Parameters.AddWithValue("@BeneficiaryID", BeneficiaryID);
                cmd.Parameters.AddWithValue("@PartnerID", ddlPartners.SelectedValue);
                cmd.Parameters.AddWithValue("@PartnerAmmountPercent", txtPartnerAmmountPercent.Text);
                cmd.Parameters.AddWithValue("@ContactID", ddlContact.SelectedValue);
                cmd.Parameters.AddWithValue("@RiskName", txtRiskName.Text);
                cmd.Parameters.AddWithValue("@PackageCount", txtPackageCount.Text);
                cmd.Parameters.AddWithValue("@Origin", txtOrigin.Text);
                cmd.Parameters.AddWithValue("@Destination", txtDestination.Text);
                cmd.Parameters.AddWithValue("@TransportationMethodID", ddlTransportationMethod.SelectedValue);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Premium", txtPremium.Text);
                cmd.Parameters.AddWithValue("@PremiunmPlusTax", txtPremiunmPlusTax.Text);
                cmd.Parameters.AddWithValue("@CapitalAmount", txtCapitalAmount.Text);
                cmd.Parameters.AddWithValue("@Rate", txtRate.Text);
                cmd.Parameters.AddWithValue("@SpendingPercent", txtSpendingPercent.Text);
                cmd.Parameters.AddWithValue("@Spending", txtSpending.Text);
                cmd.Parameters.AddWithValue("@ComissionASSAPercent", txtComissionASSAPercent.Text);
                cmd.Parameters.AddWithValue("@ComissionAdviserPercent", txtComissionAdviserPercent.Text);
                cmd.Parameters.AddWithValue("@AgentID", ddlAgent.SelectedValue);
                cmd.Parameters.AddWithValue("@ComissionPercent", txtComissionPercent.Text);
                cmd.Parameters.AddWithValue("@ComissionAmount", txtComissionAmount.Text);
                cmd.Parameters.AddWithValue("@ComissionSellerPercent", txtComissionSellerPercent.Text);
                cmd.Parameters.AddWithValue("@ComissionSellerAmount", txtComissionSellerAmount.Text);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

                Response.Redirect("Certificates.aspx");

            }
            catch(Exception ex)
            {
                ErrorLabel.Text = ex.InnerException.ToString();
                ErrorLabel.Visible = true;
                throw;
            }

        }
    }
}