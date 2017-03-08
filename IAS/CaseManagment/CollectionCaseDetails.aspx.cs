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

namespace IAS.CaseManagment
{
    public partial class CollectionCaseDetails : System.Web.UI.Page
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

        public IQueryable<Collection> GetCollectionsForCase([QueryString("CaseID")] long? caseID)
        {

            if (null == caseID)
                return null;
            var lastDate = this.LastDayofMonth(DateTime.Now);
            var db = new ApplicationDbContext();

            var coll = db.Collections
                .Where(c => c.CaseID == caseID)
                .Where(c => c.PaymentDueDate <= lastDate)
                .GroupBy(c => c.PolicyNumber)
                .Select(c => c.FirstOrDefault());

            return coll;
        }

        public IQueryable<Collection> GetOverdueInvoices([Control("lblPolicyNumber")] long? policyNumber)
        {
            if (null == policyNumber)
                return null;

            var lastDate = this.LastDayofMonth(DateTime.Now);
            var db = new ApplicationDbContext();
            var coll = db.Collections
                .Where(c => c.PolicyNumber == policyNumber)
                .Where(c => c.PaymentDueDate <= lastDate)
                .Where(c => c.Collected == false);
            return coll;
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
            
            Label lblCollectionID = (Label)lv.FindControl("lblCollectionID");
            UpdatePayment2(lblCollectionID.Text);
        }

        private void UpdatePayment2(string text)
        {
            throw new NotImplementedException();
        }

        public void UpdatePayment(Collection subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var theCollection = db.Collections.SingleOrDefault(c => c.CollectionID == subject.CollectionID);
                if (theCollection == null)
                {
                    ModelState.AddModelError("", String.Format("No se encontró el elemento con id. {0}", subject.CollectionID.ToString()));
                    return;
                }

                theCollection.Collected = subject.Collected;
                if (null == subject.CollectedDate)
                    theCollection.CollectedDate = DateTime.Today;
                else
                    theCollection.CollectedDate = subject.CollectedDate;


                theCollection.CollectionStateID = subject.CollectionStateID;
                db.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = EventLogManager.LogError(ex);
            }
            catch (Exception exp)
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = exp.Message;
            }
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

        protected void CollectionsListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblPolicyNumber = (Label)e.Item.FindControl("lblPolicyNumber");
                HiddenField1.Value = lblPolicyNumber.Text;
                ListView DetailListView = (ListView)e.Item.FindControl("DetailListView");

                //LoadDetailListView(DetailListView, lblPolicyNumber.Text);
            }
        }

        //private void LoadDetailListView(ListView detailListView, string policyNumber)
        //{
        //    SqlConnection sqlConnection1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IASDBContext"].ToString());
        //    SqlCommand cmd = new SqlCommand();

        //    SqlDataAdapter da = new SqlDataAdapter();
        //    DataTable dt = new DataTable();
        //    long caseID = long.Parse(Request.QueryString["CaseID"]);
        //    try
        //    {
        //        cmd.CommandText = "[collection].[sp_get_collections_by_policy]";
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Connection = sqlConnection1;

        //        cmd.Parameters.AddWithValue("@PolicyNumber", policyNumber);
        //        cmd.Parameters.AddWithValue("@CaseID", caseID);
        //        da.SelectCommand = cmd;

        //        da.Fill(dt);

        //        // Load certificate
        //        if (dt?.Rows.Count > 0)
        //        {
        //            detailListView.DataSource = da;
        //            detailListView.DataBind();
        //        }
        //        else
        //        {
        //            ErrorLabel.Text = "No existen registros del certificado";
        //            ErrorLabel.Visible = true;
        //        }
        //    }
        //    catch (Exception exp)
        //    {
        //        ErrorLabel.Text = exp.Message;
        //        ErrorLabel.Visible = true;
        //    }
        //}

        protected void DetailListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            var lv = sender as ListView;

            Label lblCollectionID = (Label)lv.Items[e.ItemIndex].FindControl("lblCollectionID");
            CheckBox chkCollected = (CheckBox)lv.Items[e.ItemIndex].FindControl("chkCollected");
            TextBox txtEffectiveDate = (TextBox)lv.Items[e.ItemIndex].FindControl("txtEffectiveDate");
            DropDownList ddlCollectionState = (DropDownList)lv.Items[e.ItemIndex].FindControl("ddlCollectionState");

            SqlDataSource ds = (SqlDataSource)lv.FindControl("CollectionSqlDatSource");
            long collectionID = long.Parse(lblCollectionID.Text);
            var db = new ApplicationDbContext();
            var theCollection = db.Collections.SingleOrDefault(c => c.CollectionID == collectionID);
            if (theCollection == null)
            {
                ModelState.AddModelError("", String.Format("No se encontró el elemento con id. {0}", lblCollectionID.Text));
                return;
            }

            theCollection.Collected = chkCollected.Checked;
            if (txtEffectiveDate.Text == string.Empty)
                theCollection.CollectedDate = DateTime.Today;
            else
                theCollection.CollectedDate = DateTime.Parse(txtEffectiveDate.Text);


            theCollection.CollectionStateID = int.Parse(ddlCollectionState.SelectedValue);
            db.SaveChanges();
        }
    }
}