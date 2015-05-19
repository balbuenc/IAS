using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ContactTypeMap : EntityTypeConfiguration<ContactType>
    {
        public ContactTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.ContactTypeID);

            // Properties
            this.Property(t => t.Description)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ContactType");
            this.Property(t => t.ContactTypeID).HasColumnName("ContactTypeID");
            this.Property(t => t.Description).HasColumnName("Description");
        }
    }
}
