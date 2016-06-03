using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Transports
{
<<<<<<< HEAD
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
				if(Request.QueryString["CertificateNumber"] == null)
				{
					CertificateNumber = "5005010343315";
				}
				else
				{
					CertificateNumber = Request.QueryString["CertificateNumber"];
				}
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
=======
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

        public Int64 CertificateID
        {
            get
            {
                object o = Session["CertificateID"];
                if(o == null)
                    return 0;
                return (Int64)o;
            }
            set
            {
                Session["CertificateID"] = value;
            }
        }

        public string Mode
        {
            get
            {
                object o = Session["Mode"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                Session["Mode"] = value;
            }
        }

        private string criteria;
        private string find;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                criteria = Request.QueryString["criteria"]?.ToString();
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
                if(Mode == string.Empty)
                {
                    Mode = Request.QueryString["mode"]?.ToString();
                }

                CertificateNumber = Convert.ToInt64(Request.QueryString["CertificateNumber"]?.ToString());
                if(CertificateID == 0)
                {
                    CertificateID = Convert.ToInt64(Request.QueryString["CertificateID"]?.ToString());
                }

                if(Mode.Equals("update"))
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

                cmd.Parameters.AddWithValue("@certificateID", CertificateID);

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
                    txtPartnerAmmountPercent.Text = dt.Rows[0]["PartnerAmmountPercent"].ToString();
                    txtRiskName.Text = dt.Rows[0]["RiskName"]?.ToString();
                    ddlInsuranceManager.SelectedValue = (dt.Rows[0]["InsuranceManagerID"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["InsuranceManagerID"].ToString();
                    ddlPartners.SelectedValue = (dt.Rows[0]["PartnerID"].ToString() == string.Empty) ? "-1" : dt.Rows[0]["PartnerID"].ToString();
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
                    txtEmissionDate.Text = dt.Rows[0]["EmissionDate"].ToString();
                    txtExtensionDate.Text = dt.Rows[0]["ExtensionDate"].ToString();
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
                    Int64 personaID = Int64.Parse(values[3]);

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
            if(Mode != string.Empty)
            {
                SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
                SqlCommand cmd = new SqlCommand();

                int rowsAffected;

                try
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlConnection1;

                    if(Mode == "update")
                    {
                        cmd.CommandText = "[transport].[sp_update_certificate]";
                        cmd.Parameters.AddWithValue("@CertificateID", CertificateID);
                    }
                    else if(Mode == "insert")
                    {
                        cmd.CommandText = "[transport].[sp_insert_certificate]";
                    }

                    cmd.Parameters.AddWithValue("@CertificateNumber", Convert.ToInt64(txtCertificateNumber.Text));
                    cmd.Parameters.AddWithValue("@PersonID", PersonaID);
                    cmd.Parameters.AddWithValue("@InsuranceManagerID", Convert.ToInt32(ddlInsuranceManager.SelectedValue));
                    cmd.Parameters.AddWithValue("@PolicyNumber", Convert.ToInt32(ddlPolicy.SelectedValue));
                    cmd.Parameters.AddWithValue("@BeneficiaryID", BeneficiaryID);
                    cmd.Parameters.AddWithValue("@PartnerID", Convert.ToInt32(ddlPartners.SelectedValue));
                    cmd.Parameters.AddWithValue("@PartnerAmmountPercent", Convert.ToDecimal(txtPartnerAmmountPercent.Text));
                    cmd.Parameters.AddWithValue("@ContactID", Convert.ToInt32(ddlContact.SelectedValue));
                    cmd.Parameters.AddWithValue("@RiskName", txtRiskName.Text);
                    cmd.Parameters.AddWithValue("@PackageCount", Convert.ToDecimal(txtPackageCount.Text));
                    cmd.Parameters.AddWithValue("@Origin", txtOrigin.Text);
                    cmd.Parameters.AddWithValue("@Destination", txtDestination.Text);
                    cmd.Parameters.AddWithValue("@TransportationMethodID", Convert.ToInt32(ddlTransportationMethod.SelectedValue));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Premium", Convert.ToDecimal(txtPremium.Text));
                    cmd.Parameters.AddWithValue("@PremiunmPlusTax", Convert.ToDecimal(txtPremiunmPlusTax.Text));
                    cmd.Parameters.AddWithValue("@CapitalAmount", Convert.ToDecimal(txtCapitalAmount.Text));
                    cmd.Parameters.AddWithValue("@Rate", Convert.ToDecimal(txtRate.Text));
                    cmd.Parameters.AddWithValue("@SpendingPercent", Convert.ToDecimal(txtSpendingPercent.Text));
                    cmd.Parameters.AddWithValue("@Spending", Convert.ToDecimal(txtSpending.Text));
                    cmd.Parameters.AddWithValue("@ComissionASSAPercent", Convert.ToDecimal(txtComissionASSAPercent.Text));
                    cmd.Parameters.AddWithValue("@ComissionAdviserPercent", Convert.ToDecimal(txtComissionAdviserPercent.Text));
                    cmd.Parameters.AddWithValue("@CurrencyID", Convert.ToInt32(ddlCurrency.SelectedValue));
                    cmd.Parameters.AddWithValue("@Beneficiary", txtBeneficiary.Text);
                    cmd.Parameters.AddWithValue("@EmissionDate", DateTime.Parse(txtEmissionDate.Text));
                    cmd.Parameters.AddWithValue("@ExtensionDate", DateTime.Parse(txtExtensionDate.Text));
                    cmd.Parameters.AddWithValue("@Status", "Activo");

                    sqlConnection1.Open();

                    rowsAffected = cmd.ExecuteNonQuery();

                    sqlConnection1.Close();

                    Mode = string.Empty;
                    CertificateID = 0;

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
>>>>>>> db57491f0ee5f7168d07d232cb702d8689df96db
}