using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class sendmailMap : EntityTypeConfiguration<sendmail>
    {
        public sendmailMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.email)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.user)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("sendmail", "exchange");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.email).HasColumnName("email");
            this.Property(t => t.body).HasColumnName("body");
            this.Property(t => t.user).HasColumnName("user");
        }
    }
}
