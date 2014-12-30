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