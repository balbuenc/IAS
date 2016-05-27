using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Admin
{
    public partial class CollectionResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CollectionManagementResultListView_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            DropDownList ddlEstadoCuota = (DropDownList)e.Item.FindControl("ddlEstadoCuota");
            DropDownList ddlResultado = (DropDownList)e.Item.FindControl("ddlResultado");

            CollectionResultsSqlDataSource1.InsertParameters["CollectionStateID"].DefaultValue = ddlEstadoCuota.SelectedValue;
            CollectionResultsSqlDataSource1.InsertParameters["CollectionManagementResultID"].DefaultValue = ddlResultado.SelectedValue;

        }
    }
}