using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class InsuranceManager
    {
        public InsuranceManager()
        {
            this.Collections = new List<Collection>();
        }

        public int InsuranceManagerID { get; set; }
        public string InsuranceManager1 { get; set; }
        public virtual ICollection<Collection> Collections { get; set; }
    }
}
