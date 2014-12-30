using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CaseTransitionMap : EntityTypeConfiguration<CaseTransition>
    {
        public CaseTransitionMap()
        {
            // Primary Key
            this.HasKey(t => t.CaseTransitionID);

            // Properties
            this.Property(t => t.UserID)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.Comment)
                .HasMaxLength(8000);

            // Table & Column Mappings
            this.ToTable("CaseTransition");
            this.Property(t => t.CaseTransitionID).HasColumnName("CaseTransitionID");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.PreviousStateID).HasColumnName("PreviousStateID");
            this.Property(t => t.NewStateID).HasColumnName("NewStateID");
            this.Property(t => t.UserID).HasColumnName("UserID");
            this.Property(t => t.TransitionDate).HasColumnName("TransitionDate");
            this.Property(t => t.Comment).HasColumnName("Comment");
            this.Property(t => t.EffectiveDate).HasColumnName("EffectiveDate");

            // Relationships
            this.HasRequired(t => t.AspNetUser)
                .WithMany(t => t.CaseTransitions)
                .HasForeignKey(d => d.UserID);
            this.HasRequired(t => t.Case)
                .WithMany(t => t.CaseTransitions)
                .HasForeignKey(d => d.CaseID);
            this.HasRequired(t => t.State)
                .WithMany(t => t.CaseTransitions)
                .HasForeignKey(d => d.NewStateID);
            this.HasRequired(t => t.State1)
                .WithMany(t => t.CaseTransitions1)
                .HasForeignKey(d => d.PreviousStateID);

        }
    }
}
