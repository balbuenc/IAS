using System;
using System.Collections.Generic;
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

        protected void Page_Load(object sender, EventArgs e)
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
            catch (Exception exp1)
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
                            criteriaBtn.InnerText = "Nro. Pòliza";
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

        protected void searchBox_ServerClick(object sender, EventArgs e)
        {
            ClaimListView.DataBind();
        }
    }
}