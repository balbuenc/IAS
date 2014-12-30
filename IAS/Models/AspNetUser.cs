using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class AspNetUser
    {
        public AspNetUser()
        {
            this.AppConfigs = new List<AppConfig>();
            this.AspNetUserClaims = new List<AspNetUserClaim>();
            this.AspNetUserLogins = new List<AspNetUserLogin>();
            this.Cases = new List<Case>();
            this.CaseTransitions = new List<CaseTransition>();
            this.UserStateTransitions = new List<UserStateTransition>();
            this.Alarms = new List<Alarm>();
            this.AspNetRoles = new List<AspNetRole>();
            this.personas = new List<persona>();
        }

        public string Id { get; set; }
        public string UserName { get; set; }
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Discriminator { get; set; }
        public virtual ICollection<AppConfig> AppConfigs { get; set; }
        public virtual ICollection<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual ICollection<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual ICollection<Case> Cases { get; set; }
        public virtual ICollection<CaseTransition> CaseTransitions { get; set; }
        public virtual ICollection<UserStateTransition> UserStateTransitions { get; set; }
        public virtual ICollection<Alarm> Alarms { get; set; }
        public virtual ICollection<AspNetRole> AspNetRoles { get; set; }
        public virtual ICollection<persona> personas { get; set; }
    }
}
