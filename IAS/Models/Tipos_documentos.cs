using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class Tipos_documentos
    {
        public long id_tipo_documento { get; set; }
        public string descripcion { get; set; }
        public Nullable<int> id_empresa_carga { get; set; }
        public Nullable<int> id_sucursal_carga { get; set; }
        public string id_usuario_carga { get; set; }
        public Nullable<System.DateTime> fecha_ultima_modificacion { get; set; }
    }
}
