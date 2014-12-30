using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public class Currency
    {
        public Currency()
        {
        } 

        [ScaffoldColumn(true)]
        public int CurrencyID { get; set; }

        [Required, StringLength( 3 ), Display( Name = "Codigo" ), Column( TypeName = "char" )]
        public string Code { get; set; }

        [Required, StringLength( 50 ), Display( Name = "Denominación" )]
        public string Denomination { get; set; }

        public  override string ToString() {
            return Code;
        }

    }
}