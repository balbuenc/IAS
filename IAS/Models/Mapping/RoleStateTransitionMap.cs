using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class RoleStateTransitionMap : EntityTypeConfiguration<RoleStateTransition>
    {
        public RoleStateTransitionMap()
        {
            // Primary Key
            this.HasKey(t => t.RoleStateTransitionID);

            // Properties
            this.Property(t => t.RoleID)
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("RoleStateTransition");
            this.Property(t => t.RoleStateTransitionID).HasColumnName("RoleStateTransitionID");
            this.Property(t => t.RoleID).HasColumnName("RoleID");
            this.Property(t => t.WorkflowStateTransitionID).HasColumnName("WorkflowStateTransitionID");

            // Relationships
            this.HasOptional(t => t.AspNetRole)
                .WithMany(t => t.RoleStateTransitions)
                .HasForeignKey(d => d.RoleID);
            this.HasRequired(t => t.WorkflowStateTransition)
                .WithMany(t => t.RoleStateTransitions)
                .HasForeignKey(d => d.WorkflowStateTransitionID);

        }
    }
}
