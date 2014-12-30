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


using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using IAS.Models;


using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace IAS.Account
{
    public partial class Register : Page
    {

        public IQueryable<IdentityRole> GetRoles() {
            try {
                var db = new ApplicationDbContext();
                return db.Roles.OrderBy( u => u.Name );
            }
            catch ( Exception exp ) {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }
        
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var db = new ApplicationDbContext();            
            var userStore = new UserStore<ApplicationUser>(db);
            var userManager = new UserManager<ApplicationUser>(userStore);

            var newUser = new ApplicationUser
            {
                UserName = txtUserName.Text.Trim(),
                FirstName = txtFirstName.Text.Trim(),
                LastName = txtLastName.Text.Trim(),
                Email = txtEmail.Text.Trim(),
                Phone = txtPhones.Text.Trim()
            };
            var userResult = userManager.Create(newUser, txtPassword.Text);            
            if (userResult.Succeeded)
            {
                foreach ( var item in RolesListView.Items ) {
                    var chk = item.FindControl( "chkSelectOneRole" ) as CheckBox;
                    if ( chk.Checked ) {                        
                        var roleId = RolesListView.DataKeys[item.DisplayIndex].Value.ToString();
                        var roleName = db.Roles.Single( r => r.Id == roleId ).Name;
                        userManager.AddToRole( newUser.Id, roleName );
                        chk.Checked = false;
                    }
                }
                txtUserName.Text = string.Empty;
                txtFirstName.Text = string.Empty;
                txtLastName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtPhones.Text = string.Empty;

                ErrorMessage.Text = string.Format("Registro de usuario {0} realizado correctamente.", newUser.UserName);
            }
            else
            {
                ErrorMessage.Text = userResult.Errors.FirstOrDefault();
            }
        }
    }
}