using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class ClaimType
    {
        public ClaimType()
        {
            this.Claims = new List<Claim>();
        }

        public int ClaimTypeID { get; set; }
        public string Description { get; set; }
        public virtual ICollection<Claim> Claims { get; set; }
    }
}
