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
    public partial class Coverages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public IQueryable<Coverage> GetCoverages()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.Coverages;
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateCoverage(Coverage subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var coverage = db.Coverages.Where(s => s.CoverageID == subject.CoverageID).SingleOrDefault();
                coverage.CoverageName = subject.CoverageName;
                coverage.Active = subject.Active;
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

        public void DeleteCoverage(Coverage subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var coverage = db.Coverages.Where(s => s.CoverageID == subject.CoverageID).SingleOrDefault();
                db.Coverages.Remove(coverage);
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

        protected void CoveragesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            CoveragesListView.EditIndex = e.NewEditIndex;
        }

        protected void CoveragesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            CoveragesListView.EditIndex = -1;
        }

        public void InsertCoverage()
        {
            var db = new ApplicationDbContext();
            var coverage = new Coverage();
            TryUpdateModel(coverage);
            if (ModelState.IsValid)
            {
                try
                {
                    db.Coverages.Add(coverage);
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