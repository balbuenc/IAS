using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Renovations
{
    public partial class NewRenovation : System.Web.UI.Page
    {

        public string nro_poliza
        {
            get
            {
                object o = ViewState["nro_poliza"];
                if (o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["nro_poliza"] = value;
            }
        }

        public string id_persona
        {
            get
            {
                object o = ViewState["id_persona"];
                if (o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["id_persona"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            string[] data = txtSearchPolicy.Text.Split('|');

            string idPersona = data[0];
            string numero_documento = data[1];
            string cliente = data[2];
            string nroPoliza = data[3];
            string detail = data[4];

            lblPoliza.Text = nroPoliza;
            lblNroDocumento.Text = numero_documento;
            lblCliente.Text = cliente;
            id_persona = idPersona;
            nro_poliza = nroPoliza;

            registrarRenovacionBtn.Enabled = true;
        }

        protected void registrarRenovacionBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["IASDBContext"].ConnectionString);
            SqlCommand cmd = new SqlCommand();

            int rowsAffected;

            try
            {

                cmd.CommandText = "[commercial].[sp_insert_policy_renovation]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                string userID = ddlUsuario.SelectedValue;

                cmd.Parameters.AddWithValue("@PolicyNumber", nro_poliza);
                cmd.Parameters.AddWithValue("@renovationDate", DateTime.Parse(dpDateRenovation.Value));
                cmd.Parameters.AddWithValue("@user", User.Identity.Name);
                cmd.Parameters.AddWithValue("@userID", userID);
                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

                //Direcciono a la pagina de renovaciones
                Response.Redirect("Renovations.aspx");

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}