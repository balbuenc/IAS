//«Copyright 2014 Balcazz HT, http://www.balcazzht.com»

//This file is part of IAS | Insurance Advanced Services.

//IAS is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//IAS is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with Foobar.  If not, see <http://www.gnu.org/licenses/>.


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