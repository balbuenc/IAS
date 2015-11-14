using System;
using System.Collections.Generic;
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

            string filename = Path.GetFileName(Request.Path);

            //Limpio los campos de Atributos de las pastillas de Navegacion
            searchClaimTab.Attributes.Remove("class");
            newClaimTab.Attributes.Remove("class");
            verificationClaimTab.Attributes.Remove("class");
            registerClaimTab.Attributes.Remove("class");
            approvementClaimTab.Attributes.Remove("class");
            workShopClaimTab.Attributes.Remove("class");
            closeClaimTab.Attributes.Remove("class");

            //Seteo la pastilla de Navegacion activa
            if (filename == "ClaimSearch")
                searchClaimTab.Attributes.Add("class","active");
            else if (filename == "NewClaim")
                newClaimTab.Attributes.Add("class", "active");

        }



    }
}