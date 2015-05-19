using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Form
    {
        public Form()
        {
            this.Workflows = new List<Workflow>();
            this.WorkflowStateForms = new List<WorkflowStateForm>();
        }

        public long FormID { get; set; }
        public string FormName { get; set; }
        public string Url { get; set; }
        public virtual ICollection<Workflow> Workflows { get; set; }
        public virtual ICollection<WorkflowStateForm> WorkflowStateForms { get; set; }
    }
}
