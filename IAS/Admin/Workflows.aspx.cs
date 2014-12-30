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
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Validation;

namespace IAS.Admin {

    public partial class Workflows : System.Web.UI.Page {

        protected void Page_Load( object sender, EventArgs e ) {

        }

        public IQueryable<Workflow> GetData() {
            try {
                var db = new ApplicationDbContext();
                var query = db.Workflows;
                return query;
            }
            catch ( Exception exp ) {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = exp.Message;
                return null;
            }
        }

        public IQueryable<Form> GetForms()
        {
            var db = new ApplicationDbContext();
            var query = db.Forms.OrderBy(u => u.FormName).Distinct();
            return query;
        }

        public void Update( Workflow subject ) {

            try
            {
                var db = new ApplicationDbContext();
                var workflow = db.Workflows.Where(s => s.WorkflowID == subject.WorkflowID).SingleOrDefault();
                // workflow.WorkflowName = subject.WorkflowName;
                workflow.DefaultFormID = subject.DefaultFormID;

                db.SaveChanges();

                this.WorkflowsListView.EditIndex = -1;
                
                ErrorLabel.Visible = false;
                ErrorLabel.Text = String.Empty;
            
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

        public void Delete( Workflow subject ) {
            try {
                
                var db = new ApplicationDbContext();
                var workflow = db.Workflows.Where( s => s.WorkflowID == subject.WorkflowID ).SingleOrDefault();
                db.Workflows.Remove( workflow );
                db.SaveChanges();

                ErrorLabel.Visible = false;
                ErrorLabel.Text = String.Empty;
            }
            catch (DbEntityValidationException ex)
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = EventLogManager.LogError(ex);
            }
            catch ( Exception exp ) {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = exp.Message;
            }
        }

        protected void WorkflowsListView_ItemEditing( object sender, ListViewEditEventArgs e ) {
            WorkflowsListView.EditIndex = e.NewEditIndex;
        }

        protected void WorkflowsListView_ItemCanceling( object sender, ListViewCancelEventArgs e ) {
            WorkflowsListView.EditIndex = -1;
        }

        public void Insert() {
            var db = new ApplicationDbContext();
            var workflow = new Workflow();
            TryUpdateModel( workflow );
            if ( ModelState.IsValid ) {
                try {
                    db.Workflows.Add( workflow );
                    db.SaveChanges();

                    ErrorLabel.Visible = false;
                    ErrorLabel.Text = String.Empty;
                }
                catch (DbEntityValidationException ex)
                {
                    ErrorLabel.Visible = true;
                    ErrorLabel.Text = EventLogManager.LogError(ex);
                }
                catch ( Exception exp ) {
                    ErrorLabel.Visible = true;
                    ErrorLabel.Text = exp.Message;
                }
            }
            else {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = "Complete todos los campos.";
            }
        }

        protected void WorkflowsListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if(e.Item.ItemType == ListViewItemType.DataItem){
                Label _lblDefaultFormName = (Label)e.Item.FindControl("lblDefaultFormName");
                if (_lblDefaultFormName != null && DataBinder.Eval(e.Item.DataItem, "DefaultFormID") != null)
                {
                    _lblDefaultFormName.Text = DataBinder.Eval(e.Item.DataItem, "DefaultForm.FormName").ToString();
                }
            }
        }
    }
}