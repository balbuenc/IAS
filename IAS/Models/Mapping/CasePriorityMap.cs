using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CasePriorityMap : EntityTypeConfiguration<CasePriority>
    {
        public CasePriorityMap()
        {
            // Primary Key
            this.HasKey(t => t.CasePriorityID);

            // Properties
            this.Property(t => t.PriorityName)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("CasePriority");
            this.Property(t => t.CasePriorityID).HasColumnName("CasePriorityID");
            this.Property(t => t.PriorityName).HasColumnName("PriorityName");
        }
    }
}
