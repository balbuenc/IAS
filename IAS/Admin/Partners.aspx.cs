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

            string txtPartner;
            string txtPartnerID;
            DropDownList ddlCountry;

            try
            {
                if(e.CommandName == "Insert")
                {
                    try
                    {
                        txtPartner = (PartnerListView.InsertItem.FindControl("txtPartner") as TextBox).Text;
                        ddlCountry = (PartnerListView.InsertItem.FindControl("ddlCountry") as DropDownList);

                        PartnerDataSource.InsertParameters["Partner"].DefaultValue = txtPartner;
                        PartnerDataSource.InsertParameters["CountryID"].DefaultValue = ddlCountry.SelectedValue;

                        PartnerDataSource.Insert();

                    }
                    catch(Exception exp)
                    {
                        ErrorLabel.Text = exp.Message;
                        ErrorLabel.Visible = true;
                    }
                }
                else if(e.CommandName == "Update")
                {
                    txtPartner = (e.Item.FindControl("txtPartner") as TextBox).Text;
                    ddlCountry = (e.Item.FindControl("ddlCountry") as DropDownList);
                    txtPartnerID = (e.Item.FindControl("txtPartnerID") as TextBox).Text;

                    PartnerDataSource.UpdateParameters["PartnerID"].DefaultValue = txtPartnerID;
                    PartnerDataSource.UpdateParameters["Partner"].DefaultValue = txtPartner;
                    PartnerDataSource.UpdateParameters["CountryID"].DefaultValue = ddlCountry.SelectedValue;

                    PartnerDataSource.Update();
                }
                
            }
            catch(Exception)
            {

                throw;
            }
            
        }

    }

}