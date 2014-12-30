using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class UserStateTransitionMap : EntityTypeConfiguration<UserStateTransition>
    {
        public UserStateTransitionMap()
        {
            // Primary Key
            this.HasKey(t => t.UserStateTransitionID);

            // Properties
            this.Property(t => t.UserID)
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("UserStateTransition");
            this.Property(t => t.UserStateTransitionID).HasColumnName("UserStateTransitionID");
            this.Property(t => t.UserID).HasColumnName("UserID");
            this.Property(t => t.WorkflowStateTransitionID).HasColumnName("WorkflowStateTransitionID");

            // Relationships
            this.HasOptional(t => t.AspNetUser)
                .WithMany(t => t.UserStateTransitions)
                .HasForeignKey(d => d.UserID);
            this.HasRequired(t => t.WorkflowStateTransition)
                .WithMany(t => t.UserStateTransitions)
                .HasForeignKey(d => d.WorkflowStateTransitionID);

        }
    }
}
