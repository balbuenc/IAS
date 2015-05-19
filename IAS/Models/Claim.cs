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

namespace IAS.Models
{
    public partial class Claim
    {
        public Claim()
        {
            this.ClaimContactHistories = new List<ClaimContactHistory>();
        }

        public long ClaimID { get; set; }
        public long CaseID { get; set; }
        public long PolicyNumber { get; set; }
        public Nullable<long> ClaimNumber { get; set; }
        public string RiskName { get; set; }
        public long PersonID { get; set; }
        public Nullable<short> LiquidatorID { get; set; }
        public Nullable<short> WorkshopID { get; set; }
        public System.DateTime RegistryDate { get; set; }
        public Nullable<System.DateTime> CloseDate { get; set; }
        public bool Closed { get; set; }
        public System.DateTime ClaimDate { get; set; }
        public short ClaimStatusID { get; set; }
        public string ClaimType { get; set; }
        public string InsuranceExpert { get; set; }
        public Nullable<int> Section { get; set; }
        public virtual Case Case { get; set; }
        public virtual ClaimStatu ClaimStatu { get; set; }
        public virtual Liquidator Liquidator { get; set; }
        public virtual Person Person { get; set; }
        public virtual WorkShop WorkShop { get; set; }
        public virtual ICollection<ClaimContactHistory> ClaimContactHistories { get; set; }
    }
}
