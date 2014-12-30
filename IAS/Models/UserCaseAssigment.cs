using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.Models {

    public class UserCaseAssigment {
       
        public long UserCaseAssigmentID { get; set; }        
        public long WorkflowID { get; set; }
        public string WorkflowName { get; set; }
        public string Description { get; set; }
        public int CasePriorityID { get; set; }
        public string CasePriorityDescription { get; set; }
        public long StateID { get; set; }
        public string StateName { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime LastModificationDate { get; set; }
        public DateTime EffectiveDate { get; set; }
        public String UserID { get; set; }
        public String UserName { get; set; }
    }
}