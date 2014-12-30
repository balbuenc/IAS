using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class LiquidatorMap : EntityTypeConfiguration<Liquidator>
    {
        public LiquidatorMap()
        {
            // Primary Key
            this.HasKey(t => t.LiquidatorID);

            // Properties
            this.Property(t => t.Name)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.MobilePhoneNumber)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.RegistryNumber)
                .HasMaxLength(50);

            this.Property(t => t.Email)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Liquidator", "claim");
            this.Property(t => t.LiquidatorID).HasColumnName("LiquidatorID");
            this.Property(t => t.Name).HasColumnName("Name");
            this.Property(t => t.MobilePhoneNumber).HasColumnName("MobilePhoneNumber");
            this.Property(t => t.RegistryNumber).HasColumnName("RegistryNumber");
            this.Property(t => t.Email).HasColumnName("Email");
        }
    }
}
