using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class SMSNotificationMap : EntityTypeConfiguration<SMSNotification>
    {
        public SMSNotificationMap()
        {
            // Primary Key
            this.HasKey(t => t.SMSNotificationID);

            // Properties
            this.Property(t => t.MobilePhone)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.Message)
                .IsRequired()
                .HasMaxLength(8000);

            // Table & Column Mappings
            this.ToTable("SMSNotification");
            this.Property(t => t.SMSNotificationID).HasColumnName("SMSNotificationID");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.MobilePhone).HasColumnName("MobilePhone");
            this.Property(t => t.Message).HasColumnName("Message");
            this.Property(t => t.CreationDate).HasColumnName("CreationDate");
            this.Property(t => t.ScheduledDendDate).HasColumnName("ScheduledDendDate");
            this.Property(t => t.SendDate).HasColumnName("SendDate");
            this.Property(t => t.Sent).HasColumnName("Sent");
            this.Property(t => t.CollectionID).HasColumnName("CollectionID");

            // Relationships
            this.HasRequired(t => t.Case)
                .WithMany(t => t.SMSNotifications)
                .HasForeignKey(d => d.CaseID);
            this.HasOptional(t => t.Collection)
                .WithMany(t => t.SMSNotifications)
                .HasForeignKey(d => d.CollectionID);

        }
    }
}
