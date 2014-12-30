using IAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Validation;

namespace IAS.Admin
{
    public partial class WorkflowStateForms : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetWorkflows();
                ddlWorkflows.SelectedValue = Request.QueryString["WorkflowID"];

                this.StatesObjectDataSource.DataBind();
            }
        }

        public IQueryable<Workflow> GetWorkflows()
        {
            var db = new ApplicationDbContext();
            var query = db.Workflows;
            return query;
        }

        public IQueryable<WorkflowStateForm> GetData([QueryString("WorkflowID")] long? workflowID, [Control("ddlWorkflows")] long? postBackWorkflowID)
        {
            try
            {
                long? _workflowID = (postBackWorkflowID.HasValue) ? postBackWorkflowID : workflowID;
                var db = new ApplicationDbContext();
                var query = db.WorkflowStatesForms
                    .Where(s => s.WorkflowID == _workflowID)
                    .OrderBy(s => s.State.StateName);
                return query;
            }
            catch (Exception exp)
            {
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

        public IQueryable<State> GetStates(long? pDefaultWorkFlowID, long? pCurrentWorkflowID)
        {
            long? _workflowID = (pCurrentWorkflowID.HasValue) ? pCurrentWorkflowID : pDefaultWorkFlowID;
            var db = new ApplicationDbContext();
            var query = db.WorkflowStateTransitions
                .Where(s => s.WorkflowID == _workflowID)
                .Select(s => s.InicialState)
                .Distinct()
                .OrderBy(s => s.StateName);

            return query;
        }

        public void BindStates()
        {
            long _workflowID;
            if (!long.TryParse(this.ddlWorkflows.SelectedValue, out _workflowID))
            {
                _workflowID = long.Parse(this.ddlWorkflows.SelectedValue);
            }
            var db = new ApplicationDbContext();
            var query = db.WorkflowStateTransitions
                .Where(s => s.WorkflowID == _workflowID)
                .Select(s => s.InicialState)
                .Distinct()
                .OrderBy(s => s.StateName);
        }

        public void DeleteStateForm(WorkflowStateForm subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var stateForm = db.WorkflowStatesForms.Where(p => p.WorkflowStateFormID == subject.WorkflowStateFormID).SingleOrDefault();
                db.WorkflowStatesForms.Remove(stateForm);
                db.SaveChanges();
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

        public void UpdateStateForm(WorkflowStateForm subject)
        {

            try
            {
                var db = new ApplicationDbContext();
                var stateForm = db.WorkflowStatesForms.Where(p => p.WorkflowStateFormID == subject.WorkflowStateFormID).SingleOrDefault();
                TryUpdateModel(stateForm);
                db.SaveChanges();
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

        public void InsertStateForm([Control("ddlWorkflows")] long workflowID)
        {
      
            var db = new ApplicationDbContext();
            var stateForm = new WorkflowStateForm();
            
            TryUpdateModel(stateForm);

            stateForm.WorkflowID = workflowID;

            if (ModelState.IsValid)
            {
                try
                {
                    db.WorkflowStatesForms.Add(stateForm);
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
                    ErrorLabel.Text = exp.Message;
                    ErrorLabel.Visible = true;
                }
            }
            else
            {
                ErrorLabel.Text = "Complete todos los campos.";
                ErrorLabel.Visible = true;
            }

        }

        protected void StatesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            StatesListView.EditIndex = -1;
        }

        protected void StatesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            StatesListView.EditIndex = e.NewEditIndex;
        }

        protected void ddlWorkflows_DataBound(object sender, EventArgs e)
        {

        }

    }
}