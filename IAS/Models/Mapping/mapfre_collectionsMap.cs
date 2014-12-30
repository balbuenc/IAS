using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class mapfre_collectionsMap : EntityTypeConfiguration<mapfre_collections>
    {
        public mapfre_collectionsMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.TIPO_DOCUMENTO)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.NRO_DOCUMENTO)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.NOMBRE_DEL_TOMADOR)
                .HasMaxLength(128);

            this.Property(t => t.DOMICILIO)
                .HasMaxLength(128);

            this.Property(t => t.NRO_TELEFONO)
                .HasMaxLength(128);

            this.Property(t => t.NRO_TEL_MOVIL)
                .HasMaxLength(128);

            this.Property(t => t.NRO_POLIZA)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.COD_EJECUTIVO)
                .HasMaxLength(128);

            this.Property(t => t.NOMBRE_DEL_EJECUTIVO)
                .HasMaxLength(128);

            this.Property(t => t.COD_OFICINA)
                .HasMaxLength(128);

            this.Property(t => t.NOMBRE_DE_LA_OFICINA)
                .HasMaxLength(128);

            this.Property(t => t.NOMBRE_DEL_RIESGO)
                .HasMaxLength(128);

            this.Property(t => t.NRO_RECIBO)
                .HasMaxLength(128);

            this.Property(t => t.NRO_CUOTA)
                .IsRequired()
                .HasMaxLength(128);

            this.Property(t => t.FECHA_EFEC_RECIBO)
                .HasMaxLength(128);

            this.Property(t => t.TIPO_GESTOR)
                .HasMaxLength(128);

            this.Property(t => t.MONEDA)
                .HasMaxLength(128);

            this.Property(t => t.IMPORTE_RECIBO_GS)
                .HasMaxLength(128);

            this.Property(t => t.IMPORTE_RECIBO_USD)
                .HasMaxLength(128);

            // Table & Column Mappings
            this.ToTable("mapfre_collections", "exchange");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.date).HasColumnName("date");
            this.Property(t => t.TIPO_DOCUMENTO).HasColumnName("TIPO_DOCUMENTO");
            this.Property(t => t.NRO_DOCUMENTO).HasColumnName("NRO_DOCUMENTO");
            this.Property(t => t.NOMBRE_DEL_TOMADOR).HasColumnName("NOMBRE_DEL_TOMADOR");
            this.Property(t => t.DOMICILIO).HasColumnName("DOMICILIO");
            this.Property(t => t.NRO_TELEFONO).HasColumnName("NRO_TELEFONO");
            this.Property(t => t.NRO_TEL_MOVIL).HasColumnName("NRO_TEL_MOVIL");
            this.Property(t => t.NRO_POLIZA).HasColumnName("NRO_POLIZA");
            this.Property(t => t.COD_EJECUTIVO).HasColumnName("COD_EJECUTIVO");
            this.Property(t => t.NOMBRE_DEL_EJECUTIVO).HasColumnName("NOMBRE_DEL_EJECUTIVO");
            this.Property(t => t.COD_OFICINA).HasColumnName("COD_OFICINA");
            this.Property(t => t.NOMBRE_DE_LA_OFICINA).HasColumnName("NOMBRE_DE_LA_OFICINA");
            this.Property(t => t.NOMBRE_DEL_RIESGO).HasColumnName("NOMBRE_DEL_RIESGO");
            this.Property(t => t.NRO_RECIBO).HasColumnName("NRO_RECIBO");
            this.Property(t => t.NRO_CUOTA).HasColumnName("NRO_CUOTA");
            this.Property(t => t.FECHA_EFEC_RECIBO).HasColumnName("FECHA_EFEC_RECIBO");
            this.Property(t => t.TIPO_GESTOR).HasColumnName("TIPO_GESTOR");
            this.Property(t => t.MONEDA).HasColumnName("MONEDA");
            this.Property(t => t.IMPORTE_RECIBO_GS).HasColumnName("IMPORTE_RECIBO_GS");
            this.Property(t => t.IMPORTE_RECIBO_USD).HasColumnName("IMPORTE_RECIBO_USD");
        }
    }
}
