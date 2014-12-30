using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class v_mapfre_joinMap : EntityTypeConfiguration<v_mapfre_join>
    {
        public v_mapfre_joinMap()
        {
            // Primary Key
            this.HasKey(t => new { t.id, t.TIPO_DOCUMENTO, t.NRO_DOCUMENTO, t.NRO_POLIZA, t.NRO_CUOTA });

            // Properties
            this.Property(t => t.id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

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

            this.Property(t => t.apellido2)
                .HasMaxLength(100);

            this.Property(t => t.razon_social)
                .HasMaxLength(200);

            this.Property(t => t.nombre)
                .HasMaxLength(100);

            this.Property(t => t.apellido1)
                .HasMaxLength(100);

            this.Property(t => t.tipo_persona)
                .HasMaxLength(1);

            // Table & Column Mappings
            this.ToTable("v_mapfre_join");
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
            this.Property(t => t.id_tipo_documento).HasColumnName("id_tipo_documento");
            this.Property(t => t.descripcion).HasColumnName("descripcion");
            this.Property(t => t.id_persona).HasColumnName("id_persona");
            this.Property(t => t.apellido2).HasColumnName("apellido2");
            this.Property(t => t.razon_social).HasColumnName("razon_social");
            this.Property(t => t.nombre).HasColumnName("nombre");
            this.Property(t => t.apellido1).HasColumnName("apellido1");
            this.Property(t => t.tipo_persona).HasColumnName("tipo_persona");
        }
    }
}
