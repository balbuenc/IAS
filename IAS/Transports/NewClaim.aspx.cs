using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Transports
{
    public partial class NewClaim : Page
    {
        public string PolicyNumber
        {
            get
            {
                object o = ViewState["PolicyNumber"];
                if (o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["PolicyNumber"] = value;
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

        public string CertificateNumber
        {
            get
            {
                object o = ViewState["CertificateNumber"];
                if (o == null)
                    return string.Empty;
                return (string)o;
            }
            set
            {
                ViewState["CertificateNumber"] = value;
            }
        }
        public string PersonID
        {
            get
            {
                object o = ViewState["PersonID"];
                if (o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["PersonID"] = value;
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

                SqlParameter claimIDOut = new SqlParameter("@claimID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                cmd.Parameters.Add(claimIDOut);
                cmd.Parameters.AddWithValue("@personID", PersonID);
                cmd.Parameters.AddWithValue("@client", lblClient.Text);
                cmd.Parameters.AddWithValue("@claimDate", Convert.ToDateTime(dp1.Value));
                cmd.Parameters.AddWithValue("@observations", txtObservations.Text);
                cmd.Parameters.AddWithValue("@policyNumber", PolicyNumber);
                cmd.Parameters.AddWithValue("@certificateID", CertificateID);
                cmd.Parameters.AddWithValue("@user", User.Identity.Name);
                cmd.Parameters.AddWithValue("@carrier", txtCarrier.Text);
                cmd.Parameters.AddWithValue("@commodity", txtCommodity.Text);
                cmd.Parameters.AddWithValue("@invoiceNumber", txtInvoiceNumber.Text);
                cmd.Parameters.AddWithValue("@invoiceAmount", decimal.Parse(txtInvoiceAmount.Text));
                cmd.Parameters.AddWithValue("@origin", txtOrigin.Text);
                cmd.Parameters.AddWithValue("@destination", txtDestination.Text);
                cmd.Parameters.AddWithValue("@contact", txtContact.Text);
                cmd.Parameters.AddWithValue("@phoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@location", txtLocation.Text);
                
                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();
                claimID = int.Parse(cmd.Parameters["@claimID"].Value.ToString());

                sqlConnection1.Close();

                //SaveDetails(claimID);

                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + PolicyNumber.Replace(".", ""));

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
                       
                        lblPolicyNumber.Text = dt.Rows[0]["nro_poliza"].ToString();
                        lblDocumentNumber.Text = dt.Rows[0]["numero_documento"].ToString();
                        lblClient.Text = dt.Rows[0]["cliente"].ToString();
                        PersonID = dt.Rows[0]["id_persona"].ToString();
                        PolicyNumber = dt.Rows[0]["nro_poliza"].ToString();
                        CertificateID = certificateID;
                        txtCrtNumber.Text = dt.Rows[0]["CertificateNumber"].ToString();
                        txtBeneficiary.Text = dt.Rows[0]["Beneficiary"].ToString();
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