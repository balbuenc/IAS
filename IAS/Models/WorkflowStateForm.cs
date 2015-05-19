using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class WorkflowStateForm
    {
        public long WorkflowStateFormID { get; set; }
        public long WorkflowID { get; set; }
        public long StateID { get; set; }
        public long FormID { get; set; }
        public bool ReadOnlyForm { get; set; }
        public virtual Form Form { get; set; }
        public virtual State State { get; set; }
        public virtual Workflow Workflow { get; set; }
    }
}
