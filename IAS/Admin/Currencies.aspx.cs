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
    public partial class Currencies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Currency> GetCurrencies()
        {
            try
            {
                var db = new ApplicationDbContext();
                var query = db.Currencies.OrderBy(m=>m.Code);             
                return query;                
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void UpdateCurrency(Currency subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var currency = db.Currencies.Where(s => s.CurrencyID == subject.CurrencyID).SingleOrDefault();
                currency.Code = subject.Code;
                currency.Denomination = subject.Denomination;
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

        public void DeleteCurrency(Currency subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var currency = db.Currencies.Where(s => s.CurrencyID == subject.CurrencyID).SingleOrDefault();
                db.Currencies.Remove(currency);
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

        protected void CurrenciesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            CurrenciesListView.EditIndex = e.NewEditIndex;
        }

        protected void CurrenciesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            CurrenciesListView.EditIndex = -1;
        }

        public void InsertCurrency()
        {
            var db = new ApplicationDbContext();
            var currency = new Currency();
            TryUpdateModel(currency);
            if (ModelState.IsValid)
            {
                try
                {
                    db.Currencies.Add(currency);
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