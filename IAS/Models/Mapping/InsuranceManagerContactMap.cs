using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class InsuranceManagerContactMap : EntityTypeConfiguration<InsuranceManagerContact>
    {
        public InsuranceManagerContactMap()
        {
            // Primary Key
            this.HasKey(t => t.ContactID);

            // Properties
            this.Property(t => t.Name)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.LastName)
                .HasMaxLength(50);

            this.Property(t => t.PhoneNumber)
                .HasMaxLength(50);

            this.Property(t => t.MobilePhoneNumber)
                .HasMaxLength(50);

            this.Property(t => t.Email)
                .HasMaxLength(50);

            this.Property(t => t.ContactRole)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("InsuranceManagerContacts");
            this.Property(t => t.InsuranceManagerID).HasColumnName("InsuranceManagerID");
            this.Property(t => t.ContactID).HasColumnName("ContactID");
            this.Property(t => t.Name).HasColumnName("Name");
            this.Property(t => t.LastName).HasColumnName("LastName");
            this.Property(t => t.PhoneNumber).HasColumnName("PhoneNumber");
            this.Property(t => t.MobilePhoneNumber).HasColumnName("MobilePhoneNumber");
            this.Property(t => t.Email).HasColumnName("Email");
            this.Property(t => t.ContactRole).HasColumnName("ContactRole");

            // Relationships
            this.HasRequired(t => t.InsuranceManager)
                .WithMany(t => t.InsuranceManagerContacts)
                .HasForeignKey(d => d.InsuranceManagerID);

        }
    }
}
