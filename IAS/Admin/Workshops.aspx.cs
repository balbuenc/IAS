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
    public partial class WorkShops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

         public IQueryable<WorkShop> GetWorkShops()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.WorkShops.OrderBy(m => m.WorkshopID);
                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateWorkShop(WorkShop subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var workShop = db.WorkShops.Where(s => s.WorkshopID == subject.WorkshopID).SingleOrDefault();

                workShop.Name = subject.Name;
                workShop.Address = subject.Address;
                workShop.PhoneNumber = subject.PhoneNumber;
                workShop.MobilePhoneNumber = subject.MobilePhoneNumber;
                workShop.Email = subject.Email;
                

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

        public void DeleteWorkShop(WorkShop subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var workShop = db.WorkShops.Where(s => s.WorkshopID == subject.WorkshopID).SingleOrDefault();
                db.WorkShops.Remove(workShop);
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

        protected void WorkShopsListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            WorkShopsListView.EditIndex = e.NewEditIndex;
        }

        protected void WorkShopsListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            WorkShopsListView.EditIndex = -1;
        }

        public void InsertWorkShop()
        {
            var db = new ApplicationDbContext();
            var workShop = new WorkShop();
            TryUpdateModel(workShop);
            if (ModelState.IsValid)
            {
                try
                {
                    db.WorkShops.Add(workShop);
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

