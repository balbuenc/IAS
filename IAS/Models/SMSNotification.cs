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