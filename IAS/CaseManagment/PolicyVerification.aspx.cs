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


using IAS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.ClaimManagment
{
    public partial class PolicyVerification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Person GetPerson([QueryString("CaseID")] long? caseID)
        {
            try
            {
                var db = new ApplicationDbContext();
                var colls = db.Collections.Where(c => c.CaseID == caseID);
                if (null != colls)
                    return colls.First().Person;
                else
                    return null;
            }
            catch
            {
                return null;
            }
        }

      
    

        protected void CaseTransitionManager_CaseStateChanged()
        {
            this.caseInfoPanel.Update();
        }

       
        protected void DetailListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            var lv = sender as ListView;
            lv.EditIndex = e.NewEditIndex;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dateTimePickup", "$('input.datetime').datetimepicker({pickTime: false});", true);
        }

        protected void DetailListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            var lv = sender as ListView;
            lv.EditIndex = -1;
        }

        protected void DetailListView_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            var lv = sender as ListView;
            lv.EditIndex = -1;
        }

      


        public DateTime LastDayofMonth(DateTime dt)
        {

            //Select the first day of the month by using the DateTime class
            dt = new DateTime(dt.Year, dt.Month, 1);

            //Add one month to our adjusted DateTime
            dt = dt.AddMonths(1);

            //Subtract one day from our adjusted DateTime
            dt = dt.AddDays(-1);

            //Return the DateTime, now set to the last day of the month
            return dt;

        }

       

        protected void ClaimListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ClaimSqldataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;

            if (e.CommandName == "Request")
            {

                Label lblClaimID = (Label)e.Item.FindControl("lblClaimID");
                try
                {
                    cmd.CommandText = "claim.sp_enviar_verificacion_poliza";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlConnection1;

                    cmd.Parameters.AddWithValue("@tipo_notificacion", "solicitud_verificacion");
                    cmd.Parameters.AddWithValue("@destino", "cbalbuena.cazzola@gmail.com");
                    cmd.Parameters.AddWithValue("@mensaje", "Se solicita la verificación del Siniestro");
                    cmd.Parameters.AddWithValue("@user", User.Identity.Name);
                    cmd.Parameters.AddWithValue("@id_caso", Request.QueryString["CaseID"]);
                    cmd.Parameters.AddWithValue("@id_siniestro",  lblClaimID.Text);





                    sqlConnection1.Open();

                    rowsAffected = cmd.ExecuteNonQuery();

                    sqlConnection1.Close();

                }
                catch (Exception exp)
                {
                    ErrorLabel.Text = exp.Message;
                }
            }
        }
    }
}