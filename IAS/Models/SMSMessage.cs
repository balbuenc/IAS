using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class SMSMessage
    {
        public int MessageID { get; set; }
        public int LowRange { get; set; }
        public int TopRange { get; set; }
        public string Message { get; set; }
        public bool Status { get; set; }
    }
}
