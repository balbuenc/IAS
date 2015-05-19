using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class sendmail
    {
        public int id { get; set; }
        public string email { get; set; }
        public string body { get; set; }
        public string user { get; set; }
    }
}
