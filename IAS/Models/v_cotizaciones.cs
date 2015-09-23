using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class v_cotizaciones
    {
        public long id_persona { get; set; }
        public string tipo_persona { get; set; }
        public string asegurado { get; set; }
        public string nro_poliza { get; set; }
        public string nro_poliza_anterior { get; set; }
        public Nullable<System.DateTime> fecha_recepcion_solicitud { get; set; }
        public Nullable<System.DateTime> Fecha_acuse_poliza { get; set; }
        public Nullable<System.DateTime> fecha_cotizacion { get; set; }
        public Nullable<System.DateTime> fecha_emision { get; set; }
        public string aseguradora { get; set; }
    }
}
