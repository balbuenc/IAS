using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class v_alarmas_activasMap : EntityTypeConfiguration<v_alarmas_activas>
    {
        public v_alarmas_activasMap()
        {
            // Primary Key
            this.HasKey(t => new { t.AlarmID, t.StateID, t.Interval, t.ApplicationUser_Id, t.CaseID, t.PriorityName });

            // Properties
            this.Property(t => t.AlarmID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.StateID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Interval)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ApplicationUser_Id)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.CaseID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.PriorityName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Description)
                .HasMaxLength(200);

            this.Property(t => t.CreationDate)
                .IsFixedLength()
                .HasMaxLength(10);

            this.Property(t => t.EffectiveDate)
                .IsFixedLength()
                .HasMaxLength(10);

            this.Property(t => t.Message)
                .HasMaxLength(696);

            this.Property(t => t.Editar)
                .HasMaxLength(125);

            this.Property(t => t.UserName)
                .HasMaxLength(8000);

            // Table & Column Mappings
            this.ToTable("v_alarmas_activas");
            this.Property(t => t.AlarmID).HasColumnName("AlarmID");
            this.Property(t => t.StateID).HasColumnName("StateID");
            this.Property(t => t.Interval).HasColumnName("Interval");
            this.Property(t => t.ApplicationUser_Id).HasColumnName("ApplicationUser_Id");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.PriorityName).HasColumnName("PriorityName");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.CreationDate).HasColumnName("CreationDate");
            this.Property(t => t.EffectiveDate).HasColumnName("EffectiveDate");
            this.Property(t => t.OverTimed).HasColumnName("OverTimed");
            this.Property(t => t.Message).HasColumnName("Message");
            this.Property(t => t.Editar).HasColumnName("Editar");
            this.Property(t => t.UserName).HasColumnName("UserName");
        }
    }
}
