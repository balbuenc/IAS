using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class WorkflowMap : EntityTypeConfiguration<Workflow>
    {
        public WorkflowMap()
        {
            // Primary Key
            this.HasKey(t => t.WorkflowID);

            // Properties
            this.Property(t => t.WorkflowName)
                .IsRequired()
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("Workflow");
            this.Property(t => t.WorkflowID).HasColumnName("WorkflowID");
            this.Property(t => t.WorkflowName).HasColumnName("WorkflowName");
            this.Property(t => t.DefaultFormID).HasColumnName("DefaultFormID");

            // Relationships
            this.HasOptional(t => t.Form)
                .WithMany(t => t.Workflows)
                .HasForeignKey(d => d.DefaultFormID);

        }
    }
}
