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
                    Response.Redirect("/Account/Login.aspx", false);
                }

                GetTotalStatus();

                string filename = Path.GetFileName(Request.Path);

                //Limpio los campos de Atributos de las pastillas de Navegacion
                searchClaimTab.Attributes.Remove("class");
                //newClaimTab.Attributes.Remove("class");
                verificationClaimTab.Attributes.Remove("class");
                registerClaimTab.Attributes.Remove("class");
                approvementClaimTab.Attributes.Remove("class");
                workShopClaimTab.Attributes.Remove("class");
                closeClaimTab.Attributes.Remove("class");

                //Seteo la pastilla de Navegacion activa
                if (filename == "ClaimSearch")
                    searchClaimTab.Attributes.Add("class", "active");
                //else if (filename == "NewClaim")
                //    newClaimTab.Attributes.Add("class", "active");
                else if (filename == "ClaimPolicyVerification")
                    verificationClaimTab.Attributes.Add("class", "active");
                else if (filename == "ClaimRegistration")
                    registerClaimTab.Attributes.Add("class", "active");
                else if (filename == "CloseClaim")
                    closeClaimTab.Attributes.Add("class", "active");
                else if (filename == "ApprovementClaim")
                    approvementClaimTab.Attributes.Add("class", "active");
                else if (filename == "WorkShopClaim")
                    workShopClaimTab.Attributes.Add("class", "active");
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