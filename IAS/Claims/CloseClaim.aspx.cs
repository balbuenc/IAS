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
    public partial class CloseClaim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CloseBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ClaimSqldataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            int rowsAffected;

            string claimID = Request.QueryString["ClaimID"];
            string PolicyNumber = Request.QueryString["PolicyNumber"];

            try
            {

                //Genero el cambio de estado
                cmd.CommandText = "claim.sp_change_claim_status";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@ClaimID", claimID);
                cmd.Parameters.AddWithValue("@GoNextStep", -1);
                cmd.Parameters.AddWithValue("@UserName", User.Identity.Name);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();



                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + PolicyNumber);

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}