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