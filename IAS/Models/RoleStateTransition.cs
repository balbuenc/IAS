using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class RoleStateTransition
    {

        public RoleStateTransition()
        {
        }

        [ScaffoldColumn( false )]
        public long RoleStateTransitionID { get; set; }

        public string RoleID { get; set; }
        [ForeignKey( "RoleID" )]
        public virtual ApplicationRole ApplicationRole { get; set; }

        public long WorkflowStateTransitionID { get; set; }
        [ForeignKey( "WorkflowStateTransitionID" )]
        public virtual WorkflowStateTransition WorkflowStateTransition { get; set; }

    }
}
