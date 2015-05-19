using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class AppConfig
    {
        public int AppConfigID { get; set; }
        public long CollectionWorkflowID { get; set; }
        public int DefaultCasePriorityID { get; set; }
        public long CollectionInitialStateID { get; set; }
        public long CollectionFinalStateID { get; set; }
        public string DefaultUserID { get; set; }
        public int EffectiveDaysThreshold { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual CasePriority CasePriority { get; set; }
        public virtual State State { get; set; }
        public virtual State State1 { get; set; }
        public virtual Workflow Workflow { get; set; }
    }
}
