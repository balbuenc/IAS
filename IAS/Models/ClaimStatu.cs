using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class ClaimStatu
    {
        public ClaimStatu()
        {
            this.Claims = new List<Claim>();
        }

        public short ClaimStatusID { get; set; }
        public string ClaimStatus { get; set; }
        public virtual ICollection<Claim> Claims { get; set; }
    }
}
