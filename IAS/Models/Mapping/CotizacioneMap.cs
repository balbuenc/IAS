using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class CotizacioneMap : EntityTypeConfiguration<Cotizacione>
    {
        public CotizacioneMap()
        {
            // Primary Key
            this.HasKey(t => t.nro_cotizacion);

            // Properties
            this.Property(t => t.nro_cotizacion)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.nro_poliza)
                .HasMaxLength(50);

            this.Property(t => t.nro_suplemento)
                .HasMaxLength(50);

            this.Property(t => t.nro_cuenta)
                .HasMaxLength(20);

            this.Property(t => t.vencimiento_tarjeta)
                .HasMaxLength(20);

            this.Property(t => t.nro_poliza_anterior)
                .HasMaxLength(50);

            this.Property(t => t.nro_recibo)
                .HasMaxLength(30);

            this.Property(t => t.acuse_entregado_a)
                .HasMaxLength(100);

            this.Property(t => t.recibido_por)
                .HasMaxLength(20);

            this.Property(t => t.remesa_entregado_a)
                .HasMaxLength(40);

            this.Property(t => t.id_usuario)
                .HasMaxLength(20);

            this.Property(t => t.nro_cotizacion_aseguradora)
                .HasMaxLength(30);

            this.Property(t => t.id_usuario_gestion1)
                .HasMaxLength(20);

            this.Property(t => t.id_usuario_carga)
                .HasMaxLength(20);

            this.Property(t => t.id_usuario_modificacion)
                .HasMaxLength(20);

            this.Property(t => t.nro_tarjeta)
                .HasMaxLength(20);

            this.Property(t => t.nro_factura)
                .HasMaxLength(50);

            this.Property(t => t.nro_referencia)
                .HasMaxLength(50);

            this.Property(t => t.estado)
                .HasMaxLength(1);

            this.Property(t => t.correo_responsable)
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("Cotizaciones", "exchange");
            this.Property(t => t.nro_cotizacion).HasColumnName("nro_cotizacion");
            this.Property(t => t.fecha_cotizacion).HasColumnName("fecha_cotizacion");
            this.Property(t => t.id_persona_tomador).HasColumnName("id_persona_tomador");
            this.Property(t => t.id_persona_asegurado).HasColumnName("id_persona_asegurado");
            this.Property(t => t.vigencia_desde).HasColumnName("vigencia_desde");
            this.Property(t => t.vigencia_hasta).HasColumnName("vigencia_hasta");
            this.Property(t => t.id_moneda_cotizacion).HasColumnName("id_moneda_cotizacion");
            this.Property(t => t.id_ramo).HasColumnName("id_ramo");
            this.Property(t => t.id_aseguradora).HasColumnName("id_aseguradora");
            this.Property(t => t.id_producto).HasColumnName("id_producto");
            this.Property(t => t.id_tipo_negocio).HasColumnName("id_tipo_negocio");
            this.Property(t => t.id_tipo_propuesta).HasColumnName("id_tipo_propuesta");
            this.Property(t => t.id_tipos_propuestas_especificas).HasColumnName("id_tipos_propuestas_especificas");
            this.Property(t => t.id_tipo_financiamiento).HasColumnName("id_tipo_financiamiento");
            this.Property(t => t.id_forma_pago).HasColumnName("id_forma_pago");
            this.Property(t => t.monto_inicial).HasColumnName("monto_inicial");
            this.Property(t => t.fecha_primer_vencimiento).HasColumnName("fecha_primer_vencimiento");
            this.Property(t => t.prima).HasColumnName("prima");
            this.Property(t => t.premio).HasColumnName("premio");
            this.Property(t => t.descuento).HasColumnName("descuento");
            this.Property(t => t.recargo).HasColumnName("recargo");
            this.Property(t => t.id_empresa).HasColumnName("id_empresa");
            this.Property(t => t.nro_poliza).HasColumnName("nro_poliza");
            this.Property(t => t.nro_suplemento).HasColumnName("nro_suplemento");
            this.Property(t => t.nro_cuenta).HasColumnName("nro_cuenta");
            this.Property(t => t.vencimiento_tarjeta).HasColumnName("vencimiento_tarjeta");
            this.Property(t => t.id_banco).HasColumnName("id_banco");
            this.Property(t => t.id_sucursal_banco).HasColumnName("id_sucursal_banco");
            this.Property(t => t.nro_poliza_anterior).HasColumnName("nro_poliza_anterior");
            this.Property(t => t.id_concesionaria).HasColumnName("id_concesionaria");
            this.Property(t => t.id_vendedor).HasColumnName("id_vendedor");
            this.Property(t => t.id_acreedor).HasColumnName("id_acreedor");
            this.Property(t => t.comision_produccion).HasColumnName("comision_produccion");
            this.Property(t => t.comision_cobranzas).HasColumnName("comision_cobranzas");
            this.Property(t => t.excepcion_comision).HasColumnName("excepcion_comision");
            this.Property(t => t.plazo_prenda).HasColumnName("plazo_prenda");
            this.Property(t => t.id_procesadora).HasColumnName("id_procesadora");
            this.Property(t => t.contraentrega).HasColumnName("contraentrega");
            this.Property(t => t.fecha_cierre).HasColumnName("fecha_cierre");
            this.Property(t => t.fecha_propuesta).HasColumnName("fecha_propuesta");
            this.Property(t => t.tasa_prima).HasColumnName("tasa_prima");
            this.Property(t => t.tasa_premio).HasColumnName("tasa_premio");
            this.Property(t => t.id_sucursal_origen).HasColumnName("id_sucursal_origen");
            this.Property(t => t.capital).HasColumnName("capital");
            this.Property(t => t.tasa_moneda).HasColumnName("tasa_moneda");
            this.Property(t => t.nro_recibo).HasColumnName("nro_recibo");
            this.Property(t => t.id_tipo_tarjeta).HasColumnName("id_tipo_tarjeta");
            this.Property(t => t.factor_tasa_prima).HasColumnName("factor_tasa_prima");
            this.Property(t => t.factor_tasa_premio).HasColumnName("factor_tasa_premio");
            this.Property(t => t.fecha_emision).HasColumnName("fecha_emision");
            this.Property(t => t.id_oficina_aseguradora).HasColumnName("id_oficina_aseguradora");
            this.Property(t => t.Fecha_acuse_poliza).HasColumnName("Fecha_acuse_poliza");
            this.Property(t => t.acuse_entregado_a).HasColumnName("acuse_entregado_a");
            this.Property(t => t.descripcion_entrega_acuse).HasColumnName("descripcion_entrega_acuse");
            this.Property(t => t.fecha_recepcion_poliza).HasColumnName("fecha_recepcion_poliza");
            this.Property(t => t.fecha_recepcion_solicitud).HasColumnName("fecha_recepcion_solicitud");
            this.Property(t => t.fecha_remesa_poliza).HasColumnName("fecha_remesa_poliza");
            this.Property(t => t.fecha_rendicion).HasColumnName("fecha_rendicion");
            this.Property(t => t.recibido_por).HasColumnName("recibido_por");
            this.Property(t => t.remesa_entregado_a).HasColumnName("remesa_entregado_a");
            this.Property(t => t.id_usuario).HasColumnName("id_usuario");
            this.Property(t => t.nro_cotizacion_aseguradora).HasColumnName("nro_cotizacion_aseguradora");
            this.Property(t => t.id_usuario_gestion1).HasColumnName("id_usuario_gestion1");
            this.Property(t => t.id_usuario_carga).HasColumnName("id_usuario_carga");
            this.Property(t => t.id_empresa_carga).HasColumnName("id_empresa_carga");
            this.Property(t => t.id_sucursal_carga).HasColumnName("id_sucursal_carga");
            this.Property(t => t.fecha_carga).HasColumnName("fecha_carga");
            this.Property(t => t.id_usuario_modificacion).HasColumnName("id_usuario_modificacion");
            this.Property(t => t.id_empresa_modificacion).HasColumnName("id_empresa_modificacion");
            this.Property(t => t.id_sucursal_modificacion).HasColumnName("id_sucursal_modificacion");
            this.Property(t => t.fecha_modificacion).HasColumnName("fecha_modificacion");
            this.Property(t => t.nro_tarjeta).HasColumnName("nro_tarjeta");
            this.Property(t => t.nro_factura).HasColumnName("nro_factura");
            this.Property(t => t.nro_referencia).HasColumnName("nro_referencia");
            this.Property(t => t.estado).HasColumnName("estado");
            this.Property(t => t.correo_responsable).HasColumnName("correo_responsable");
            this.Property(t => t.dia_vto).HasColumnName("dia_vto");
        }
    }
}
