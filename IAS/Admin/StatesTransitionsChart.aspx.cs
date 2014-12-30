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