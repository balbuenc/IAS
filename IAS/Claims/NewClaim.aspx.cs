using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Claims
{
    public partial class NewClaim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void registrarSiniestroBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;

            try
            {

                cmd.CommandText = "sp_registrar_caso_siniestro";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@id_persona", ddlClientes.SelectedValue);
                cmd.Parameters.AddWithValue("@cliente", ddlClientes.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@fecha_siniestro", Convert.ToDateTime(dp1.Value));
                cmd.Parameters.AddWithValue("@id_tipo_siniestro", ddlTipoSiniestro.SelectedValue);
                cmd.Parameters.AddWithValue("@nro_poliza", ddlNroPoliza.SelectedValue);
                cmd.Parameters.AddWithValue("@usuario", User.Identity.Name);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + ddlNroPoliza.SelectedValue.Replace(".",""));

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}