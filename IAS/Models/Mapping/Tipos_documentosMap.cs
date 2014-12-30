using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class Tipos_documentosMap : EntityTypeConfiguration<Tipos_documentos>
    {
        public Tipos_documentosMap()
        {
            // Primary Key
            this.HasKey(t => t.id_tipo_documento);

            // Properties
            this.Property(t => t.id_usuario_carga)
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Tipos_documentos", "exchange");
            this.Property(t => t.id_tipo_documento).HasColumnName("id_tipo_documento");
            this.Property(t => t.descripcion).HasColumnName("descripcion");
            this.Property(t => t.id_empresa_carga).HasColumnName("id_empresa_carga");
            this.Property(t => t.id_sucursal_carga).HasColumnName("id_sucursal_carga");
            this.Property(t => t.id_usuario_carga).HasColumnName("id_usuario_carga");
            this.Property(t => t.fecha_ultima_modificacion).HasColumnName("fecha_ultima_modificacion");
        }
    }
}
