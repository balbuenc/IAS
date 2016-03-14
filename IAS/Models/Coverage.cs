using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IAS.Models
{
    public partial class Coverage
    {
        public Coverage()
        {

        }

        [ScaffoldColumn(false)]
        public long CoverageID { get; set; }

        [Required, StringLength(50), Display(Name = "Coverage Name")]
        public string CoverageName { get; set; }

        [Required]
        public bool Active { get; set; }

        public override string ToString()
        {
            return CoverageName;
        }
    }
}
