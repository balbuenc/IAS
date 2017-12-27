using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Tasks
{
    public partial class TaskCalendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtWebAuthUser.Text = User.Identity.Name;

        }

        protected void DayPilotCalendar1_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
        {
            switch (e.Command)
            {
                case "previous":
                    DayPilotCalendar1.StartDate = DayPilotCalendar1.StartDate.AddDays(-7);
                    DayPilotCalendar1.DataBind();
                    break;
                case "next":
                    DayPilotCalendar1.StartDate = DayPilotCalendar1.StartDate.AddDays(7);
                    DayPilotCalendar1.DataBind();
                    break;
            }
        }
    }
}