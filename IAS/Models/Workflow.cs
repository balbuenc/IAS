using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace IAS.Models
{
    public partial class Workflow
    {

        public Workflow()
        {
        }

        [ScaffoldColumn( false )]
        public long WorkflowID { get; set; }

        [Required,StringLength(128), Display( Name = "Workflow Name" )]
        public string WorkflowName { get; set; }

        public override string ToString() {
            return WorkflowName;
        }

        public Nullable<long> DefaultFormID { get; set; }
        [ForeignKey("DefaultFormID")]
        public virtual Form DefaultForm { get; set; }

        
    }
}
