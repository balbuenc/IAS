using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS.Claims
{
    public partial class WorkShopClaim : System.Web.UI.Page
    {

        protected void DoneBtn_Click(object sender, EventArgs e)
        {

            SqlConnection sqlConnection1 = new SqlConnection(estadoClienteDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            int rowsAffected;

            try
            {

                //Actualizo los datos del Siniestro
                UpdateClaim();

                //Genero el cambio de estado
                cmd.CommandText = "claim.sp_change_claim_status";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@ClaimID", Request.QueryString["ClaimID"]);
                cmd.Parameters.AddWithValue("@GoNextStep", 1);
                cmd.Parameters.AddWithValue("@UserName", User.Identity.Name);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

                // Enviamos la notificación al cliente
                SendNotificacion();

                //Direcciono a la pagina de busqueda
                Response.Redirect("ClaimSearch.aspx?PolicyNumber=" + Request.QueryString["PolicyNumber"]);

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdateClaim()
        {

            SqlConnection sqlConnection1 = new SqlConnection(estadoClienteDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();
            SqlCommand cmd2 = new SqlCommand();
            Int32 rowsAffected;

            string txtClaimNumber = (ClaimDetailsListView.Row.FindControl("txtClaimNumber") as TextBox).Text;
            string txtRiskName = (ClaimDetailsListView.Row.FindControl("txtRiskName") as TextBox).Text;
            DropDownList ddlLiquidador = (ClaimDetailsListView.Row.FindControl("ddlLiquidador") as DropDownList);
            DropDownList ddlTaller = (ClaimDetailsListView.Row.FindControl("ddlTaller") as DropDownList);
            string lblContactName = (ClaimDetailsListView.Row.FindControl("lblContactName") as Label).Text;
            string lblClaimDate = (ClaimDetailsListView.Row.FindControl("lblClaimDate") as Label).Text;
            DropDownList ddlExpertoAseguradora = (ClaimDetailsListView.Row.FindControl("ddlExpertoAseguradora") as DropDownList);
            string lblSection = (ClaimDetailsListView.Row.FindControl("lblSection") as Label).Text;
            string lblClaimAddress = (ClaimDetailsListView.Row.FindControl("lblClaimAddress") as Label).Text;
            string lblClaimDescription = (ClaimDetailsListView.Row.FindControl("lblClaimDescription") as TextBox).Text;
            string lblClaimTime = (ClaimDetailsListView.Row.FindControl("lblClaimTime") as Label).Text;

            string lblOtherVehicleDescription = (ClaimDetailsListView.Row.FindControl("lblOtherVehicleDescription") as Label).Text;
            string lblOtherVehiclePatentNumber = (ClaimDetailsListView.Row.FindControl("lblOtherVehiclePatentNumber") as Label).Text;
            string txtLooseDescription = (ClaimDetailsListView.Row.FindControl("txtLooseDescription") as TextBox).Text;
            string txtObservations = (ClaimDetailsListView.Row.FindControl("txtObservations") as TextBox).Text;

            try
            {

                cmd1.CommandText = "[claim].[sp_update_claim]";
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Connection = sqlConnection1;

                cmd1.Parameters.AddWithValue("@ClaimID", Request.QueryString["ClaimID"]);
                cmd1.Parameters.AddWithValue("@ClaimNumber", txtClaimNumber);
                cmd1.Parameters.AddWithValue("@RiskName", txtRiskName);
                cmd1.Parameters.AddWithValue("@LiquidatorID", ddlLiquidador.SelectedValue);
                cmd1.Parameters.AddWithValue("@WorkshopID", ddlTaller.SelectedValue);
                cmd1.Parameters.AddWithValue("@ClaimDate", DateTime.Parse(lblClaimDate));
                cmd1.Parameters.AddWithValue("@InsuranceExpertID", ddlExpertoAseguradora.SelectedValue);
                cmd1.Parameters.AddWithValue("@Section", lblSection);
                cmd1.Parameters.AddWithValue("@ContactName", lblContactName);
                cmd1.Parameters.AddWithValue("@ClaimAddress", lblClaimAddress);
                cmd1.Parameters.AddWithValue("@ClaimDescription", lblClaimDescription);
                cmd1.Parameters.AddWithValue("@ClaimTime", lblClaimTime);
                cmd1.Parameters.AddWithValue("@OtherVehicleDescription", lblOtherVehicleDescription);
                cmd1.Parameters.AddWithValue("@OtherVehiclePatentNumber", lblOtherVehiclePatentNumber);
                cmd1.Parameters.AddWithValue("@LooseDescription", txtLooseDescription);
                //cmd1.Parameters.AddWithValue("@Observations", txtObservations);

                sqlConnection1.Open();

                rowsAffected = cmd1.ExecuteNonQuery();

                sqlConnection1.Close();

                //Genero el cambio de estado
                cmd2.CommandText = "claim.sp_insert_claimComment";
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Connection = sqlConnection1;

                cmd2.Parameters.AddWithValue("@ClaimID", Request.QueryString["ClaimID"]);
                cmd2.Parameters.AddWithValue("@UserName", User.Identity.Name);
                cmd2.Parameters.AddWithValue("@CommentDate", DateTime.Now);
                cmd2.Parameters.AddWithValue("@Comment", txtObservations);

                sqlConnection1.Open();

                rowsAffected = cmd2.ExecuteNonQuery();

                sqlConnection1.Close();

            }
            catch (Exception exp)
            {
                ErrorLabel.Text = exp.Message;
                ErrorLabel.Visible = true;
            }
        }
        private void SendEmail()
        {

            SqlConnection sqlConnection1 = new SqlConnection(estadoClienteDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            int rowsAffected;

            try
            {

                //Genero el cambio de estado
                cmd.CommandText = "sp_send_email_to_client";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@p_claimID", Request.QueryString["ClaimID"]);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
                ErrorLabel.Visible = true;
            }
        }

        private void SendNotificacion()
        {

            try
            {
                RadioButtonList rdbOptions = (ClaimDetailsListView.Row.FindControl("rdbSendOptions") as RadioButtonList);
                if (rdbOptions.SelectedValue != "1")
                {
                    switch (rdbOptions.SelectedValue)
                    {
                        case "2":
                            SendSMS();
                            break;
                        case "3":
                            SendSMS();
                            SendEmail();
                            break;
                        default:
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
                ErrorLabel.Visible = true;
            }
        }
        private void SendSMS()
        {

            SqlConnection sqlConnection1 = new SqlConnection(estadoClienteDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            int rowsAffected;

            try
            {

                //Genero el cambio de estado
                cmd.CommandText = "sp_send_sms_to_client";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                cmd.Parameters.AddWithValue("@p_claimID", Request.QueryString["ClaimID"]);

                sqlConnection1.Open();

                rowsAffected = cmd.ExecuteNonQuery();

                sqlConnection1.Close();

            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
                ErrorLabel.Visible = true;
            }
        }

        protected void grdClaimComments_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void grdClaimComments_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblClaimCommentId = (Label)grdClaimComments.Rows[e.RowIndex].FindControl("lblClaimCommentId");
            TextBox txtComment = (TextBox)grdClaimComments.Rows[e.RowIndex].FindControl("txtComment");

            claimCommentsDataSource.UpdateParameters["ClaimCommentId"].DefaultValue = lblClaimCommentId.Text;
            claimCommentsDataSource.UpdateParameters["Comment"].DefaultValue = txtComment.Text;
            claimCommentsDataSource.UpdateParameters["UserName"].DefaultValue = User.Identity.Name;
            claimCommentsDataSource.UpdateParameters["CommentDate"].DefaultValue = DateTime.Now.ToString();

            claimCommentsDataSource.Update();
            grdClaimComments.EditIndex = -1;

        }

    }
}