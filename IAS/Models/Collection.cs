//«Copyright 2014 Balcazz HT, http://www.balcazzht.com»

//This file is part of IAS | Insurance Advanced Services.

//IAS is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//IAS is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with Foobar.  If not, see <http://www.gnu.org/licenses/>.


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