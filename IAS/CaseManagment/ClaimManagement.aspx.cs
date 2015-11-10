using IAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.CaseManagment
{
    public partial class ClaimManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchBox_ServerClick(object sender, EventArgs e)
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