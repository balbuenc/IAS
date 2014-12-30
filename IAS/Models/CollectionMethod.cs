using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public class CollectionMethod
    {
        public CollectionMethod()
        {
        } 

        [ScaffoldColumn(true)]
        public int CollectionMethodID { get; set; }

        [Required, StringLength( 2 ), Display( Name = "Código" ), Column( TypeName = "char" )]
        public string Code { get; set; }

        [Required, StringLength( 50 ), Display( Name = "Método de cobro" )]
        public string CollectionMethodName { get; set; }

        public  override string ToString() {
            return CollectionMethodName;
        }

    }
}