using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class AspNetUserMap : EntityTypeConfiguration<AspNetUser>
    {
        public AspNetUserMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Id)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.UserName)
                .HasMaxLength(8000);

            this.Property(t => t.PasswordHash)
                .HasMaxLength(8000);

            this.Property(t => t.SecurityStamp)
                .HasMaxLength(8000);

            this.Property(t => t.FirstName)
                .HasMaxLength(120);

            this.Property(t => t.LastName)
                .HasMaxLength(120);

            this.Property(t => t.Email)
                .HasMaxLength(120);

            this.Property(t => t.Phone)
                .HasMaxLength(150);

            this.Property(t => t.Discriminator)
                .IsRequired()
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("AspNetUsers");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.PasswordHash).HasColumnName("PasswordHash");
            this.Property(t => t.SecurityStamp).HasColumnName("SecurityStamp");
            this.Property(t => t.FirstName).HasColumnName("FirstName");
            this.Property(t => t.LastName).HasColumnName("LastName");
            this.Property(t => t.Email).HasColumnName("Email");
            this.Property(t => t.Phone).HasColumnName("Phone");
            this.Property(t => t.Discriminator).HasColumnName("Discriminator");

            // Relationships
            this.HasMany(t => t.personas)
                .WithMany(t => t.AspNetUsers)
                .Map(m =>
                    {
                        m.ToTable("PersonApplicationUser");
                        m.MapLeftKey("ApplicationUser_Id");
                        m.MapRightKey("Person_PersonID");
                    });


        }
    }
}
