using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class WorkShop1
    {
        public WorkShop1()
        {
            this.Claim1 = new List<Claim1>();
        }

        public short WorkshopID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string MobilePhoneNumber { get; set; }
        public string Email { get; set; }
        public virtual ICollection<Claim1> Claim1 { get; set; }
    }
}
