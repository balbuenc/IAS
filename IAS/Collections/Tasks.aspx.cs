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
    public partial class Tasks : System.Web.UI.Page
    {
        protected int IdUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conexion = new SqlConnection(DSTasks.ConnectionString))
                {
                    conexion.Open();

                    SqlCommand comando = new SqlCommand();
                   
                    comando.CommandType = CommandType.Text;
                    comando.Connection = conexion;
                    comando.CommandText = "SELECT  first_name + ' ' + last_name AS [USER], id_user FROM core.users WHERE (login = @login)";

                    comando.Parameters.AddWithValue("@login", User.Identity.Name);

                    SqlDataReader reader = comando.ExecuteReader();

                    // Leo el Id del usuario autenticado
                    while (reader.Read())
                    {
                        LabelUser.Text = ((IDataRecord)reader)[0].ToString();
                        IdUser = Convert.ToInt32 (((IDataRecord)reader)[1]);
                        IdUserHiddenField.Value = IdUser.ToString();
                    }

                    conexion.Close();
                }

            }
            catch(Exception EX)
            {
                Response.Write(EX.Message);
            }
        }
    }
}