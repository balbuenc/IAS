using IAS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace IAS.Mappings {
    public class UserCaseAssigmentMap : EntityTypeConfiguration<UserCaseAssigment> {
        public UserCaseAssigmentMap()
        {
            // Table & Column Mappings
            this.ToTable( "UserCaseAssigment" );
            HasKey( u => u.UserCaseAssigmentID );
            this.Property( t => t.UserCaseAssigmentID ).HasColumnName( "CaseID" );

        }
    }
}