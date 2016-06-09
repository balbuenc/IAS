using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Transports
{
    public partial class Certificates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CertificateListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch(e.CommandName)
            {
                case "Edit":
                    Response.Redirect("Certificate.aspx?criteria=Client&mode=update&certificateID=" + e.CommandArgument);
                    break;
                case "Delete":
                    break;
                default:
                    break;
            }
        }
    }
}