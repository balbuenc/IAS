using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Workflow
    {
        public Workflow()
        {
            this.Alarms = new List<Alarm>();
            this.AppConfigs = new List<AppConfig>();
            this.Cases = new List<Case>();
            this.WorkflowStateForms = new List<WorkflowStateForm>();
            this.WorkflowStateTransitions = new List<WorkflowStateTransition>();
        }

        public long WorkflowID { get; set; }
        public string WorkflowName { get; set; }
        public Nullable<long> DefaultFormID { get; set; }
        public virtual ICollection<Alarm> Alarms { get; set; }
        public virtual ICollection<AppConfig> AppConfigs { get; set; }
        public virtual ICollection<Case> Cases { get; set; }
        public virtual Form Form { get; set; }
        public virtual ICollection<WorkflowStateForm> WorkflowStateForms { get; set; }
        public virtual ICollection<WorkflowStateTransition> WorkflowStateTransitions { get; set; }
    }
}
