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
using System.IO;
using System.Linq;
using System.Web;

namespace IAS.Infrastructure {
    public class ExceptionUtility {
        // All methods are static, so this can be private
        private ExceptionUtility() { }
        //s
        // Log an Exception
        public static void LogException( Exception exc, string source ) {
            // Include logic for logging exceptions
            // Get the absolute path to the log file
            string logFile = "App_Data/ErrorLog.txt";
            logFile = HttpContext.Current.Server.MapPath( logFile );

            // Open the log file for append and write the log
            StreamWriter sw = new StreamWriter( logFile, true );
            sw.WriteLine( "********** {0} **********", DateTime.Now );
            if ( exc.InnerException != null ) {
                sw.Write( "Inner Exception Type: " );
                sw.WriteLine( exc.InnerException.GetType().ToString() );
                sw.Write( "Inner Exception: " );
                sw.WriteLine( exc.InnerException.Message );
                sw.Write( "Inner Source: " );
                sw.WriteLine( exc.InnerException.Source );
                if ( exc.InnerException.StackTrace != null ) {
                    sw.WriteLine( "Inner Stack Trace: " );
                    sw.WriteLine( exc.InnerException.StackTrace );
                }
            }
            sw.Write( "Exception Type: " );
            sw.WriteLine( exc.GetType().ToString() );
            sw.WriteLine( "Exception: " + exc.Message );
            sw.WriteLine( "Source: " + source );
            sw.WriteLine( "Stack Trace: " );
            if ( exc.StackTrace != null ) {
                sw.WriteLine( exc.StackTrace );
                sw.WriteLine();
            }
            sw.Close();
        }
    }
}