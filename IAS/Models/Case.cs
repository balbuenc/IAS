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
    public class Case
    {

        [ScaffoldColumn(true)]
        public long CaseID { get; set; }
         
        [Required, Display(Name = "Workflow")]
        public long WorkflowID { get; set; }
        public virtual Workflow Workflow { get; set; }

        [StringLength(200), Display(Name = "Descripción")]
        public string Description { get; set; }

        [Required, Display(Name = "Prioridad")]
        public int CasePriorityID { get; set; }
        public virtual CasePriority CasePriority { get; set; }

        [Required, Display(Name = "Estado Actual")]
        public long StateID { get; set; }
        [ForeignKey("StateID")]
        public virtual State CurrentState { get; set;}

        [Required, Display(Name = "Fecha de creación")]
        public DateTime CreationDate { get; set; }

        [Required, Display(Name = "Ultima modificación")]
        public DateTime LastModificationDate { get; set; }

        [Required, Display(Name = "Fecha Efectividad")]
        public DateTime EffectiveDate { get; set; }

        [StringLength(128), Display(Name = "Usuario")]
        public String UserID { get; set; }
        [ForeignKey("UserID")]
        public virtual ApplicationUser User { get; set; }

        public virtual ICollection<CaseTransition> StateTransitions { get; set; }

        public virtual ICollection<Collection> Collections { get; set; }

    }

    
}