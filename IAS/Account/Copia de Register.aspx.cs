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

namespace IAS.Account
{
    public partial class Register : Page
    {

        public IQueryable<RoleStateTransition> GetData( ) {
            if ( null == workflowStateTransitionID )
                return null;
            try {
                var db = new ApplicationDbContext();
                var query = db.RoleStateTransitions.Where( s => s.WorkflowStateTransitionID == workflowStateTransitionID );
                return query;
            }
            catch ( Exception exp ) {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public IQueryable<ApplicationRole> GetRoles() {
            try {
                var workflowStateTransitionID = long.Parse( Request.QueryString["WorkflowStateTransitionID"] );
                var db = new ApplicationDbContext();
                var roles = from r in
                                db.ApplicationRoles.Except(
                                    from t in db.RoleStateTransitions
                                    join r1 in db.ApplicationRoles on t.RoleID equals r1.Id into tr
                                    where t.WorkflowStateTransitionID == workflowStateTransitionID
                                    from r2 in tr.DefaultIfEmpty()
                                    select r2
                                    )
                            select r;
                return roles.OrderBy( u => u.Name );
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
                ErrorMessage.Text = string.Format("Registro de usuario {0} realizado correctamente.", newUser.UserName);
            }
            else
            {
                ErrorMessage.Text = userResult.Errors.FirstOrDefault();
            }
        }
    }
}