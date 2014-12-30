using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class v_mapfre_join
    {
        public decimal id { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string TIPO_DOCUMENTO { get; set; }
        public string NRO_DOCUMENTO { get; set; }
        public string NOMBRE_DEL_TOMADOR { get; set; }
        public string DOMICILIO { get; set; }
        public string NRO_TELEFONO { get; set; }
        public string NRO_TEL_MOVIL { get; set; }
        public string NRO_POLIZA { get; set; }
        public string COD_EJECUTIVO { get; set; }
        public string NOMBRE_DEL_EJECUTIVO { get; set; }
        public string COD_OFICINA { get; set; }
        public string NOMBRE_DE_LA_OFICINA { get; set; }
        public string NOMBRE_DEL_RIESGO { get; set; }
        public string NRO_RECIBO { get; set; }
        public string NRO_CUOTA { get; set; }
        public string FECHA_EFEC_RECIBO { get; set; }
        public string TIPO_GESTOR { get; set; }
        public string MONEDA { get; set; }
        public string IMPORTE_RECIBO_GS { get; set; }
        public string IMPORTE_RECIBO_USD { get; set; }
        public Nullable<long> id_tipo_documento { get; set; }
        public string descripcion { get; set; }
        public Nullable<long> id_persona { get; set; }
        public string apellido2 { get; set; }
        public string razon_social { get; set; }
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string tipo_persona { get; set; }
    }
}
