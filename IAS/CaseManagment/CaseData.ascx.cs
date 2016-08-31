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
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Data;

namespace IAS.CaseManagment {
    public partial class CaseData : System.Web.UI.UserControl {
        Case theCase;
        protected void Page_Load( object sender, EventArgs e ) {

        }

        protected void Page_PreRender( object sender, EventArgs e ) {
            if ( null == Request.QueryString["CaseID"] || Request.QueryString["Dash"] == "True")
                Response.Redirect("/Default.aspx", false);
        }
        
        public Case GetCase( [QueryString( "CaseID" )] long? caseID ) {            
            var db = new ApplicationDbContext();
            IQueryable<Case> query = db.Cases.Include( "StateTransitions" );
            theCase = query.Where( c => c.CaseID == caseID.Value ).SingleOrDefault();
            return theCase;
        }

        public ClientPaymentDay GetClientPaymentDay( [QueryString( "CaseID" )] long? caseID ) {
            if ( !caseID.HasValue )
                return null;
            var db = new ApplicationDbContext();
            var coll = db.Collections.FirstOrDefault( c => c.CaseID == caseID );
            if ( null != coll )
                return db.ClientPaymentDays.FirstOrDefault( cp => cp.PersonID == coll.PersonID );
            else
                return null;            
        }        

        public void Rebind() {
            this.CaseDetail.DataBind();
        }

        // El nombre de parámetro del id. debe coincidir con el valor DataKeyNames establecido en el control
        public void ClientPaymentDayInfo_UpdateItem(ClientPaymentDay subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var pDay = db.ClientPaymentDays.Single(p => p.ClientPaymentDayID == subject.ClientPaymentDayID);
                if (pDay == null)
                {
                    Page.ModelState.AddModelError("", String.Format("No se encontró el elemento con id. {0}", subject.ClientPaymentDayID));
                    return;
                }
                pDay.PaymentDay = subject.PaymentDay;
                if (Page.ModelState.IsValid)
                {
                    db.SaveChanges();

                    ModifyCaseEffectiveDate(pDay.Person.PersonID, subject.PaymentDay);

                    CaseDetail.DataBind();
                }
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        private void ModifyCaseEffectiveDate(long PersonID, int Day)
        {

            SqlConnection sqlConnection1 = new SqlConnection(caseDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

          
            try
            {
                cmd.CommandText = "[dbo].[sp_update_person_effective_day]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@PersonID", PersonID);
                cmd.Parameters.AddWithValue("@Day", Day);
                cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.User.Identity.GetUserId());

                sqlConnection1.Open();

                cmd.ExecuteNonQuery();

                sqlConnection1.Close();


            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }
        /*
                public IQueryable<State> GetStates()
                {
                    var db = new ApplicationDbContext();
                    var query = db.States.OrderBy(s => s.StateName);
                    return query;
                }

                public IQueryable<CaseTransition> GetCaseTransitions( [QueryString( "CaseID" )] long? caseID ) {
                    if ( null == theCase )
                        return null;
                    return theCase.StateTransitions.AsQueryable();
                }

                public void InsertCaseTransition( [QueryString( "CaseID" )] long caseID ) {
                    if ( Page.ModelState.IsValid ) {
                        try {
                            var ddlState = CaseTransitionsListView.InsertItem.FindControl( "ddlStates" ) as DropDownList;
                            var txtComment = CaseTransitionsListView.InsertItem.FindControl( "txtComments" ) as TextBox;

                            var db = new ApplicationDbContext();
                            theCase = db.Cases.Single( c => c.CaseID == caseID );
                            var trans = new CaseTransition();                    
                            trans.CaseID = caseID;
                            trans.NewStateID = long.Parse( ddlState.SelectedValue );
                            var user = db.Users.Where(u=>u.UserName == Page.User.Identity.Name).Single();
                            trans.UserID = user.Id;// Page.User.Identity.GetUserId();
                            trans.TransitionDate = DateTime.Now;
                            trans.Comment = txtComment.Text;

                            var lastOne = theCase.StateTransitions.OrderByDescending( t => t.TransitionDate ).FirstOrDefault();
                            if ( null != lastOne ) 
                                trans.PreviousState = lastOne.NewState;
                            else
                                trans.PreviousState = theCase.CurrentState;

                            //Usuario 
                            // Recupera la lista de usuarios on permisos
                            var users = from ust in db.UserStateTransitions
                                        where ust.WorkflowStateTransition.InitialStateID == trans.NewStateID
                                        && ust.WorkflowStateTransition.WorkflowID == theCase.WorkflowID
                                        select ust.ApplicationUser;

                            var roles = from rst in db.RoleStateTransitions
                                        where rst.WorkflowStateTransition.InitialStateID == trans.NewStateID
                                        && rst.WorkflowStateTransition.WorkflowID == theCase.WorkflowID
                                        select rst.ApplicationRole.Id;

                            var users2 = from usr in db.Users
                                         where usr.Roles.Count(r => roles.Contains(r.RoleId)) > 0
                                         select usr;

                            users.Union(users2).Distinct();

                            var cargaLaboral = db.Cases.GroupBy(c => c.UserID).
                             Select(group =>
                                 new
                                 {
                                     UserID = group.Key,
                                     Count = group.Count()
                                 });

                            var winner = cargaLaboral.First();
                            foreach (var unU in users){
                                foreach (var theUser in cargaLaboral)
                                {
                                    if (unU.Id == theUser.UserID)
                                    {
                                        if (theUser.Count > winner.Count) {
                                            winner = theUser;
                                        }
                                    }
                                }
                            }

                            var uWinner = users.First(u => u.Id == winner.UserID);
                            theCase.User = uWinner;
                            theCase.CurrentState = db.States.Single(s => s.StateID == trans.NewStateID);

                            theCase.StateTransitions.Add( trans );
                            db.SaveChanges();
                            ErrorLabel.Text = String.Empty;
                        }
                        catch ( Exception exp ) {
                            ErrorLabel.Visible = true;
                            ErrorLabel.Text = exp.Message;
                        }
                    }
                    else {
                        ErrorLabel.Visible = true;
                        ErrorLabel.Text = "Complete todos los campos.";
                    }
                }
                */
    }
}