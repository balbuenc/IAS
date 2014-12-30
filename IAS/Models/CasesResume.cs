using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class CasesResume
    {
        public long CaseId { get; set; }
        public string Description { get; set; }
        public string PriorityName { get; set; }
        public string UserName { get; set; }
        public string StateName { get; set; }
    }
}
