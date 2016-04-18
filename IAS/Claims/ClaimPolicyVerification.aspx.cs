//«Copyright 2014 Balcazz HT, http://www.balcazzht.com»

//This file is part of IAS | Insurance Advanced Services.

//IAS is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//IAS is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with Foobar.  If not, see <http://www.gnu.org/licenses/>.



using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Claims
{
    public partial class ClaimPolicyVerification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblPolicyNumber.InnerText = Request.QueryString["PolicyNumber"].ToString();
            }
            catch (Exception exp)
            {
                lblPolicyNumber.InnerText = "";
            }
        }


        protected void RegistrarSiniestro(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(estadoClienteDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;

            try
            {

                cmd.CommandText = "claim.sp_change_claim_status";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@ClaimID", Request.QueryString["ClaimID"]);
                cmd.Parameters.AddWithValue("@GoNextStep", 1);
                cmd.Parameters.AddWithValue("@UserName", User.Identity.Name);

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

        protected void CierreSiniestro(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(estadoClienteDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;

            try
            {
                cmd.CommandText = "claim.sp_change_claim_status";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@ClaimID", Request.QueryString["ClaimID"]);
                cmd.Parameters.AddWithValue("@GoNextStep", 0);
                cmd.Parameters.AddWithValue("@UserName", User.Identity.Name);

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