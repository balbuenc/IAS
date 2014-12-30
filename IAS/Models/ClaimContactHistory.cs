using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class ClaimContactHistory
    {
        [Key]
        public long ContactID { get; set; }
        public long ClaimID { get; set; }
        public short ContactTypeID { get; set; }
        public short ContactDestinationID { get; set; }
        public System.DateTime ContactDate { get; set; }
        public string Message { get; set; }
        public virtual Claim Claim { get; set; }
        public virtual ContactDestination ContactDestination { get; set; }
        public virtual ContactType ContactType { get; set; }
    }
}
