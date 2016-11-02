using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Transports
{
    public partial class NewClaim : Page
    {
        public string NroPoliza
        {
            get
            {
                object o = ViewState["NroPoliza"];
                if (o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["NroPoliza"] = value;
            }
        }

        public long CertificateID
        {
            get
            {
                object o = ViewState["CertificateID"];
                if (o == null)
                    return 0;
                return (long)o;
            }
            set
            {
                ViewState["CertificateID"] = value;
            }
        }

        public string PersonaID
        {
            get
            {
                object o = ViewState["PersonaID"];
                if (o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["PersonaID"] = value;
            }
        }

        private string criteria;
        private string find;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void registrarSiniestroBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            int claimID;
            int rowsAffected;

            try
            {

                cmd.CommandText = "[transport].[sp_registrar_caso_siniestro]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                SqlParameter claim_id = new SqlParameter("@id_claim", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                cmd.Parameters.Add(claim_id);
                cmd.Parameters.AddWithValue("@id_persona", PersonaID);
                cmd.Parameters.AddWithValue("@cliente", lblCliente.Text);
                cmd.Parameters.AddWithValue("@fecha_siniestro", Convert.ToDateTime(dp1.Value));
                cmd.Parameters.AddWithValue("@observacion", txtObservacion.Text);
                cmd.Parameters.AddWithValue("@nro_poliza", NroPoliza);
                cmd.Parameters.AddWithValue("@id_certificado", CertificateID);
                cmd.Parameters.AddWithValue("@usuario", User.Identity.Name);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();
                claimID = int.Parse(cmd.Parameters["@id_claim"].Value.ToString());

                sqlConnection1.Close();

                //SaveDetails(claimID);

                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + NroPoliza.Replace(".", ""));

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        //private void SaveDetails(int claimID)
        //{

        //    SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
        //    int rowsAffected;

        //    foreach (ListItem item in lsbCoberturas.Items)
        //    {
        //        if (item.Selected)
        //        {
        //            using (SqlCommand cmd = new SqlCommand())
        //            {

        //                try
        //                {

        //                    cmd.CommandText = "sp_registrar_caso_siniestro_detalle";
        //                    cmd.CommandType = CommandType.StoredProcedure;
        //                    cmd.Connection = sqlConnection1;

        //                    string val = item.Value;

        //                    cmd.Parameters.AddWithValue("@id_claim", claimID);
        //                    cmd.Parameters.AddWithValue("@id_cobertura", val);

        //                    sqlConnection1.Open();

        //                    rowsAffected = cmd.ExecuteNonQuery();

        //                    sqlConnection1.Close();
        //                }
        //                catch (Exception exp)
        //                {
        //                    ErrorLabel.Text = exp.Message;
        //                    ErrorLabel.Visible = true;
        //                }
        //            }
        //        }
        //    }

        //}

        protected void searchBox_ServerClick(object sender, EventArgs e)
        {
            string[] data = txtSearch.Text.Split('|');
            if (data.Length > 0)
            {


                SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
                SqlCommand cmd = new SqlCommand();

                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                
                int certificateID = int.Parse(data[1]);

                try
                {
                    cmd.CommandText = "[transport].[sp_search_certificate_by_certificateID]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlConnection1;

                    cmd.Parameters.AddWithValue("@certificateID", certificateID);

                    da.SelectCommand = cmd;

                    da.Fill(dt);

                    if (dt?.Rows.Count > 0)
                    {
                       
                        lblPoliza.Text = dt.Rows[0]["nro_poliza"].ToString();
                        lblNroDocumento.Text = dt.Rows[0]["numero_documento"].ToString();
                        lblCliente.Text = dt.Rows[0]["cliente"].ToString();
                        PersonaID = dt.Rows[0]["id_persona"].ToString();
                        NroPoliza = dt.Rows[0]["nro_poliza"].ToString();
                        CertificateID = certificateID;
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
}