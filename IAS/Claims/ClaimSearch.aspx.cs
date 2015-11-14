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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                criteria = Request.QueryString["criteria"].ToString();
                switch (criteria)
                {
                    case "PolicyNumber":
                        txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Pòliza";
                        criteriaBtn.InnerText = "Nro. Pòliza";
                        break;
                    case "Client":
                        txtSearchClaim.Attributes["placeholder"] = "Buscar por Cliente";
                        criteriaBtn.InnerText = "Cliente";
                        break;
                    case "ClaimDate":
                        txtSearchClaim.Attributes["placeholder"] = "Buscar por Fecha";
                        criteriaBtn.InnerText = "Fecha";
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
            catch (Exception exp)
            {
                txtSearchClaim.Attributes["placeholder"] = "Buscar por Nro. Pòliza";
                criteriaBtn.InnerText = "Nro. Pòliza";
                criteria = "PolicyNumber";
            }

        }

        protected void searchBox_ServerClick(object sender, EventArgs e)
        {
            ClaimListView.DataBind();
        }
    }
}