using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class SMSMessageMap : EntityTypeConfiguration<SMSMessage>
    {
        public SMSMessageMap()
        {
            // Primary Key
            this.HasKey(t => t.MessageID);

            // Properties
            this.Property(t => t.Message)
                .IsRequired()
                .HasMaxLength(4000);

            // Table & Column Mappings
            this.ToTable("SMSMessage");
            this.Property(t => t.MessageID).HasColumnName("MessageID");
            this.Property(t => t.LowRange).HasColumnName("LowRange");
            this.Property(t => t.TopRange).HasColumnName("TopRange");
            this.Property(t => t.Message).HasColumnName("Message");
            this.Property(t => t.Status).HasColumnName("Status");
        }
    }
}
