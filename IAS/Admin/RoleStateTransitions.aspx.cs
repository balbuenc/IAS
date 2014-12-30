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
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Admin
{
    public partial class RoleStateTransitions : System.Web.UI.Page
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

        public IQueryable<RoleStateTransition> GetData([QueryString("WorkflowStateTransitionID")] long? workflowStateTransitionID)
        {
            if (null == workflowStateTransitionID)
                return null;
            try
            {
                var db = new ApplicationDbContext();
                var query = db.RoleStateTransitions.Where(s => s.WorkflowStateTransitionID == workflowStateTransitionID);
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public IQueryable<ApplicationRole> GetRoles()
        {
            try
            {
                var workflowStateTransitionID = long.Parse(Request.QueryString["WorkflowStateTransitionID"]);
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
                return roles.OrderBy(u => u.Name);
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            var db = new ApplicationDbContext();
            foreach (var item in RolesListView.Items)
            {
                var chk = item.FindControl("chkSelectOneRole") as CheckBox;
                if (chk.Checked)
                {
                    var ust = new RoleStateTransition();
                    ust.RoleID = RolesListView.DataKeys[item.DisplayIndex].Value.ToString();
                    ust.WorkflowStateTransitionID = long.Parse(Request.QueryString["WorkflowStateTransitionID"]);
                    db.RoleStateTransitions.Add(ust);
                    //string dii =  RolesListView.DataKeys[item.DataItemIndex].Value.ToString();                    
                }
            }
            if (db.ChangeTracker.HasChanges())
            {
                db.SaveChanges();
                RoleStateTransitionListView.DataBind();
                RolesListView.DataBind();
            }
        }

        protected void RemoveButton_Click(object sender, EventArgs e)
        {
            var db = new ApplicationDbContext();
            foreach (var item in RoleStateTransitionListView.Items)
            {
                var chk = item.FindControl("chkSelectOneRole") as CheckBox;
                if (chk.Checked)
                {
                    var ustID = (long)RoleStateTransitionListView.DataKeys[item.DisplayIndex].Value;
                    var ust = db.RoleStateTransitions.Single(u => u.RoleStateTransitionID == ustID);
                    db.RoleStateTransitions.Remove(ust);
                }
            }
            if (db.ChangeTracker.HasChanges())
            {
                db.SaveChanges();
                RoleStateTransitionListView.DataBind();
                RolesListView.DataBind();
            }
        }
    }
}