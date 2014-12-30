using IAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Admin
{
    public partial class PersonUserAssignments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public IQueryable<Person> GetUserPersons()
        {
            try
            {
                var db = new ApplicationDbContext();
                var user = db.Users.Single(u => u.Id == this.UsersDropDownList.SelectedValue);
                var searched = string.IsNullOrEmpty( hdnUserPersonSearch.Value ) ? string.Empty : hdnPersonSearch.Value.ToUpper();
                var personType = ddlPersonType.SelectedValue;
                return user.Persons
                    .Where(
                        p => (string.IsNullOrEmpty(searched) ? true : p.FirstName.ToUpper().Contains(searched) 
                        || (
                            string.IsNullOrEmpty( searched ) || string.IsNullOrEmpty( p.LastName ) ? true : p.LastName.ToUpper().Contains( searched ))
                        || (
                            string.IsNullOrEmpty( searched ) || string.IsNullOrEmpty( p.LastName1 ) ? true : p.LastName1.ToUpper().Contains( searched )) 
                        && (
                            p.PersonType == (personType == "All" ? p.PersonType : personType)))
                            )
                    .OrderBy(p => p.FirstName).ThenBy(p => p.LastName).AsQueryable();

                //return user.Persons
                //    .Where( p =>  ( p.FirstName.ToUpper().Contains( searched ) 
                //        || ( 
                //            p.LastName != null && p.LastName.ToUpper().Contains( searched ) ) 
                //        || ( 
                //            p.LastName1 != null && p.LastName1.ToUpper().Contains( searched ) ) ) 
                //        && ( 
                //             p.PersonType ==  ( personType == "All" ? p.PersonType : personType  ) ) )
                //    .OrderBy(p => p.FirstName).ThenBy(p => p.LastName).AsQueryable();
            }
            catch (Exception exp)
            {
                // ErrorLabel.Visible = true;
                // ErrorLabel.Text = exp.Message;
                return null;
            }
        }

        public IQueryable<Person> GetPersons()
        {
            try
            {
                var db = new ApplicationDbContext();
                var user = db.Users.Single(u => u.Id == this.UsersDropDownList.SelectedValue);
                var searched = string.IsNullOrEmpty( hdnPersonSearch.Value ) ? string.Empty : hdnPersonSearch.Value.ToUpper();
                var personType = ddlPersonType1.SelectedValue;
                
                var query = db.Persons.Where(p => !p.ApplicationUsers.Any())
                    .Where( p =>    
                            string.IsNullOrEmpty( searched ) ? true : p.FirstName.ToUpper().Contains( searched ) 
                            ||
                            string.IsNullOrEmpty( searched )  ? true : p.LastName.ToUpper().Contains( searched )  
                            ||
                            string.IsNullOrEmpty( searched )  ? true : p.LastName1.ToUpper().Contains( searched ) 
                     &&  personType == "All" ? true : p.PersonType == personType )
                            
                    .OrderBy(p => p.FirstName).ThenBy(p => p.LastName);
                return query;
            }
            catch (Exception exp)
            {
                // ErrorLabel.Visible = true;
                // ErrorLabel.Text = exp.Message;
                return null;
            }
        }

        public IQueryable<ApplicationUser> GetUsers()
        {
            var db = new ApplicationDbContext();
            var query = db.Users.OrderBy(u => u.FirstName);
            return query;
        }

        protected void PersonsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var db = new ApplicationDbContext();
            ApplicationUser user;
            Person person;
            long personID;

            switch (e.CommandName)
            {
                case "Assign":
                    
                    user = db.Users.Single(u => u.Id == this.UsersDropDownList.SelectedValue);
                    personID = long.Parse(e.CommandArgument.ToString());
                    person = db.Persons.Single(p => p.PersonID == personID);
                    user.Persons.Add(person);
                    db.SaveChanges();

                    this.PersonsListView.DataBind();
                    this.UserPersonsListView.DataBind();
                    break;

            }
        }

        protected void UserPersonsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var db = new ApplicationDbContext();
            ApplicationUser user;
            Person person;
            long personID;

            switch (e.CommandName)
            {
                case "Remove":

                    user = db.Users.Single(u => u.Id == this.UsersDropDownList.SelectedValue);
                    personID = long.Parse(e.CommandArgument.ToString());
                    person = db.Persons.Single(p => p.PersonID == personID);
                    person.ApplicationUsers.Clear();
                    user.Persons.Remove(person);
                    db.SaveChanges();

                    this.PersonsListView.DataBind();
                    this.UserPersonsListView.DataBind();
                    break;
            }
        }

        protected void UsersDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.PersonsListView.DataBind();
            this.UserPersonsListView.DataBind();
        }

        protected void btnPersonSearch_Click(object sender, EventArgs e)
        {
            this.hdnPersonSearch.Value = this.txtPersonSearch.Text;
            this.PersonDataPager.SetPageProperties(0, this.PersonDataPager.MaximumRows, false);
            this.PersonsListView.DataBind();
        }

        protected void btnUserPersonSearch_Click(object sender, EventArgs e)
        {
            this.hdnUserPersonSearch.Value = this.txtUserPersonSearch.Text;
            this.UserPersonsDataPager.SetPageProperties(0, this.UserPersonsDataPager.MaximumRows, false);
            this.UserPersonsListView.DataBind();
        }
    }
}