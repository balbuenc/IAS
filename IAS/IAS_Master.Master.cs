using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS
{
    public partial class IAS_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.Url.LocalPath.ToString() != "/Account/Login")
            {
                Core.Core User = new Core.Core();

                if (!User.IsUserAuthenticate())
                {
                    Response.Redirect("/Account/Login.aspx", false);
                }
            }
        }
    }
}