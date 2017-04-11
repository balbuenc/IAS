using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Agents
{
    public partial class ClaimsReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = "http://app.balcazzht.com/ReportServer/Pages/ReportViewer.aspx?%2fIAS_SSRS%2fClaims&rs:Command=Render";
            Response.Redirect(url);
            //string s = "window.open('" + url + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            //ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }
    }
}