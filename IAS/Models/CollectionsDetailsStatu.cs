using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class CollectionsDetailsStatu
    {
        public long CollectionID { get; set; }
        public System.DateTime PaymentDueDate { get; set; }
        public long ReceiptNumber { get; set; }
        public string RiskName { get; set; }
        public decimal DebtAmount { get; set; }
        public string Currency { get; set; }
        public string UserName { get; set; }
        public string Status { get; set; }
        public Nullable<System.DateTime> CollectedDate { get; set; }
        public Nullable<long> CaseID { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> EffectiveDate { get; set; }
        public string StateName { get; set; }
        public Nullable<decimal> TotalPYG { get; set; }
        public Nullable<decimal> TotalUSD { get; set; }
        public Nullable<int> PendingDays { get; set; }
    }
}
