using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Claims {
    public partial class NewClaim : System.Web.UI.Page {

        public string nro_poliza {
            get {
                object o = ViewState["nro_poliza"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set {
                ViewState["nro_poliza"] = value;
            }
        }

        public string id_persona {
            get {
                object o = ViewState["id_persona"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set {
                ViewState["id_persona"] = value;
            }
        }

        private string criteria;
        private string find;
        
        protected void Page_Load(object sender, EventArgs e) {

            try {

                if(Request.QueryString["criteria"] != null) {
                    criteria = Request.QueryString["criteria"].ToString();
                    switch(criteria) {
                        case "PolicyNumber":
                            txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Póliza";
                            criteriaBtn.InnerText = "Nro. Póliza";
                            break;
                        case "Client":
                            txtSearchClaim.Attributes["placeholder"] = "Buscar por Cliente";
                            criteriaBtn.InnerText = "Cliente";
                            break;
                        case "ClientDocumentNumber":
                            txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Documento";
                            criteriaBtn.InnerText = "Nro. Documento";
                            break;

                        default:
                            txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Pòliza";
                            criteriaBtn.InnerText = "Nro. Pòliza";
                            criteria = "PolicyNumber";
                            break;
                    }
                }

            }
            catch(Exception exp) {
                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Póliza";
                criteriaBtn.InnerText = "Nro. Póliza";
                criteria = "PolicyNumber";
            }
        }

        protected void registrarSiniestroBtn_Click(object sender, EventArgs e) {

            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();

            int rowsAffected;

            try {

                cmd.CommandText = "sp_registrar_caso_siniestro";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@id_persona", id_persona);
                cmd.Parameters.AddWithValue("@cliente", lblCliente.Text);
                cmd.Parameters.AddWithValue("@fecha_siniestro", Convert.ToDateTime(dp1.Value));
                cmd.Parameters.AddWithValue("@id_tipo_siniestro", ddlTipoSiniestro.SelectedValue);
                cmd.Parameters.AddWithValue("@nro_poliza", nro_poliza);
                cmd.Parameters.AddWithValue("@usuario", User.Identity.Name);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

                //cmd1.CommandText = "sp_registrar_caso_siniestro";
                //cmd1.CommandType = CommandType.StoredProcedure;
                //cmd1.Connection = sqlConnection1;

                ////Genero el cambio de estado
                //cmd1.CommandText = "claim.sp_change_claim_status";
                //cmd1.CommandType = CommandType.StoredProcedure;
                //cmd1.Connection = sqlConnection1;

                //cmd1.Parameters.AddWithValue("@ClaimID", claimID);
                //cmd1.Parameters.AddWithValue("@GoNextStep", 1);
                //cmd1.Parameters.AddWithValue("@UserName", User.Identity.Name);

                //sqlConnection1.Open();

                //rowsAffected = cmd1.ExecuteNonQuery();

                //sqlConnection1.Close();

                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + nro_poliza.Replace(".", ""));

            }
            catch(Exception exp) {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void searchBox_ServerClick(object sender, EventArgs e) {

            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            try {

                cmd.CommandText = "[claim].[sp_search_clients]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@find", txtSearchClaim.Value);
                cmd.Parameters.AddWithValue("@criteria", criteria);

                da.SelectCommand = cmd;

                da.Fill(dt);

                gridClients.DataSource = dt;
                gridClients.DataBind();

            }
            catch(Exception exp) {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openResetearContrasena();", true);
        }

        protected void gridClients_RowCommand(object sender, GridViewCommandEventArgs e) {

            switch(e.CommandName) {
                case "seleccionar":
                    string[] values = e.CommandArgument.ToString().Split('|');

                    string detail = values[0];
                    string numero_documento = values[1];
                    string cliente = values[2];
                    string idPersona = values[3];
                    string nroPoliza = values[4];
                    lblPoliza.Text = detail;
                    lblNroDocumento.Text = numero_documento;
                    lblCliente.Text = cliente;

                    id_persona = idPersona;
                    nro_poliza = nroPoliza;

                    break;
                default:
                    break;


            }

        }
    }
}