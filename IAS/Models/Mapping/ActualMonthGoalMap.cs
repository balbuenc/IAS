using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ActualMonthGoalMap : EntityTypeConfiguration<ActualMonthGoal>
    {
        public ActualMonthGoalMap()
        {
            // Primary Key
            this.HasKey(t => new { t.PolicyNumber, t.PaymentNumber, t.Collected, t.PaymentDueDate, t.DebtAmount, t.ReceiptNumber, t.RiskName, t.Currency, t.InsuranceManager, t.CollectionID });

            // Properties
            this.Property(t => t.Client)
                .HasMaxLength(200);

            this.Property(t => t.PolicyNumber)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.PaymentNumber)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.PersonType)
                .HasMaxLength(1);

            this.Property(t => t.DebtAmount)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ReceiptNumber)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.RiskName)
                .IsRequired()
                .HasMaxLength(8000);

            this.Property(t => t.Currency)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.InsuranceManager)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.CollectionID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.UserName)
                .HasMaxLength(8000);

            // Table & Column Mappings
            this.ToTable("ActualMonthGoal");
            this.Property(t => t.Client).HasColumnName("Client");
            this.Property(t => t.PolicyNumber).HasColumnName("PolicyNumber");
            this.Property(t => t.PaymentNumber).HasColumnName("PaymentNumber");
            this.Property(t => t.PersonType).HasColumnName("PersonType");
            this.Property(t => t.Collected).HasColumnName("Collected");
            this.Property(t => t.PaymentDueDate).HasColumnName("PaymentDueDate");
            this.Property(t => t.CollectedDate).HasColumnName("CollectedDate");
            this.Property(t => t.DebtAmount).HasColumnName("DebtAmount");
            this.Property(t => t.ReceiptNumber).HasColumnName("ReceiptNumber");
            this.Property(t => t.RiskName).HasColumnName("RiskName");
            this.Property(t => t.Currency).HasColumnName("Currency");
            this.Property(t => t.InsuranceManager).HasColumnName("InsuranceManager");
            this.Property(t => t.CollectionID).HasColumnName("CollectionID");
            this.Property(t => t.UserName).HasColumnName("UserName");
        }
    }
}
