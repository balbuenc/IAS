using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ActualMonthCollectedMap : EntityTypeConfiguration<ActualMonthCollected>
    {
        public ActualMonthCollectedMap()
        {
            // Primary Key
            this.HasKey(t => new { t.CollectionID, t.CaseID, t.RiskName, t.DebtAmount, t.PaymentDueDate, t.CurrencyID });

            // Properties
            this.Property(t => t.CollectionID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.Property(t => t.CaseID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.RiskName)
                .IsRequired()
                .HasMaxLength(8000);

            this.Property(t => t.DebtAmount)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CurrencyID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("ActualMonthCollected");
            this.Property(t => t.CollectionID).HasColumnName("CollectionID");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.RiskName).HasColumnName("RiskName");
            this.Property(t => t.DebtAmount).HasColumnName("DebtAmount");
            this.Property(t => t.PaymentDueDate).HasColumnName("PaymentDueDate");
            this.Property(t => t.CollectedDate).HasColumnName("CollectedDate");
            this.Property(t => t.CurrencyID).HasColumnName("CurrencyID");
        }
    }
}
