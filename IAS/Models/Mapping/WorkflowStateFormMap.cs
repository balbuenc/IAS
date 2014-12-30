using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class WorkflowStateFormMap : EntityTypeConfiguration<WorkflowStateForm>
    {
        public WorkflowStateFormMap()
        {
            // Primary Key
            this.HasKey(t => t.WorkflowStateFormID);

            // Properties
            // Table & Column Mappings
            this.ToTable("WorkflowStateForm");
            this.Property(t => t.WorkflowStateFormID).HasColumnName("WorkflowStateFormID");
            this.Property(t => t.WorkflowID).HasColumnName("WorkflowID");
            this.Property(t => t.StateID).HasColumnName("StateID");
            this.Property(t => t.FormID).HasColumnName("FormID");
            this.Property(t => t.ReadOnlyForm).HasColumnName("ReadOnlyForm");

            // Relationships
            this.HasRequired(t => t.Form)
                .WithMany(t => t.WorkflowStateForms)
                .HasForeignKey(d => d.FormID);
            this.HasRequired(t => t.State)
                .WithMany(t => t.WorkflowStateForms)
                .HasForeignKey(d => d.StateID);
            this.HasRequired(t => t.Workflow)
                .WithMany(t => t.WorkflowStateForms)
                .HasForeignKey(d => d.WorkflowID);

        }
    }
}
