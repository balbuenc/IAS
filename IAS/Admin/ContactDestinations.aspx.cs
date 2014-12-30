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
    public partial class ContactDestinations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ContactDestination> GetContactDestinations()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.ContactDestinations.OrderBy(m => m.ContactDestinationID );
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateContactDestination(ContactDestination subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var contactDestination = db.ContactDestinations.Where(s => s.ContactDestinationID == subject.ContactDestinationID ).SingleOrDefault();

                contactDestination.Description = subject.Description;
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

        public void DeleteContactDestination(ContactDestination subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var contactDestination = db.ContactDestinations.Where(s => s.ContactDestinationID  == subject.ContactDestinationID).SingleOrDefault();
                db.ContactDestinations.Remove(contactDestination);
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

        protected void ContactDestinationsListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            ContactDestinationsListView.EditIndex = e.NewEditIndex;
        }

        protected void ContactDestinationsListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ContactDestinationsListView.EditIndex = -1;
        }

        public void InsertContactDestination()
        {
            var db = new ApplicationDbContext();
            var contactDestination = new ContactDestination();
            TryUpdateModel(contactDestination);
            if (ModelState.IsValid)
            {
                try
                {
                    db.ContactDestinations.Add(contactDestination);
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