using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class caso
    {
        public long id_persona { get; set; }
        public string nombre_del_tomador { get; set; }
        public int cantidad_polizas { get; set; }
        public int moneda { get; set; }
        public long gs { get; set; }
        public decimal usd { get; set; }
        public System.DateTime fecha_mas_antigua { get; set; }
        public int dias_atrazo { get; set; }
        public string prioridad { get; set; }
        public int factor { get; set; }
    }
}
