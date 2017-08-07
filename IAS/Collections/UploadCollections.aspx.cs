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

                    DateTime dateMapfre;

                    string[] components = txtDateMapfre.Value.Split('-');

                    int day = int.Parse(components[2]);
                    int month = int.Parse(components[1]);
                    int year = int.Parse(components[0]);

                    dateMapfre = new DateTime(year, month, day);

                    string fileName = $"mapfre_expired_{dateMapfre.Year}{((dateMapfre.Month.ToString().Length == 1) ? "0" + dateMapfre.Month : dateMapfre.Month.ToString())}{((dateMapfre.Day.ToString().Length == 1) ? "0" + dateMapfre.Day : dateMapfre.Day.ToString())}.csv";
                  
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
                    DateTime dateMapfre;
                    
                    string[] components = txtDateMapfre.Value.Split('-');

                    int day = int.Parse(components[2]);
                    int month = int.Parse(components[1]);
                    int year = int.Parse(components[0]);

                    dateMapfre = new DateTime(year, month, day);

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
                    DateTime dateSancor;
                    
                    string[] components = txtDateSancor.Value.Split('-');

                    int day = int.Parse(components[2]);
                    int month = int.Parse(components[1]);
                    int year = int.Parse(components[0]);

                    dateSancor = new DateTime(year, month, day);


                    string fileName = $"sancor_collections_{dateSancor.Year}{((dateSancor.Month.ToString().Length == 1) ? "0" + dateSancor.Month : dateSancor.Month.ToString())}{((dateSancor.Day.ToString().Length == 1) ? "0" + dateSancor.Day : dateSancor.Day.ToString())}.csv";

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

        protected void MapfreToExcludeBtn_Click(object sender, EventArgs e)
        {
            if (MapfreToExcludeUp.HasFile)
            {
                try
                {
                   

                    string fileName = $"mapfre_to_exclude_{DDLMapfreToExclude.SelectedValue}.xlsx";


                    string fileExtension = Path.GetExtension(MapfreToExcludeUp.FileName);

                    if (fileExtension.Equals(".xlsx"))
                    {
                        MapfreToExcludeUp.SaveAs(Server.MapPath("../Exchange/") + fileName);
                        MapfreToExcludeStatus.Text = "Estado: Archivo actualizado!";
                    }
                    else
                    {
                        MapfreToExcludeStatus.Text = "Estado: El archivo debe ser .xlsx!";
                    }


                }
                catch (Exception ex)
                {
                    MapfreToExcludeStatus.Text = "Estado: Error al subir el archivo: " + ex.Message;
                }
            }
        }

        protected void SancorToExcludeUpBtn_Click(object sender, EventArgs e)
        {
            if (SancorToExcludeUp.HasFile)
            {
                try
                {


                    string fileName = $"sancor_to_exclude_{DDLSancorToExclude.SelectedValue}.xlsx";


                    string fileExtension = Path.GetExtension(SancorToExcludeUp.FileName);

                    if (fileExtension.Equals(".xlsx"))
                    {
                        SancorToExcludeUp.SaveAs(Server.MapPath("../Exchange/") + fileName);
                        SancorToExcludeStatus.Text = "Estado: Archivo actualizado!";
                    }
                    else
                    {
                        SancorToExcludeStatus.Text = "Estado: El archivo debe ser .xlsx!";
                    }


                }
                catch (Exception ex)
                {
                    SancorToExcludeStatus.Text = "Estado: Error al subir el archivo: " + ex.Message;
                }
            }
        }
    }
}