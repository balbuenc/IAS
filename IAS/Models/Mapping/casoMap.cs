using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class casoMap : EntityTypeConfiguration<caso>
    {
        public casoMap()
        {
            // Primary Key
            this.HasKey(t => new { t.id_persona, t.moneda });

            // Properties
            this.Property(t => t.id_persona)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.nombre_del_tomador)
                .IsRequired()
                .HasMaxLength(256);

            this.Property(t => t.moneda)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.prioridad)
                .IsRequired()
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("casos", "exchange");
            this.Property(t => t.id_persona).HasColumnName("id_persona");
            this.Property(t => t.nombre_del_tomador).HasColumnName("nombre_del_tomador");
            this.Property(t => t.cantidad_polizas).HasColumnName("cantidad_polizas");
            this.Property(t => t.moneda).HasColumnName("moneda");
            this.Property(t => t.gs).HasColumnName("gs");
            this.Property(t => t.usd).HasColumnName("usd");
            this.Property(t => t.fecha_mas_antigua).HasColumnName("fecha_mas_antigua");
            this.Property(t => t.dias_atrazo).HasColumnName("dias_atrazo");
            this.Property(t => t.prioridad).HasColumnName("prioridad");
            this.Property(t => t.factor).HasColumnName("factor");
        }
    }
}
