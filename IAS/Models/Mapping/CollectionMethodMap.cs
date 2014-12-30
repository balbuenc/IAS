using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CollectionMethodMap : EntityTypeConfiguration<CollectionMethod>
    {
        public CollectionMethodMap()
        {
            // Primary Key
            this.HasKey(t => t.CollectionMethodID);

            // Properties
            this.Property(t => t.Code)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(2);

            this.Property(t => t.CollectionMethodName)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("CollectionMethod");
            this.Property(t => t.CollectionMethodID).HasColumnName("CollectionMethodID");
            this.Property(t => t.Code).HasColumnName("Code");
            this.Property(t => t.CollectionMethodName).HasColumnName("CollectionMethodName");
        }
    }
}
