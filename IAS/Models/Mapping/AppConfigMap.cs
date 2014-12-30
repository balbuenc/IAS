using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class AppConfigMap : EntityTypeConfiguration<AppConfig>
    {
        public AppConfigMap()
        {
            // Primary Key
            this.HasKey(t => t.AppConfigID);

            // Properties
            this.Property(t => t.DefaultUserID)
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("AppConfig");
            this.Property(t => t.AppConfigID).HasColumnName("AppConfigID");
            this.Property(t => t.CollectionWorkflowID).HasColumnName("CollectionWorkflowID");
            this.Property(t => t.DefaultCasePriorityID).HasColumnName("DefaultCasePriorityID");
            this.Property(t => t.CollectionInitialStateID).HasColumnName("CollectionInitialStateID");
            this.Property(t => t.CollectionFinalStateID).HasColumnName("CollectionFinalStateID");
            this.Property(t => t.DefaultUserID).HasColumnName("DefaultUserID");
            this.Property(t => t.EffectiveDaysThreshold).HasColumnName("EffectiveDaysThreshold");

            // Relationships
            this.HasOptional(t => t.AspNetUser)
                .WithMany(t => t.AppConfigs)
                .HasForeignKey(d => d.DefaultUserID);
            this.HasRequired(t => t.CasePriority)
                .WithMany(t => t.AppConfigs)
                .HasForeignKey(d => d.DefaultCasePriorityID);
            this.HasRequired(t => t.State)
                .WithMany(t => t.AppConfigs)
                .HasForeignKey(d => d.CollectionFinalStateID);
            this.HasRequired(t => t.State1)
                .WithMany(t => t.AppConfigs1)
                .HasForeignKey(d => d.CollectionInitialStateID);
            this.HasRequired(t => t.Workflow)
                .WithMany(t => t.AppConfigs)
                .HasForeignKey(d => d.CollectionWorkflowID);

        }
    }
}
