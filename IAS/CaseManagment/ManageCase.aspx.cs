using IAS.Constants;
using IAS.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.CaseManagment
{
    public partial class ManageCase : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            //if (null == Request.QueryString["CaseID"])
            //    Response.Redirect("~/Default.aspx", false);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            hdnCaseID.Value = Request.QueryString["CaseID"].ToString();


        }

        public Person GetPerson([QueryString("CaseID")] long? caseID)
        {
            try
            {
                var db = new ApplicationDbContext();
                var colls = db.Collections.Where(c => c.CaseID == caseID);
                if (null != colls)
                    return colls.First().Person;
                else
                    return null;
            }
            catch
            {
                return null;
            }
        }

        public IQueryable<Collection> GetCollectionsForCase([QueryString("CaseID")] long? caseID)
        {

            if (null == caseID)
                return null;
            var lastDate = this.LastDayofMonth(DateTime.Now);
            var db = new ApplicationDbContext();

            var coll = db.Collections
                .Where(c => c.CaseID == caseID)
                .Where(c => c.PaymentDueDate <= lastDate)
                .GroupBy(c => c.PolicyNumber)
                .Select(c => c.FirstOrDefault());

            return coll;
        }

        public IQueryable<Collection> GetOverdueInvoices([Control("lblPolicyNumber")] long? policyNumber)
        {
            if (null == policyNumber)
                return null;

            var lastDate = this.LastDayofMonth(DateTime.Now);
            var db = new ApplicationDbContext();
            var coll = db.Collections
                .Where(c => c.PolicyNumber == policyNumber)
                .Where(c => c.PaymentDueDate <= lastDate)
                .Where(c => c.Collected == false);
            return coll;
        }


        protected void CaseTransitionManager_CaseStateChanged()
        {

        }

        public IQueryable<CollectionState> GetCollectionStates()
        {
            var db = new ApplicationDbContext();
            return db.CollectionStates;
        }

        protected void DetailListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            var lv = sender as ListView;
            lv.EditIndex = e.NewEditIndex;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dateTimePickup", "$('input.datetime').datetimepicker({pickTime: false});", true);
        }


        public void UpdatePayment(Collection subject)
        {
            try
            {
                var db = new ApplicationDbContext();
                var theCollection = db.Collections.SingleOrDefault(c => c.CollectionID == subject.CollectionID);
                if (theCollection == null)
                {
                    ModelState.AddModelError("", String.Format("No se encontró el elemento con id. {0}", subject.CollectionID.ToString()));
                    return;
                }

                theCollection.Collected = subject.Collected;
                if (null == subject.CollectedDate)
                    theCollection.CollectedDate = DateTime.Today;
                else
                    theCollection.CollectedDate = subject.CollectedDate;


                theCollection.CollectionStateID = subject.CollectionStateID;
                db.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = EventLogManager.LogError(ex);
            }
            catch (Exception exp)
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = exp.Message;
            }
        }


        public DateTime LastDayofMonth(DateTime dt)
        {

            //Select the first day of the month by using the DateTime class
            dt = new DateTime(dt.Year, dt.Month, 1);

            //Add one month to our adjusted DateTime
            dt = dt.AddMonths(1);

            //Subtract one day from our adjusted DateTime
            dt = dt.AddDays(-1);

            //Return the DateTime, now set to the last day of the month
            return dt;

        }



        protected void CollectionsListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblPolicyNumber = (Label)e.Item.FindControl("lblPolicyNumber");
                HiddenField1.Value = lblPolicyNumber.Text;
            }
        }


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

        public void buttonChangeState_Click(object sender, EventArgs e)
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
                try
                {
                    effectiveDate = DateTime.ParseExact(txtEffectiveDate.Text, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                }
                catch (Exception ex)
                {
                    effectiveDate = DateTime.Now;
                }


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

            theCase.EffectiveDate = effectiveDate;
            theCase.StateTransitions.Add(transition);
            db.SaveChanges();

            this.ddlNewState.DataBind();



            this.txtComments.Text = string.Empty;
            this.txtEffectiveDate.Text = string.Empty;

            Response.Redirect("MyCaseList.aspx");
        }



        protected void ddlNewState_SelectedIndexChanged(object sender, EventArgs e)
        {
            changeEffectiveDateEnableProperty();
        }

        protected void ddlNewState_DataBound(object sender, EventArgs e)
        {
            changeEffectiveDateEnableProperty();
        }

    }
}