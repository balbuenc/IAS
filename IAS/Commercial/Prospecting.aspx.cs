using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Commercial
{
    public partial class Prospecting : System.Web.UI.Page
    {
        string ProspectingID;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ProspectingListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            DropDownList ddlDocumentType = (DropDownList)ProspectingListView.Items[e.ItemIndex].FindControl("DocumentTypeDDL");
            DropDownList ddlProposalType = (DropDownList)ProspectingListView.Items[e.ItemIndex].FindControl("ProposalTypeDDL");

            ProspectingDataSource.UpdateParameters["ProspectingID"].DefaultValue = ProspectingID;
            ProspectingDataSource.UpdateParameters["DocumentTypeID"].DefaultValue = ddlDocumentType.SelectedValue;
            ProspectingDataSource.UpdateParameters["ProposalTypeID"].DefaultValue = ddlProposalType.SelectedValue;
        }

        protected void ProspectingListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit" || e.CommandName == "update")
            {
                ProspectingID = e.CommandArgument.ToString();
            }
        }
    }
}