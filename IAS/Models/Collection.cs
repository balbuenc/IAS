using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public class Collection {

        [ScaffoldColumn( true )]
        public long CollectionID { get; set; }

        [Required, Display( Name = "Caso" )]
        public long CaseID { get; set; }
        [ForeignKey( "CaseID" )]
        public virtual Case Case { get; set; }

        [Required, Display( Name = "Fecha de Vencimiento" )]
        public DateTime PaymentDueDate { get; set; }

        [Required, Display( Name = "Numero de Poliza" )]
        public long PolicyNumber { get; set; }

        [Required, Display( Name = "Numero de recibo" )]
        public long ReceiptNumber { get; set; }

        [Required, Display( Name = "Denominacion del Riesgo" )]
        public String RiskName { get; set; }

        [Required, Display( Name = "Importe" )]
        [DisplayFormat( DataFormatString = "{0:C}" )]
        public decimal DebtAmount { get; set; }

        [Required, Display( Name = "Nro de cuota" )]
        public int PaymentNumber { get; set; }

        [Required]
        public bool Collected { get; set; }

        [Display( Name = "Fecha del cobro" )]
        public DateTime? CollectedDate { get; set; }

        [Required]
        public long PersonID { get; set; }
        [ForeignKey( "PersonID" )]
        public virtual Person Person {
            get;
            set;

        }

        [Required]
        public int CurrencyID { get; set; }
        [ForeignKey( "CurrencyID" )]
        public virtual Currency Money {
            get;
            set;
        }

        [Required]
        public int CollectionStateID { get; set; }
        [ForeignKey( "CollectionStateID" )]
        public virtual CollectionState CollectionState {
            get;
            set;
        }

        [Required]
        public int CollectionMethodID { get; set; }
        [ForeignKey( "CollectionMethodID" )]
        public virtual CollectionMethod CollectionMethod {
            get;
            set;
        }
    }

}