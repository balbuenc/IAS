using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ClaimMap : EntityTypeConfiguration<Claim>
    {
        public ClaimMap()
        {
            // Primary Key
            this.HasKey(t => t.ClaimID);

            // Properties
            this.Property(t => t.RiskName)
                .IsRequired()
                .HasMaxLength(8000);

            this.Property(t => t.ClaimType)
                .HasMaxLength(255);

            this.Property(t => t.InsuranceExpert)
                .HasMaxLength(255);

            // Table & Column Mappings
            this.ToTable("Claim", "claim");
            this.Property(t => t.ClaimID).HasColumnName("ClaimID");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.PolicyNumber).HasColumnName("PolicyNumber");
            this.Property(t => t.ClaimNumber).HasColumnName("ClaimNumber");
            this.Property(t => t.RiskName).HasColumnName("RiskName");
            this.Property(t => t.PersonID).HasColumnName("PersonID");
            this.Property(t => t.LiquidatorID).HasColumnName("LiquidatorID");
            this.Property(t => t.WorkshopID).HasColumnName("WorkshopID");
            this.Property(t => t.RegistryDate).HasColumnName("RegistryDate");
            this.Property(t => t.CloseDate).HasColumnName("CloseDate");
            this.Property(t => t.Closed).HasColumnName("Closed");
            this.Property(t => t.ClaimDate).HasColumnName("ClaimDate");
            this.Property(t => t.ClaimStatusID).HasColumnName("ClaimStatusID");
            this.Property(t => t.ClaimType).HasColumnName("ClaimType");
            this.Property(t => t.InsuranceExpert).HasColumnName("InsuranceExpert");
            this.Property(t => t.Section).HasColumnName("Section");

            // Relationships
            this.HasRequired(t => t.Case)
                .WithMany(t => t.Claims)
                .HasForeignKey(d => d.CaseID);
            this.HasRequired(t => t.ClaimStatu)
                .WithMany(t => t.Claims)
                .HasForeignKey(d => d.ClaimStatusID);
            this.HasOptional(t => t.Liquidator)
                .WithMany(t => t.Claims)
                .HasForeignKey(d => d.LiquidatorID);
            this.HasRequired(t => t.persona)
                .WithMany(t => t.Claims)
                .HasForeignKey(d => d.PersonID);
            this.HasOptional(t => t.WorkShop)
                .WithMany(t => t.Claims)
                .HasForeignKey(d => d.WorkshopID);

        }
    }
}
