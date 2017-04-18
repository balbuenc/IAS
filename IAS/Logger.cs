using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS
{
    public static class Logger
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public static ILog Log
        {
            get
            {
                InicializeLogging();
                return log;
            }
        }

        public static void InicializeLogging()
        {
            if (!LogManager.GetRepository().Configured)
                log4net.Config.XmlConfigurator.Configure();
        }

    }
}