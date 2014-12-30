using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace IAS.Collections
{
    public partial class Assignations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString.GetValues("ix_user") != null)
            //{
            //    UsersDropDownList.SelectedIndex = Convert.ToInt32(Request.QueryString["ix_user"].ToString());
            //}
        }

        protected void AssignBtn_Click(object sender, EventArgs e)
        {
            //insercion de asiganacion de personas a funcionario
            for (int i = 0; i < PersonasGridView.Rows.Count; i++)
            {
                GridViewRow row = PersonasGridView.Rows[i];
                bool isChecked = ((CheckBox)row.FindControl("chkSelect")).Checked;

                if (isChecked)
                {                 
                    try
                    {
                        using (SqlConnection conexion = new SqlConnection(DSusers.ConnectionString))
                        {
                            conexion.Open();

                            SqlCommand comando = new SqlCommand();

                            comando.CommandType = CommandType.StoredProcedure;
                            comando.Connection = conexion;
                            comando.CommandText = "set_user_person_assignation";

                            comando.Parameters.AddWithValue("@id_user", UsersDropDownList.SelectedValue);
                            comando.Parameters.AddWithValue("@id_persona", PersonasGridView.Rows[i].Cells[1].Text);

                            comando.ExecuteNonQuery();

                            conexion.Close();
                        }

                    }
                    catch (Exception EX)
                    {
                        Response.Write(EX.Message);
                    }


                }
            }

            Response.Redirect("Assignations.aspx?ix_user=" + UsersDropDownList.SelectedIndex, false);
        }

        protected void DeAssingBtn_Click(object sender, EventArgs e)
        {
            //insercion de asiganacion de personas a funcionario
            for (int i = 0; i < AssignationsGridView.Rows.Count; i++)
            {
                GridViewRow row = AssignationsGridView.Rows[i];
                bool isChecked = ((CheckBox)row.FindControl("chkSelect")).Checked;

                if (isChecked)
                {
                    try
                    {
                        using (SqlConnection conexion = new SqlConnection(DSusers.ConnectionString))
                        {
                            conexion.Open();

                            SqlCommand comando = new SqlCommand();

                            comando.CommandType = CommandType.StoredProcedure;
                            comando.Connection = conexion;
                            comando.CommandText = "unset_user_person_assignation";

                            comando.Parameters.AddWithValue("@id_user", UsersDropDownList.SelectedValue);
                            comando.Parameters.AddWithValue("@id_persona", AssignationsGridView.Rows[i].Cells[1].Text);

                            comando.ExecuteNonQuery();

                            conexion.Close();
                        }

                    }
                    catch (Exception EX)
                    {
                        Response.Write(EX.Message);
                    }


                }
            }

            Response.Redirect("Assignations.aspx?ix_user=" + UsersDropDownList.SelectedIndex, false);
        }

      

       


    }
}