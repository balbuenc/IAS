using IAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

namespace IAS.Admin
{
    public partial class CasePriorities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<CasePriority> GetCasePriorities()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.CasePriorities;
                
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                return null;
            }
        }

        public void UpdateCasePriority(CasePriority subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var CasePriority = db.CasePriorities.Where(s => s.CasePriorityID == subject.CasePriorityID).SingleOrDefault();
                CasePriority.PriorityName = subject.PriorityName;
                db.SaveChanges();
                ErrorLabel.Text = String.Empty;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
            }
        }

        public void DeleteCasePriority(CasePriority subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var CasePriority = db.CasePriorities.Where(s => s.CasePriorityID == subject.CasePriorityID).SingleOrDefault();
                db.CasePriorities.Remove(CasePriority);
                db.SaveChanges();
                ErrorLabel.Text = "Eliminado";
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
            }
        }

        protected void CasePrioritiesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            CasePrioritiesListView.EditIndex = e.NewEditIndex;
        }

        protected void CasePrioritiesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            CasePrioritiesListView.EditIndex = -1;
        }

        public void InsertCasePriority()
        {
            var db = new ApplicationDbContext();
            var CasePriority = new CasePriority();
            TryUpdateModel(CasePriority);
            if (ModelState.IsValid)
            {
                try
                {
                    db.CasePriorities.Add(CasePriority);
                    db.SaveChanges();
                    ErrorLabel.Text = String.Empty;
                }
                catch (Exception exp)
                {
                    ErrorLabel.Text = exp.Message;
                }
            }
            else
            {
                ErrorLabel.Text = "Complete todos los campos.";
            }
        }
    }
}