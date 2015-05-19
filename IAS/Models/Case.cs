using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Case
    {
        public Case()
        {
            this.Claims = new List<Claim>();
            this.Claim1 = new List<Claim1>();
            this.CaseTransitions = new List<CaseTransition>();
            this.Collections = new List<Collection>();
            this.SMSNotifications = new List<SMSNotification>();
        }

        public long CaseID { get; set; }
        public long WorkflowID { get; set; }
        public string Description { get; set; }
        public int CasePriorityID { get; set; }
        public long StateID { get; set; }
        public System.DateTime CreationDate { get; set; }
        public System.DateTime LastModificationDate { get; set; }
        public System.DateTime EffectiveDate { get; set; }
        public string UserID { get; set; }
        public long PersonID { get; set; }
        public virtual ICollection<Claim> Claims { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual ICollection<Claim1> Claim1 { get; set; }
        public virtual CasePriority CasePriority { get; set; }
        public virtual State State { get; set; }
        public virtual Workflow Workflow { get; set; }
        public virtual ICollection<CaseTransition> CaseTransitions { get; set; }
        public virtual ICollection<Collection> Collections { get; set; }
        public virtual ICollection<SMSNotification> SMSNotifications { get; set; }
    }
}
