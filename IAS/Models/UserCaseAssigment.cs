using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class UserCaseAssigment
    {
        public long CaseID { get; set; }
        public long WorkflowID { get; set; }
        public string Description { get; set; }
        public int CasePriorityID { get; set; }
        public long StateID { get; set; }
        public System.DateTime CreationDate { get; set; }
        public System.DateTime LastModificationDate { get; set; }
        public System.DateTime EffectiveDate { get; set; }
        public string UserID { get; set; }
        public string WorkflowName { get; set; }
        public string PriorityName { get; set; }
    }
}
