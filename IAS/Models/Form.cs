using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class Form
    {

        public Form()
        {
        }

        [ScaffoldColumn( false )]        
        public long FormID { get; set; }

        [Required, StringLength( 50 ), Display( Name = "Form Name" )]
        public string FormName { get; set; }

        [Required, StringLength( 250 )]
        public string Url { get; set; }

        public override string ToString() {
            return FormName;
        }
        //public long WorkflowID { get; set; }
        //public virtual Workflow Workflow { get; set; }
    }
}
