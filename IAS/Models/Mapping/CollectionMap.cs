using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CollectionMap : EntityTypeConfiguration<Collection>
    {
        public CollectionMap()
        {
            // Primary Key
            this.HasKey(t => t.CollectionID);

            // Properties
            this.Property(t => t.RiskName)
                .IsRequired()
                .HasMaxLength(8000);

            // Table & Column Mappings
            this.ToTable("Collection");
            this.Property(t => t.CollectionID).HasColumnName("CollectionID");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.PaymentDueDate).HasColumnName("PaymentDueDate");
            this.Property(t => t.PolicyNumber).HasColumnName("PolicyNumber");
            this.Property(t => t.ReceiptNumber).HasColumnName("ReceiptNumber");
            this.Property(t => t.RiskName).HasColumnName("RiskName");
            this.Property(t => t.DebtAmount).HasColumnName("DebtAmount");
            this.Property(t => t.PaymentNumber).HasColumnName("PaymentNumber");
            this.Property(t => t.PersonID).HasColumnName("PersonID");
            this.Property(t => t.Collected).HasColumnName("Collected");
            this.Property(t => t.CollectedDate).HasColumnName("CollectedDate");
            this.Property(t => t.CurrencyID).HasColumnName("CurrencyID");
            this.Property(t => t.CollectionStateID).HasColumnName("CollectionStateID");
            this.Property(t => t.CollectionMethodID).HasColumnName("CollectionMethodID");
            this.Property(t => t.InsuranceManagerID).HasColumnName("InsuranceManagerID");
            this.Property(t => t.MonthGoal).HasColumnName("MonthGoal");
            this.Property(t => t.YearGoal).HasColumnName("YearGoal");

            // Relationships
            this.HasRequired(t => t.Case)
                .WithMany(t => t.Collections)
                .HasForeignKey(d => d.CaseID);
            this.HasRequired(t => t.InsuranceManager)
                .WithMany(t => t.Collections)
                .HasForeignKey(d => d.InsuranceManagerID);
            this.HasRequired(t => t.CollectionMethod)
                .WithMany(t => t.Collections)
                .HasForeignKey(d => d.CollectionMethodID);
            this.HasRequired(t => t.Person)
                .WithMany(t => t.Collections)
                .HasForeignKey(d => d.PersonID);

        }
    }
}
