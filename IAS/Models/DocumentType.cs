using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class DocumentType
    {
        public DocumentType()
        {           
        }
        
        public long DocumentTypeID { get; private set; }                
        public string Descripcion{get; private set;}

        public int? LoadedByBusinessID { get; private set; }
        public int? LoadedByBusinessBranchID { get; private set; }
        [StringLength(20)]        
        public string LoadedByUserID { get; private set; }
        public DateTime? ModifiedDate { get; private set; }
    }
}
