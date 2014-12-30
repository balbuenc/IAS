using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CaseTransitionResumeMap : EntityTypeConfiguration<CaseTransitionResume>
    {
        public CaseTransitionResumeMap()
        {
            // Primary Key
            this.HasKey(t => new { t.CaseTransitionID, t.FechaGestión, t.FechaVencimiento, t.EstadoNuevo });

            // Properties
            this.Property(t => t.CaseTransitionID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Comentario)
                .HasMaxLength(8000);

            this.Property(t => t.Cliente)
                .HasMaxLength(200);

            this.Property(t => t.Gestor)
                .HasMaxLength(8000);

            this.Property(t => t.EstadoNuevo)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.EstadoAnterior)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("CaseTransitionResume");
            this.Property(t => t.CaseTransitionID).HasColumnName("CaseTransitionID");
            this.Property(t => t.FechaGestión).HasColumnName("FechaGestión");
            this.Property(t => t.Comentario).HasColumnName("Comentario");
            this.Property(t => t.FechaVencimiento).HasColumnName("FechaVencimiento");
            this.Property(t => t.Cliente).HasColumnName("Cliente");
            this.Property(t => t.Gestor).HasColumnName("Gestor");
            this.Property(t => t.CaseID).HasColumnName("CaseID");
            this.Property(t => t.EstadoNuevo).HasColumnName("EstadoNuevo");
            this.Property(t => t.EstadoAnterior).HasColumnName("EstadoAnterior");
        }
    }
}
