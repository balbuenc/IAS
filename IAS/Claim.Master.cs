using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS
{
    public partial class Claim : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && Request.Url.LocalPath.ToString() != "/Account/Login")
            {
                Core.Core User = new Core.Core();

                if (!User.IsUserAuthenticate())
                {
                    //Response.Redirect("/Account/Login.aspx", false);

                    string OriginalUrl = HttpContext.Current.Request.RawUrl;
                    string LoginPageUrl = "/Account/Login.aspx";
                    HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
                }

                GetTotalStatus();
                
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut();
        }

        private void GetTotalStatus()
        {

            SqlConnection sqlConnection1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IASDBContext"].ToString());
            SqlCommand cmd = new SqlCommand();

            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            try
            {

                cmd.CommandText = "[claim].[sp_get_total_status]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                da.SelectCommand = cmd;

                da.Fill(dt);


                if (dt.Rows.Count > 0)
                {

                    lblDanger.Text = dt.Rows[0]["Total"] + " / " + dt.Rows[0]["Status"];

                    lblDanger.Text = dt.Rows[0]["Total"] + " / " + dt.Rows[0]["Status"];

                    lblWarning.Text = dt.Rows[1]["Total"] + " / " + dt.Rows[1]["Status"];
                    lblInfo.Text = dt.Rows[2]["Total"] + " / " + dt.Rows[2]["Status"];
                }
            }
            catch (Exception exp)
            {

            }

        }

    }
}