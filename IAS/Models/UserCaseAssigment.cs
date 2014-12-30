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