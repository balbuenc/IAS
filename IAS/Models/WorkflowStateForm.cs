using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace IAS.Models
{
    public partial class WorkflowStateForm
    {
        public WorkflowStateForm()
        {
        }

        [ScaffoldColumn( false )]
        public long WorkflowStateFormID { get; set; }

        public long WorkflowID { get; set; }
        public virtual Workflow Workflow { get; set; }

        public long StateID { get; set; }
        [ForeignKey( "StateID" )] 
        public virtual State State { get; set; }

        public long FormID { get; set; }
        [ForeignKey( "FormID" )] 
        public virtual Form Form { get; set; }

        public bool ReadOnlyForm { get; set; }

    }
}