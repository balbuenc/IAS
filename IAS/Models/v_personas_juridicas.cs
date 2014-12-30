using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class v_personas_juridicas
    {
        public Nullable<System.DateTime> fecha_efec_recibo { get; set; }
        public Nullable<long> id_persona { get; set; }
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string razon_social { get; set; }
        public string NOMBRE_DEL_TOMADOR { get; set; }
        public string NRO_POLIZA { get; set; }
        public string NOMBRE_DEL_RIESGO { get; set; }
        public string NRO_RECIBO { get; set; }
        public string NRO_CUOTA { get; set; }
        public string MONEDA { get; set; }
        public string IMPORTE_RECIBO_GS { get; set; }
        public string IMPORTE_RECIBO_USD { get; set; }
    }
}
