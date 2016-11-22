using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Transports
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

        protected void SearchClaims()
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

            criteria = "Client";
            myClaims = ddlMyClaims.SelectedValue;
            claimStatusId = ddlStatus.SelectedValue;

            SqlConnection sqlConnection1 = new SqlConnection(ClaimSqldataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[transport].[sp_search_claims]";
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

            switch (e.CommandName.ToLower())
            {
                case "edit":
                    Response.Redirect("Claim.aspx?ClaimID=" + claimID + "&mode=update");
                    break;
                case "close":
                    try
                    {
                        //Genero el cambio de estado
                        cmd.CommandText = "transport.sp_change_claim_status";
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
                    break;
                case "delete":
                    try
                    {

                        //Genero el cambio de estado
                        cmd.CommandText = "transport.sp_delete_claim";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = sqlConnection1;

                        cmd.Parameters.AddWithValue("@ClaimID", claimID);
                        
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
                    break;
                default:
                    break;
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchClaims();
        }

        protected void ClaimListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    Label lblStatusID = (Label)e.Item.FindControl("lblStatusID");

                    if (lblStatusID.Text.Equals("4"))
                    {

                        HyperLink linkAction = (HyperLink)e.Item.FindControl("linkAction");
                        linkAction.Visible = false;

                        LinkButton EditButton  = (LinkButton)e.Item.FindControl("EditButton");
                        EditButton.Visible = false;

                        LinkButton CloseButton = (LinkButton)e.Item.FindControl("CloseButton");
                        CloseButton.Visible = false;

                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = "Error al visualizar los datos.. : " + ex.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}