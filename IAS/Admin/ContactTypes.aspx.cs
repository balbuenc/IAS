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
	public partial class ContactTypes : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}


        public IQueryable<ContactType> GetContactTypes()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.ContactTypes.OrderBy(m => m.ContactTypeID);
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateContactType(ContactType subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var contactType = db.ContactTypes.Where(s => s.ContactTypeID  == subject.ContactTypeID).SingleOrDefault();
               
                contactType.Description  = subject.Description ;
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

        public void DeleteContactType(ContactType subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var contactType = db.ContactTypes.Where(s => s.ContactTypeID  == subject.ContactTypeID).SingleOrDefault();
                db.ContactTypes.Remove(contactType);
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

        protected void ContactTypesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            ContactTypesListView.EditIndex = e.NewEditIndex;
        }

        protected void ContactTypesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ContactTypesListView.EditIndex = -1;
        }

        public void InsertContactType()
        {
            var db = new ApplicationDbContext();
            var contactType = new ContactType();
            TryUpdateModel(contactType);
            if (ModelState.IsValid)
            {
                try
                {
                    db.ContactTypes.Add(contactType);
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