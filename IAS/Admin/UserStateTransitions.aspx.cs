using IAS.Models;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data.Entity.Validation;
using System.Linq;

namespace IAS.Admin
{
    public partial class UserStateTransitions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (null == Request.QueryString["WorkflowStateTransitionID"])
                Response.Redirect("~/Default.aspx", false);

            if (!IsPostBack)
            {
                var WorkflowStateTransitionID = long.Parse(Request.QueryString["WorkflowStateTransitionID"]);
                var db = new ApplicationDbContext();
                WorkflowStateTransition _transition = db.WorkflowStateTransitions.Single(t => t.WorkflowStateTransitionID == WorkflowStateTransitionID);
                this.lblTransicion.Text = _transition.InicialState.StateName + " a " + _transition.FinalState.StateName;
                this.TransitionsHyperLink.NavigateUrl = "WorkflowStateTransitions.aspx?WorkflowID=" + _transition.WorkflowID.ToString();
            }
        }

        public IQueryable<UserStateTransition> GetData( [QueryString( "WorkflowStateTransitionID" )] long? workflowStateTransitionID )
        {
            if ( null == workflowStateTransitionID )
                return null;
            try
            {
                var db = new ApplicationDbContext();
                var query = db.UserStateTransitions.Where(s=>s.WorkflowStateTransitionID == workflowStateTransitionID);
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public IQueryable<ApplicationUser> GetUsers( ) {            
            try {
                var workflowStateTransitionID = long.Parse(Request.QueryString["WorkflowStateTransitionID"]);
                var db = new ApplicationDbContext();
                var users = from u in
                                db.Users.Except(
                                    from t in db.UserStateTransitions
                                    join u in db.Users on t.UserID equals u.Id into tu
                                    where t.WorkflowStateTransitionID == workflowStateTransitionID
                                    from u in tu.DefaultIfEmpty()
                                    select u
                                    )
                            select u;
                return users.OrderBy(u=>u.UserName);
            }
            catch ( Exception exp ) {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        protected void AddButton_Click( object sender, EventArgs e ) {
            var db = new ApplicationDbContext();
            foreach (var item in UsersListView.Items)
            {                
                var chk = item.FindControl("chkSelectOneUser") as CheckBox;
                if (chk.Checked)
                {
                    var ust = new UserStateTransition();
                    ust.UserID = UsersListView.DataKeys[item.DisplayIndex].Value.ToString();
                    ust.WorkflowStateTransitionID = long.Parse(Request.QueryString["WorkflowStateTransitionID"]);
                    db.UserStateTransitions.Add(ust);
                    //string dii =  UsersListView.DataKeys[item.DataItemIndex].Value.ToString();                    
                }
            }
            if (db.ChangeTracker.HasChanges())
            {
                db.SaveChanges();
                UserStateTransitionListView.DataBind();
                UsersListView.DataBind();
            }
        }

        protected void RemoveButton_Click( object sender, EventArgs e ) {
            var db = new ApplicationDbContext();
            foreach (var item in UserStateTransitionListView.Items)
            {
                var chk = item.FindControl("chkSelectOneUser") as CheckBox;
                if (chk.Checked)
                {   
                    var ustID = (long)UserStateTransitionListView.DataKeys[item.DisplayIndex].Value;
                    var ust = db.UserStateTransitions.Single(u=>u.UserStateTransitionID == ustID);
                    db.UserStateTransitions.Remove(ust);                                      
                }
            }
            if (db.ChangeTracker.HasChanges()){
                db.SaveChanges();
                            UserStateTransitionListView.DataBind();
                UsersListView.DataBind();
            }
        }
    }
}