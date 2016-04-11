using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Admin
{
    public partial class Partners : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PartnerListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(PartnerDataSource.ConnectionString);

            SqlCommand cmd1 = new SqlCommand();
            int rowsAffected;

            string txtPartner;
            string txtPartnerID; 
            DropDownList ddlCountry;


            if (e.CommandName == "Insert")
            {
                try
                {
                    txtPartner = (PartnerListView.InsertItem.FindControl("txtPartner") as TextBox).Text;
                    ddlCountry = (PartnerListView.InsertItem.FindControl("ddlCountry") as DropDownList);

                    cmd1.CommandText = "[dbo].[sp_insert_partner]";
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Connection = sqlConnection1;

                    cmd1.Parameters.AddWithValue("@Partner", txtPartner);
                    cmd1.Parameters.AddWithValue("@CountryID", ddlCountry.SelectedValue);

                    sqlConnection1.Open();

                    rowsAffected = cmd1.ExecuteNonQuery();

                    sqlConnection1.Close();
                }
                catch (Exception exp)
                {
                    ErrorLabel.Text = exp.Message;
                    ErrorLabel.Visible = true;
                }
            }
            else if (e.CommandName == "Update")
            {
                txtPartner = (e.Item.FindControl("txtPartner") as TextBox).Text;
                ddlCountry = (e.Item.FindControl("ddlCountry") as DropDownList);
                txtPartnerID = (e.Item.FindControl("txtPartnerID") as TextBox).Text;

                cmd1.CommandText = "[dbo].[sp_update_partner]";
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Connection = sqlConnection1;

                cmd1.Parameters.AddWithValue("@Partner", txtPartner);
                cmd1.Parameters.AddWithValue("@CountryID", ddlCountry.SelectedValue);
                cmd1.Parameters.AddWithValue("@PartnerID", txtPartnerID);
                sqlConnection1.Open();

                rowsAffected = cmd1.ExecuteNonQuery();

                sqlConnection1.Close();

                
            }
           
        }

      

      
    }

}