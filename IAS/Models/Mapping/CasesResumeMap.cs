using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CasesResumeMap : EntityTypeConfiguration<CasesResume>
    {
        public CasesResumeMap()
        {
            // Primary Key
            this.HasKey(t => new { t.CaseId, t.PriorityName, t.StateName });

            // Properties
            this.Property(t => t.CaseId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Description)
                .HasMaxLength(200);

            this.Property(t => t.PriorityName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.UserName)
                .HasMaxLength(8000);

            this.Property(t => t.StateName)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("CasesResume");
            this.Property(t => t.CaseId).HasColumnName("CaseId");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.PriorityName).HasColumnName("PriorityName");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.StateName).HasColumnName("StateName");
        }
    }
}
