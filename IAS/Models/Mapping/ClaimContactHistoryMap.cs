using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class ClaimContactHistoryMap : EntityTypeConfiguration<ClaimContactHistory>
    {
        public ClaimContactHistoryMap()
        {
            // Primary Key
            this.HasKey(t => t.ContactID);

            // Properties
            this.Property(t => t.Message)
                .IsRequired()
                .HasMaxLength(2000);

            // Table & Column Mappings
            this.ToTable("ClaimContactHistory", "claim");
            this.Property(t => t.ContactID).HasColumnName("ContactID");
            this.Property(t => t.ClaimID).HasColumnName("ClaimID");
            this.Property(t => t.ContactTypeID).HasColumnName("ContactTypeID");
            this.Property(t => t.ContactDestinationID).HasColumnName("ContactDestinationID");
            this.Property(t => t.ContactDate).HasColumnName("ContactDate");
            this.Property(t => t.Message).HasColumnName("Message");

            // Relationships
            this.HasRequired(t => t.Claim)
                .WithMany(t => t.ClaimContactHistories)
                .HasForeignKey(d => d.ClaimID);
            this.HasRequired(t => t.ContactDestination)
                .WithMany(t => t.ClaimContactHistories)
                .HasForeignKey(d => d.ContactDestinationID);
            this.HasRequired(t => t.ContactType)
                .WithMany(t => t.ClaimContactHistories)
                .HasForeignKey(d => d.ContactTypeID);

        }
    }
}
