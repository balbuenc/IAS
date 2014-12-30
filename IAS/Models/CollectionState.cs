using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public class CollectionState
    {
        public CollectionState()
        {
        } 

        [ScaffoldColumn(true)]
        public int CollectionStateID { get; set; }

        [Required, StringLength( 50 ), Display( Name = "Estado de cobranza" )]
        public string CollectionStateName { get; set; }

        public  override string ToString() {
            return CollectionStateName;
        }

    }
}