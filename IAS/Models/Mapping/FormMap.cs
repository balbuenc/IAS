using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class FormMap : EntityTypeConfiguration<Form>
    {
        public FormMap()
        {
            // Primary Key
            this.HasKey(t => t.FormID);

            // Properties
            this.Property(t => t.FormName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Url)
                .IsRequired()
                .HasMaxLength(250);

            // Table & Column Mappings
            this.ToTable("Form");
            this.Property(t => t.FormID).HasColumnName("FormID");
            this.Property(t => t.FormName).HasColumnName("FormName");
            this.Property(t => t.Url).HasColumnName("Url");
        }
    }
}
