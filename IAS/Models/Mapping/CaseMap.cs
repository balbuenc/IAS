using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CaseMap : EntityTypeConfiguration<Case>
    {
        public CaseMap()
        {
            // Primary Key
            this.HasKey(t => t.CaseID);

            // Properties
            this.Property(t => t.Description)
                .HasMaxLength(200);

            this.Property(t => t.UserID)
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("Case");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.WorkflowID).HasColumnName("WorkflowID");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.CasePriorityID).HasColumnName("CasePriorityID");
            this.Property(t => t.StateID).HasColumnName("StateID");
            this.Property(t => t.CreationDate).HasColumnName("CreationDate");
            this.Property(t => t.LastModificationDate).HasColumnName("LastModificationDate");
            this.Property(t => t.EffectiveDate).HasColumnName("EffectiveDate");
            this.Property(t => t.UserID).HasColumnName("UserID");
            this.Property(t => t.PersonID).HasColumnName("PersonID");

            // Relationships
            this.HasOptional(t => t.AspNetUser)
                .WithMany(t => t.Cases)
                .HasForeignKey(d => d.UserID);
            this.HasRequired(t => t.CasePriority)
                .WithMany(t => t.Cases)
                .HasForeignKey(d => d.CasePriorityID);
            this.HasRequired(t => t.State)
                .WithMany(t => t.Cases)
                .HasForeignKey(d => d.StateID);
            this.HasRequired(t => t.Workflow)
                .WithMany(t => t.Cases)
                .HasForeignKey(d => d.WorkflowID);

        }
    }
}
