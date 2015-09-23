using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ClaimTypeMap : EntityTypeConfiguration<ClaimType>
    {
        public ClaimTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.ClaimTypeID);

            // Properties
            this.Property(t => t.Description)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ClaimType");
            this.Property(t => t.ClaimTypeID).HasColumnName("ClaimTypeID");
            this.Property(t => t.Description).HasColumnName("Description");
        }
    }
}
