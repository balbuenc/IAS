using IAS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace IAS.Mappings {
    public class ApplicationRoleMap : EntityTypeConfiguration<ApplicationRole> {
        public ApplicationRoleMap()
        {
            // Table & Column Mappings
            this.ToTable("AspNetRoles");
            this.Property( t => t.Id).HasColumnName( "Id" );
            this.Property( t => t.Name ).HasColumnName( "Name" );
        }
    }
}