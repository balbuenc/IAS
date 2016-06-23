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

        public Int64 PersonaID
        {
            get
            {
                object o = ViewState["PersonaID"];
                if(o == null)
                    return 0;
                return (Int64)o;
            }
            set
            {
                ViewState["PersonaID"] = value;
            }
        }

        public Int64 BeneficiaryID
        {
            get
            {
                object o = ViewState["BeneficiaryID"];
                if(o == null)
                    return 0;
                return (Int64)o;
            }
            set
            {
                ViewState["BeneficiaryID"] = value;
            }
        }

        public Int64 CertificateNumber
        {
            get
            {
                object o = ViewState["CertificateNumber"];
                if(o == null)
                    return 0;
                return (Int64)o;
            }
            set
            {
                ViewState["CertificateNumber"] = value;
            }
        }

        private string criteria;
        private string find;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
            catch(Exception exp)
            {
                txtSearchClient.Attributes["placeholder"] = "Buscar por Nro. Póliza";
                criteriaBtn.InnerText = "Nro. Póliza";
                criteria = "PolicyNumber";
            }

            if(!Page.IsPostBack)
            {

                if(Request.QueryString["mode"] == null)
                {
                    throw new NullReferenceException("El modo del formulario no se ha definido");
                }

                if(Request.QueryString["mode"].ToString().Equals("update"))
                {
                    //Load data to update
                    LoadCertificates();
                }
            }
        }

        private void LoadCertificates()
        {

            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[transport].[sp_get_certificate_by_collectionID]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@certificateID", long.Parse(Request.QueryString["certificateID"].ToString()));

                da.SelectCommand = cmd;

                da.Fill(dt);

                // Load certificate
                if(dt != null)
                {
                    divClientData.Visible = true;
                    lblNroDocumento.Text = dt.Rows[0]["numero_documento"].ToString();
                    lblCliente.Text = dt.Rows[0]["cliente"].ToString();
                    lblRazonSocial.Text = dt.Rows[0]["razon_social"].ToString();
                    PersonaID = Convert.ToInt64(dt.Rows[0]["PersonID"].ToString());
                    BeneficiaryID = Convert.ToInt64(dt.Rows[0]["PersonID"].ToString());
                    txtCertificateNumber.Text = dt.Rows[0]["CertificateNumber"].ToString();
                    //txtPartnerAmmountPercent.Text = dt.Rows[0]["PartnerAmmountPercent"].ToString();
                    txtRiskName.Text = dt.Rows[0]["RiskName"].ToString();
                    ddlInsuranceManager.SelectedValue = (dt.Rows[0]["InsuranceManagerID"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["InsuranceManagerID"].ToString();
                    //ddlPartners.SelectedValue = (dt.Rows[0]["PartnerID"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["PartnerID"].ToString();
                    ddlPolicy.SelectedValue = (dt.Rows[0]["PolicyNumber"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["PolicyNumber"].ToString();
                    ddlContact.SelectedValue = (dt.Rows[0]["ContactID"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["ContactID"].ToString();
                    ddlTransportationMethod.SelectedValue = (dt.Rows[0]["TransportationMethodID"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["TransportationMethodID"].ToString();
                    txtPackageCount.Text = dt.Rows[0]["PackageCount"].ToString();
                    txtOrigin.Text = dt.Rows[0]["Origin"].ToString();
                    txtDestination.Text = dt.Rows[0]["Destination"].ToString();
                    txtDescription.Text = dt.Rows[0]["Description"].ToString();
                    txtPremium.Text = dt.Rows[0]["Premium"].ToString();
                    txtPremiunmPlusTax.Text = dt.Rows[0]["PremiunmPlusTax"].ToString();
                    txtCapitalAmount.Text = dt.Rows[0]["CapitalAmount"].ToString();
                    txtRate.Text = dt.Rows[0]["Rate"].ToString();
                    txtSpendingPercent.Text = dt.Rows[0]["SpendingPercent"].ToString();
                    txtSpending.Text = dt.Rows[0]["Spending"].ToString();
                    txtComissionASSAPercent.Text = dt.Rows[0]["ComissionASSAPercent"].ToString();
                    txtComissionAdviserPercent.Text = dt.Rows[0]["ComissionAdviserPercent"].ToString();
                    ddlCurrency.SelectedValue = (dt.Rows[0]["CurrencyID"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["CurrencyID"].ToString();
                    txtBeneficiary.Text = dt.Rows[0]["Beneficiary"].ToString();
                    txtEmissionDate.Text = Convert.ToDateTime(dt.Rows[0]["EmissionDate"].ToString()).ToString("yyyy-MM-dd");
                    txtExtensionDate.Text = Convert.ToDateTime(dt.Rows[0]["ExtensionDate"].ToString()).ToString("yyyy-MM-dd");
                }
            }
            catch(Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
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
                    long personaID = long.Parse(values[3]);

                    lblNroDocumento.Text = numero_documento;
                    lblCliente.Text = cliente;
                    lblRazonSocial.Text = razonSocial;
                    PersonaID = personaID;
                    BeneficiaryID = personaID;
                    txtBeneficiary.Text = cliente;

                    divClientData.Visible = true;

                    break;
                default:
                    break;

            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if(Request.QueryString["mode"] != null)
            {
                SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
                SqlCommand cmd = new SqlCommand();

                int rowsAffected;

                try
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlConnection1;

                    if(Request.QueryString["mode"].ToString().Equals("update"))
                    {
                        if(Request.QueryString["certificateID"] == null)
                        {
                            ErrorLabel.Text = "No se puede actualizar sin conocer el ID de Certificado";
                            ErrorLabel.Visible = true;
                            return;
                        }

                        cmd.CommandText = "[transport].[sp_update_certificate]";
                        cmd.Parameters.AddWithValue("@CertificateID", long.Parse(Request.QueryString["certificateID"].ToString()));
                    }
                    else if(Request.QueryString["mode"].ToString().Equals("insert"))
                    {
                        cmd.CommandText = "[transport].[sp_insert_certificate]";
                    }

                    if(PersonaID == 0)
                    {
                        ErrorLabel.Text = "No se ha seleccionado al cliente";
                        ErrorLabel.Visible = true;
                        txtSearchClient.Focus();
                        return;
                    }

                    long certificateNumber = 0;
                    long.TryParse(txtCertificateNumber.Text, out certificateNumber);
                    int insuranceManager = 0;
                    int.TryParse(ddlInsuranceManager.SelectedValue, out insuranceManager);
                    int policy = 0;
                    int.TryParse(ddlPolicy.SelectedValue, out policy);
                    int contact = 0;
                    int.TryParse(ddlContact.SelectedValue, out contact);
                    decimal packageCount = 0;
                    decimal.TryParse(txtPackageCount.Text, out packageCount);
                    int transportationMethod = 0;
                    int.TryParse(ddlTransportationMethod.SelectedValue, out transportationMethod);
                    decimal premium = 0;
                    decimal.TryParse(txtPremium.Text, out premium);
                    decimal premiunmPlusTax = 0;
                    decimal.TryParse(txtPremiunmPlusTax.Text, out premiunmPlusTax);
                    decimal capitalAmount = 0;
                    decimal.TryParse(txtCapitalAmount.Text, out capitalAmount);
                    decimal rate = 0;
                    decimal.TryParse(txtRate.Text, out rate);
                    decimal spendingPercent = 0;
                    decimal.TryParse(txtSpendingPercent.Text, out spendingPercent);
                    decimal spending = 0;
                    decimal.TryParse(txtSpending.Text, out spending);
                    decimal comissionASSAPercent = 0;
                    decimal.TryParse(txtComissionASSAPercent.Text, out comissionASSAPercent);
                    decimal comissionAdviserPercent = 0;
                    decimal.TryParse(txtComissionAdviserPercent.Text, out comissionAdviserPercent);
                    int currency = 0;
                    int.TryParse(ddlCurrency.SelectedValue, out currency);

                    DateTime emissionDate = DateTime.Now;
                    if(!string.IsNullOrEmpty(txtEmissionDate.Text))
                    {
                        DateTime.TryParse(txtEmissionDate.Text, out emissionDate);
                    }

                    DateTime extensionDate = DateTime.Now;
                    if(!string.IsNullOrEmpty(txtExtensionDate.Text))
                    {
                        DateTime.TryParse(txtExtensionDate.Text, out extensionDate);
                    }

                    cmd.Parameters.AddWithValue("@CertificateNumber", certificateNumber);
                    cmd.Parameters.AddWithValue("@PersonID", PersonaID);
                    cmd.Parameters.AddWithValue("@InsuranceManagerID", insuranceManager);
                    cmd.Parameters.AddWithValue("@PolicyNumber", policy);
                    cmd.Parameters.AddWithValue("@BeneficiaryID", BeneficiaryID);
                    //cmd.Parameters.AddWithValue("@PartnerID", Convert.ToInt32(ddlPartners.SelectedValue));
                    //cmd.Parameters.AddWithValue("@PartnerAmmountPercent", Convert.ToDecimal(txtPartnerAmmountPercent.Text));
                    cmd.Parameters.AddWithValue("@ContactID", contact);
                    cmd.Parameters.AddWithValue("@RiskName", txtRiskName.Text);
                    cmd.Parameters.AddWithValue("@PackageCount", packageCount);
                    cmd.Parameters.AddWithValue("@Origin", txtOrigin.Text);
                    cmd.Parameters.AddWithValue("@Destination", txtDestination.Text);
                    cmd.Parameters.AddWithValue("@TransportationMethodID", transportationMethod);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Premium", premium);
                    cmd.Parameters.AddWithValue("@PremiunmPlusTax", premiunmPlusTax);
                    cmd.Parameters.AddWithValue("@CapitalAmount", capitalAmount);
                    cmd.Parameters.AddWithValue("@Rate", rate);
                    cmd.Parameters.AddWithValue("@SpendingPercent", spendingPercent);
                    cmd.Parameters.AddWithValue("@Spending", spending);
                    cmd.Parameters.AddWithValue("@ComissionASSAPercent", comissionASSAPercent);
                    cmd.Parameters.AddWithValue("@ComissionAdviserPercent", comissionAdviserPercent);
                    cmd.Parameters.AddWithValue("@CurrencyID", currency);
                    cmd.Parameters.AddWithValue("@Beneficiary", txtBeneficiary.Text);
                    cmd.Parameters.AddWithValue("@EmissionDate", emissionDate);
                    cmd.Parameters.AddWithValue("@ExtensionDate", extensionDate);
                    cmd.Parameters.AddWithValue("@Status", "Activo");

                    sqlConnection1.Open();

                    rowsAffected = cmd.ExecuteNonQuery();

                    sqlConnection1.Close();


                    Response.Redirect("Certificates.aspx");

                }
                catch(Exception ex)
                {
                    ErrorLabel.Text = ex.ToString();
                    ErrorLabel.Visible = true;
                }

            }
        }
    }



}