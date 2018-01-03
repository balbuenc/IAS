using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.CaseManagment
{
    public partial class SearchCase : System.Web.UI.Page
    {
        string CaseID;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CaseListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string url;
          
            try
            {
                if (e.CommandName == "Manage")
                {
                    url = "/CaseManagment/ManageCase.aspx?CaseID=" + e.CommandArgument.ToString();
                    Response.Redirect(url, false);

                }
                else if (e.CommandName == "Edit" || e.CommandName == "update")
                {
                    CaseID = e.CommandArgument.ToString();
                }
               

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void CaseListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            DropDownList ddlOrigen = (DropDownList)CaseListView.Items[e.ItemIndex].FindControl("ddlUser");
            CaseDataSource.UpdateParameters["CaseID"].DefaultValue = CaseID;
            CaseDataSource.UpdateParameters["UserID"].DefaultValue = ddlOrigen.SelectedValue;
        }

       

       
    }
}