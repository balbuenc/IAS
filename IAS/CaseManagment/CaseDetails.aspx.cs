using IAS.Infrastructure;
using IAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.CaseManagment {
    public partial class CaseDetails : System.Web.UI.Page {
        protected void Page_Load( object sender, EventArgs e ) {
        }

        protected override bool OnBubbleEvent( object source, EventArgs e ) {
            bool handled = false;
            var arg = e as CaseStateChangedEventArgs;
            if ( null != arg ) {
                this.CaseData.Rebind();
                handled = true;
            }
            return handled;
            
        }
    }
}