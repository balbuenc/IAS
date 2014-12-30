using IAS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace IAS.Mappings
{
    public class PersonMap : EntityTypeConfiguration<Person>
    {
        public PersonMap()
        {
            // Table & Column Mappings
            this.ToTable("personas", "exchange");
            this.Property(p => p.PersonID).HasColumnName("id_persona");
            this.Property(t => t.DocumentTypeID).HasColumnName("id_tipo_documento");
            this.Property(t => t.DocumentNumber).HasColumnName("numero_documento");
            this.Property(t => t.FirstName).HasColumnName("nombre");
            this.Property(t => t.LastName).HasColumnName("apellido1");
            this.Property(t => t.LastName1).HasColumnName("apellido2");
            this.Property(t => t.CorporateName).HasColumnName("razon_social");
            this.Property(t => t.BirthDate).HasColumnName("fecha_nacimiento");
            this.Property(t => t.Gender).HasColumnName("sexo");
            this.Property(t => t.HomeAddress).HasColumnName("direccion_domicilio1");
            this.Property(t => t.HomePhone).HasColumnName("telefono_domicilio1");
            this.Property(t => t.HomePhone1).HasColumnName("telefono_domicilio2");
            this.Property(t => t.MobilePhone).HasColumnName("telefono_celular");
            this.Property(t => t.Email).HasColumnName("email_particular");
            this.Property(t => t.BusinessAddress).HasColumnName("direccion_laboral1");
            this.Property(t => t.BusinessPhone).HasColumnName("telefono_laboral1");
            this.Property(t => t.BusinessEmail).HasColumnName("email_laboral");
            this.Property(t => t.PersonType).HasColumnName("tipo_persona");
            this.Property(t => t.Comments).HasColumnName("observacion");

            this.Property(t => t.DocumentType2ID).HasColumnName("id_tipo_documento2");
            this.Property(t => t.DocumentNumber2).HasColumnName("numero_documento2");
            this.Property(t => t.NationalityID).HasColumnName("id_pais_nacionalidad");
            this.Property(t => t.MaritalStatusID).HasColumnName("id_estado_civil");
            this.Property(t => t.HomeAddress2).HasColumnName("direccion_domicilio2");
            this.Property(t => t.HomeAddress3).HasColumnName("direccion_domicilio3");
            this.Property(t => t.HomeAddressNumber).HasColumnName("numero_casa_domicilio");
            this.Property(t => t.FloorNumber).HasColumnName("piso_domicilio");
            this.Property(t => t.ApartmentHomeAddressNumber).HasColumnName("numero_departamento_domicilio");
            this.Property(t => t.CountryHomeAddressID).HasColumnName("id_pais_domicilio");
            this.Property(t => t.DeparmentHomeAddressID).HasColumnName("id_departamento_domicilio");
            this.Property(t => t.CityHomeAddressID).HasColumnName("id_ciudad_domicilio");
            this.Property(t => t.NeighborhoodHomeAddressID).HasColumnName("id_barrio_domicilio");
            this.Property(t => t.BusinessAddress2).HasColumnName("direccion_laboral2");
            this.Property(t => t.BusinessAddress3).HasColumnName("direccion_laboral3");
            this.Property(t => t.BusinessAddressNumber).HasColumnName("numero_casa_laboral");
            this.Property(t => t.BusinessFloorNumber).HasColumnName("piso_laboral");
            this.Property(t => t.ApartmentBusinessAddressNumber).HasColumnName("numero_departamento_laboral");
            this.Property(t => t.CityBusinessAddressID).HasColumnName("id_ciudad_laboral");
            this.Property(t => t.NeighborhoodBusinessAddressID).HasColumnName("id_barrio_laboral");
            this.Property(t => t.CountryBusinessAddressID).HasColumnName("id_pais_laboral");
            this.Property(t => t.DeparmentBusinessAddressID).HasColumnName("id_departamento_laboral");
            this.Property(t => t.BusinessPhone2).HasColumnName("telefono_laboral2");
            this.Property(t => t.ProfessionID).HasColumnName("id_profesion");
            this.Property(t => t.ProfessionActivityID).HasColumnName("id_profesion_actividad");
            this.Property(t => t.LoadedByBusinessID).HasColumnName("id_empresa_carga");
            this.Property(t => t.LoadedByBusinessBranchID).HasColumnName("id_sucursal_carga");
            this.Property(t => t.LoadedByUserID).HasColumnName("id_usuario_carga");
            this.Property(t => t.LoadedDate).HasColumnName("fecha_carga");
            this.Property(t => t.OfficceID).HasColumnName("id_oficina_gestion");
            this.Property(t => t.ProduccionID).HasColumnName("id_usuario_produccion");
            this.Property(t => t.Produccion1ID).HasColumnName("id_usuario_produccion1");
            this.Property(t => t.ModifiedByBusinessID).HasColumnName("id_empresa_modificacion");
            this.Property(t => t.ModifiedByBusinessBranchID).HasColumnName("id_sucursal_modificacion");
            this.Property(t => t.ModifiedByUserID).HasColumnName("id_usuario_modificacion");
            this.Property(t => t.ModifiedDate).HasColumnName("fecha_modificacion");
            this.Property(t => t.PersonPhoto).HasColumnName("imagen");

        }
    }
}