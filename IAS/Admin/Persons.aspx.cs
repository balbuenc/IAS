using IAS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Admin
{
    public partial class Persons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        public IQueryable<Person> GetData()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.Persons
                    .Where(p => (p.FirstName.Contains(this.fullNameSearchHidden.Value) || p.LastName.Contains(this.fullNameSearchHidden.Value) || p.LastName1.Contains(this.fullNameSearchHidden.Value)) && p.DocumentNumber.Contains(this.docNumberSearchHidden.Value))
                    .OrderBy(u => u.FirstName);
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = exp.Message;
                return null;
            }
        }

        public IQueryable<ApplicationUser> GetUsers()
        {
            var db = new ApplicationDbContext();
            var query = db.Users.OrderBy(u => u.FirstName);
            return query;
        }

        public string GetPersonID(Person subject)
        {
            var db = new ApplicationDbContext();
            var person = db.Persons.Single(r => r.PersonID == subject.PersonID);
            if (person.ApplicationUsers.Count > 0)
                return person.ApplicationUsers.Single().Id;
            else
                return db.Users.First().Id;
        }


        public void UpdateAssignment(Person subject)
        {            
            var ddlUsers = PersonsListView.EditItem.FindControl("ddlUsers") as DropDownList;
            try
            {
                var db = new ApplicationDbContext();
                var user = db.Users.Single(r => r.Id == ddlUsers.SelectedValue);
                var person = db.Persons.Where(p => p.PersonID == subject.PersonID).SingleOrDefault();
                person.ApplicationUsers.Clear();
                person.ApplicationUsers.Add(user);
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


        protected void PersonsListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            PersonsListView.EditIndex = e.NewEditIndex;
        }

        protected void PersonsListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            PersonsListView.EditIndex = -1;
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            this.fullNameSearchHidden.Value = this.fullNameSearchTextBox.Text;
            this.docNumberSearchHidden.Value = this.docNumberSearchTextBox.Text;
            this.PersonsListView.DataBind();
        }


    }
}