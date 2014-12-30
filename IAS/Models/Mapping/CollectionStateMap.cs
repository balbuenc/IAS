using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CollectionStateMap : EntityTypeConfiguration<CollectionState>
    {
        public CollectionStateMap()
        {
            // Primary Key
            this.HasKey(t => t.CollectionStateID);

            // Properties
            this.Property(t => t.CollectionStateName)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("CollectionState");
            this.Property(t => t.CollectionStateID).HasColumnName("CollectionStateID");
            this.Property(t => t.CollectionStateName).HasColumnName("CollectionStateName");
        }
    }
}
