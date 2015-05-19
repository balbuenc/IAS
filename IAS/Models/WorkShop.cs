using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class WorkShop
    {
        public WorkShop()
        {
            this.Claims = new List<Claim>();
        }

        public short WorkshopID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string MobilePhoneNumber { get; set; }
        public string Email { get; set; }
        public virtual ICollection<Claim> Claims { get; set; }
    }
}
