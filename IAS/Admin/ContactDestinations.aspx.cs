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