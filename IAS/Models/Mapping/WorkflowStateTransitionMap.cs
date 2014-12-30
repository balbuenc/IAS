using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class WorkflowStateTransitionMap : EntityTypeConfiguration<WorkflowStateTransition>
    {
        public WorkflowStateTransitionMap()
        {
            // Primary Key
            this.HasKey(t => t.WorkflowStateTransitionID);

            // Properties
            // Table & Column Mappings
            this.ToTable("WorkflowStateTransition");
            this.Property(t => t.WorkflowStateTransitionID).HasColumnName("WorkflowStateTransitionID");
            this.Property(t => t.WorkflowID).HasColumnName("WorkflowID");
            this.Property(t => t.InitialStateID).HasColumnName("InitialStateID");
            this.Property(t => t.FinalStateID).HasColumnName("FinalStateID");
            this.Property(t => t.EditableEffectiveDate).HasColumnName("EditableEffectiveDate");

            // Relationships
            this.HasRequired(t => t.State)
                .WithMany(t => t.WorkflowStateTransitions)
                .HasForeignKey(d => d.FinalStateID);
            this.HasRequired(t => t.State1)
                .WithMany(t => t.WorkflowStateTransitions1)
                .HasForeignKey(d => d.InitialStateID);
            this.HasRequired(t => t.Workflow)
                .WithMany(t => t.WorkflowStateTransitions)
                .HasForeignKey(d => d.WorkflowID);

        }
    }
}
