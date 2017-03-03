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
    public partial class UploadCollections : Page
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
                    
                    DateTime dateMapfre = DateTime.Parse(txtDateMapfre.Value);
                    string fileName = $"mapfre_expire_{dateMapfre.Year}{((dateMapfre.Month.ToString().Length == 1) ? "0" + dateMapfre.Month : dateMapfre.Month.ToString())}{((dateMapfre.Day.ToString().Length == 1) ? "0" + dateMapfre.Day : dateMapfre.Day.ToString())}.csv";
                  
                    string fileExtension = Path.GetExtension(MapfreExpiredUp.FileName);

                    if (fileExtension.Equals(".csv"))
                    {
                        MapfreExpiredUp.SaveAs(Server.MapPath("../Exchange/") + fileName);
                        MapfreExpiredStatus.Text = "Estado: Archivo actualizado!";
                    }
                    else
                    {
                        MapfreExpiredStatus.Text = "Estado: El archivo debe ser .csv!";
                    }                  
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
                    DateTime dateMapfre = DateTime.Parse(txtDateMapfre.Value);
                    string fileName = $"mapfre_to_expire_{dateMapfre.Year}{((dateMapfre.Month.ToString().Length == 1) ? "0" + dateMapfre.Month : dateMapfre.Month.ToString())}{((dateMapfre.Day.ToString().Length == 1) ? "0" + dateMapfre.Day : dateMapfre.Day.ToString())}.csv";


                    string fileExtension = Path.GetExtension(MapfreToExpireUp.FileName);

                    if (fileExtension.Equals(".csv"))
                    {
                        MapfreToExpireUp.SaveAs(Server.MapPath("../Exchange/") + fileName);
                        MapfreToExpireStatus.Text = "Estado: Archivo actualizado!";
                    }
                    else
                    {
                        MapfreToExpireStatus.Text = "Estado: El archivo debe ser .csv!";
                    }

                 
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
                    DateTime dateSancor = DateTime.Parse(txtDateSancor.Value);
                    string fileName = $"sancor_collection_{dateSancor.Year}{((dateSancor.Month.ToString().Length == 1) ? "0" + dateSancor.Month : dateSancor.Month.ToString())}{((dateSancor.Day.ToString().Length == 1) ? "0" + dateSancor.Day : dateSancor.Day.ToString())}.csv";

                    string fileExtension = Path.GetExtension(Sancor.FileName);

                    if (fileExtension.Equals(".csv"))
                    {
                        Sancor.SaveAs(Server.MapPath("../Exchange/") + fileName);
                        SancorStatus.Text = "Estado: Archivo actualizado!";
                    }
                    else
                    {
                        SancorStatus.Text = "Estado: El archivo debe ser .csv!";
                    }
                
                }
                catch (Exception ex)
                {
                    SancorStatus.Text = "Estado: Error al subir el archivo: " + ex.Message;
                }
            }
        }
    }
}