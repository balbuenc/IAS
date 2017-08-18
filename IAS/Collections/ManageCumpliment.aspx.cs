using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Collections
{
    public partial class ManageCumpliment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            CumplimentSqlDataSource.DataBind();
            GetValues();
        }

        protected void GetValues()
        {
            decimal Total = 0;

            
            SqlConnection sqlConnection1 = new SqlConnection(CumplimentSqlDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();

            txtObjetivo.Text = "0";
            txtDevolver.Text = "0";
          


            //Obtengo el valor del Objetivo
            try
            {
                cmd.CommandText = "SELECT @Total = sum(DebtAmount) FROM [exchange].[fn_GetParametricCumpliment] (  @period  ,@UserName  ,@CurrencyID  ,@InsurancemanagerID  ,1)";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@period", ddlPeriod.SelectedValue);
                cmd.Parameters.AddWithValue("@UserName", ddlUser.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@CurrencyID", ddlCurrency.SelectedValue);
                cmd.Parameters.AddWithValue("@InsurancemanagerID", ddlInsuranceManager.SelectedValue);


                SqlParameter Ptotal = new SqlParameter("@Total", Total);

                Ptotal.Direction = ParameterDirection.Output;
                Ptotal.SqlDbType = SqlDbType.Decimal;

                cmd.Parameters.Add(Ptotal);


                sqlConnection1.Open();

                cmd.ExecuteNonQuery();

                Total = Convert.ToDecimal(Ptotal.Value);

             
                if (ddlCurrency.SelectedValue == "1")
                {
                    txtObjetivo.Text = Total.ToString("c", System.Globalization.CultureInfo.GetCultureInfo("es-PY"));
                }
                else
                {
                    txtObjetivo.Text = Total.ToString("c", System.Globalization.CultureInfo.GetCultureInfo("en-us"));
                }
                
                sqlConnection1.Close();


                }


           
            catch (Exception exp)
            {
                Total = 0;
                

                if (ddlCurrency.SelectedValue == "1")
                {
                    txtObjetivo.Text = Total.ToString("c", System.Globalization.CultureInfo.GetCultureInfo("es-PY"));
                }
                else
                {
                    txtObjetivo.Text = Total.ToString("c", System.Globalization.CultureInfo.GetCultureInfo("en-us"));
                }
            }

           

            //Obtengo el valor a devolver
            try
            {
                Total = 0;

                cmd1.CommandText = "SELECT @Total = sum(DebtAmount) FROM [exchange].[fn_GetParametricCumpliment] (  @period  ,@UserName  ,@CurrencyID  ,@InsurancemanagerID  ,0)";
                cmd1.CommandType = CommandType.Text;
                cmd1.Connection = sqlConnection1;

                cmd1.Parameters.AddWithValue("@period", ddlPeriod.SelectedValue);
                cmd1.Parameters.AddWithValue("@UserName", ddlUser.SelectedItem.Text);
                cmd1.Parameters.AddWithValue("@CurrencyID", ddlCurrency.SelectedValue);
                cmd1.Parameters.AddWithValue("@InsurancemanagerID", ddlInsuranceManager.SelectedValue);


                SqlParameter PtotalDevolver = new SqlParameter("@Total", Total);

                PtotalDevolver.Direction = ParameterDirection.Output;
                PtotalDevolver.SqlDbType = SqlDbType.Decimal;

                cmd1.Parameters.Add(PtotalDevolver);


                sqlConnection1.Open();

                cmd1.ExecuteNonQuery();

                Total = Convert.ToDecimal(PtotalDevolver.Value);


                if (ddlCurrency.SelectedValue == "1")
                {
                    txtDevolver.Text = Total.ToString("c", System.Globalization.CultureInfo.GetCultureInfo("es-PY"));
                }
                else
                {
                    txtDevolver.Text = Total.ToString("c", System.Globalization.CultureInfo.GetCultureInfo("en-us"));
                }

                sqlConnection1.Close();


            }
            catch (Exception exp1)
            {
                Total = 0;

                if (ddlCurrency.SelectedValue == "1")
                {
                    txtDevolver.Text = Total.ToString("c", System.Globalization.CultureInfo.GetCultureInfo("es-PY"));
                }
                else
                {
                    txtDevolver.Text = Total.ToString("c", System.Globalization.CultureInfo.GetCultureInfo("en-us"));
                }
            }

        }
      

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Commit")
            {

                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);            

                //Get the new Values.
                GridViewRow row = GridView1.Rows[index];
                String CollectionStateID = ((DropDownList)row.Cells[7].Controls[1]).SelectedValue;
                String CollectionID = ((Label)row.Cells[0].Controls[1]).Text;

                // Code to update the DataSource.
                //collection.sp_update_collecction_result



                SqlConnection sqlConnection1 = new SqlConnection(CumplimentSqlDataSource.ConnectionString);
                SqlCommand cmd = new SqlCommand();



                try
                {
                    cmd.CommandText = "collection.sp_update_collecction_result";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlConnection1;

                    cmd.Parameters.AddWithValue("@Period", ddlPeriod.SelectedValue);
                    cmd.Parameters.AddWithValue("@CollentionID", CollectionID);
                    cmd.Parameters.AddWithValue("@CollectionStatID ", CollectionStateID);




                    sqlConnection1.Open();

                    cmd.ExecuteNonQuery();


                    sqlConnection1.Close();

                    //Reset the edit index.
                    GridView1.EditIndex = -1;

                    GetValues();
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