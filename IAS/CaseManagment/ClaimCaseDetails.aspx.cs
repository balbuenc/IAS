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
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.CaseManagment
{
    public partial class ClaimCaseDetails1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Person GetPerson([QueryString("CaseID")] long? caseID)
        {
            try
            {
                var db = new ApplicationDbContext();
                var colls = db.Claims.Where(c => c.CaseID == caseID);
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

        public IQueryable<CollectionState> GetCollectionStates()
        {
            var db = new ApplicationDbContext();
            return db.CollectionStates;
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
    }
}