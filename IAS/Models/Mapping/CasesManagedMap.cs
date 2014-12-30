using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CasesManagedMap : EntityTypeConfiguration<CasesManaged>
    {
        public CasesManagedMap()
        {
            // Primary Key
            this.HasKey(t => new { t.CaseID, t.CreationDate, t.LastModificationDate, t.EffectiveDate, t.PriorityName, t.StateName });

            // Properties
            this.Property(t => t.CaseID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Description)
                .HasMaxLength(200);

            this.Property(t => t.UserName)
                .HasMaxLength(8000);

            this.Property(t => t.PriorityName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.StateName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Manage)
                .HasMaxLength(203);

            this.Property(t => t.History)
                .HasMaxLength(245);

            // Table & Column Mappings
            this.ToTable("CasesManaged");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.CreationDate).HasColumnName("CreationDate");
            this.Property(t => t.LastModificationDate).HasColumnName("LastModificationDate");
            this.Property(t => t.EffectiveDate).HasColumnName("EffectiveDate");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.PriorityName).HasColumnName("PriorityName");
            this.Property(t => t.StateName).HasColumnName("StateName");
            this.Property(t => t.Manage).HasColumnName("Manage");
            this.Property(t => t.History).HasColumnName("History");
        }
    }
}
