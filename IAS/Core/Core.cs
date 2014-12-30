using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.Core
{
    public class Core : System.Web.UI.Page
    {
        public bool IsUserAuthenticate()
        {
            return Context.User.Identity.IsAuthenticated;
        }
    }
}