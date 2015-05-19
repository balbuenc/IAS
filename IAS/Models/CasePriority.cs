using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class CasePriority
    {
        public CasePriority()
        {
            this.AppConfigs = new List<AppConfig>();
            this.Cases = new List<Case>();
        }

        public int CasePriorityID { get; set; }
        public string PriorityName { get; set; }
        public virtual ICollection<AppConfig> AppConfigs { get; set; }
        public virtual ICollection<Case> Cases { get; set; }
    }
}
