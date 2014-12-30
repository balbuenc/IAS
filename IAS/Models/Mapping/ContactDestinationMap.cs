using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ContactDestinationMap : EntityTypeConfiguration<ContactDestination>
    {
        public ContactDestinationMap()
        {
            // Primary Key
            this.HasKey(t => t.ContactDestinationID);

            // Properties
            this.Property(t => t.ContactDestination1)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ContactDestination");
            this.Property(t => t.ContactDestinationID).HasColumnName("ContactDestinationID");
            this.Property(t => t.ContactDestination1).HasColumnName("ContactDestination");
            this.Property(t => t.Active).HasColumnName("Active");
        }
    }
}
