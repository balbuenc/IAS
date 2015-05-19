using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class RoleStateTransition
    {
        public long RoleStateTransitionID { get; set; }
        public string RoleID { get; set; }
        public long WorkflowStateTransitionID { get; set; }
        public virtual AspNetRole AspNetRole { get; set; }
        public virtual WorkflowStateTransition WorkflowStateTransition { get; set; }
    }
}
