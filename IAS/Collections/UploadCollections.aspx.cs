using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Collections
{
    public partial class UploadCollections : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MapfreExpireBtn_Click(object sender, EventArgs e)
        {
            if (MapfreExpiredUp.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(MapfreExpiredUp.FileName);
                    MapfreExpiredUp.SaveAs(Server.MapPath("../Exchange/") + filename);
                    MapfreExpiredStatus.Text = "Estado: Archivo actualizado!";
                }
                catch (Exception ex)
                {
                    MapfreExpiredStatus.Text = "Estado: Error al subir el archivo: " + ex.Message;
                }
            }
        }

        protected void MapfreToExpireBtn_Click(object sender, EventArgs e)
        {
            if (MapfreToExpireUp.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(MapfreToExpireUp.FileName);
                    MapfreToExpireUp.SaveAs(Server.MapPath("../Exchange/") + filename);
                    MapfreToExpireStatus.Text = "Estado: Archivo actualizado!";
                }
                catch (Exception ex)
                {
                    MapfreToExpireStatus.Text = "Estado: Error al subir el archivo: " + ex.Message;
                }
            }
        }

        protected void SancorBtn_Click(object sender, EventArgs e)
        {
            if (Sancor.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(Sancor.FileName);
                    Sancor.SaveAs(Server.MapPath("../Exchange/") + filename);
                    SancorStatus.Text = "Estado: Archivo actualizado!";
                }
                catch (Exception ex)
                {
                    SancorStatus.Text = "Estado: Error al subir el archivo: " + ex.Message;
                }
            }
        }
    }
}