using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class UserStateTransition
    {
        public long UserStateTransitionID { get; set; }
        public string UserID { get; set; }
        public long WorkflowStateTransitionID { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual WorkflowStateTransition WorkflowStateTransition { get; set; }
    }
}
