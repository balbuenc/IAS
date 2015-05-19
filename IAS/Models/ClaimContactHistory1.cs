using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class ClaimContactHistory1
    {
        public long ContactID { get; set; }
        public long ClaimID { get; set; }
        public short ContactTypeID { get; set; }
        public short ContactDestinationID { get; set; }
        public System.DateTime ContactDate { get; set; }
        public string Message { get; set; }
        public virtual Claim1 Claim1 { get; set; }
        public virtual ContactDestination ContactDestination { get; set; }
        public virtual ContactType ContactType { get; set; }
    }
}
