using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace IAS.CaseManagment
{

    public partial class CollectionsToExpire : System.Web.UI.Page
    {
        protected static double CollectionID;
        protected static double CaseID;
 
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CollectionsToExpireGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SendSMS")
            {
                // Retrieve the row index stored in the 
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                GridViewRow row = CollectionsToExpireGridView.Rows[index];




                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "js_sendSMS", "$('#dvSendSMS').modal('toggle')", true);

                setMessageData(row);
                this.SendSMSPanel.Update();
            }

        }


        protected void CollectionsExpiredGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SendSMS")
            {
                // Retrieve the row index stored in the 
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                GridViewRow row = CollectionsExpiredGridView.Rows[index];




                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "js_sendSMSExpired", "$('#dvSendSMSExpired').modal('toggle')", true);

                setExpiredMessageData(row);
                this.SendExpiredPanel.Update();
            }

        }
        protected void setMessageData(GridViewRow row)
        {
            this.Destination.Text = row.Cells[7].Text;
            this.TextToSend.Text = "ESTIMADO CLIENTE, SU CUOTA DEL SEGURO VENCE EN FECHA " + row.Cells[1].Text + ", UN SERVICIO DE SU CORREDORA AIB.";
            CaseID = Convert.ToDouble ( row.Cells[0].Text) ;
            CollectionID = Convert.ToDouble(row.Cells[9].Text); 
        }

        protected void setExpiredMessageData(GridViewRow row)
        {
            this.DestinationExpired.Text = row.Cells[7].Text;
            this.TextToSendExpired.Text = "ESTIMADO CLIENTE, SU CUOTA DEL SEGURO A VENCIDO EN FECHA " + row.Cells[1].Text + ", EN CASO DE PAGO REALIZADO, HACER CASO OMISO AL AVISO. UN SERVICIO DE SU CORREDORA AIB.";
            CaseID = Convert.ToDouble(row.Cells[0].Text);
            CollectionID = Convert.ToDouble(row.Cells[9].Text); 
        }

        protected void SendSMSButtom_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(CollectionsToExpireSqlDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;

            try
            {

                cmd.CommandText = "sp_send_sms";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("p_movile_number", Destination.Text);
                cmd.Parameters.AddWithValue("p_message", TextToSend.Text);
                cmd.Parameters.AddWithValue("p_collection_id", CollectionID);
                cmd.Parameters.AddWithValue("p_case_id", CaseID);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

            }
            finally
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "js_sendSMS", "$('#dvSendSMS').modal('toggle')", true);
            }
        }

        protected void SendSMSExpiredButtom_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(CollectionsToExpireSqlDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;

            try
            {

                cmd.CommandText = "sp_send_sms";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("p_movile_number", DestinationExpired.Text);
                cmd.Parameters.AddWithValue("p_message", TextToSendExpired.Text);
                cmd.Parameters.AddWithValue("p_collection_id", CollectionID);
                cmd.Parameters.AddWithValue("p_case_id", CaseID);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

            }
            finally
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "js_sendSMS", "$('#dvSendSMSExpired').modal('toggle')", true);
            }
        }

        protected void SendToAllSmsBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(CollectionsToExpireSqlDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;
           

            try
            {
                foreach (GridViewRow dr in CollectionsToExpireGridView.Rows)
                {
                    setMessageData(dr);

                    cmd.Parameters.Clear();

                    cmd.CommandText = "sp_send_sms";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlConnection1;


                    cmd.Parameters.AddWithValue("p_movile_number", Destination.Text);                    
                    cmd.Parameters.AddWithValue("p_message", "");
                    cmd.Parameters.AddWithValue("p_collection_id", CollectionID);
                    cmd.Parameters.AddWithValue("p_case_id", CaseID);

                    sqlConnection1.Open();

                    
                    rowsAffected = cmd.ExecuteNonQuery();

                    sqlConnection1.Close();
                }
            }
            catch (Exception Ex)
            {
                Response.Write(Ex.Message);
                throw Ex;
            }

        }

      

        protected void SendToAllExpiredSmsBtn_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(CollectionsToExpireSqlDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            Int32 rowsAffected;
           

            try
            {
                foreach (GridViewRow dr in CollectionsExpiredGridView.Rows)
                {
                    setExpiredMessageData(dr);

                    cmd.Parameters.Clear();

                    cmd.CommandText = "sp_send_sms";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = sqlConnection1;


                    cmd.Parameters.AddWithValue("p_movile_number", DestinationExpired.Text);                    
                    cmd.Parameters.AddWithValue("p_message", "");
                    cmd.Parameters.AddWithValue("p_collection_id", CollectionID);
                    cmd.Parameters.AddWithValue("p_case_id", CaseID);

                    sqlConnection1.Open();

                   
                    rowsAffected = cmd.ExecuteNonQuery();

                    sqlConnection1.Close();
                }
            }
            catch (Exception Ex)
            {
                Response.Write(Ex.Message);
                throw Ex;
            }
        }
    }
}