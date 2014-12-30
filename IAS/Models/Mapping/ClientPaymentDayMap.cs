using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ClientPaymentDayMap : EntityTypeConfiguration<ClientPaymentDay>
    {
        public ClientPaymentDayMap()
        {
            // Primary Key
            this.HasKey(t => t.ClientPaymentDayID);

            // Properties
            // Table & Column Mappings
            this.ToTable("ClientPaymentDay");
            this.Property(t => t.ClientPaymentDayID).HasColumnName("ClientPaymentDayID");
            this.Property(t => t.PaymentDay).HasColumnName("PaymentDay");
            this.Property(t => t.PersonID).HasColumnName("PersonID");

            // Relationships
            this.HasRequired(t => t.persona)
                .WithMany(t => t.ClientPaymentDays)
                .HasForeignKey(d => d.PersonID);

        }
    }
}
