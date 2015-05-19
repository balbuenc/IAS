using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Currency
    {
        public int CurrencyID { get; set; }
        public string Code { get; set; }
        public string Denomination { get; set; }
    }
}
