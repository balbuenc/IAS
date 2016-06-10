using IAS.Constants;
using IAS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS
{
    public partial class CaseManagement : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


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