using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class CaseTransitionResume
    {
        public long CaseTransitionID { get; set; }
        public System.DateTime FechaGestión { get; set; }
        public string Comentario { get; set; }
        public System.DateTime FechaVencimiento { get; set; }
        public string Cliente { get; set; }
        public string Gestor { get; set; }
        public Nullable<long> CaseID { get; set; }
        public string EstadoNuevo { get; set; }
        public string EstadoAnterior { get; set; }
    }
}
