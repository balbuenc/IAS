using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class AspNetRole
    {
        public AspNetRole()
        {
            this.RoleStateTransitions = new List<RoleStateTransition>();
            this.Alarms = new List<Alarm>();
            this.AspNetUsers = new List<AspNetUser>();
        }

        public string Id { get; set; }
        public string Name { get; set; }
        public string Discriminator { get; set; }
        public virtual ICollection<RoleStateTransition> RoleStateTransitions { get; set; }
        public virtual ICollection<Alarm> Alarms { get; set; }
        public virtual ICollection<AspNetUser> AspNetUsers { get; set; }
    }
}
