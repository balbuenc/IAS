using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class ExpiredGoal
    {
        public string Client { get; set; }
        public long PolicyNumber { get; set; }
        public int PaymentNumber { get; set; }
        public string tipo_persona { get; set; }
        public bool Collected { get; set; }
        public System.DateTime PaymentDueDate { get; set; }
        public Nullable<System.DateTime> CollectedDate { get; set; }
        public decimal DebtAmount { get; set; }
        public long ReceiptNumber { get; set; }
        public string RiskName { get; set; }
        public string Currency { get; set; }
        public string InsuranceManager { get; set; }
        public long CollectionID { get; set; }
        public string UserName { get; set; }
    }
}
