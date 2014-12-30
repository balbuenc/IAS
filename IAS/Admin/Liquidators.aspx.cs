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
    public partial class Liquidators : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Liquidator> GetLiquidators()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.Liquidators.OrderBy(m => m.LiquidatorID);
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void Updateliquidator(Liquidator subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var liquidator = db.Liquidators.Where(s => s.LiquidatorID == subject.LiquidatorID).SingleOrDefault();

                liquidator.Name = subject.Name;
                liquidator.RegistryNumber = subject.RegistryNumber;
                liquidator.Email = subject.Email;
                liquidator.MobilePhoneNumber = subject.MobilePhoneNumber;

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

        public void DeleteLiquidator(Liquidator subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var liquidator = db.Liquidators.Where(s => s.LiquidatorID == subject.LiquidatorID).SingleOrDefault();
                db.Liquidators.Remove(liquidator);
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

        protected void LiquidatorsListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            LiquidatorsListView.EditIndex = e.NewEditIndex;
        }

        protected void LiquidatorsListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            LiquidatorsListView.EditIndex = -1;
        }

        public void InsertLiquidator()
        {
            var db = new ApplicationDbContext();
            var liquidator = new Liquidator();
            TryUpdateModel(liquidator);
            if (ModelState.IsValid)
            {
                try
                {
                    db.Liquidators.Add(liquidator);
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