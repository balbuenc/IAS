using IAS.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Admin
{
    public partial class AlarmRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (null == Request.QueryString["AlarmID"])
                Response.Redirect("~/Default.aspx");

            if (!IsPostBack)
            {
                var alarmID = long.Parse(Request.QueryString["AlarmID"]);
                var db = new ApplicationDbContext();
                Alarm _alarm = db.Alarms.Single(a => a.AlarmID == alarmID);
                this.lblTransicion.Text = _alarm.State.StateName + " - " + _alarm.Interval.ToString() + "hs.";
                this.AlarmHyperLink.NavigateUrl = "Alarms.aspx?WorkflowID=" + _alarm.WorkflowID.ToString();
            }
        }

        public IQueryable<ApplicationRole> GetRoles()
        {
            var db = new ApplicationDbContext();
            var query = db.ApplicationRoles.OrderBy(r => r.Name); ;
            return query;
        }

        public IEnumerable<ApplicationRole> GetData([QueryString("AlarmID")] long? alarmID)
        {
            if (null == alarmID)
            {
                Response.Redirect("Default.aspx");
                return null;
            }
            var db = new ApplicationDbContext();
            var alarm = db.Alarms.SingleOrDefault(a => a.AlarmID == alarmID);
            if (alarm.Roles.Count > 0)
                return alarm.Roles;
            else
                return null;
        }

        public void Delete([QueryString("AlarmID")] long? alarmID, ApplicationRole subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var alarm = db.Alarms.Where(s => s.AlarmID == alarmID).SingleOrDefault();
                alarm.Roles.Remove(alarm.Roles.Single(r => r.Id == subject.Id));
                db.SaveChanges();
                ErrorLabel.Text = String.Empty;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
            }
        }

        protected void AlarmRolesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            AlarmRolesListView.EditIndex = e.NewEditIndex;
        }

        protected void AlarmRolesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            AlarmRolesListView.EditIndex = -1;
        }

        public void Insert([QueryString("AlarmID")] long alarmID)
        {
            var ddlRoles = AlarmRolesListView.InsertItem.FindControl("ddlRoles") as DropDownList;
            var db = new ApplicationDbContext();
            var alarm = db.Alarms.SingleOrDefault(a => a.AlarmID == alarmID);
            var role = db.ApplicationRoles.Single(r => r.Id == ddlRoles.SelectedValue);
            if (alarm.Roles.Contains(role))
            {
                ErrorLabel.Text = "Ya esta incluido este role";
                return;
            }
            try
            {
                alarm.Roles.Add(role);
                db.SaveChanges();
                ErrorLabel.Text = String.Empty;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
            }

        }
    }
}