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


using IAS.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAS {
    public partial class ErrorPage : System.Web.UI.Page {
        protected void Page_Load( object sender, EventArgs e ) {
            // Create safe error messages.
            string generalErrorMsg = "Ha ocurrido un problema inesperado en el sitio. Por favor  intente de nuevo. " +
                "Si el error continua, por favor contacte con personal de soporte del sistema.";
            string httpErrorMsg = "Ha ocurrido un error HTTP. La página no ha sido encontrada. Por favor intentelo de nuevo.";
            string unhandledErrorMsg = "El error no fué controlado por la aplicación.";

            // Display safe error message.
            FriendlyErrorMsg.Text = generalErrorMsg;

            // Determine where error was handled.
            string errorHandler = Request.QueryString["handler"];
            if ( errorHandler == null ) {
                errorHandler = "Error Page";
            }

            // Get the last error from the server.
            Exception ex = Server.GetLastError();

            // Get the error number passed as a querystring value.
            string errorMsg = Request.QueryString["msg"];
            if ( errorMsg == "404" ) {
                ex = new HttpException( 404, httpErrorMsg, ex );
                FriendlyErrorMsg.Text = ex.Message;
            }

            // If the exception no longer exists, create a generic exception.
            if ( ex == null ) {
                ex = new Exception( unhandledErrorMsg );
            }

            // Show error details to only you (developer). LOCAL ACCESS ONLY.
            if ( Request.IsLocal ) {
                // Detailed Error Message.
                ErrorDetailedMsg.Text = ex.Message;

                // Show where the error was handled.
                ErrorHandler.Text = errorHandler;

                // Show local access details.
                DetailedErrorPanel.Visible = true;

                if ( ex.InnerException != null ) {
                    InnerMessage.Text = ex.GetType().ToString() + "<br/>" +
                        ex.InnerException.Message;
                    InnerTrace.Text = ex.InnerException.StackTrace;
                }
                else {
                    InnerMessage.Text = ex.GetType().ToString();
                    if ( ex.StackTrace != null ) {
                        InnerTrace.Text = ex.StackTrace.ToString().TrimStart();
                    }
                }
            }

            // Log the exception.
            ExceptionUtility.LogException( ex, errorHandler );

            // Clear the error from the server.
            Server.ClearError();
        }
    }
}