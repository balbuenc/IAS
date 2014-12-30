using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class UserStateTransition
    {

        public UserStateTransition()
        {
        }

        [ScaffoldColumn( false )]
        public long UserStateTransitionID { get; set; }

        public string UserID { get; set; }
        [ForeignKey( "UserID" )] 
        public virtual ApplicationUser ApplicationUser { get; set; }

        public long WorkflowStateTransitionID { get; set; }
        [ForeignKey( "WorkflowStateTransitionID" )]
        public virtual WorkflowStateTransition WorkflowStateTransition { get; set; }

    }
}
