using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Alarm
    {
        public Alarm()
        {
            this.AspNetRoles = new List<AspNetRole>();
            this.AspNetUsers = new List<AspNetUser>();
        }

        public long AlarmID { get; set; }
        public long WorkflowID { get; set; }
        public long StateID { get; set; }
        public int Interval { get; set; }
        public bool Active { get; set; }
        public virtual State State { get; set; }
        public virtual Workflow Workflow { get; set; }
        public virtual ICollection<AspNetRole> AspNetRoles { get; set; }
        public virtual ICollection<AspNetUser> AspNetUsers { get; set; }
    }
}
