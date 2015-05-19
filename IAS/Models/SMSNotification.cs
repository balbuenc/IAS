using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class SMSNotification
    {
        public long SMSNotificationID { get; set; }
        public long CaseID { get; set; }
        public string MobilePhone { get; set; }
        public string Message { get; set; }
        public System.DateTime CreationDate { get; set; }
        public System.DateTime ScheduledDendDate { get; set; }
        public Nullable<System.DateTime> SendDate { get; set; }
        public bool Sent { get; set; }
        public Nullable<long> CollectionID { get; set; }
        public virtual Case Case { get; set; }
        public virtual Collection Collection { get; set; }
    }
}
