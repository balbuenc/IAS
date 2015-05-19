using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class InsuranceManagerContact
    {
        public int InsuranceManagerID { get; set; }
        public int ContactID { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public string MobilePhoneNumber { get; set; }
        public string Email { get; set; }
        public string ContactRole { get; set; }
        public virtual InsuranceManager InsuranceManager { get; set; }
    }
}
