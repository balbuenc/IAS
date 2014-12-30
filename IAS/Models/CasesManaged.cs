using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class CasesManaged
    {
        public long CaseID { get; set; }
        public string Description { get; set; }
        public System.DateTime CreationDate { get; set; }
        public System.DateTime LastModificationDate { get; set; }
        public System.DateTime EffectiveDate { get; set; }
        public string UserName { get; set; }
        public string PriorityName { get; set; }
        public string StateName { get; set; }
        public string Manage { get; set; }
        public string History { get; set; }
    }
}
