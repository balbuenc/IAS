using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Liquidator
    {
        public Liquidator()
        {
            this.Claims = new List<Claim>();
        }

        public short LiquidatorID { get; set; }
        public string Name { get; set; }
        public string MobilePhoneNumber { get; set; }
        public string RegistryNumber { get; set; }
        public string Email { get; set; }
        public virtual ICollection<Claim> Claims { get; set; }
    }
}
