using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IAS.Common
{
    public class IASException: Exception
    {
        public IASException() :base(Properties.Resources.UnknownErrorMessage){ }

        public IASException(string message):this(message,null){}

        public IASException(Exception innerExcepcion) : this(Properties.Resources.UnknownErrorMessage, innerExcepcion) { }

        public IASException(string message, Exception innerException):
            base(message,innerException){}


        private string getInnerExceptionDetails(string message, Exception theInnerEx)
        {
            var messageBuilder = new StringBuilder();
            Exception myInnerEx = theInnerEx;
            messageBuilder.AppendLine(message);
            while (null != myInnerEx)
            {
                messageBuilder.AppendLine();
                messageBuilder.AppendLine(String.Format("Source: {0}", myInnerEx.Source));
                messageBuilder.AppendLine(String.Format("Method: {0}", myInnerEx.TargetSite));
                messageBuilder.AppendLine(String.Format("Message: {0}", myInnerEx.Message));
                messageBuilder.AppendLine(String.Format("Help: {0}", myInnerEx.HelpLink));
                messageBuilder.AppendLine();
                messageBuilder.AppendLine("StackTrace:");
                messageBuilder.AppendLine(String.Format("{0}", myInnerEx.StackTrace));
                myInnerEx = myInnerEx.InnerException;
            }
            return messageBuilder.ToString();
        }
    }

    public class IASSecurityException : IASException
    {
        public IASSecurityException() :base(){ }
    }
}
