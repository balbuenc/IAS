using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class WorkflowStateTransition
    {

        public WorkflowStateTransition()
        {
        }

        [ScaffoldColumn( false )]
        public long WorkflowStateTransitionID { get; set; }

        public long WorkflowID { get; set; }
        public virtual Workflow Workflow { get; set; }

        public long InitialStateID { get; set; }
        [ForeignKey( "InitialStateID" )] 
        public virtual State InicialState { get; set; }

        public long FinalStateID { get; set; }
        [ForeignKey( "FinalStateID" )] 
        public virtual State FinalState { get; set; }
                
        public virtual ICollection<UserStateTransition> UserStateTransitions { get; set; }

        public bool EditableEffectiveDate { get; set; }
    }
}
