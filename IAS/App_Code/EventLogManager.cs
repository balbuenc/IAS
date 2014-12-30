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