using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;


namespace IAS.Models
{
    public class SMSNotification
    {
        [ScaffoldColumn(true)]
        public long SMSNotificationID { get; set; }

        [Required, Display(Name = "Caso")]
        public long CaseID { get; set; }
        [ForeignKey("CaseID")]
        public virtual Case Case { get; set; }

        [Required, StringLength(30)]
        public string MobilePhone { get; set; }

        [Required]
        public string Message { get; set; }

        [Required]
        public DateTime CreationDate { get; set; }

        [Required]
        public DateTime ScheduledDendDate { get; set; }

        public DateTime SendDate { get; set; }

        [Required]
        public Boolean Sent { get; set; }

    }
}