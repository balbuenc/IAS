using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class ClientPaymentDay
    {
        public long ClientPaymentDayID { get; set; }
        public int PaymentDay { get; set; }
        public long PersonID { get; set; }
        public virtual persona persona { get; set; }
    }
}
