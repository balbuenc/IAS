using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class Alarm
    {

        public Alarm()
        {
            ApplicationUsers = new HashSet<ApplicationUser>();
        }

        [ScaffoldColumn( false )]        
        public long AlarmID { get; set; }

        [Required]
        public long WorkflowID { get; set; }
        public virtual Workflow Workflow { get; set; }

        [Required]
        public long StateID { get; set; }
        public virtual State State { get; set; }

        [Required]
        public int Interval { get; set; }

        [Required]
        public bool Active { get; set; }

        public virtual ICollection<ApplicationUser> ApplicationUsers { get; set; }
        public virtual ICollection<ApplicationRole> Roles { get; set; }


    }
}
