using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace IAS.Models
{
    public partial class State
    {
       
        public State()
        {
        }

        [ScaffoldColumn( false )]
        public long StateID { get; set; }

        [Required, StringLength( 50 ), Display( Name = "Sate Name" )]
        public string StateName { get; set; }

        [Required]
        public bool Active { get; set; }

        public override string ToString() {
            return StateName;
        }
    }
}
