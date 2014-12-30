using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class AllCollectionsDetailMap : EntityTypeConfiguration<AllCollectionsDetail>
    {
        public AllCollectionsDetailMap()
        {
            // Primary Key
            this.HasKey(t => new { t.CollectionID, t.CaseID, t.PaymentDueDate, t.PaymentNumber, t.ReceiptNumber, t.RiskName, t.DebtAmount, t.Status, t.PolicyNumber, t.PersonID });

            // Properties
            this.Property(t => t.CollectionID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CaseID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.PaymentNumber)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ReceiptNumber)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.RiskName)
                .IsRequired()
                .HasMaxLength(8000);

            this.Property(t => t.DebtAmount)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Case)
                .HasMaxLength(200);

            this.Property(t => t.Currency)
                .IsFixedLength()
                .HasMaxLength(3);

            this.Property(t => t.Status)
                .IsRequired()
                .HasMaxLength(9);

            this.Property(t => t.PolicyNumber)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.PersonID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("AllCollectionsDetails");
            this.Property(t => t.CollectionID).HasColumnName("CollectionID");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.PaymentDueDate).HasColumnName("PaymentDueDate");
            this.Property(t => t.PaymentNumber).HasColumnName("PaymentNumber");
            this.Property(t => t.ReceiptNumber).HasColumnName("ReceiptNumber");
            this.Property(t => t.RiskName).HasColumnName("RiskName");
            this.Property(t => t.DebtAmount).HasColumnName("DebtAmount");
            this.Property(t => t.Case).HasColumnName("Case");
            this.Property(t => t.Currency).HasColumnName("Currency");
            this.Property(t => t.Status).HasColumnName("Status");
            this.Property(t => t.CollectedDate).HasColumnName("CollectedDate");
            this.Property(t => t.PolicyNumber).HasColumnName("PolicyNumber");
            this.Property(t => t.PersonID).HasColumnName("PersonID");
        }
    }
}
