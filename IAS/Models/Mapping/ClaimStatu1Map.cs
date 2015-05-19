using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ClaimStatu1Map : EntityTypeConfiguration<ClaimStatu1>
    {
        public ClaimStatu1Map()
        {
            // Primary Key
            this.HasKey(t => t.ClaimStatusID);

            // Properties
            this.Property(t => t.Status)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ClaimStatu");
            this.Property(t => t.ClaimStatusID).HasColumnName("ClaimStatusID");
            this.Property(t => t.Status).HasColumnName("Status");
        }
    }
}
