using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class WorkShopMap : EntityTypeConfiguration<WorkShop>
    {
        public WorkShopMap()
        {
            // Primary Key
            this.HasKey(t => t.WorkshopID);

            // Properties
            this.Property(t => t.Name)
                .HasMaxLength(50);

            this.Property(t => t.Address)
                .HasMaxLength(50);

            this.Property(t => t.PhoneNumber)
                .HasMaxLength(50);

            this.Property(t => t.MobilePhoneNumber)
                .HasMaxLength(50);

            this.Property(t => t.Email)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("WorkShop", "claim");
            this.Property(t => t.WorkshopID).HasColumnName("WorkshopID");
            this.Property(t => t.Name).HasColumnName("Name");
            this.Property(t => t.Address).HasColumnName("Address");
            this.Property(t => t.PhoneNumber).HasColumnName("PhoneNumber");
            this.Property(t => t.MobilePhoneNumber).HasColumnName("MobilePhoneNumber");
            this.Property(t => t.Email).HasColumnName("Email");
        }
    }
}
