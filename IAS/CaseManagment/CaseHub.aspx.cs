using IAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.CaseManagment
{
    public partial class CaseHub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             var db = new ApplicationDbContext();

        
           
            var id_caso = int.Parse( Request.QueryString["CaseID"]);
            var currentCase = db.Cases.Where( c => c.CaseID == id_caso ).SingleOrDefault();
           

                    var form = ( from f in db.WorkflowStatesForms
                                 where f.StateID == currentCase.StateID
                                 && f.WorkflowID == currentCase.WorkflowID
                                 select f.Form ).FirstOrDefault();

                    if (null == form)
                    {
                        form = (from f in db.Workflows
                                where f.WorkflowID == currentCase.WorkflowID
                                select f.DefaultForm).FirstOrDefault();
                        if (null == form)
                            Response.Redirect("CaseDetails.aspx?CaseID=" + currentCase.CaseID, false);
                        else
                            Response.Redirect(form.Url + "?CaseID=" + currentCase.CaseID, false);
                    }
                    else
                    {
                        Response.Redirect(form.Url + "?CaseID=" + currentCase.CaseID, false);
                    }   
        }
    }
}