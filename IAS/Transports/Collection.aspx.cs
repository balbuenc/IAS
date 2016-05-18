using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Transports
{
    public partial class Collection : System.Web.UI.Page
    {
        public string PolicyNumber
        {
            get
            {
                object o = ViewState["PolicyNumber"];
                if(o == null)
                    return string.Empty;
                return o.ToString();
            }
            set
            {
                ViewState["PolicyNumber"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if(Request.QueryString["PolicyNumber"] == null)
                {
                    PolicyNumber = "5005010343315";
                }
                else
                {
                    PolicyNumber = Request.QueryString["PolicyNumber"];
                }
            }

            //CollectionListView.DefaultMode = FormViewMode.Edit;    
        }


        protected void CollectionListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string txtPaymentDueDate;
            string txtReceiptNumber;
            string txtDebtAmount;
            string txtCollectedDate;
            bool chkCollected;
            string ddlCurrency;
            string ddlCollectionState;
            string ddlCollectionMethod;
            string txtMonthGoal;
            string txtYearGoal;

            if(e.CommandName == "Insertar")
            {
                txtPaymentDueDate = (CollectionListView.InsertItem.FindControl("txtPaymentDueDate") as TextBox).Text;
                txtReceiptNumber = (CollectionListView.InsertItem.FindControl("txtReceiptNumber") as TextBox).Text;
                txtDebtAmount = (CollectionListView.InsertItem.FindControl("txtDebtAmount") as TextBox).Text;
                txtCollectedDate = (CollectionListView.InsertItem.FindControl("txtCollectedDate") as TextBox).Text;
                chkCollected = (CollectionListView.InsertItem.FindControl("chkCollected") as CheckBox).Checked;
                ddlCurrency = (CollectionListView.InsertItem.FindControl("ddlCurrency") as DropDownList).SelectedValue;
                ddlCollectionState = (CollectionListView.InsertItem.FindControl("ddlCollectionState") as DropDownList).SelectedValue;
                ddlCollectionMethod = (CollectionListView.InsertItem.FindControl("CollectionMethod") as DropDownList).SelectedValue;
                txtMonthGoal = (CollectionListView.InsertItem.FindControl("txtMonthGoal") as TextBox).Text;
                txtYearGoal = (CollectionListView.InsertItem.FindControl("txtYearGoal") as TextBox).Text;

                CollectionStateDataSource.InsertParameters["PaymentDueDate"].DefaultValue = txtPaymentDueDate;
                CollectionStateDataSource.InsertParameters["ReceiptNumber"].DefaultValue = txtReceiptNumber;
                CollectionStateDataSource.InsertParameters["DebtAmount"].DefaultValue = txtDebtAmount;
                CollectionStateDataSource.InsertParameters["CollectedDate"].DefaultValue = txtCollectedDate;
                CollectionStateDataSource.InsertParameters["Collected"].DefaultValue = chkCollected.ToString();
                CollectionStateDataSource.InsertParameters["Currency"].DefaultValue = ddlCurrency;
                CollectionStateDataSource.InsertParameters["CollectionStateID"].DefaultValue = ddlCollectionState;
                CollectionStateDataSource.InsertParameters["CollectionMethodID"].DefaultValue = ddlCollectionMethod;
                CollectionStateDataSource.InsertParameters["MonthGoal"].DefaultValue = txtMonthGoal;
                CollectionStateDataSource.InsertParameters["YearGoal"].DefaultValue = txtYearGoal;
                CollectionStateDataSource.InsertParameters["PolicyNumber"].DefaultValue = PolicyNumber;

                CollectionDataSource.Insert();
            }
            else if(e.CommandName == "Actualizar")
            {
                txtPaymentDueDate = (e.Item.FindControl("txtPaymentDueDate") as TextBox).Text;
                txtReceiptNumber = (e.Item.FindControl("txtReceiptNumber") as TextBox).Text;
                txtDebtAmount = (e.Item.FindControl("txtDebtAmount") as TextBox).Text;
                txtCollectedDate = (e.Item.FindControl("txtCollectedDate") as TextBox).Text;
                chkCollected = (e.Item.FindControl("chkCollected") as CheckBox).Checked;
                ddlCurrency = (e.Item.FindControl("ddlCurrency") as DropDownList).SelectedValue;
                ddlCollectionState = (e.Item.FindControl("ddlCollectionState") as DropDownList).SelectedValue;
                ddlCollectionMethod = (e.Item.FindControl("CollectionMethod") as DropDownList).SelectedValue;
                txtMonthGoal = (e.Item.FindControl("txtMonthGoal") as TextBox).Text;
                txtYearGoal = (e.Item.FindControl("txtYearGoal") as TextBox).Text;

                CollectionStateDataSource.UpdateParameters["PaymentDueDate"].DefaultValue = txtPaymentDueDate;
                CollectionStateDataSource.UpdateParameters["ReceiptNumber"].DefaultValue = txtReceiptNumber;
                CollectionStateDataSource.UpdateParameters["DebtAmount"].DefaultValue = txtDebtAmount;
                CollectionStateDataSource.UpdateParameters["CollectedDate"].DefaultValue = txtCollectedDate;
                CollectionStateDataSource.UpdateParameters["Collected"].DefaultValue = chkCollected.ToString();
                CollectionStateDataSource.UpdateParameters["Currency"].DefaultValue = ddlCurrency;
                CollectionStateDataSource.UpdateParameters["CollectionStateID"].DefaultValue = ddlCollectionState;
                CollectionStateDataSource.UpdateParameters["CollectionMethodID"].DefaultValue = ddlCollectionMethod;
                CollectionStateDataSource.UpdateParameters["MonthGoal"].DefaultValue = txtMonthGoal;
                CollectionStateDataSource.UpdateParameters["YearGoal"].DefaultValue = txtYearGoal;
                CollectionStateDataSource.UpdateParameters["PolicyNumber"].DefaultValue = PolicyNumber;

                CollectionDataSource.Insert();

            }
        }
    }
}