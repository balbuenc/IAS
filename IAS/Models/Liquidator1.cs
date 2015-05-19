using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Liquidator1
    {
        public Liquidator1()
        {
            this.Claim1 = new List<Claim1>();
        }

        public short LiquidatorID { get; set; }
        public string Name { get; set; }
        public string MobilePhoneNumber { get; set; }
        public string RegistryNumber { get; set; }
        public string Email { get; set; }
        public virtual ICollection<Claim1> Claim1 { get; set; }
    }
}
