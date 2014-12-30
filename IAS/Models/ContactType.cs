using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class ContactType
    {
        public ContactType()
        {
            this.ClaimContactHistories = new List<ClaimContactHistory>();
        }

        public short ContactTypeID { get; set; }
        public string Description { get; set; }
        public virtual ICollection<ClaimContactHistory> ClaimContactHistories { get; set; }
    }
}
