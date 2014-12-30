using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public class ClientPaymentDay
    {
        public ClientPaymentDay()
        {
        } 

        [ScaffoldColumn(true)]
        public long ClientPaymentDayID { get; set; }

        [Display( Name = "Dia de pago" )]
        public int PaymentDay { get; set; }

        [Required]
        public long PersonID { get; set; }
        [ForeignKey( "PersonID" )]
        public virtual Person Person {
            get;
            set;

        }

        public  override string ToString() {
            return PaymentDay.ToString();
        }

    }
}