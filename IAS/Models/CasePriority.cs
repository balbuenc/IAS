using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public class CasePriority
    {

        public CasePriority()
        {
        } 

        [ScaffoldColumn(true)]
        public int CasePriorityID { get; set; }

        [Required, StringLength(50), Display(Name = "Prioridad")]
        public string PriorityName { get; set; }

        public  override string ToString() {
            return PriorityName;
        }

    }
}