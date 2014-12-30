using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class v_personas_fisicasMap : EntityTypeConfiguration<v_personas_fisicas>
    {
        public v_personas_fisicasMap()
        {
            // Primary Key
            this.HasKey(t => new { t.NRO_POLIZA, t.NRO_CUOTA });

            // Properties
            this.Property(t => t.nombre)
                .HasMaxLength(100);

            this.Property(t => t.apellido1)
                .HasMaxLength(100);

            this.Property(t => t.NOMBRE_DEL_TOMADOR)
                .HasMaxLength(128);

            this.Property(t => t.NRO_POLIZA)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.NOMBRE_DEL_RIESGO)
                .HasMaxLength(128);

            this.Property(t => t.NRO_RECIBO)
                .HasMaxLength(128);

            this.Property(t => t.NRO_CUOTA)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.MONEDA)
                .HasMaxLength(128);

            this.Property(t => t.IMPORTE_RECIBO_GS)
                .HasMaxLength(128);

            this.Property(t => t.IMPORTE_RECIBO_USD)
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("v_personas_fisicas");
            this.Property(t => t.fecha_efec_recibo).HasColumnName("fecha_efec_recibo");
            this.Property(t => t.id_persona).HasColumnName("id_persona");
            this.Property(t => t.nombre).HasColumnName("nombre");
            this.Property(t => t.apellido1).HasColumnName("apellido1");
            this.Property(t => t.NOMBRE_DEL_TOMADOR).HasColumnName("NOMBRE_DEL_TOMADOR");
            this.Property(t => t.NRO_POLIZA).HasColumnName("NRO_POLIZA");
            this.Property(t => t.NOMBRE_DEL_RIESGO).HasColumnName("NOMBRE_DEL_RIESGO");
            this.Property(t => t.NRO_RECIBO).HasColumnName("NRO_RECIBO");
            this.Property(t => t.NRO_CUOTA).HasColumnName("NRO_CUOTA");
            this.Property(t => t.MONEDA).HasColumnName("MONEDA");
            this.Property(t => t.IMPORTE_RECIBO_GS).HasColumnName("IMPORTE_RECIBO_GS");
            this.Property(t => t.IMPORTE_RECIBO_USD).HasColumnName("IMPORTE_RECIBO_USD");
        }
    }
}
