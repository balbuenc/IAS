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
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Validation;

namespace IAS.Admin {
    
    public partial class WorkflowStateTransitions : System.Web.UI.Page {
        
        protected void Page_Load( object sender, EventArgs e ) {
            if ( !IsPostBack ) {
                GetWorkflows();                
                ddlWorkflows.SelectedValue = Request.QueryString["WorkflowID"];
            }
        }

        public IQueryable<Workflow> GetWorkflows() {
            var db = new ApplicationDbContext();
            var query = db.Workflows;
            return query;
        }

        public IQueryable<State> GetStates() {
            var db = new ApplicationDbContext();
            var query = db.States.OrderBy( s => s.StateName ); ;
            return query;
        }


        public IQueryable<WorkflowStateTransition> GetData( [QueryString( "WorkflowID" )] long? workflowID,
            [Control( "ddlWorkflows" )] long? postBackWorkflowID) {
            var db = new ApplicationDbContext();
            IQueryable<WorkflowStateTransition> query = db.WorkflowStateTransitions;

            if ( postBackWorkflowID.HasValue )
                query = query.Where( wt => wt.WorkflowID == postBackWorkflowID.Value );
            else if ( workflowID.HasValue )
                query = query.Where( wt => wt.WorkflowID == workflowID.Value );
            return query;
        }

        public void Update( WorkflowStateTransition subject ) {
            try {
                var db = new ApplicationDbContext();
                var workflowStateTransition = db.WorkflowStateTransitions.Where( s => s.WorkflowStateTransitionID == subject.WorkflowStateTransitionID ).SingleOrDefault();
                workflowStateTransition.InitialStateID = subject.InitialStateID;
                workflowStateTransition.FinalStateID = subject.FinalStateID;
                workflowStateTransition.EditableEffectiveDate = subject.EditableEffectiveDate;
                db.SaveChanges();
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

        public void Delete( WorkflowStateTransition subject ) {
            try {
                var db = new ApplicationDbContext();
                var workflowStateTransition = db.WorkflowStateTransitions.Where( s => s.WorkflowStateTransitionID == subject.WorkflowStateTransitionID ).SingleOrDefault();
                db.WorkflowStateTransitions.Remove( workflowStateTransition );
                db.SaveChanges();
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

        protected void WorkflowStateTransitionsListView_ItemEditing( object sender, ListViewEditEventArgs e ) {
            WorkflowStateTransitionsListView.EditIndex = e.NewEditIndex;
        }

        protected void WorkflowStateTransitionsListView_ItemCanceling( object sender, ListViewCancelEventArgs e ) {
            WorkflowStateTransitionsListView.EditIndex = -1;
        }

        public void Insert( [Control( "ddlWorkflows" )] long workflowID ) {
            
            var db = new ApplicationDbContext();
            var workflowStateTransition = new WorkflowStateTransition();
            
            TryUpdateModel( workflowStateTransition );

            workflowStateTransition.WorkflowID = workflowID;
            
            if ( ModelState.IsValid ) {
                try {
                    db.WorkflowStateTransitions.Add( workflowStateTransition );
                    db.SaveChanges();
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
            else {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = "Complete todos los campos.";
            }
        }

    }
}