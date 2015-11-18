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
    public partial class ApprovementClaim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ApprovementBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(estadoClienteDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
           
            Int32 rowsAffected;

            try
            {

                //Genero el cambio de estado
                cmd.CommandText = "claim.sp_change_claim_status";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@ClaimID", Request.QueryString["ClaimID"]);
                cmd.Parameters.AddWithValue("@NextClaimStatusID", 4);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + Request.QueryString["PolicyNumber"]);

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void DisapprovementBT_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(estadoClienteDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            Int32 rowsAffected;

            try
            {

                //Genero el cambio de estado
                cmd.CommandText = "claim.sp_change_claim_status";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@ClaimID", Request.QueryString["ClaimID"]);
                cmd.Parameters.AddWithValue("@NextClaimStatusID", 5);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + Request.QueryString["PolicyNumber"]);

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}