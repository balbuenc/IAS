using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CollectionsDetailsStatuMap : EntityTypeConfiguration<CollectionsDetailsStatu>
    {
        public CollectionsDetailsStatuMap()
        {
            // Primary Key
            this.HasKey(t => new { t.CollectionID, t.PaymentDueDate, t.ReceiptNumber, t.RiskName, t.DebtAmount, t.Status });

            // Properties
            this.Property(t => t.CollectionID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ReceiptNumber)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.RiskName)
                .IsRequired()
                .HasMaxLength(8000);

            this.Property(t => t.DebtAmount)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Currency)
                .IsFixedLength()
                .HasMaxLength(3);

            this.Property(t => t.UserName)
                .HasMaxLength(8000);

            this.Property(t => t.Status)
                .IsRequired()
                .HasMaxLength(9);

            this.Property(t => t.Description)
                .HasMaxLength(200);

            this.Property(t => t.StateName)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("CollectionsDetailsStatus");
            this.Property(t => t.CollectionID).HasColumnName("CollectionID");
            this.Property(t => t.PaymentDueDate).HasColumnName("PaymentDueDate");
            this.Property(t => t.ReceiptNumber).HasColumnName("ReceiptNumber");
            this.Property(t => t.RiskName).HasColumnName("RiskName");
            this.Property(t => t.DebtAmount).HasColumnName("DebtAmount");
            this.Property(t => t.Currency).HasColumnName("Currency");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.Status).HasColumnName("Status");
            this.Property(t => t.CollectedDate).HasColumnName("CollectedDate");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.EffectiveDate).HasColumnName("EffectiveDate");
            this.Property(t => t.StateName).HasColumnName("StateName");
            this.Property(t => t.TotalPYG).HasColumnName("TotalPYG");
            this.Property(t => t.TotalUSD).HasColumnName("TotalUSD");
            this.Property(t => t.PendingDays).HasColumnName("PendingDays");
        }
    }
}
