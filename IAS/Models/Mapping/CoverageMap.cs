using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CoverageMap : EntityTypeConfiguration<Coverage>
    {
        public CoverageMap()
        {
            // Primary Key
            this.HasKey(t => t.CoverageID);

            // Properties
            this.Property(t => t.CoverageName)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Coverage");
            this.Property(t => t.CoverageID).HasColumnName("CoverageID");
            this.Property(t => t.CoverageName).HasColumnName("CoverageName");
            this.Property(t => t.Active).HasColumnName("Active");
        }
    }
}
