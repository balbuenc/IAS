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
                        case "PolicyNumber":
                            txtSearchClient.Attributes["placeholder"] = "Buscar por Nro. Póliza";
                            criteriaBtn.InnerText = "Nro. Póliza";
                            break;
                        case "Client":
                            txtSearchClient.Attributes["placeholder"] = "Buscar por Cliente";
                            criteriaBtn.InnerText = "Cliente";
                            break;
                        case "ClientDocumentNumber":
                            txtSearchClient.Attributes["placeholder"] = "Buscar por Nro. Documento";
                            criteriaBtn.InnerText = "Nro. Documento";
                            break;

                        default:
                            txtSearchClient.Attributes["placeholder"] = "Buscar por Nro. Pòliza";
                            criteriaBtn.InnerText = "Nro. Pòliza";
                            criteria = "PolicyNumber";
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
                cmd.CommandText = "[claim].[sp_search_clients]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@find", txtSearchClient.Value);
                cmd.Parameters.AddWithValue("@criteria", criteria);

                da.SelectCommand = cmd;

                da.Fill(dt);

                gridClients.DataSource = dt;
                gridClients.DataBind();

            }
            catch(Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModalPolizas();", true);
        }

        protected void gridClients_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            switch(e.CommandName)
            {
                case "seleccionar":
                    string[] values = e.CommandArgument.ToString().Split('|');

                    string detail = values[0];
                    string numero_documento = values[1];
                    string cliente = values[2];
                    string personaID = values[3];
                    string nroPoliza = values[4];
                    lblPoliza.Text = detail;
                    lblNroDocumento.Text = numero_documento;
                    lblCliente.Text = cliente;

                    PersonaID = personaID;
                    NroPoliza = nroPoliza;

                    divClientData.Visible = true;

                    break;
                default:
                    break;


            }

        }
    }
}