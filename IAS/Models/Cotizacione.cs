using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Cotizacione
    {
        public int nro_cotizacion { get; set; }
        public Nullable<System.DateTime> fecha_cotizacion { get; set; }
        public Nullable<int> id_persona_tomador { get; set; }
        public Nullable<int> id_persona_asegurado { get; set; }
        public Nullable<System.DateTime> vigencia_desde { get; set; }
        public Nullable<System.DateTime> vigencia_hasta { get; set; }
        public Nullable<int> id_moneda_cotizacion { get; set; }
        public Nullable<int> id_ramo { get; set; }
        public Nullable<int> id_aseguradora { get; set; }
        public Nullable<int> id_producto { get; set; }
        public Nullable<int> id_tipo_negocio { get; set; }
        public Nullable<int> id_tipo_propuesta { get; set; }
        public Nullable<int> id_tipos_propuestas_especificas { get; set; }
        public Nullable<int> id_tipo_financiamiento { get; set; }
        public Nullable<int> id_forma_pago { get; set; }
        public Nullable<decimal> monto_inicial { get; set; }
        public Nullable<System.DateTime> fecha_primer_vencimiento { get; set; }
        public Nullable<decimal> prima { get; set; }
        public Nullable<decimal> premio { get; set; }
        public Nullable<decimal> descuento { get; set; }
        public Nullable<decimal> recargo { get; set; }
        public Nullable<int> id_empresa { get; set; }
        public string nro_poliza { get; set; }
        public string nro_suplemento { get; set; }
        public string nro_cuenta { get; set; }
        public string vencimiento_tarjeta { get; set; }
        public Nullable<int> id_banco { get; set; }
        public Nullable<int> id_sucursal_banco { get; set; }
        public string nro_poliza_anterior { get; set; }
        public Nullable<int> id_concesionaria { get; set; }
        public Nullable<int> id_vendedor { get; set; }
        public Nullable<int> id_acreedor { get; set; }
        public Nullable<decimal> comision_produccion { get; set; }
        public Nullable<decimal> comision_cobranzas { get; set; }
        public Nullable<bool> excepcion_comision { get; set; }
        public Nullable<int> plazo_prenda { get; set; }
        public Nullable<int> id_procesadora { get; set; }
        public Nullable<bool> contraentrega { get; set; }
        public Nullable<System.DateTime> fecha_cierre { get; set; }
        public Nullable<System.DateTime> fecha_propuesta { get; set; }
        public Nullable<decimal> tasa_prima { get; set; }
        public Nullable<decimal> tasa_premio { get; set; }
        public Nullable<int> id_sucursal_origen { get; set; }
        public Nullable<decimal> capital { get; set; }
        public Nullable<decimal> tasa_moneda { get; set; }
        public string nro_recibo { get; set; }
        public Nullable<int> id_tipo_tarjeta { get; set; }
        public Nullable<decimal> factor_tasa_prima { get; set; }
        public Nullable<decimal> factor_tasa_premio { get; set; }
        public Nullable<System.DateTime> fecha_emision { get; set; }
        public Nullable<int> id_oficina_aseguradora { get; set; }
        public Nullable<System.DateTime> Fecha_acuse_poliza { get; set; }
        public string acuse_entregado_a { get; set; }
        public string descripcion_entrega_acuse { get; set; }
        public Nullable<System.DateTime> fecha_recepcion_poliza { get; set; }
        public Nullable<System.DateTime> fecha_recepcion_solicitud { get; set; }
        public Nullable<System.DateTime> fecha_remesa_poliza { get; set; }
        public Nullable<System.DateTime> fecha_rendicion { get; set; }
        public string recibido_por { get; set; }
        public string remesa_entregado_a { get; set; }
        public string id_usuario { get; set; }
        public string nro_cotizacion_aseguradora { get; set; }
        public string id_usuario_gestion1 { get; set; }
        public string id_usuario_carga { get; set; }
        public Nullable<int> id_empresa_carga { get; set; }
        public Nullable<int> id_sucursal_carga { get; set; }
        public Nullable<System.DateTime> fecha_carga { get; set; }
        public string id_usuario_modificacion { get; set; }
        public Nullable<int> id_empresa_modificacion { get; set; }
        public Nullable<int> id_sucursal_modificacion { get; set; }
        public Nullable<System.DateTime> fecha_modificacion { get; set; }
        public string nro_tarjeta { get; set; }
        public string nro_factura { get; set; }
        public string nro_referencia { get; set; }
        public string estado { get; set; }
        public string correo_responsable { get; set; }
        public Nullable<int> dia_vto { get; set; }
    }
}
