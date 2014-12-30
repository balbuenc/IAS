using IAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Validation;
using System.Text;

namespace IAS.Admin
{
    public partial class StatesTransitionsChart : System.Web.UI.Page
    {
        
        long _workflowID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["WorkflowID"] != null)
            {
                this._workflowID = long.Parse(Request.QueryString["WorkflowID"]);
                this.BuildTransitiosChart();
            }
            else
            {
                // Response.Redirect("~/default.aspx");
            }
        }

        public void BuildTransitiosChart()
        {

            StringBuilder sbLinksArray = new StringBuilder();
            

            var db = new ApplicationDbContext();
            var query = db.WorkflowStateTransitions
                .Where(t => t.WorkflowID == this._workflowID)
                .OrderBy(t => t.InicialState.StateName)
                .ThenBy(t => t.FinalState.StateName);

            foreach (WorkflowStateTransition transition in query)
            {
                if(sbLinksArray.Length == 0)
                    sbLinksArray.Append("var links = [");
                else
                    sbLinksArray.Append(",");

                sbLinksArray.Append("{ source: \"" + transition.InicialState.StateName + "\", target:\"" + transition.FinalState.StateName + "\", type: \"" + ((transition.FinalStateID == transition.InitialStateID) ? "recursive" : "normal") + "\" }");
            }

            sbLinksArray.Append("];");

            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "js_link_array", sbLinksArray.ToString(), true);
            ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "js_render_transitions", "renderTransitionChart();", true);
        
        
        }
    }
}