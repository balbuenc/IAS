using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace IAS
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

        }

        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
            //CultureInfo newCulture = (CultureInfo)System.Threading.Thread.CurrentThread.CurrentCulture.Clone();
            var myCIintl = new CultureInfo("es-PY");
            //newCulture.DateTimeFormat.ShortDatePattern = "dd/MM/YYYY";
            //newCulture.DateTimeFormat.DateSeparator = "/";
            //newCulture.NumberFormat.NumberDecimalSeparator = ",";
            //newCulture.NumberFormat.NumberGroupSeparator = ".";
            //newCulture.NumberFormat.CurrencyDecimalSeparator = ",";
            //newCulture.NumberFormat.CurrencyGroupSeparator = ",";
            //newCulture.LCID
            Thread.CurrentThread.CurrentCulture = myCIintl;
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs.

            // Get last error from the server
            Exception exc = Server.GetLastError();

            if(exc is HttpUnhandledException)
            {
                if(exc.InnerException != null)
                {
                    exc = new Exception(exc.InnerException.Message);
                    Server.Transfer("ErrorPage.aspx?handler=Application_Error%20-%20Global.asax",
                        true);
                }
            }
        }
    }
}