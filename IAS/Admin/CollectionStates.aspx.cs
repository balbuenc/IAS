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
    public partial class CollectionStates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<CollectionState> GetCollectionStates()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.CollectionStates.OrderBy(m=>m.CollectionStateName);             
                return query;                
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateCollectionState(CollectionState subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var collectionState = db.CollectionStates.Where(s => s.CollectionStateID == subject.CollectionStateID).SingleOrDefault();
                collectionState.CollectionStateName = subject.CollectionStateName;
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

        public void DeleteCollectionState(CollectionState subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var collectionState = db.CollectionStates.Where(s => s.CollectionStateID == subject.CollectionStateID).SingleOrDefault();
                db.CollectionStates.Remove(collectionState);
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

        protected void CollectionStatesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            CollectionStatesListView.EditIndex = e.NewEditIndex;
        }

        protected void CollectionStatesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            CollectionStatesListView.EditIndex = -1;
        }

        public void InsertCollectionState()
        {
            var db = new ApplicationDbContext();
            var collectionState = new CollectionState();
            TryUpdateModel(collectionState);
            if (ModelState.IsValid)
            {
                try
                {
                    db.CollectionStates.Add(collectionState);
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