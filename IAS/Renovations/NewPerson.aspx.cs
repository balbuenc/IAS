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
    public partial class NewPerson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registrarPersonaBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["IASDBContext"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            int personID;
            int rowsAffected;

            try
            {
                DateTime fechaNacimiento;


                string[] components = txtFechaNacimiento.Text.Split('-');

                int day = int.Parse(components[2]);
                int month = int.Parse(components[1]);
                int year = int.Parse(components[0]);

                fechaNacimiento = new DateTime(year, month, day);

                cmd.CommandText = "[exchange].[sp_new_person]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                SqlParameter id_persona = new SqlParameter("@id_persona", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output

                };
                cmd.Parameters.Add(id_persona);
                cmd.Parameters.AddWithValue("@id_tipo_documento", int.Parse(ddlTipoDocumento.SelectedValue));
                cmd.Parameters.AddWithValue("@numero_documento", txtNumeroDocumento.Text);
                cmd.Parameters.AddWithValue("@nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@apellido1", txtApellido1.Text);
                cmd.Parameters.AddWithValue("@apellido2", txtApellido2.Text);
                cmd.Parameters.AddWithValue("@razon_social", TxtRazonSocial.Text);
                cmd.Parameters.AddWithValue("@fecha_nacimiento", fechaNacimiento);
                cmd.Parameters.AddWithValue("@sexo", rdbSexo.SelectedValue);
                cmd.Parameters.AddWithValue("@tipo_persona", rdbTipoPersona.SelectedValue);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();
                personID = int.Parse(cmd.Parameters["@id_persona"].Value.ToString());

                sqlConnection1.Close();

                //Direcciono a la pagina de busqueda
                Response.Redirect("NewPolicy.aspx?PersonID=" + personID.ToString());

            }
            catch (Exception exp)
            {
                //ErrorLabel.Text = exp.Message;
                //ErrorLabel.Visible = true;
            }

        }
    }
}