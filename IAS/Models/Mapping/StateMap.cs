using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class StateMap : EntityTypeConfiguration<State>
    {
        public StateMap()
        {
            // Primary Key
            this.HasKey(t => t.StateID);

            // Properties
            this.Property(t => t.StateName)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("State");
            this.Property(t => t.StateID).HasColumnName("StateID");
            this.Property(t => t.StateName).HasColumnName("StateName");
            this.Property(t => t.Active).HasColumnName("Active");
        }
    }
}
