using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class AlarmMap : EntityTypeConfiguration<Alarm>
    {
        public AlarmMap()
        {
            // Primary Key
            this.HasKey(t => t.AlarmID);

            // Properties
            // Table & Column Mappings
            this.ToTable("Alarm");
            this.Property(t => t.AlarmID).HasColumnName("AlarmID");
            this.Property(t => t.WorkflowID).HasColumnName("WorkflowID");
            this.Property(t => t.StateID).HasColumnName("StateID");
            this.Property(t => t.Interval).HasColumnName("Interval");
            this.Property(t => t.Active).HasColumnName("Active");

            // Relationships
            this.HasMany(t => t.AspNetRoles)
                .WithMany(t => t.Alarms)
                .Map(m =>
                    {
                        m.ToTable("ApplicationRoleAlarm");
                        m.MapLeftKey("Alarm_AlarmID");
                        m.MapRightKey("ApplicationRole_Id");
                    });

            this.HasMany(t => t.AspNetUsers)
                .WithMany(t => t.Alarms)
                .Map(m =>
                    {
                        m.ToTable("ApplicationUserAlarm");
                        m.MapLeftKey("Alarm_AlarmID");
                        m.MapRightKey("ApplicationUser_Id");
                    });

            this.HasRequired(t => t.State)
                .WithMany(t => t.Alarms)
                .HasForeignKey(d => d.StateID);
            this.HasRequired(t => t.Workflow)
                .WithMany(t => t.Alarms)
                .HasForeignKey(d => d.WorkflowID);

        }
    }
}
