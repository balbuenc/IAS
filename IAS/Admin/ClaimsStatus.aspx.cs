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
    public partial class ClaimsStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<ClaimStatu> GetClaimStatus()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.ClaimStatus.OrderBy(m => m.ClaimStatusID);
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateClaimStatus(ClaimStatu subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var claimStatus = db.ClaimStatus.Where(s => s.ClaimStatusID  == subject.ClaimStatusID).SingleOrDefault();

                claimStatus.Status  = subject.Status;
              

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

        public void DeleteClaimStatus(ClaimStatu subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var claimStatus = db.ClaimStatus.Where(s => s.ClaimStatusID == subject.ClaimStatusID).SingleOrDefault();
                db.ClaimStatus.Remove(claimStatus);
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

        protected void ClaimStatusListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            ClaimStatusListView.EditIndex = e.NewEditIndex;
        }

        protected void ClaimStatusListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ClaimStatusListView.EditIndex = -1;
        }

        public void InsertClaimStatus()
        {
            var db = new ApplicationDbContext();
            var claimStatus = new ClaimStatu();
            TryUpdateModel(claimStatus);
            if (ModelState.IsValid)
            {
                try
                {
                    db.ClaimStatus.Add(claimStatus);
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