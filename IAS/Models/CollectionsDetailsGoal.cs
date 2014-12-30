using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class CollectionsDetailsGoal
    {
        public long CollectionID { get; set; }
        public long CaseID { get; set; }
        public System.DateTime PaymentDueDate { get; set; }
        public int PaymentNumber { get; set; }
        public long ReceiptNumber { get; set; }
        public string RiskName { get; set; }
        public decimal DebtAmount { get; set; }
        public string Case { get; set; }
        public string Currency { get; set; }
        public string UserName { get; set; }
        public string Status { get; set; }
        public Nullable<System.DateTime> CollectedDate { get; set; }
    }
}
