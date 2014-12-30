using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public class CaseTransition
    {

        [ScaffoldColumn(true)]
        public long CaseTransitionID { get; set; }

        [Required]
        public long CaseID { get; set; }
        public virtual Case Case { get; set; } 

        public long PreviousStateID { get; set; }
        [ForeignKey("PreviousStateID")]
        public virtual State PreviousState { get; set; }

        [Required]
        public long NewStateID { get; set; }
        [ForeignKey("NewStateID")]
        public virtual State NewState { set; get; }

        [Required]
        public string UserID { get; set; }
        [ForeignKey("UserID")]
        public virtual ApplicationUser User { get; set; }

        [Required]
        public DateTime TransitionDate { get; set; }

        public DateTime EffectiveDate { get; set; }

        public String Comment { get; set; }
    }
}