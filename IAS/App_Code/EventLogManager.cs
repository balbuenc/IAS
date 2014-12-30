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
using System.Data.Entity.Validation;

namespace IAS
{
    public class EventLogManager
    {

        /// <summary>
        /// Registra el error ocurrido y retorna un mensaje amigable para mostrar al usuario
        /// </summary>
        /// <param name="pExeption">Excepcion ocurrida</param>
        /// <returns>Mensaje de error en formato HTML</returns>
        public static string LogError(DbEntityValidationException pException)
        {
            string error_message = "";
            foreach (var eve in pException.EntityValidationErrors)
            {
                error_message += "<strong>No es posible procesar su solicitud:</strong>";
                error_message += "<ul>";
                foreach (var ve in eve.ValidationErrors)
                {
                    error_message += "<li>" + ve.ErrorMessage + "</li>";
                }
                error_message += "</ul>";
            }
            return error_message;
        }

    }

}