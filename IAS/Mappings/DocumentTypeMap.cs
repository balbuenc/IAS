//«Copyright 2014 Balcazz HT, http://www.balcazzht.com»

//This file is part of IAS | Insurance Advanced Services.

//IAS is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//IAS is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with Foobar.  If not, see <http://www.gnu.org/licenses/>.


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