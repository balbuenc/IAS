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
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data.Entity.Validation;
using Microsoft.AspNet.Identity;
using System.Data.Entity.SqlServer;
using IAS.Constants;
using System.Globalization;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Data;

namespace IAS.CaseManagment {
    public partial class MyCaseList : System.Web.UI.Page {

        public IQueryable<CasePriority> GetCasePriorities() {
            try {
                var db = new ApplicationDbContext();
                var query = db.CasePriorities;
                return query;

            }
            catch ( Exception exp ) {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        //public IQueryable<Case> GetMyCases([QueryString("Buscar")] string caseDescription,
        //    [Control("ddlCasePriority")] int? casePriorityID)
        public IQueryable<Case> GetMyCases( [Control( "txtSearch" )] string caseDescription,
             [Control( "ddlDateInterval" )] string dateInterval,
             [Control( "ddlCasePriority" )] int? casePriorityID ) {
            int theCasePriorityID = 0;
            if ( !Page.IsPostBack )
                theCasePriorityID = 0; //Todas
            else
                theCasePriorityID = casePriorityID.HasValue ? casePriorityID.Value : 1;
            //var fromDate = DateTime.Today;
            //var toDate = DateTime.Today;            
            int currentDayNum = DateTime.Today.Day;
            int currentMonthNum = DateTime.Today.Month;
            int currentWeekNum = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(
                DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday );
            int nextWeekNum = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(
                DateTime.Now.AddDays( 7 ), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday );
            DateTime today = DateTime.Today.Date;

            try {
                var db = new ApplicationDbContext();
                var userId = HttpContext.Current.User.Identity.GetUserId();

                // Estados con permisos para el usuario
                //var stateIDs = from ust in db.UserStateTransitions
                //               where ust.UserID == userId
                //               select ust.WorkflowStateTransition.InitialStateID;
                //stateIDs.Union(from rst in db.RoleStateTransitions
                //               where User.IsInRole(rst.ApplicationRole.Id) 
                //               select rst.WorkflowStateTransition.InitialStateID);

                var query = db.Cases
                    .Where( c => c.UserID == userId
                        && ( string.IsNullOrEmpty( dateInterval ) || dateInterval.Equals( ControlValues.Today ) ? c.isToday == 1 :
                            dateInterval.Equals( ControlValues.CurrentWeek ) ? SqlFunctions.DatePart( "week", c.EffectiveDate ) == currentWeekNum && SqlFunctions.DatePart("year", c.EffectiveDate) == today.Year  :
                            dateInterval.Equals( ControlValues.NextWeek ) ? SqlFunctions.DatePart( "week", c.EffectiveDate ) == nextWeekNum && SqlFunctions.DatePart("year", c.EffectiveDate) == today.Year :
                            dateInterval.Equals( ControlValues.CurrentMonth ) ? SqlFunctions.DatePart( "month", c.EffectiveDate ) == currentMonthNum && SqlFunctions.DatePart("year", c.EffectiveDate) == today.Year :
                            dateInterval.Equals( ControlValues.Oldest ) ? c.EffectiveDate < DateTime.Today.Date : true )
                        && c.WorkflowID == 2
                        && ( theCasePriorityID == 0 ? true : c.CasePriorityID == theCasePriorityID )
                        && ( string.IsNullOrEmpty( caseDescription ) ? true : c.Description.Contains( caseDescription ) )
                        && c.StateID != 15)
                    //&& ( SqlFunctions.PatIndex("%" + caseDescription + "%",c.Description) > 0 ) )


                    //.Where(m => m.UserID == userId && stateIDs.Contains(m.StateID))
                    //.Where(m => m.User.UserName == User.Identity.Name && stateIDs.Contains(m.StateID) && m.EffectiveDate <= DateTime.Now) 
                    .OrderBy( m => m.EffectiveDate );

                return query;
            }
            catch ( Exception exp ) {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        public void bindUsersWithPermissions( long pWorkflowID, long pStateID ) {
            this.UsersWithPermissionsDropDownList.Items.Clear();
            this.UsersWithPermissionsDropDownList.DataSource = this.GetUserWithPermissions( pWorkflowID, pStateID ).ToList();
            this.UsersWithPermissionsDropDownList.DataBind();
            this.ChangeUserUPanel.Update();
        }

        public IQueryable<ApplicationUser> GetUserWithPermissions( long pWorkflowID, long pStateID ) {
            try {
                var db = new ApplicationDbContext();

                var users = ( from ust in db.UserStateTransitions
                              where ust.WorkflowStateTransition.InitialStateID == pStateID
                              && ust.WorkflowStateTransition.WorkflowID == pWorkflowID
                              select ust.ApplicationUser ).Distinct();

                var roles = from rst in db.RoleStateTransitions
                            where rst.WorkflowStateTransition.InitialStateID == pStateID
                            && rst.WorkflowStateTransition.WorkflowID == pWorkflowID
                            select rst.ApplicationRole.Id;

                var users2 = from usr in db.Users
                             where usr.Roles.Count( r => roles.Contains( r.RoleId ) ) > 0
                             select usr;

                users.Union( users2 ).Distinct();

                return users;

            }
            catch ( Exception exc ) {
                ErrorLabel.Text = exc.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        protected void AssignUserButton_Click( object sender, EventArgs e ) {
            var userId = UsersWithPermissionsDropDownList.SelectedValue;
            var caseID = long.Parse( hdnCurrentCaseID.Value );
            var db = new ApplicationDbContext();
            var theCase = db.Cases.Where( c => c.CaseID == caseID ).SingleOrDefault();
            theCase.UserID = userId;
            db.SaveChanges();
        }

        protected void MyCasesListView_ItemCommand( object sender, ListViewCommandEventArgs e ) {
            var db = new ApplicationDbContext();

            if ( e.CommandName == "Sort" ) {
                return;
            }

            var id_caso = int.Parse( e.CommandArgument.ToString() );
            var currentCase = db.Cases.Where( c => c.CaseID == id_caso ).SingleOrDefault();
            switch ( e.CommandName.ToString() ) {
                case "OpenCase":

                    Response.Redirect("./CaseHub.aspx?CaseID=" + id_caso);
                    //var form = ( from f in db.WorkflowStatesForms
                    //             where f.StateID == currentCase.StateID
                    //             && f.WorkflowID == currentCase.WorkflowID
                    //             select f.Form ).FirstOrDefault();

                    //if ( null == form ) {
                    //    form = ( from f in db.Workflows
                    //             where f.WorkflowID == currentCase.WorkflowID
                    //             select f.DefaultForm ).FirstOrDefault();
                    //    if ( null == form )
                    //        Response.Redirect( "CaseDetails.aspx?CaseID=" + currentCase.CaseID, false );
                    //    else
                    //        Response.Redirect( form.Url + "?CaseID=" + currentCase.CaseID , false);
                    //}
                    //else {
                    //    Response.Redirect( form.Url + "?CaseID=" + currentCase.CaseID , false);
                    //}
                    break;

                case "ChangeUser":
                    ScriptManager.RegisterClientScriptBlock( this.Page, this.GetType(), "js_modalChangeUser", "$('#dvReasignacion').modal('toggle')", true );
                    bindUsersWithPermissions( currentCase.WorkflowID, currentCase.StateID );
                    this.CaseDescripcionTextBox.Text = currentCase.Description + "(" + currentCase.CurrentState.StateName + ")";
                    hdnCurrentCaseID.Value = currentCase.CaseID.ToString();
                    break;

            }
        }

        protected void MyClaimsCasesListView_ItemCommand(object sender, ListViewCommandEventArgs e) { }

        public IQueryable<Case> GetMyClaimsCases([Control("txtClaimsSearch")] string caseDescription,
        [Control("ddlClaimsDateInterval")] string dateInterval,
        [Control("ddlClaimsCasePriority")] int? casePriorityID)
        {
            int theCasePriorityID = 0;
            if (!Page.IsPostBack)
                theCasePriorityID = 0; //Todas
            else
                theCasePriorityID = casePriorityID.HasValue ? casePriorityID.Value : 1;

            int currentDayNum = DateTime.Today.Day;
            int currentMonthNum = DateTime.Today.Month;
            int currentWeekNum = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(
                DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
            int nextWeekNum = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(
                DateTime.Now.AddDays(7), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday);

            try
            {
                var db = new ApplicationDbContext();
                var userId = HttpContext.Current.User.Identity.GetUserId();

                var query = db.Cases
                    .Where(c => c.UserID == userId
                        && (string.IsNullOrEmpty(dateInterval) || dateInterval.Equals(ControlValues.Today) ? c.EffectiveDate == DateTime.Today.Date :
                            dateInterval.Equals(ControlValues.CurrentWeek) ? SqlFunctions.DatePart("week", c.EffectiveDate) == currentWeekNum :
                            dateInterval.Equals(ControlValues.NextWeek) ? SqlFunctions.DatePart("week", c.EffectiveDate) == nextWeekNum :
                            dateInterval.Equals(ControlValues.CurrentMonth) ? SqlFunctions.DatePart("month", c.EffectiveDate) == currentMonthNum :
                            dateInterval.Equals(ControlValues.Oldest) ? c.EffectiveDate < DateTime.Today.Date : true)
                        && c.WorkflowID == 1
                        && (theCasePriorityID == 0 ? true : c.CasePriorityID == theCasePriorityID)
                        && (string.IsNullOrEmpty(caseDescription) ? true : c.Description.Contains(caseDescription)))

                    .OrderBy(m => m.EffectiveDate);

                return query;
            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
                return null;
            }
        }

        protected void newManualClaimBtn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "js_newManualClaimModal", "$('#newManualClaimModal').modal('toggle')", true);
        }

      

        protected void btnRegistrarSiniestro_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(clientesDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;

            try
            {

                cmd.CommandText = "sp_registrar_caso_siniestro";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@id_persona", ddlClientes.SelectedValue);
                cmd.Parameters.AddWithValue("@cliente", ddlClientes.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@fecha_siniestro", Convert.ToDateTime( dp1.Value));
                cmd.Parameters.AddWithValue("@id_tipo_siniestro", ddlTipoSiniestro.SelectedValue);
                cmd.Parameters.AddWithValue("@nro_poliza", ddlNroPoliza.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@usuario", User.Identity.Name );

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }
    }
}