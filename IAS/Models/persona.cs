using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class persona
    {
        public persona()
        {
            this.Claims = new List<Claim>();
            this.ClientPaymentDays = new List<ClientPaymentDay>();
            this.Collections = new List<Collection>();
            this.AspNetUsers = new List<AspNetUser>();
        }

        public long id_persona { get; set; }
        public long id_tipo_documento { get; set; }
        public string numero_documento { get; set; }
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string apellido2 { get; set; }
        public string razon_social { get; set; }
        public Nullable<System.DateTime> fecha_nacimiento { get; set; }
        public string sexo { get; set; }
        public string direccion_domicilio1 { get; set; }
        public string telefono_domicilio1 { get; set; }
        public string telefono_domicilio2 { get; set; }
        public string telefono_celular { get; set; }
        public string email_particular { get; set; }
        public string direccion_laboral1 { get; set; }
        public string telefono_laboral1 { get; set; }
        public string email_laboral { get; set; }
        public string tipo_persona { get; set; }
        public string observacion { get; set; }
        public Nullable<int> id_tipo_documento2 { get; set; }
        public string numero_documento2 { get; set; }
        public Nullable<int> id_pais_nacionalidad { get; set; }
        public Nullable<int> id_estado_civil { get; set; }
        public string direccion_domicilio2 { get; set; }
        public string direccion_domicilio3 { get; set; }
        public string numero_casa_domicilio { get; set; }
        public string piso_domicilio { get; set; }
        public string numero_departamento_domicilio { get; set; }
        public Nullable<int> id_pais_domicilio { get; set; }
        public Nullable<int> id_departamento_domicilio { get; set; }
        public Nullable<int> id_ciudad_domicilio { get; set; }
        public Nullable<int> id_barrio_domicilio { get; set; }
        public string direccion_laboral2 { get; set; }
        public string direccion_laboral3 { get; set; }
        public string numero_casa_laboral { get; set; }
        public string piso_laboral { get; set; }
        public string numero_departamento_laboral { get; set; }
        public Nullable<int> id_ciudad_laboral { get; set; }
        public Nullable<int> id_barrio_laboral { get; set; }
        public Nullable<int> id_pais_laboral { get; set; }
        public Nullable<int> id_departamento_laboral { get; set; }
        public string telefono_laboral2 { get; set; }
        public Nullable<int> id_profesion { get; set; }
        public Nullable<int> id_profesion_actividad { get; set; }
        public Nullable<int> id_empresa_carga { get; set; }
        public Nullable<int> id_sucursal_carga { get; set; }
        public string id_usuario_carga { get; set; }
        public Nullable<System.DateTime> fecha_carga { get; set; }
        public Nullable<int> id_oficina_gestion { get; set; }
        public string id_usuario_produccion { get; set; }
        public string id_usuario_produccion1 { get; set; }
        public Nullable<int> id_empresa_modificacion { get; set; }
        public Nullable<int> id_sucursal_modificacion { get; set; }
        public string id_usuario_modificacion { get; set; }
        public Nullable<System.DateTime> fecha_modificacion { get; set; }
        public string imagen { get; set; }
        public virtual ICollection<Claim> Claims { get; set; }
        public virtual ICollection<ClientPaymentDay> ClientPaymentDays { get; set; }
        public virtual ICollection<Collection> Collections { get; set; }
        public virtual ICollection<AspNetUser> AspNetUsers { get; set; }
    }
}
