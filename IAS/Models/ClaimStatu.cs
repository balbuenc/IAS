using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class ClaimStatu
    {
        public ClaimStatu()
        {
            this.Claims = new List<Claim>();
        }

        [Key]
        public short ClaimStatusID { get; set; }
        public string Status { get; set; }
        public virtual ICollection<Claim> Claims { get; set; }
    }
}
