using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ClaimStatuMap : EntityTypeConfiguration<ClaimStatu>
    {
        public ClaimStatuMap()
        {
            // Primary Key
            this.HasKey(t => t.ClaimStatusID);

            // Properties
            this.Property(t => t.ClaimStatus)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ClaimStatus", "claim");
            this.Property(t => t.ClaimStatusID).HasColumnName("ClaimStatusID");
            this.Property(t => t.ClaimStatus).HasColumnName("ClaimStatus");
        }
    }
}
