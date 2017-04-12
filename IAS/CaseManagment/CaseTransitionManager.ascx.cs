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
using System.Web.Security;
using System.Data.SqlClient;
using IAS.Infrastructure;
using System.Globalization;
using IAS.Constants;

using System.Data;
using System.Data.SqlClient;

namespace IAS.CaseManagment
{

    public partial class CaseTransitionManager : System.Web.UI.UserControl
    {

        private void changeEffectiveDateEnableProperty()
        {
            if (this.ddlNewState.Items.Count == 0)
            {
                this.txtEffectiveDate.Enabled = false;
            }
            else
            {
                long caseID = long.Parse(hdnCaseID.Value);
                long newStateID = long.Parse(this.ddlNewState.SelectedValue);

                var db = new ApplicationDbContext();
             
                var theCase = db.Cases.SingleOrDefault(c => c.CaseID == caseID);
                if (null == theCase)
                {
                    ErrorLabel.Text = string.Format(
                        "No hay ningun caso activo actualmente. Por favor contactar al administrador del sistema.Datos adicionales: Caso actual {0}",
                        theCase.CaseID);
                    return;
                }

                var stateTransition = db.WorkflowStateTransitions
                    .SingleOrDefault(t => t.InitialStateID == theCase.StateID && t.FinalStateID == newStateID && t.WorkflowID == theCase.WorkflowID);
                if (null == stateTransition)
                {
                    ErrorLabel.Text = string.Format(
                        "No se encontro una transicion de estado valida paar este Workflow, por favor contactar al administrador del sistema.Datos adicionales: flujo {0}, Estado actual {1}, estado final {2}",
                        theCase.WorkflowID, theCase.StateID, newStateID);
                    return;
                }

                //if (stateTransition.EditableEffectiveDate != null && stateTransition.EditableEffectiveDate == true)
                if (stateTransition.EditableEffectiveDate == true)
                    this.txtEffectiveDate.Enabled = true;
                else
                    this.txtEffectiveDate.Enabled = false;
            }
        }

        private System.Data.Entity.Infrastructure.DbRawSqlQuery<UserAssignmet> GetNewResponsible(long pStateID)
        {
            try
            {
                var db = new ApplicationDbContext();

                var users = db.Database.SqlQuery<UserAssignmet>(
                    "SELECT u.Id UserID, COUNT(u.Id) Caseload " +
                    "FROM AspNetUsers u LEFT JOIN [Case] c ON c.UserID = u.Id  " +
                    "WHERE  u.Id IN( " +
                    "SELECT dbo.[UserStateTransition].UserID " +
                    "FROM dbo.[UserStateTransition] INNER JOIN dbo.[WorkflowStateTransition]  " +
                    "ON dbo.[UserStateTransition].WorkflowStateTransitionID = dbo.[WorkflowStateTransition].WorkflowStateTransitionID " +
                    "WHERE dbo.[WorkflowStateTransition].InitialStateID = @StateID " +
                    "UNION " +
                    "SELECT dbo.AspNetUserRoles.UserId " +
                    "FROM dbo.[RoleStateTransition] INNER JOIN dbo.[WorkflowStateTransition]  " +
                    "ON dbo.[RoleStateTransition].WorkflowStateTransitionID = dbo.[WorkflowStateTransition].WorkflowStateTransitionID " +
                    "INNER JOIN dbo.AspNetRoles ON dbo.[RoleStateTransition].RoleID = dbo.AspNetRoles.Id " +
                    "INNER JOIN dbo.AspNetUserRoles ON dbo.AspNetUserRoles.RoleId = dbo.AspNetRoles.Id " +
                    "WHERE dbo.[WorkflowStateTransition].InitialStateID = @StateID ) group by u.Id", new SqlParameter("@StateID", pStateID)
                    );

                return users;
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "js_ctrl_init",
                "$('#" + this.txtEffectiveDate.ClientID + "').datetimepicker({  lang: 'es', format:'d/m/Y H:i', step: 30 });",
                true
            );
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (null == Request.QueryString["CaseID"])
                Response.Redirect("~/Default.aspx", false);
        }

        public IQueryable<CaseTransition> GetData([QueryString("CaseID")] long? caseID)
        {
            if (!caseID.HasValue)
                return null;

            hdnCaseID.Value = caseID.Value.ToString();
            var db = new ApplicationDbContext();
            var theCase = db.Cases.Where(c => c.CaseID == caseID).SingleOrDefault();
            if (null == theCase)
            {
                Session[SessionKeys.CurrentCase] = null;
                return null;
            }
            else
            {
                Session[SessionKeys.CurrentCase] = theCase;
                return theCase.StateTransitions.OrderByDescending(s => s.TransitionDate).AsQueryable();
            }
        }

        public IQueryable<State> GetNewStates([QueryString("CaseID")] long? caseID)
        {
            try
            {
                var userId = HttpContext.Current.User.Identity.GetUserId();
                var db = new ApplicationDbContext();
                var user = db.Users.SingleOrDefault(u => u.Id == userId);
                var theCase = db.Cases.Where(c => c.CaseID == caseID).SingleOrDefault();
             

                var states = db.WorkflowStateTransitions
                    .Where(wst => wst.WorkflowID == theCase.WorkflowID && wst.InitialStateID == theCase.StateID)
                    .Join(db.UserStateTransitions.Where(ust => ust.UserID == userId),
                        wst => wst.WorkflowStateTransitionID,
                        ust => ust.WorkflowStateTransitionID,
                        (wst, ust) => wst.FinalState)
                    .Union(db.WorkflowStateTransitions
                        .Where(wst => wst.WorkflowID == theCase.WorkflowID && wst.InitialStateID == theCase.StateID)
                        .Join(db.RoleStateTransitions.Where(r => user.ApplicationRoles.Contains(r.RoleID)),
                            wst => wst.WorkflowStateTransitionID,
                            rst => rst.WorkflowStateTransitionID,
                            (wst, rst) => wst.FinalState));

            

                return states;
            }
            catch (Exception exc)
            {

                return null;
            }
        }

        protected void buttonChangeState_Click(object sender, EventArgs e)
        {
            var currentUserId = HttpContext.Current.User.Identity.GetUserId();
            var caseID = long.Parse(hdnCaseID.Value);

            var db = new ApplicationDbContext();
            var theCase = db.Cases.Where(c => c.CaseID == caseID).SingleOrDefault();
            if (null == theCase)
            {
                this.ErrorLabel.Text = "No es posible procesar el cambio de estado debido que no se puede recuperar la informacion del caso actual . <br />Actualice la pagina y vuelta a intetar procesar el cambio de estado.";
                this.ErrorLabel.Visible = true;
                return;
            }

            DateTime effectiveDate;
            if (this.txtEffectiveDate.Enabled == false)
            {
                effectiveDate = DateTime.Now;
            }
            else
            {
                //try
                //{

                //    effectiveDate = DateTime.ParseExact(txtEffectiveDate.Text, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                //}
                //catch (Exception ex)
                //{
                //    effectiveDate = DateTime.Now;
                //}

                string[] components = txtEffectiveDate.Text.Split('-');

                int day = int.Parse(components[2]);
                int month = int.Parse(components[1]);
                int year = int.Parse(components[0]);
             
                effectiveDate = new DateTime(year, month, day);
            }

            var transition = new CaseTransition();
            transition.CaseID = theCase.CaseID;
            transition.PreviousStateID = theCase.StateID;
            transition.NewStateID = int.Parse(this.ddlNewState.SelectedValue);
            transition.Comment = this.txtComments.Text;
            transition.UserID = currentUserId;
            transition.TransitionDate = DateTime.Now;
            transition.EffectiveDate = effectiveDate;

            theCase.StateID = transition.NewStateID;
            //theCase.UserID = newResponsableID;
            theCase.EffectiveDate = effectiveDate;
            theCase.StateTransitions.Add(transition);
            db.SaveChanges();

            this.ddlNewState.DataBind();
            this.CaseTransitionsListView.DataBind();


            this.txtComments.Text = string.Empty;
            this.txtEffectiveDate.Text = string.Empty;
            RaiseBubbleEvent(this, new CaseStateChangedEventArgs());
        }

        private class UserAssignmet
        {
            public UserAssignmet()
            {

            }
            public string UserID { get; set; }
            public int Caseload { get; set; }
        }

        protected void ddlNewState_SelectedIndexChanged(object sender, EventArgs e)
        {
            changeEffectiveDateEnableProperty();
        }

        protected void ddlNewState_DataBound(object sender, EventArgs e)
        {
            changeEffectiveDateEnableProperty();
        }

        protected void CaseTransitionsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(CaseTransitionDataSource.ConnectionString);
          
            SqlCommand cmd1 = new SqlCommand();

            Label lblCaseTransitionID = (Label)e.Item.FindControl("lblCaseTransitionID");
            
            if (e.CommandName == "Drop")
            {
                try
                {
                    cmd1.CommandText = "[dbo].[sp_delete_case_transition]";
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Connection = sqlConnection1;

                    cmd1.Parameters.AddWithValue("@CaseTransitionID", lblCaseTransitionID.Text);

                    sqlConnection1.Open();

                    cmd1.ExecuteNonQuery();

                    sqlConnection1.Close();

                    Response.Redirect("CollectionCaseDetails.aspx?CaseID=" + Request.QueryString["CaseID"]);

                }
                catch (Exception exp)
                {
                    ErrorLabel.Text = exp.Message;
                    ErrorLabel.Visible = true;
                }
            }
        }

    }
}