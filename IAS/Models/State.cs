using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class State
    {
        public State()
        {
            this.Alarms = new List<Alarm>();
            this.AppConfigs = new List<AppConfig>();
            this.AppConfigs1 = new List<AppConfig>();
            this.Cases = new List<Case>();
            this.CaseTransitions = new List<CaseTransition>();
            this.CaseTransitions1 = new List<CaseTransition>();
            this.WorkflowStateForms = new List<WorkflowStateForm>();
            this.WorkflowStateTransitions = new List<WorkflowStateTransition>();
            this.WorkflowStateTransitions1 = new List<WorkflowStateTransition>();
        }

        public long StateID { get; set; }
        public string StateName { get; set; }
        public bool Active { get; set; }
        public virtual ICollection<Alarm> Alarms { get; set; }
        public virtual ICollection<AppConfig> AppConfigs { get; set; }
        public virtual ICollection<AppConfig> AppConfigs1 { get; set; }
        public virtual ICollection<Case> Cases { get; set; }
        public virtual ICollection<CaseTransition> CaseTransitions { get; set; }
        public virtual ICollection<CaseTransition> CaseTransitions1 { get; set; }
        public virtual ICollection<WorkflowStateForm> WorkflowStateForms { get; set; }
        public virtual ICollection<WorkflowStateTransition> WorkflowStateTransitions { get; set; }
        public virtual ICollection<WorkflowStateTransition> WorkflowStateTransitions1 { get; set; }
    }
}
