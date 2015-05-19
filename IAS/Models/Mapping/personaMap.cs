using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class personaMap : EntityTypeConfiguration<persona>
    {
        public personaMap()
        {
            // Primary Key
            this.HasKey(t => t.id_persona);

            // Properties
            this.Property(t => t.numero_documento)
                .HasMaxLength(30);

            this.Property(t => t.nombre)
                .HasMaxLength(100);

            this.Property(t => t.apellido1)
                .HasMaxLength(100);

            this.Property(t => t.apellido2)
                .HasMaxLength(100);

            this.Property(t => t.razon_social)
                .HasMaxLength(200);

            this.Property(t => t.direccion_domicilio1)
                .HasMaxLength(100);

            this.Property(t => t.telefono_domicilio1)
                .HasMaxLength(30);

            this.Property(t => t.telefono_domicilio2)
                .HasMaxLength(30);

            this.Property(t => t.telefono_celular)
                .HasMaxLength(30);

            this.Property(t => t.email_particular)
                .HasMaxLength(100);

            this.Property(t => t.direccion_laboral1)
                .HasMaxLength(100);

            this.Property(t => t.telefono_laboral1)
                .HasMaxLength(30);

            this.Property(t => t.email_laboral)
                .HasMaxLength(100);

            this.Property(t => t.tipo_persona)
                .HasMaxLength(1);

            this.Property(t => t.direccion_domicilio2)
                .HasMaxLength(100);

            this.Property(t => t.direccion_domicilio3)
                .HasMaxLength(100);

            this.Property(t => t.numero_casa_domicilio)
                .HasMaxLength(10);

            this.Property(t => t.piso_domicilio)
                .HasMaxLength(10);

            this.Property(t => t.numero_departamento_domicilio)
                .HasMaxLength(10);

            this.Property(t => t.direccion_laboral2)
                .HasMaxLength(100);

            this.Property(t => t.direccion_laboral3)
                .HasMaxLength(100);

            this.Property(t => t.numero_casa_laboral)
                .HasMaxLength(10);

            this.Property(t => t.piso_laboral)
                .HasMaxLength(10);

            this.Property(t => t.numero_departamento_laboral)
                .HasMaxLength(10);

            this.Property(t => t.telefono_laboral2)
                .HasMaxLength(30);

            this.Property(t => t.id_usuario_carga)
                .HasMaxLength(20);

            this.Property(t => t.id_usuario_produccion)
                .HasMaxLength(20);

            this.Property(t => t.id_usuario_produccion1)
                .HasMaxLength(20);

            this.Property(t => t.id_usuario_modificacion)
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("personas", "exchange");
            this.Property(t => t.id_persona).HasColumnName("id_persona");
            this.Property(t => t.id_tipo_documento).HasColumnName("id_tipo_documento");
            this.Property(t => t.numero_documento).HasColumnName("numero_documento");
            this.Property(t => t.nombre).HasColumnName("nombre");
            this.Property(t => t.apellido1).HasColumnName("apellido1");
            this.Property(t => t.apellido2).HasColumnName("apellido2");
            this.Property(t => t.razon_social).HasColumnName("razon_social");
            this.Property(t => t.fecha_nacimiento).HasColumnName("fecha_nacimiento");
            this.Property(t => t.sexo).HasColumnName("sexo");
            this.Property(t => t.direccion_domicilio1).HasColumnName("direccion_domicilio1");
            this.Property(t => t.telefono_domicilio1).HasColumnName("telefono_domicilio1");
            this.Property(t => t.telefono_domicilio2).HasColumnName("telefono_domicilio2");
            this.Property(t => t.telefono_celular).HasColumnName("telefono_celular");
            this.Property(t => t.email_particular).HasColumnName("email_particular");
            this.Property(t => t.direccion_laboral1).HasColumnName("direccion_laboral1");
            this.Property(t => t.telefono_laboral1).HasColumnName("telefono_laboral1");
            this.Property(t => t.email_laboral).HasColumnName("email_laboral");
            this.Property(t => t.tipo_persona).HasColumnName("tipo_persona");
            this.Property(t => t.observacion).HasColumnName("observacion");
            this.Property(t => t.id_tipo_documento2).HasColumnName("id_tipo_documento2");
            this.Property(t => t.numero_documento2).HasColumnName("numero_documento2");
            this.Property(t => t.id_pais_nacionalidad).HasColumnName("id_pais_nacionalidad");
            this.Property(t => t.id_estado_civil).HasColumnName("id_estado_civil");
            this.Property(t => t.direccion_domicilio2).HasColumnName("direccion_domicilio2");
            this.Property(t => t.direccion_domicilio3).HasColumnName("direccion_domicilio3");
            this.Property(t => t.numero_casa_domicilio).HasColumnName("numero_casa_domicilio");
            this.Property(t => t.piso_domicilio).HasColumnName("piso_domicilio");
            this.Property(t => t.numero_departamento_domicilio).HasColumnName("numero_departamento_domicilio");
            this.Property(t => t.id_pais_domicilio).HasColumnName("id_pais_domicilio");
            this.Property(t => t.id_departamento_domicilio).HasColumnName("id_departamento_domicilio");
            this.Property(t => t.id_ciudad_domicilio).HasColumnName("id_ciudad_domicilio");
            this.Property(t => t.id_barrio_domicilio).HasColumnName("id_barrio_domicilio");
            this.Property(t => t.direccion_laboral2).HasColumnName("direccion_laboral2");
            this.Property(t => t.direccion_laboral3).HasColumnName("direccion_laboral3");
            this.Property(t => t.numero_casa_laboral).HasColumnName("numero_casa_laboral");
            this.Property(t => t.piso_laboral).HasColumnName("piso_laboral");
            this.Property(t => t.numero_departamento_laboral).HasColumnName("numero_departamento_laboral");
            this.Property(t => t.id_ciudad_laboral).HasColumnName("id_ciudad_laboral");
            this.Property(t => t.id_barrio_laboral).HasColumnName("id_barrio_laboral");
            this.Property(t => t.id_pais_laboral).HasColumnName("id_pais_laboral");
            this.Property(t => t.id_departamento_laboral).HasColumnName("id_departamento_laboral");
            this.Property(t => t.telefono_laboral2).HasColumnName("telefono_laboral2");
            this.Property(t => t.id_profesion).HasColumnName("id_profesion");
            this.Property(t => t.id_profesion_actividad).HasColumnName("id_profesion_actividad");
            this.Property(t => t.id_empresa_carga).HasColumnName("id_empresa_carga");
            this.Property(t => t.id_sucursal_carga).HasColumnName("id_sucursal_carga");
            this.Property(t => t.id_usuario_carga).HasColumnName("id_usuario_carga");
            this.Property(t => t.fecha_carga).HasColumnName("fecha_carga");
            this.Property(t => t.id_oficina_gestion).HasColumnName("id_oficina_gestion");
            this.Property(t => t.id_usuario_produccion).HasColumnName("id_usuario_produccion");
            this.Property(t => t.id_usuario_produccion1).HasColumnName("id_usuario_produccion1");
            this.Property(t => t.id_empresa_modificacion).HasColumnName("id_empresa_modificacion");
            this.Property(t => t.id_sucursal_modificacion).HasColumnName("id_sucursal_modificacion");
            this.Property(t => t.id_usuario_modificacion).HasColumnName("id_usuario_modificacion");
            this.Property(t => t.fecha_modificacion).HasColumnName("fecha_modificacion");
            this.Property(t => t.imagen).HasColumnName("imagen");
        }
    }
}
