using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class UserCaseAssigmentMap : EntityTypeConfiguration<UserCaseAssigment>
    {
        public UserCaseAssigmentMap()
        {
            // Primary Key
            this.HasKey(t => new { t.CaseID, t.WorkflowID, t.CasePriorityID, t.StateID, t.CreationDate, t.LastModificationDate, t.EffectiveDate, t.WorkflowName, t.PriorityName });

            // Properties
            this.Property(t => t.CaseID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.WorkflowID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Description)
                .HasMaxLength(200);

            this.Property(t => t.CasePriorityID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.StateID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.UserID)
                .HasMaxLength(128);

            this.Property(t => t.WorkflowName)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.PriorityName)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("UserCaseAssigment");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.WorkflowID).HasColumnName("WorkflowID");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.CasePriorityID).HasColumnName("CasePriorityID");
            this.Property(t => t.StateID).HasColumnName("StateID");
            this.Property(t => t.CreationDate).HasColumnName("CreationDate");
            this.Property(t => t.LastModificationDate).HasColumnName("LastModificationDate");
            this.Property(t => t.EffectiveDate).HasColumnName("EffectiveDate");
            this.Property(t => t.UserID).HasColumnName("UserID");
            this.Property(t => t.WorkflowName).HasColumnName("WorkflowName");
            this.Property(t => t.PriorityName).HasColumnName("PriorityName");
        }
    }
}
