using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class ClaimStatu1
    {
        public ClaimStatu1()
        {
            this.Claim1 = new List<Claim1>();
        }

        public short ClaimStatusID { get; set; }
        public string Status { get; set; }
        public virtual ICollection<Claim1> Claim1 { get; set; }
    }
}
