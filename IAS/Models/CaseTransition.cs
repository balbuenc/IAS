using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class CaseTransition
    {
        public long CaseTransitionID { get; set; }
        public long CaseID { get; set; }
        public long PreviousStateID { get; set; }
        public long NewStateID { get; set; }
        public string UserID { get; set; }
        public System.DateTime TransitionDate { get; set; }
        public string Comment { get; set; }
        public System.DateTime EffectiveDate { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Case Case { get; set; }
        public virtual State State { get; set; }
        public virtual State State1 { get; set; }
    }
}
