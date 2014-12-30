using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class InsuranceManagerMap : EntityTypeConfiguration<InsuranceManager>
    {
        public InsuranceManagerMap()
        {
            // Primary Key
            this.HasKey(t => t.InsuranceManagerID);

            // Properties
            this.Property(t => t.InsuranceManager1)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("InsuranceManagers");
            this.Property(t => t.InsuranceManagerID).HasColumnName("InsuranceManagerID");
            this.Property(t => t.InsuranceManager1).HasColumnName("InsuranceManager");
        }
    }
}
