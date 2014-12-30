using IAS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

namespace IAS.Mappings {
    public class DocumentTypeMap : EntityTypeConfiguration<DocumentType> {
        public DocumentTypeMap()
        {
            // Table & Column Mappings
            this.ToTable( "Tipos_documentos", "exchange" );
            this.Property( t => t.DocumentTypeID ).HasColumnName( "id_tipo_documento" );
            this.Property( t => t.Descripcion ).HasColumnName( "descripcion" );

            this.Property(t => t.LoadedByBusinessID).HasColumnName("id_empresa_carga");
            this.Property(t => t.LoadedByBusinessBranchID).HasColumnName("id_sucursal_carga");
            this.Property(t => t.LoadedByUserID).HasColumnName("id_usuario_carga");
            this.Property(t => t.ModifiedDate).HasColumnName("fecha_ultima_modificacion");
        }
    }
}