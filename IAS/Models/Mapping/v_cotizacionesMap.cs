using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class v_cotizacionesMap : EntityTypeConfiguration<v_cotizaciones>
    {
        public v_cotizacionesMap()
        {
            // Primary Key
            this.HasKey(t => t.id_persona);

            // Properties
            this.Property(t => t.id_persona)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.tipo_persona)
                .HasMaxLength(1);

            this.Property(t => t.asegurado)
                .HasMaxLength(202);

            this.Property(t => t.nro_poliza)
                .HasMaxLength(50);

            this.Property(t => t.nro_poliza_anterior)
                .HasMaxLength(50);

            this.Property(t => t.aseguradora)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("v_cotizaciones", "exchange");
            this.Property(t => t.id_persona).HasColumnName("id_persona");
            this.Property(t => t.tipo_persona).HasColumnName("tipo_persona");
            this.Property(t => t.asegurado).HasColumnName("asegurado");
            this.Property(t => t.nro_poliza).HasColumnName("nro_poliza");
            this.Property(t => t.nro_poliza_anterior).HasColumnName("nro_poliza_anterior");
            this.Property(t => t.fecha_recepcion_solicitud).HasColumnName("fecha_recepcion_solicitud");
            this.Property(t => t.Fecha_acuse_poliza).HasColumnName("Fecha_acuse_poliza");
            this.Property(t => t.fecha_cotizacion).HasColumnName("fecha_cotizacion");
            this.Property(t => t.fecha_emision).HasColumnName("fecha_emision");
            this.Property(t => t.aseguradora).HasColumnName("aseguradora");
        }
    }
}
