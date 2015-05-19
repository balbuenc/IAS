using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class CollectionMethod
    {
        public CollectionMethod()
        {
            this.Collections = new List<Collection>();
        }

        public int CollectionMethodID { get; set; }
        public string Code { get; set; }
        public string CollectionMethodName { get; set; }
        public virtual ICollection<Collection> Collections { get; set; }
    }
}
