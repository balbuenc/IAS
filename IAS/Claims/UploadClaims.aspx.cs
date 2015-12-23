using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Claims
{
    public partial class UploadClaims : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MapfreClaimsFileBtn_Click(object sender, EventArgs e)
        {
            if (MapfreClaimsFileUp.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(MapfreClaimsFileUp.FileName);
                    MapfreClaimsFileUp.SaveAs(Server.MapPath("../Exchange/") + filename);
                    MapfreClaimsFileStatus.Text = "Estado: Archivo actualizado!";
                }
                catch (Exception ex)
                {
                    MapfreClaimsFileStatus.Text = "Estado: Error al subir el archivo: " + ex.Message;
                }
            }
        }

        protected void SancorClaimsFileBtn_Click(object sender, EventArgs e)
        {
            if (SancorClaimsFileUp.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(SancorClaimsFileUp.FileName);
                    SancorClaimsFileUp.SaveAs(Server.MapPath("../Exchange/") + filename);
                    SancorClaimsFileStatus.Text = "Estado: Archivo actualizado!";
                }
                catch (Exception ex)
                {
                    SancorClaimsFileStatus.Text = "Estado: Error al subir el archivo: " + ex.Message;
                }
            }
        }
    }
}