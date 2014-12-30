using IAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data.Entity.Validation;

namespace IAS.Admin
{
    public partial class States : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<State> GetStates()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.States;             
                return query;                
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateState(State subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var state = db.States.Where(s => s.StateID == subject.StateID).SingleOrDefault();
                state.StateName = subject.StateName;
                state.Active = subject.Active;
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

        public void DeleteState(State subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var state = db.States.Where(s => s.StateID == subject.StateID).SingleOrDefault();
                db.States.Remove(state);
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

        protected void StatesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            StatesListView.EditIndex = e.NewEditIndex;
        }

        protected void StatesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            StatesListView.EditIndex = -1;
        }

        public void InsertState()
        {
            var db = new ApplicationDbContext();
            var state = new State();
            TryUpdateModel(state);
            if (ModelState.IsValid)
            {
                try
                {
                    db.States.Add(state);
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
    }
}