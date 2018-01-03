using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.CaseManagment
{
    public partial class SearchCollection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void CollectionLoad()
        {
           
            DateTime? startDate = null;

            if (!string.IsNullOrEmpty(dpDueDate.Value))
            {
                startDate = DateTime.Parse(dpDueDate.Value);
            }

            SqlConnection sqlConnection1 = new SqlConnection(CollectionDataSource.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[collection].[sp_get_collections_by_duedate]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.Add("@PaymentDueDate", SqlDbType.DateTime).Value = startDate;
             

                da.SelectCommand = cmd;

                da.Fill(dt);

                CollectionListView.DataSourceID = string.Empty;
                CollectionListView.DataSource = dt;
                CollectionListView.DataBind();
               

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = "Error a ejecutar busqueda.. : " + exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            CollectionLoad();
        }
    }
}