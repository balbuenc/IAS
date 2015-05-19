using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class WorkflowStateTransition
    {
        public WorkflowStateTransition()
        {
            this.RoleStateTransitions = new List<RoleStateTransition>();
            this.UserStateTransitions = new List<UserStateTransition>();
        }

        public long WorkflowStateTransitionID { get; set; }
        public long WorkflowID { get; set; }
        public long InitialStateID { get; set; }
        public long FinalStateID { get; set; }
        public bool EditableEffectiveDate { get; set; }
        public virtual ICollection<RoleStateTransition> RoleStateTransitions { get; set; }
        public virtual State State { get; set; }
        public virtual State State1 { get; set; }
        public virtual ICollection<UserStateTransition> UserStateTransitions { get; set; }
        public virtual Workflow Workflow { get; set; }
    }
}
