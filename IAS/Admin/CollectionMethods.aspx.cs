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
    public partial class CollectionMethods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<CollectionMethod> GetCollectionMethods()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.CollectionMethods.OrderBy(m=>m.CollectionMethodName);             
                return query;                
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateCollectionMethod(CollectionMethod subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var collectionMethod = db.CollectionMethods.Where(s => s.CollectionMethodID == subject.CollectionMethodID).SingleOrDefault();
                TryUpdateModel<CollectionMethod>( collectionMethod );
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

        public void DeleteCollectionMethod(CollectionMethod subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var collectionMethod = db.CollectionMethods.Where(s => s.CollectionMethodID == subject.CollectionMethodID).SingleOrDefault();
                db.CollectionMethods.Remove(collectionMethod);
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

        protected void CollectionMethodsListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            CollectionMethodsListView.EditIndex = e.NewEditIndex;
        }

        protected void CollectionMethodsListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            CollectionMethodsListView.EditIndex = -1;
        }

        public void InsertCollectionMethod()
        {
            var db = new ApplicationDbContext();
            var collectionMethod = new CollectionMethod();
            TryUpdateModel(collectionMethod);
            if (ModelState.IsValid)
            {
                try
                {
                    db.CollectionMethods.Add(collectionMethod);
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