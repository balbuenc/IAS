using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Claim
    {
        public Claim()
        {
            this.ClaimContactHistories = new List<ClaimContactHistory>();
        }

        public long ClaimID { get; set; }
        public long CaseID { get; set; }
        public long PolicyNumber { get; set; }
        public Nullable<long> ClaimNumber { get; set; }
        public string RiskName { get; set; }
        public long PersonID { get; set; }
        public Nullable<short> LiquidatorID { get; set; }
        public Nullable<short> WorkshopID { get; set; }
        public System.DateTime RegistryDate { get; set; }
        public Nullable<System.DateTime> CloseDate { get; set; }
        public bool Closed { get; set; }
        public System.DateTime ClaimDate { get; set; }
        public short ClaimStatusID { get; set; }
        public string ClaimType { get; set; }
        public string InsuranceExpert { get; set; }
        public Nullable<int> Section { get; set; }
        public virtual Case Case { get; set; }
        public virtual ClaimStatu ClaimStatu { get; set; }
        public virtual Liquidator Liquidator { get; set; }
        public virtual Person Person { get; set; }
        public virtual WorkShop WorkShop { get; set; }
        public virtual ICollection<ClaimContactHistory> ClaimContactHistories { get; set; }
    }
}
