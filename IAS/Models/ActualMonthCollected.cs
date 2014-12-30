using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class ActualMonthCollected
    {
        public long CollectionID { get; set; }
        public long CaseID { get; set; }
        public string RiskName { get; set; }
        public decimal DebtAmount { get; set; }
        public System.DateTime PaymentDueDate { get; set; }
        public Nullable<System.DateTime> CollectedDate { get; set; }
        public int CurrencyID { get; set; }
    }
}
