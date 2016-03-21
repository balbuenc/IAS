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
    public partial class ClaimTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ClaimType> GetClaimTypes()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.ClaimTypes;
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateClaimType(ClaimType subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var claimType = db.ClaimTypes.Where(s => s.ClaimTypeID == subject.ClaimTypeID).SingleOrDefault();
                claimType.Description = subject.Description;
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

        public void DeleteClaimType(ClaimType subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var claimType = db.ClaimTypes.Where(s => s.ClaimTypeID == subject.ClaimTypeID).SingleOrDefault();
                db.ClaimTypes.Remove(claimType);
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

        protected void ClaimTypesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            ClaimTypesListView.EditIndex = e.NewEditIndex;
        }

        protected void ClaimTypesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ClaimTypesListView.EditIndex = -1;
        }

        public void InsertClaimType()
        {
            var db = new ApplicationDbContext();
            var claimType = new ClaimType();
            TryUpdateModel(claimType);
            if (ModelState.IsValid)
            {
                try
                {
                    db.ClaimTypes.Add(claimType);
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