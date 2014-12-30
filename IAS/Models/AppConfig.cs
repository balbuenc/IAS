using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class AppConfig
    {

        public AppConfig()
        {
        }

        [ScaffoldColumn( false )]
        public int AppConfigID { get; set; }

        public long CollectionWorkflowID { get; set; }
        [ForeignKey( "CollectionWorkflowID" )]
        public Workflow CollectionWorkflow { get; set; }

        public int DefaultCasePriorityID { get; set; }
        [ForeignKey( "DefaultCasePriorityID" )]
        public CasePriority DefaultCasePriority { get; set; }

        public long CollectionInitialStateID { get; set; }
        [ForeignKey( "CollectionInitialStateID" )]
        public State CollectionInitialState { get; set; }

        public long CollectionFinalStateID { get; set; }
        [ForeignKey( "CollectionFinalStateID" )]
        public State CollectionFinalState { get; set; }

        public string DefaultUserID { get; set; }
        [ForeignKey( "DefaultUserID" )]
        public ApplicationUser DefaultUser { get; set; }

        public int EffectiveDaysThreshold { get; set; }

    }
}
