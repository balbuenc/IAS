using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Claims
{
    public partial class ClaimSearch : System.Web.UI.Page
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
                        txtSearchClaim.Value = claimID;
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
                                criteriaBtn.InnerText = "Nro. Póliza";
                                break;
                            case "Client":
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Cliente";
                                criteriaBtn.InnerText = "Cliente";
                                break;
                            case "ClientDocumentNumber":
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Documento";
                                criteriaBtn.InnerText = "Nro. Documento";
                                break;
                            case "ClaimNumber":
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Siniestro";
                                criteriaBtn.InnerText = "Nro. Siniestro";
                                break;
                            default:
                                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Pòliza";
                                criteriaBtn.InnerText = "Nro. Póliza";
                                criteria = "PolicyNumber";
                                break;
                        }
                    }

                }
                catch (Exception exp)
                {
                    txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Póliza";
                    criteriaBtn.InnerText = "Nro. Póliza";
                    criteria = "PolicyNumber";
                }
            }
        }

        protected void searchBox_ServerClick(object sender, EventArgs e)
        {
            if (txtSearchClaim.Value == "" && ddlMyClaims.SelectedValue == "0" && ddlStatus.SelectedValue == "-1")
            {
                getAllClaims();
            }
            else
            {
                ClaimListView.DataBind();
            }
        }

        protected void getAllClaims()
        {
            ClaimSqldataSource.SelectParameters["find"].DefaultValue = " ";
            ClaimSqldataSource.SelectParameters["criteria"].DefaultValue = " ";
            ClaimListView.DataBind();
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
    }
}