using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Claims
{
    public partial class NewPolicy : Page
    {
        public long PersonaID
        {
            get
            {
                object o = ViewState["PersonaID"];
                if (o == null)
                    return 0;
                return (long)o;
            }
            set
            {
                ViewState["PersonaID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["PersonID"] != null)
                {
                    PersonaID = long.Parse(Request.QueryString["PersonID"]);
                    CargarCliente(PersonaID);
                }
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            string[] data = txtSearchPerson.Text.Split('-');

            PersonaID = long.Parse(data[0].ToString());
            lblNroDocumento.Text = data[1].ToString();
            lblCliente.Text = data[2].ToString();

        }

        private void CargarCliente(long personID)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["IASDBContext"].ConnectionString);
            SqlCommand cmd = new SqlCommand();

            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[exchange].[sp_get_person_by_person_id]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@id_persona", personID);

                da.SelectCommand = cmd;

                da.Fill(dt);

                // Load certificate
                if (dt?.Rows.Count > 0)
                {
                    lblNroDocumento.Text = dt.Rows[0]["numero_documento"].ToString();
                    lblCliente.Text = dt.Rows[0]["cliente"].ToString();
                    
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
    }
}