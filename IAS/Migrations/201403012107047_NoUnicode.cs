namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class NoUnicode : DbMigration
    {
        public override void Up()
        {            
            AlterColumn("dbo.AspNetUsers", "UserName", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("dbo.AspNetUsers", "PasswordHash", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("dbo.AspNetUsers", "SecurityStamp", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("dbo.AspNetUsers", "FirstName", c => c.String(maxLength: 120, unicode: false));
            AlterColumn("dbo.AspNetUsers", "LastName", c => c.String(maxLength: 120, unicode: false));
            AlterColumn("dbo.AspNetUsers", "Email", c => c.String(maxLength: 120, unicode: false));
            AlterColumn("dbo.AspNetUsers", "Phone", c => c.String(maxLength: 150, unicode: false));
            AlterColumn("dbo.AspNetUserClaims", "ClaimType", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("dbo.AspNetUserClaims", "ClaimValue", c => c.String(maxLength: 8000, unicode: false));                                    
            AlterColumn("dbo.AspNetRoles", "Name", c => c.String(nullable: false, maxLength: 8000, unicode: false));
            AlterColumn("exchange.personas", "numero_documento", c => c.String(maxLength: 30, unicode: false));
            AlterColumn("exchange.personas", "nombre", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "apellido1", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "apellido2", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "razon_social", c => c.String(maxLength: 200, unicode: false));
            AlterColumn("exchange.personas", "sexo", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("exchange.personas", "direccion_domicilio1", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "telefono_domicilio1", c => c.String(maxLength: 30, unicode: false));
            AlterColumn("exchange.personas", "telefono_domicilio2", c => c.String(maxLength: 30, unicode: false));
            AlterColumn("exchange.personas", "telefono_celular", c => c.String(maxLength: 30, unicode: false));
            AlterColumn("exchange.personas", "email_particular", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "direccion_laboral1", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "telefono_laboral1", c => c.String(maxLength: 30, unicode: false));
            AlterColumn("exchange.personas", "email_laboral", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "tipo_persona", c => c.String(maxLength: 1, unicode: false));
            AlterColumn("exchange.personas", "observacion", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("exchange.personas", "numero_documento2", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("exchange.personas", "direccion_domicilio2", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "direccion_domicilio3", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "numero_casa_domicilio", c => c.String(maxLength: 10, unicode: false));
            AlterColumn("exchange.personas", "piso_domicilio", c => c.String(maxLength: 10, unicode: false));
            AlterColumn("exchange.personas", "numero_departamento_domicilio", c => c.String(maxLength: 10, unicode: false));
            AlterColumn("exchange.personas", "direccion_laboral2", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "direccion_laboral3", c => c.String(maxLength: 100, unicode: false));
            AlterColumn("exchange.personas", "numero_casa_laboral", c => c.String(maxLength: 10, unicode: false));
            AlterColumn("exchange.personas", "piso_laboral", c => c.String(maxLength: 10, unicode: false));
            AlterColumn("exchange.personas", "numero_departamento_laboral", c => c.String(maxLength: 10, unicode: false));
            AlterColumn("exchange.personas", "telefono_laboral2", c => c.String(maxLength: 30, unicode: false));
            AlterColumn("exchange.personas", "id_usuario_carga", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("exchange.personas", "id_usuario_produccion", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("exchange.personas", "id_usuario_produccion1", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("exchange.personas", "id_usuario_modificacion", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("exchange.personas", "imagen", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("exchange.Tipos_documentos", "descripcion", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("exchange.Tipos_documentos", "id_usuario_carga", c => c.String(maxLength: 20, unicode: false));
            AlterColumn("dbo.State", "StateName", c => c.String(nullable: false, maxLength: 50, unicode: false));
            AlterColumn("dbo.Workflow", "WorkflowName", c => c.String(nullable: false, maxLength: 128, unicode: false));
            AlterColumn("dbo.Form", "FormName", c => c.String(nullable: false, maxLength: 50, unicode: false));
            AlterColumn("dbo.Form", "Url", c => c.String(nullable: false, maxLength: 250, unicode: false));            
            AlterColumn("dbo.CasePriority", "PriorityName", c => c.String(nullable: false, maxLength: 50, unicode: false));
            AlterColumn("dbo.Case", "Description", c => c.String(maxLength: 200, unicode: false));
            AlterColumn("dbo.CaseTransition", "Comment", c => c.String(maxLength: 8000, unicode: false));
            AlterColumn("dbo.Collection", "RiskName", c => c.String(nullable: false, maxLength: 8000, unicode: false));
            AlterColumn("dbo.SMSNotification", "MobilePhone", c => c.String(nullable: false, maxLength: 30, unicode: false));
            AlterColumn("dbo.SMSNotification", "Message", c => c.String(nullable: false, maxLength: 8000, unicode: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.SMSNotification", "Message", c => c.String(nullable: false));
            AlterColumn("dbo.SMSNotification", "MobilePhone", c => c.String(nullable: false, maxLength: 30));
            AlterColumn("dbo.Collection", "RiskName", c => c.String(nullable: false));
            AlterColumn("dbo.CaseTransition", "Comment", c => c.String());
            AlterColumn("dbo.Case", "Description", c => c.String(maxLength: 200));
            AlterColumn("dbo.CasePriority", "PriorityName", c => c.String(nullable: false, maxLength: 50));            
            AlterColumn("dbo.Form", "Url", c => c.String(nullable: false, maxLength: 250));
            AlterColumn("dbo.Form", "FormName", c => c.String(nullable: false, maxLength: 50));
            AlterColumn("dbo.Workflow", "WorkflowName", c => c.String(nullable: false, maxLength: 150));
            AlterColumn("dbo.State", "StateName", c => c.String(nullable: false, maxLength: 50));
            AlterColumn("exchange.Tipos_documentos", "id_usuario_carga", c => c.String(maxLength: 20));
            AlterColumn("exchange.Tipos_documentos", "descripcion", c => c.String());
            AlterColumn("exchange.personas", "imagen", c => c.String());
            AlterColumn("exchange.personas", "id_usuario_modificacion", c => c.String(maxLength: 20));
            AlterColumn("exchange.personas", "id_usuario_produccion1", c => c.String(maxLength: 20));
            AlterColumn("exchange.personas", "id_usuario_produccion", c => c.String(maxLength: 20));
            AlterColumn("exchange.personas", "id_usuario_carga", c => c.String(maxLength: 20));
            AlterColumn("exchange.personas", "telefono_laboral2", c => c.String(maxLength: 30));
            AlterColumn("exchange.personas", "numero_departamento_laboral", c => c.String(maxLength: 10));
            AlterColumn("exchange.personas", "piso_laboral", c => c.String(maxLength: 10));
            AlterColumn("exchange.personas", "numero_casa_laboral", c => c.String(maxLength: 10));
            AlterColumn("exchange.personas", "direccion_laboral3", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "direccion_laboral2", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "numero_departamento_domicilio", c => c.String(maxLength: 10));
            AlterColumn("exchange.personas", "piso_domicilio", c => c.String(maxLength: 10));
            AlterColumn("exchange.personas", "numero_casa_domicilio", c => c.String(maxLength: 10));
            AlterColumn("exchange.personas", "direccion_domicilio3", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "direccion_domicilio2", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "numero_documento2", c => c.String());
            AlterColumn("exchange.personas", "observacion", c => c.String());
            AlterColumn("exchange.personas", "tipo_persona", c => c.String(maxLength: 1));
            AlterColumn("exchange.personas", "email_laboral", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "telefono_laboral1", c => c.String(maxLength: 30));
            AlterColumn("exchange.personas", "direccion_laboral1", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "email_particular", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "telefono_celular", c => c.String(maxLength: 30));
            AlterColumn("exchange.personas", "telefono_domicilio2", c => c.String(maxLength: 30));
            AlterColumn("exchange.personas", "telefono_domicilio1", c => c.String(maxLength: 30));
            AlterColumn("exchange.personas", "direccion_domicilio1", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "sexo", c => c.String());
            AlterColumn("exchange.personas", "razon_social", c => c.String(maxLength: 200));
            AlterColumn("exchange.personas", "apellido2", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "apellido1", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "nombre", c => c.String(maxLength: 100));
            AlterColumn("exchange.personas", "numero_documento", c => c.String(maxLength: 30));
            AlterColumn("dbo.AspNetRoles", "Name", c => c.String(nullable: false));            
            AlterColumn("dbo.AspNetUserClaims", "ClaimValue", c => c.String());
            AlterColumn("dbo.AspNetUserClaims", "ClaimType", c => c.String());
            AlterColumn("dbo.AspNetUsers", "Phone", c => c.String(maxLength: 150));
            AlterColumn("dbo.AspNetUsers", "Email", c => c.String(maxLength: 120));
            AlterColumn("dbo.AspNetUsers", "LastName", c => c.String(maxLength: 120));
            AlterColumn("dbo.AspNetUsers", "FirstName", c => c.String(maxLength: 120));
            AlterColumn("dbo.AspNetUsers", "SecurityStamp", c => c.String());
            AlterColumn("dbo.AspNetUsers", "PasswordHash", c => c.String());
            AlterColumn("dbo.AspNetUsers", "UserName", c => c.String());            
        }
    }
}
