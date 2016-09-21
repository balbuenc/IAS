using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Claims
{
    public partial class ClaimSearch : Page
    {
        private string criteria;
        private string claimID;


        protected void Page_Init(object sender, EventArgs e)
        {
            ClaimSqldataSource.SelectParameters["user"].DefaultValue = User.Identity.Name;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Verifico si es una busqueda por Formulario
                try
                {

                    if (Request.QueryString["PolicyNumber"] != null)
                    {
                        claimID = Request.QueryString["PolicyNumber"].ToString();
                    }

                    if (claimID != null)
                    {
                        txtSearchClaim.Text = claimID;
                        ClaimListView.DataSource = null;
                        ClaimListView.DataSourceID = "ClaimSqldataSource";
                        ClaimListView.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    claimID = null;
                }

                try
                {
                    if (Request.QueryString["criteria"] != null)
                    {
                        criteria = Request.QueryString["criteria"].ToString();
                        switch (criteria)
                        {
                            case "PolicyNumber":
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Póliza";
                                //criteriaBtn.InnerText = "Nro. Póliza";
                                break;
                            case "Client":
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Cliente";
                                //criteriaBtn.InnerText = "Cliente";
                                break;
                            case "ClientDocumentNumber":
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Documento";
                                //criteriaBtn.InnerText = "Nro. Documento";
                                break;
                            case "ClaimNumber":
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Siniestro";
                                //criteriaBtn.InnerText = "Nro. Siniestro";
                                break;
                            default:
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Pòliza";
                                //criteriaBtn.InnerText = "Nro. Póliza";
                                criteria = "PolicyNumber";
                                break;
                        }
                    }

                }
                catch (Exception exp)
                {
                    txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Póliza";
                    //criteriaBtn.InnerText = "Nro. Póliza";
                    criteria = "PolicyNumber";
                }
            }
        }

        protected void searchBox_ServerClick(object sender, EventArgs e)
        {
            searchClaims();
        }
        
        protected void searchClaims()
        {
            string criteria,
                   find,
                   myClaims,
                   claimStatusId;

            DateTime? startDate = null,
                     endDate = null;

            if (!string.IsNullOrEmpty(dpStart.Value))
            {
                startDate = DateTime.Parse(dpStart.Value);
            }

            if (!string.IsNullOrEmpty(dpEnd.Value))
            {
                endDate = DateTime.Parse(dpEnd.Value);
            }

            if (txtSearchClaim.Text == string.Empty)
                find = " ";
            else
            {
                find = txtSearchClaim.Text;
            }

            criteria = ddlCriteria.SelectedValue;
            myClaims = ddlMyClaims.SelectedValue;
            claimStatusId = ddlStatus.SelectedValue;

            SqlConnection sqlConnection1 = new SqlConnection(ClaimSqldataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[claim].[sp_search_claims]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@find", find);
                cmd.Parameters.AddWithValue("@criteria", criteria);
                cmd.Parameters.AddWithValue("@user", User.Identity.Name);
                cmd.Parameters.AddWithValue("@myClaims", myClaims);
                cmd.Parameters.AddWithValue("@claimStatusId", claimStatusId);

                cmd.Parameters.Add("@startDate", SqlDbType.DateTime).Value = startDate;
                cmd.Parameters.Add("@endDate", SqlDbType.DateTime).Value = endDate;

                da.SelectCommand = cmd;

                da.Fill(dt);

                //if (dt != null && dt.Rows.Count > 0)
                //{
                ClaimListView.DataSourceID = string.Empty;
                ClaimListView.DataSource = dt;
                ClaimListView.DataBind();
                //}
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = "Error a ejecutar busqueda.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void ClaimListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ClaimSqldataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            int rowsAffected;

            string claimID = ((Label)e.Item.FindControl("lblClaimID")).Text;
            string PolicyNumber = ((Label)e.Item.FindControl("lblPolicyNumber")).Text;

            if (e.CommandName == "Edit")
            {
                Response.Redirect("ClaimDetail.aspx?ClaimID=" + claimID + "&PolicyNumber=" + PolicyNumber);
            }
            else if (e.CommandName == "Close")
            {
                try
                {

                    //Genero el cambio de estado
                    cmd.CommandText = "claim.sp_change_claim_status";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlConnection1;

                    cmd.Parameters.AddWithValue("@ClaimID", claimID);
                    cmd.Parameters.AddWithValue("@GoNextStep", -1);
                    cmd.Parameters.AddWithValue("@UserName", User.Identity.Name);

                    sqlConnection1.Open();

                    rowsAffected = cmd.ExecuteNonQuery();

                    sqlConnection1.Close();



                    //Direcciono a la pagina de busqueda
                    Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + PolicyNumber);

                }
                catch (Exception exp)
                {
                    ErrorLabel.Text = exp.Message;
                    ErrorLabel.Visible = true;
                }
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            searchClaims();
        }

        [WebMethod]
        public static string[] SearchClaim(string prefix)
        {
            List<string> customers = new List<string>();
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = @"Data Source = aibsql.cloudapp.net,1500; Initial Catalog = ias_developer; Persist Security Info = True; User ID = ias_desarrollo; Password = Passw0rd";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select Top 10 nombre, apellido1 from exchange.personas where nombre like ''+@SearchText+'%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefix);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(string.Format("{0}-{1}", sdr["nombre"], sdr["apellido1"]));
                        }
                    }
                    conn.Close();
                }
            }
            return customers.ToArray();
        }

    }
}