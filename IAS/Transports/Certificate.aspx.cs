using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
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
                    SiteLabel.InnerText = "Certificado (Actualización)";
                    //divAgentCommission.Visible = true;
                }
                else
                {
                    SiteLabel.InnerText = "Certificado (Nuevo)";
                    txtCertificateNumber.Text = GetNextCertificateNumber();
                    //divAgentCommission.Visible = false;
                    SetRates();

                }
            }
        }

        private void SetRates()
        {
            txtRate.Text = "5,00";
            txtComissionASSAPercent.Text = "5,00";
            txtComissionAdviserPercent.Text = "5,00";
            txtSpendingPercent.Text = "5,00";
            txtAgentPercent_1.Text = "5,00";
            txtAgentPercent_2.Text = "5,00";
        }

        private void LoadCertificates()
        {

            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[transport].[sp_get_certificate_by_certificateID]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@certificateID", long.Parse(Request.QueryString["certificateID"].ToString()));

                da.SelectCommand = cmd;

                da.Fill(dt);

                // Load certificate
                if(dt?.Rows.Count > 0)
                {
                    divClientData.Visible = true;
                    lblNroDocumento.Text = dt.Rows[0]["numero_documento"].ToString();
                    lblCliente.Text = dt?.Rows[0]["cliente"].ToString();
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

                    double premium = double.Parse(dt.Rows[0]["Premium"].ToString());
                    txtPremium.Text = premium.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double premiunmPlusTax = double.Parse(dt.Rows[0]["PremiunmPlusTax"].ToString());
                    txtPremiunmPlusTax.Text = premiunmPlusTax.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double capitalAmount = double.Parse(dt.Rows[0]["CapitalAmount"].ToString());
                    txtCapitalAmount.Text = capitalAmount.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double rate = double.Parse(dt.Rows[0]["Rate"].ToString());
                    txtRate.Text = rate.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double spendingPercent = double.Parse(dt.Rows[0]["SpendingPercent"].ToString());
                    txtSpendingPercent.Text = spendingPercent.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double spending = double.Parse(dt.Rows[0]["Spending"].ToString());
                    txtSpending.Text = spending.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double comissionASSAPercent = double.Parse(dt.Rows[0]["ComissionASSAPercent"].ToString());
                    txtComissionASSAPercent.Text = comissionASSAPercent.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double comissionASSA = double.Parse(dt.Rows[0]["ComissionASSA"].ToString());
                    txtComissionASSA.Text = comissionASSA.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double comissionAdviserPercent = double.Parse(dt.Rows[0]["ComissionAdviserPercent"].ToString());
                    txtComissionAdviserPercent.Text = comissionAdviserPercent.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double comissionAdviser = double.Parse(dt.Rows[0]["ComissionAdviser"].ToString());
                    txtComissionAdviser.Text = comissionAdviser.ToString("0,0.00", new CultureInfo("es-PY", false));

                    double totalPrime = double.Parse(dt.Rows[0]["TotalPrime"].ToString());
                    txtTotalPrime.Text = totalPrime.ToString("0,0.00", new CultureInfo("es-PY", false));

                    ddlCurrency.SelectedValue = (dt.Rows[0]["CurrencyID"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["CurrencyID"].ToString();
                    txtBeneficiary.Text = dt.Rows[0]["Beneficiary"].ToString();
                    txtEmissionDate.Text = Convert.ToDateTime(dt.Rows[0]["EmissionDate"].ToString()).ToString("yyyy-MM-dd");
                    txtExtensionDate.Text = Convert.ToDateTime(dt.Rows[0]["ExtensionDate"].ToString()).ToString("yyyy-MM-dd");

                    if(dt.Rows[0]["RequestDate"] != null)
                    {
                        txtRequestDate.Text = Convert.ToDateTime(dt.Rows[0]["RequestDate"].ToString()).ToString("yyyy-MM-dd");
                    }

                    ddlCoverType.SelectedItem.Text = dt.Rows[0]["CoverType"]?.ToString();

                    AgentsDDL_1.SelectedValue = dt.Rows[0]["AgentID_1"].ToString();

                    double agentPercent_1 = double.Parse(dt.Rows[0]["AgentPercent_1"].ToString());
                    txtAgentPercent_1.Text = agentPercent_1.ToString("0,0.00", new CultureInfo("es-PY", false));
                    double agentAmount_1 = double.Parse(dt.Rows[0]["AgentAmount_1"].ToString());
                    txtAgentAmount_1.Text = agentAmount_1.ToString("0,0.00", new CultureInfo("es-PY", false));

                    AgentsDDL_2.SelectedValue = dt.Rows[0]["AgentID_2"].ToString();
                    double agentPercent_2 = double.Parse(dt.Rows[0]["AgentPercent_2"].ToString());
                    txtAgentPercent_2.Text = agentPercent_2.ToString("0,0.00", new CultureInfo("es-PY", false));
                    double agentAmount_2 = double.Parse(dt.Rows[0]["AgentAmount_2"].ToString());
                    txtAgentAmount_2.Text = agentAmount_2.ToString("0,0.00", new CultureInfo("es-PY", false));

                }
                else
                {
                    ErrorLabel.Text = "No existen registros del certificado";
                    ErrorLabel.Visible = true;
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

        private string GetNextCertificateNumber()
        {

            string NextCertificateNumber = "-1";

            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            string caseID = string.Empty;

            try
            {
                //Obtengo el primer Caso para gestionar
                cmd.CommandText = "transport.sp_get_next_certificate_number";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                sqlConnection1.Open();

                reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    // make sure the value is not DBNull
                    if(DBNull.Value != reader["NextCertificateNumber"])
                    {
                        NextCertificateNumber = reader["NextCertificateNumber"].ToString();
                    }
                    else
                    {
                        NextCertificateNumber = "-1";
                    }
                }


                sqlConnection1.Close();

                //devuelvo el valro 
                return NextCertificateNumber;

            }
            catch(Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                NextCertificateNumber = "-1";
            }

            //devuelvo el valor
            return NextCertificateNumber;
        }

        private string GetLastPolicyNumberFromClient(long PersonaID)
        {

            string LastPolicyNumber = "";

            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            string caseID = string.Empty;

            try
            {
                //Obtengo el primer Caso para gestionar
                cmd.CommandText = "transport.sp_get_last_policy_by_PersonID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@PersonID", PersonaID);

                sqlConnection1.Open();

                reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    // make sure the value is not DBNull
                    if(DBNull.Value != reader["PolicyNumber"])
                    {
                        LastPolicyNumber = reader["PolicyNumber"].ToString();

                    }
                    else
                    {
                        LastPolicyNumber = "";
                    }

                }


                sqlConnection1.Close();

                //devuelvo el valro 
                return LastPolicyNumber;


            }
            catch(Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                LastPolicyNumber = "";
            }

            //devuelvo el valor
            return LastPolicyNumber;

        }

        private void FindClientdata(int PersonID)
        {
            string numero_documento;
            string cliente;
            string razonSocial;
            long personaID;

            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            string caseID = string.Empty;

            try
            {
                //Obtengo el primer Caso para gestionar
                cmd.CommandText = "exchange.sp_get_client_data";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@PersonID", PersonID);

                sqlConnection1.Open();

                reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    // make sure the value is not DBNull
                    if(DBNull.Value != reader["PersonID"])
                    {
                        numero_documento = reader["numero_documento"].ToString();
                        cliente = reader["nombre"].ToString() + " " + reader["primer_apellido"].ToString() + " " + reader["segundo_apellido"].ToString();
                        razonSocial = reader["razon_social"].ToString();
                        personaID = long.Parse(reader["PersonID"].ToString());

                        lblNroDocumento.Text = numero_documento;
                        lblCliente.Text = cliente;
                        lblRazonSocial.Text = razonSocial;
                        PersonaID = personaID;
                        BeneficiaryID = personaID;
                        txtBeneficiary.Text = cliente;

                        try
                        {
                            ddlPolicy.SelectedValue = GetLastPolicyNumberFromClient(PersonaID);
                        }
                        catch(Exception ex)
                        {
                            ddlPolicy.SelectedIndex = 0;
                        }
                    }
                }

                sqlConnection1.Close();

                //Actualizo la informacion del cliente

            }
            catch(Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void ClientsDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            FindClientdata(Convert.ToInt32(ClientsDDL.SelectedValue));
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

                    txtPremium.Text = txtPremium.Text.Replace(".", "");
                    decimal premium = 0;
                    if(!string.IsNullOrEmpty(txtPremium.Text))
                    {
                        premium = ParseToDecimal(txtPremium.Text);
                    }

                    txtPremiunmPlusTax.Text = txtPremiunmPlusTax.Text.Replace(".", "");
                    decimal premiunmPlusTax = 0;
                    if(!string.IsNullOrEmpty(txtPremiunmPlusTax.Text))
                    {
                        premiunmPlusTax = ParseToDecimal(txtPremiunmPlusTax.Text);
                    }

                    txtCapitalAmount.Text = txtCapitalAmount.Text.Replace(".", "");
                    decimal capitalAmount = 0;
                    if(!string.IsNullOrEmpty(txtCapitalAmount.Text))
                    {
                        capitalAmount = ParseToDecimal(txtCapitalAmount.Text);
                    }

                    txtRate.Text = txtRate.Text.Replace(".", "");
                    decimal rate = 0;
                    if(!string.IsNullOrEmpty(txtRate.Text))
                    {
                        rate = ParseToDecimal(txtRate.Text);
                    }

                    txtSpendingPercent.Text = txtSpendingPercent.Text.Replace(".", "");
                    decimal spendingPercent = 0;
                    if(!string.IsNullOrEmpty(txtSpendingPercent.Text))
                    {
                        spendingPercent = ParseToDecimal(txtSpendingPercent.Text);
                    }

                    txtSpending.Text = txtSpending.Text.Replace(".", "");
                    decimal spending = 0;
                    if(!string.IsNullOrEmpty(txtSpending.Text))
                    {
                        spending = ParseToDecimal(txtSpending.Text);
                    }

                    txtComissionASSAPercent.Text = txtComissionASSAPercent.Text.Replace(".", "");
                    decimal comissionASSAPercent = 0;
                    if(!string.IsNullOrEmpty(txtComissionASSAPercent.Text))
                    {
                        comissionASSAPercent = ParseToDecimal(txtComissionASSAPercent.Text);
                    }

                    txtComissionAdviserPercent.Text = txtComissionAdviserPercent.Text.Replace(".", "");
                    decimal comissionAdviserPercent = 0;
                    if(!string.IsNullOrEmpty(txtComissionAdviserPercent.Text))
                    {
                        comissionAdviserPercent = ParseToDecimal(txtComissionAdviserPercent.Text);
                    }

                    txtTotalPrime.Text = txtTotalPrime.Text.Replace(".", "");
                    decimal totalPrime = 0;
                    if(!string.IsNullOrEmpty(txtTotalPrime.Text))
                    {
                        totalPrime = ParseToDecimal(txtTotalPrime.Text);
                    }

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

                    DateTime? requestDate = null;
                    if(!string.IsNullOrEmpty(txtRequestDate.Text))
                    {
                        requestDate = DateTime.Parse(txtRequestDate.Text);
                    }

                    string coverType = ddlContact.SelectedItem.Text;

                    int agentID_1 = 0;
                    int.TryParse(AgentsDDL_1.SelectedValue, out agentID_1);

                    txtAgentPercent_1.Text = txtAgentPercent_1.Text.Replace(".", "");
                    decimal agentPercent_1 = 0;
                    if(!string.IsNullOrEmpty(txtAgentPercent_1.Text))
                    {
                        agentPercent_1 = ParseToDecimal(txtAgentPercent_1.Text);
                    }

                    int agentID_2 = 0;
                    int.TryParse(AgentsDDL_2.SelectedValue, out agentID_2);
                    txtAgentPercent_2.Text = txtAgentPercent_2.Text.Replace(".", "");
                    decimal agentPercent_2 = 0;
                    if(!string.IsNullOrEmpty(txtAgentPercent_2.Text))
                    {
                        agentPercent_2 = ParseToDecimal(txtAgentPercent_2.Text);
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

                    cmd.Parameters.AddWithValue("@RequestDate", requestDate);
                    cmd.Parameters.AddWithValue("@CoverType", coverType);
                    cmd.Parameters.AddWithValue("@TotalPrime", totalPrime);

                    cmd.Parameters.AddWithValue("@AgentID_1", agentID_1);
                    cmd.Parameters.AddWithValue("@AgentPercent_1", agentPercent_1);

                    cmd.Parameters.AddWithValue("@AgentID_2", agentID_2);
                    cmd.Parameters.AddWithValue("@AgentPercent_2", agentPercent_2);

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

        private decimal ParseToDecimal(string s)
        {
            if(string.IsNullOrEmpty(s))
            {
                return 0;
            }
            s = s.Replace(",", CultureInfo.InvariantCulture.NumberFormat.NumberDecimalSeparator);
            return decimal.Parse(s, NumberStyles.Any, CultureInfo.InvariantCulture);
        }
        
        protected void Comission_TextChanged(object sender, EventArgs e)
        {
            if(Request.QueryString["mode"] != null)
            {

                if(Request.QueryString["mode"].ToString().Equals("update"))
                {
                    SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
                    SqlCommand cmd = new SqlCommand();
                    SqlDataAdapter da;
                    DataTable dt = new DataTable();

                    int rowsAffected;

                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = sqlConnection1;

                        if(Request.QueryString["certificateID"] == null)
                        {
                            ErrorLabel.Text = "No se puede actualizar sin conocer el ID de Certificado";
                            ErrorLabel.Visible = true;
                            return;
                        }

                        cmd.CommandText = "[transport].[sp_update_certificate_rate]";
                        cmd.Parameters.AddWithValue("@CertificateID", long.Parse(Request.QueryString["certificateID"].ToString()));

                        txtSpendingPercent.Text = txtSpendingPercent.Text.Replace(".", "");
                        decimal spendingPercent = 0;
                        if(!string.IsNullOrEmpty(txtSpendingPercent.Text))
                        {
                            spendingPercent = ParseToDecimal(txtSpendingPercent.Text);
                        }

                        txtComissionASSAPercent.Text = txtComissionASSAPercent.Text.Replace(".", "");
                        decimal comissionASSAPercent = 0;
                        if(!string.IsNullOrEmpty(txtComissionASSAPercent.Text))
                        {
                            comissionASSAPercent = ParseToDecimal(txtComissionASSAPercent.Text);
                        }

                        txtComissionAdviserPercent.Text = txtComissionAdviserPercent.Text.Replace(".", "");
                        decimal comissionAdviserPercent = 0;
                        if(!string.IsNullOrEmpty(txtComissionAdviserPercent.Text))
                        {
                            comissionAdviserPercent = ParseToDecimal(txtComissionAdviserPercent.Text);
                        }

                        txtCapitalAmount.Text = txtCapitalAmount.Text.Replace(".", "");
                        decimal capitalAmount = 0;
                        if(!string.IsNullOrEmpty(txtCapitalAmount.Text))
                        {
                            capitalAmount = ParseToDecimal(txtCapitalAmount.Text);
                        }

                        txtRate.Text = txtRate.Text.Replace(".", "");
                        decimal rate = 0;
                        if(!string.IsNullOrEmpty(txtRate.Text))
                        {
                            rate = ParseToDecimal(txtRate.Text);
                        }

                        txtAgentPercent_1.Text = txtAgentPercent_1.Text.Replace(".", "");
                        decimal agentPercent_1 = 0;
                        if(!string.IsNullOrEmpty(txtAgentPercent_1.Text))
                        {
                            agentPercent_1 = ParseToDecimal(txtAgentPercent_1.Text);
                        }

                        txtAgentPercent_2.Text = txtAgentPercent_2.Text.Replace(".", "");
                        decimal agentPercent_2 = 0;
                        if(!string.IsNullOrEmpty(txtAgentPercent_2.Text))
                        {
                            agentPercent_2 = ParseToDecimal(txtAgentPercent_2.Text);
                        }

                        cmd.Parameters.AddWithValue("@SpendingPercent", spendingPercent);
                        cmd.Parameters.AddWithValue("@ComissionASSAPercent", comissionASSAPercent);
                        cmd.Parameters.AddWithValue("@ComissionAdviserPercent", comissionAdviserPercent);
                        cmd.Parameters.AddWithValue("@CapitalAmount", capitalAmount);
                        cmd.Parameters.AddWithValue("@Rate", rate);
                        cmd.Parameters.AddWithValue("@AgentPercent_1", agentPercent_1);
                        cmd.Parameters.AddWithValue("@AgentPercent_2", agentPercent_2);
                        da = new SqlDataAdapter(cmd);

                        da.Fill(dt);

                        if(dt?.Rows.Count > 0)
                        {

                            double comissionASSAPercent1 = double.Parse(dt.Rows[0]["ComissionASSAPercent"].ToString());
                            txtComissionASSAPercent.Text = comissionASSAPercent1.ToString("0.0,00", new CultureInfo("es-PY", false));

                            double comissionASSA1 = double.Parse(dt.Rows[0]["ComissionASSA"].ToString());
                            txtComissionASSA.Text = comissionASSA1.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double comissionAdviserPercent1 = double.Parse(dt.Rows[0]["ComissionAdviserPercent"].ToString());
                            txtComissionAdviserPercent.Text = comissionAdviserPercent1.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double comissionAdviser1 = double.Parse(dt.Rows[0]["ComissionAdviser"].ToString());
                            txtComissionAdviser.Text = comissionAdviser1.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double spendingPercent1 = double.Parse(dt.Rows[0]["SpendingPercent"].ToString());
                            txtSpendingPercent.Text = spendingPercent1.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double spending1 = double.Parse(dt.Rows[0]["Spending"].ToString());
                            txtSpending.Text = spending1.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double capitalAmount1 = double.Parse(dt.Rows[0]["CapitalAmount"].ToString());
                            txtCapitalAmount.Text = capitalAmount1.ToString("0,0.00", new CultureInfo("es-PY", false));


                            double rate1 = double.Parse(dt.Rows[0]["Rate"].ToString());
                            txtRate.Text = rate1.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double premium1 = double.Parse(dt.Rows[0]["Premium"].ToString());
                            txtPremium.Text = premium1.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double agentPercent_11 = double.Parse(dt.Rows[0]["AgentPercent_1"].ToString());
                            txtAgentPercent_1.Text = agentPercent_11.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double agentAmount_1 = double.Parse(dt.Rows[0]["AgentAmount_1"].ToString());
                            txtAgentAmount_1.Text = agentAmount_1.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double agentPercent_12 = double.Parse(dt.Rows[0]["AgentPercent_2"].ToString());
                            txtAgentPercent_2.Text = agentPercent_12.ToString("0,0.00", new CultureInfo("es-PY", false));

                            double agentAmount_2 = double.Parse(dt.Rows[0]["AgentAmount_2"].ToString());
                            txtAgentAmount_2.Text = agentAmount_2.ToString("0,0.00", new CultureInfo("es-PY", false));

                        }

                    }
                    catch(Exception ex)
                    {
                        ErrorLabel.Text = ex.ToString();
                        ErrorLabel.Visible = true;
                    }
                }
                else if(Request.QueryString["mode"].ToString().Equals("insert"))
                {
                    // Calculos auxiliares para los campos calculados

                    // Premium: (([CapitalAmount]*[Rate])/(100))
                    decimal premium = 0;
                    decimal capitalAmount = 0;
                    decimal rate = 0;
                    decimal spendingPercent = 0;
                    decimal spending = 0;
                    decimal comissionASSAPercent = 0;
                    decimal comissionASSA = 0;
                    decimal comissionAdviserPercent = 0;
                    decimal comissionAdviser = 0;
                    decimal agentPercent_1 = 0;
                    decimal agentAmount_1 = 0;
                    decimal agentPercent_2 = 0;
                    decimal agentAmount_2 = 0;

                    if(!string.IsNullOrEmpty( txtCapitalAmount .Text))
                    {
                        capitalAmount = ParseToDecimal(txtCapitalAmount.Text.Replace(".", "")); 
                    }

                    if(!string.IsNullOrEmpty(txtRate.Text))
                    {
                        rate = ParseToDecimal(txtRate.Text.Replace(".", ","));
                    }
                    premium = (capitalAmount * rate) / 100;
                    txtPremium.Text = premium.ToString("0,0.00", new CultureInfo("es-PY", false));


                    // Spending : (((([CapitalAmount] *[Rate]) / (100)) *[SpendingPercent]) / (100))

                    if(!string.IsNullOrEmpty(txtSpendingPercent.Text))
                    {
                        spendingPercent = ParseToDecimal(txtSpendingPercent.Text.Replace(".", ","));
                    }

                    // se calcula premium antes ((([CapitalAmount] *[Rate]) / (100))
                    spending = (premium * spendingPercent) / 100;
                    txtSpending.Text = spending.ToString("0,0.00", new CultureInfo("es-PY", false));

                    // (([ComissionASSAPercent]*(([CapitalAmount]*[Rate])/(100)))/(100))

                    if(!string.IsNullOrEmpty(txtComissionASSAPercent.Text))
                    {
                        comissionASSAPercent = ParseToDecimal(txtComissionASSAPercent.Text.Replace(".", ","));
                    }

                    // se calcula antes premium: (([CapitalAmount]*[Rate])/(100))
                    comissionASSA = (comissionASSAPercent * premium) / 100;
                    txtComissionASSA.Text = comissionASSA.ToString("0,0.00", new CultureInfo("es-PY", false));

                    // ComissionAdviser: (([ComissionAdviserPercent]*(([CapitalAmount]*[Rate])/(100)))/(100))

                    if(!string.IsNullOrEmpty(txtComissionAdviserPercent.Text))
                    {
                        comissionAdviserPercent = ParseToDecimal(txtComissionAdviserPercent.Text.Replace(".", ","));
                    }

                    // se calcula antes premium: (([CapitalAmount]*[Rate])/(100))
                    comissionAdviser = (comissionAdviserPercent * premium) / 100;
                    txtComissionAdviser.Text = comissionAdviser.ToString("0,0.00", new CultureInfo("es-PY", false));


                    // AgentAmount_1: (([AgentPercent_1]/(100))*[CapitalAmount])
                    if(!string.IsNullOrEmpty(txtAgentPercent_1.Text))
                    {
                        agentPercent_1 = ParseToDecimal(txtAgentPercent_1.Text.Replace(".", ","));
                    }

                    agentAmount_1 = (agentPercent_1 / 100) * capitalAmount;
                    txtAgentAmount_1.Text = agentPercent_1.ToString("0,0.00", new CultureInfo("es-PY", false));

                    // AgentAmount_2: (([AgentPercent_2]/(100))*[CapitalAmount])
                    if(!string.IsNullOrEmpty(txtAgentPercent_2.Text))
                    {
                        agentPercent_2 = ParseToDecimal(txtAgentPercent_2.Text.Replace(".", ","));
                    }

                    agentAmount_2 = (agentPercent_2 / 100) * capitalAmount;
                    txtAgentAmount_2.Text = agentPercent_2.ToString("0,0.00", new CultureInfo("es-PY", false));

                }
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {

            string[] data = txtSearch.Text.Split('|');

            if (data.Length > 0)
            {
                int personID = int.Parse(data[1]);
                FindClientdata(personID);
            }
            //if (!string.IsNullOrEmpty(hifPersonID.Value))
            //{
            //    int personID = int.Parse(hifPersonID.Value);
            //    FindClientdata(personID);
            //}
        }
    }
}