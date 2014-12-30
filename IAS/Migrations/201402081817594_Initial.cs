namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    using System.IO;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Alarm",
                c => new
                    {
                        AlarmID = c.Long(nullable: false, identity: true),
                        WorkflowID = c.Long(nullable: false),
                        StateID = c.Long(nullable: false),
                        Interval = c.Int(nullable: false),
                        Active = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.AlarmID)
                .ForeignKey("dbo.State", t => t.StateID, cascadeDelete: true)
                .ForeignKey("dbo.Workflow", t => t.WorkflowID, cascadeDelete: true)
                .Index(t => t.StateID)
                .Index(t => t.WorkflowID);
            
            CreateTable(
                "dbo.AspNetUsers",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        UserName = c.String(),
                        PasswordHash = c.String(),
                        SecurityStamp = c.String(),
                        FirstName = c.String(maxLength: 120),
                        LastName = c.String(maxLength: 120),
                        Email = c.String(maxLength: 120),
                        Phone = c.String(maxLength: 150),
                        Discriminator = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.AspNetUserClaims",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                        User_Id = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AspNetUsers", t => t.User_Id, cascadeDelete: true)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.AspNetUserLogins",
                c => new
                    {
                        UserId = c.String(nullable: false, maxLength: 128),
                        LoginProvider = c.String(nullable: false, maxLength: 128),
                        ProviderKey = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.UserId, t.LoginProvider, t.ProviderKey })
                .ForeignKey("dbo.AspNetUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.AspNetUserRoles",
                c => new
                    {
                        UserId = c.String(nullable: false, maxLength: 128),
                        RoleId = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("dbo.AspNetRoles", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.AspNetUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.RoleId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.AspNetRoles",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Name = c.String(nullable: false),
                        Discriminator = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "exchange.personas",
                c => new
                    {
                        id_persona = c.Long(nullable: false, identity: true),
                        id_tipo_documento = c.Long(nullable: false),
                        numero_documento = c.String(maxLength: 30),
                        nombre = c.String(maxLength: 100),
                        apellido1 = c.String(maxLength: 100),
                        apellido2 = c.String(maxLength: 100),
                        razon_social = c.String(maxLength: 200),
                        fecha_nacimiento = c.DateTime(),
                        sexo = c.String(),
                        direccion_domicilio1 = c.String(maxLength: 100),
                        telefono_domicilio1 = c.String(maxLength: 30),
                        telefono_domicilio2 = c.String(maxLength: 30),
                        telefono_celular = c.String(maxLength: 30),
                        email_particular = c.String(maxLength: 100),
                        direccion_laboral1 = c.String(maxLength: 100),
                        telefono_laboral1 = c.String(maxLength: 30),
                        email_laboral = c.String(maxLength: 100),
                        tipo_persona = c.String(maxLength: 1),
                        observacion = c.String(),
                        id_tipo_documento2 = c.Int(),
                        numero_documento2 = c.String(),
                        id_pais_nacionalidad = c.Int(),
                        id_estado_civil = c.Int(),
                        direccion_domicilio2 = c.String(maxLength: 100),
                        direccion_domicilio3 = c.String(maxLength: 100),
                        numero_casa_domicilio = c.String(maxLength: 10),
                        piso_domicilio = c.String(maxLength: 10),
                        numero_departamento_domicilio = c.String(maxLength: 10),
                        id_pais_domicilio = c.Int(),
                        id_departamento_domicilio = c.Int(),
                        id_ciudad_domicilio = c.Int(),
                        id_barrio_domicilio = c.Int(),
                        direccion_laboral2 = c.String(maxLength: 100),
                        direccion_laboral3 = c.String(maxLength: 100),
                        numero_casa_laboral = c.String(maxLength: 10),
                        piso_laboral = c.String(maxLength: 10),
                        numero_departamento_laboral = c.String(maxLength: 10),
                        id_ciudad_laboral = c.Int(),
                        id_barrio_laboral = c.Int(),
                        id_pais_laboral = c.Int(),
                        id_departamento_laboral = c.Int(),
                        telefono_laboral2 = c.String(maxLength: 30),
                        id_profesion = c.Int(),
                        id_profesion_actividad = c.Int(),
                        id_empresa_carga = c.Int(),
                        id_sucursal_carga = c.Int(),
                        id_usuario_carga = c.String(maxLength: 20),
                        fecha_carga = c.DateTime(),
                        id_oficina_gestion = c.Int(),
                        id_usuario_produccion = c.String(maxLength: 20),
                        id_usuario_produccion1 = c.String(maxLength: 20),
                        id_empresa_modificacion = c.Int(),
                        id_sucursal_modificacion = c.Int(),
                        id_usuario_modificacion = c.String(maxLength: 20),
                        fecha_modificacion = c.DateTime(),
                        imagen = c.String(),
                    })
                .PrimaryKey(t => t.id_persona)
                .ForeignKey("exchange.Tipos_documentos", t => t.id_tipo_documento, cascadeDelete: true)
                .Index(t => t.id_tipo_documento);
            
            CreateTable(
                "exchange.Tipos_documentos",
                c => new
                    {
                        id_tipo_documento = c.Long(nullable: false, identity: true),
                        descripcion = c.String(),
                        id_empresa_carga = c.Int(),
                        id_sucursal_carga = c.Int(),
                        id_usuario_carga = c.String(maxLength: 20),
                        fecha_ultima_modificacion = c.DateTime(),
                    })
                .PrimaryKey(t => t.id_tipo_documento);
            
            CreateTable(
                "dbo.State",
                c => new
                    {
                        StateID = c.Long(nullable: false, identity: true),
                        StateName = c.String(nullable: false, maxLength: 50),
                        Active = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.StateID);
            
            CreateTable(
                "dbo.Workflow",
                c => new
                    {
                        WorkflowID = c.Long(nullable: false, identity: true),
                        WorkflowName = c.String(nullable: false, maxLength: 150),
                    })
                .PrimaryKey(t => t.WorkflowID);
            
            CreateTable(
                "dbo.CasePriority",
                c => new
                    {
                        CasePriorityID = c.Int(nullable: false, identity: true),
                        PriorityName = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.CasePriorityID);
            
            CreateTable(
                "dbo.Case",
                c => new
                    {
                        CaseID = c.Long(nullable: false, identity: true),
                        WorkflowID = c.Long(nullable: false),
                        Description = c.String(maxLength: 200),
                        CasePriorityID = c.Int(nullable: false),
                        StateID = c.Long(nullable: false),
                        CreationDate = c.DateTime(nullable: false),
                        LastModificationDate = c.DateTime(nullable: false),
                        EffectiveDate = c.DateTime(nullable: false),
                        UserID = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.CaseID)
                .ForeignKey("dbo.CasePriority", t => t.CasePriorityID, cascadeDelete: true)
                .ForeignKey("dbo.State", t => t.StateID, cascadeDelete: true)
                .ForeignKey("dbo.AspNetUsers", t => t.UserID)
                .ForeignKey("dbo.Workflow", t => t.WorkflowID, cascadeDelete: true)
                .Index(t => t.CasePriorityID)
                .Index(t => t.StateID)
                .Index(t => t.UserID)
                .Index(t => t.WorkflowID);
            
            CreateTable(
                "dbo.CaseTransition",
                c => new
                    {
                        CaseTransitionID = c.Long(nullable: false, identity: true),
                        CaseID = c.Long(nullable: false),
                        PreviousStateID = c.Long(nullable: false),
                        NewStateID = c.Long(nullable: false),
                        UserID = c.String(nullable: false, maxLength: 128),
                        TransitionDate = c.DateTime(nullable: false),
                        Comment = c.String(),
                    })
                .PrimaryKey(t => t.CaseTransitionID)
                .ForeignKey("dbo.Case", t => t.CaseID, cascadeDelete: true)
                .ForeignKey("dbo.State", t => t.NewStateID, cascadeDelete: false)
                .ForeignKey("dbo.State", t => t.PreviousStateID, cascadeDelete: false)
                .ForeignKey("dbo.AspNetUsers", t => t.UserID, cascadeDelete: false)
                .Index(t => t.CaseID)
                .Index(t => t.NewStateID)
                .Index(t => t.PreviousStateID)
                .Index(t => t.UserID);
            
            CreateTable(
                "dbo.Form",
                c => new
                    {
                        FormID = c.Long(nullable: false, identity: true),
                        FormName = c.String(nullable: false, maxLength: 50),
                        Url = c.String(nullable: false, maxLength: 250),
                    })
                .PrimaryKey(t => t.FormID);
            
            CreateTable(
                "dbo.RoleStateTransition",
                c => new
                    {
                        RoleStateTransitionID = c.Long(nullable: false, identity: true),
                        RoleID = c.String(maxLength: 128),
                        WorkflowStateTransitionID = c.Long(nullable: false),
                    })
                .PrimaryKey(t => t.RoleStateTransitionID)
                .ForeignKey("dbo.AspNetRoles", t => t.RoleID)
                .ForeignKey("dbo.WorkflowStateTransition", t => t.WorkflowStateTransitionID, cascadeDelete: true)
                .Index(t => t.RoleID)
                .Index(t => t.WorkflowStateTransitionID);
            
            CreateTable(
                "dbo.WorkflowStateTransition",
                c => new
                    {
                        WorkflowStateTransitionID = c.Long(nullable: false, identity: true),
                        WorkflowID = c.Long(nullable: false),
                        InitialStateID = c.Long(nullable: false),
                        FinalStateID = c.Long(nullable: false),
                        ReadOnlyForm = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.WorkflowStateTransitionID)
                .ForeignKey("dbo.State", t => t.FinalStateID, cascadeDelete: false)
                .ForeignKey("dbo.State", t => t.InitialStateID, cascadeDelete: false)
                .ForeignKey("dbo.Workflow", t => t.WorkflowID, cascadeDelete: true)
                .Index(t => t.FinalStateID)
                .Index(t => t.InitialStateID)
                .Index(t => t.WorkflowID);
            
            CreateTable(
                "dbo.UserStateTransition",
                c => new
                    {
                        UserStateTransitionID = c.Long(nullable: false, identity: true),
                        UserID = c.String(maxLength: 128),
                        WorkflowStateTransitionID = c.Long(nullable: false),
                    })
                .PrimaryKey(t => t.UserStateTransitionID)
                .ForeignKey("dbo.AspNetUsers", t => t.UserID)
                .ForeignKey("dbo.WorkflowStateTransition", t => t.WorkflowStateTransitionID, cascadeDelete: true)
                .Index(t => t.UserID)
                .Index(t => t.WorkflowStateTransitionID);
            
            CreateTable(
                "dbo.WorkflowStateForm",
                c => new
                    {
                        WorkflowStateFormID = c.Long(nullable: false, identity: true),
                        WorkflowID = c.Long(nullable: false),
                        StateID = c.Long(nullable: false),
                        FormID = c.Long(nullable: false),
                    })
                .PrimaryKey(t => t.WorkflowStateFormID)
                .ForeignKey("dbo.Form", t => t.FormID, cascadeDelete: true)
                .ForeignKey("dbo.State", t => t.StateID, cascadeDelete: true)
                .ForeignKey("dbo.Workflow", t => t.WorkflowID, cascadeDelete: true)
                .Index(t => t.FormID)
                .Index(t => t.StateID)
                .Index(t => t.WorkflowID);
            
            CreateTable(
                "dbo.ApplicationUserAlarm",
                c => new
                    {
                        ApplicationUser_Id = c.String(nullable: false, maxLength: 128),
                        Alarm_AlarmID = c.Long(nullable: false),
                    })
                .PrimaryKey(t => new { t.ApplicationUser_Id, t.Alarm_AlarmID })
                .ForeignKey("dbo.AspNetUsers", t => t.ApplicationUser_Id, cascadeDelete: true)
                .ForeignKey("dbo.Alarm", t => t.Alarm_AlarmID, cascadeDelete: true)
                .Index(t => t.ApplicationUser_Id)
                .Index(t => t.Alarm_AlarmID);
            
            CreateTable(
                "dbo.ApplicationRoleAlarm",
                c => new
                    {
                        ApplicationRole_Id = c.String(nullable: false, maxLength: 128),
                        Alarm_AlarmID = c.Long(nullable: false),
                    })
                .PrimaryKey(t => new { t.ApplicationRole_Id, t.Alarm_AlarmID })
                .ForeignKey("dbo.AspNetRoles", t => t.ApplicationRole_Id, cascadeDelete: true)
                .ForeignKey("dbo.Alarm", t => t.Alarm_AlarmID, cascadeDelete: true)
                .Index(t => t.ApplicationRole_Id)
                .Index(t => t.Alarm_AlarmID);
            
            CreateTable(
                "dbo.PersonApplicationUser",
                c => new
                    {
                        Person_PersonID = c.Long(nullable: false),
                        ApplicationUser_Id = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.Person_PersonID, t.ApplicationUser_Id })
                .ForeignKey("exchange.personas", t => t.Person_PersonID, cascadeDelete: true)
                .ForeignKey("dbo.AspNetUsers", t => t.ApplicationUser_Id, cascadeDelete: true)
                .Index(t => t.Person_PersonID)
                .Index(t => t.ApplicationUser_Id);

            //dbo.UserCaseAssigment Ultima en crearce y primera en borrarla
            //No se usa CreateTable pq es una View
            var dirBase = AppDomain.CurrentDomain.BaseDirectory.Replace(@"\bin", string.Empty) + @"\Migrations\SqlScripts";
            Sql(File.ReadAllText(dirBase + @"\UserCaseAssigment.sql"));

        }

        public override void Down()
        {

            Sql("drop view UserCaseAssigment");
            DropForeignKey("dbo.WorkflowStateForm", "WorkflowID", "dbo.Workflow");
            DropForeignKey("dbo.WorkflowStateForm", "StateID", "dbo.State");
            DropForeignKey("dbo.WorkflowStateForm", "FormID", "dbo.Form");
            DropForeignKey("dbo.UserStateTransition", "WorkflowStateTransitionID", "dbo.WorkflowStateTransition");
            DropForeignKey("dbo.UserStateTransition", "UserID", "dbo.AspNetUsers");
            DropForeignKey("dbo.RoleStateTransition", "WorkflowStateTransitionID", "dbo.WorkflowStateTransition");
            DropForeignKey("dbo.WorkflowStateTransition", "WorkflowID", "dbo.Workflow");
            DropForeignKey("dbo.WorkflowStateTransition", "InitialStateID", "dbo.State");
            DropForeignKey("dbo.WorkflowStateTransition", "FinalStateID", "dbo.State");
            DropForeignKey("dbo.RoleStateTransition", "RoleID", "dbo.AspNetRoles");
            DropForeignKey("dbo.Case", "WorkflowID", "dbo.Workflow");
            DropForeignKey("dbo.Case", "UserID", "dbo.AspNetUsers");
            DropForeignKey("dbo.CaseTransition", "UserID", "dbo.AspNetUsers");
            DropForeignKey("dbo.CaseTransition", "PreviousStateID", "dbo.State");
            DropForeignKey("dbo.CaseTransition", "NewStateID", "dbo.State");
            DropForeignKey("dbo.CaseTransition", "CaseID", "dbo.Case");
            DropForeignKey("dbo.Case", "StateID", "dbo.State");
            DropForeignKey("dbo.Case", "CasePriorityID", "dbo.CasePriority");
            DropForeignKey("dbo.Alarm", "WorkflowID", "dbo.Workflow");
            DropForeignKey("dbo.Alarm", "StateID", "dbo.State");
            DropForeignKey("exchange.personas", "id_tipo_documento", "exchange.Tipos_documentos");
            DropForeignKey("dbo.PersonApplicationUser", "ApplicationUser_Id", "dbo.AspNetUsers");
            DropForeignKey("dbo.PersonApplicationUser", "Person_PersonID", "exchange.personas");
            DropForeignKey("dbo.AspNetUserClaims", "User_Id", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserRoles", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserRoles", "RoleId", "dbo.AspNetRoles");
            DropForeignKey("dbo.ApplicationRoleAlarm", "Alarm_AlarmID", "dbo.Alarm");
            DropForeignKey("dbo.ApplicationRoleAlarm", "ApplicationRole_Id", "dbo.AspNetRoles");
            DropForeignKey("dbo.AspNetUserLogins", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.ApplicationUserAlarm", "Alarm_AlarmID", "dbo.Alarm");
            DropForeignKey("dbo.ApplicationUserAlarm", "ApplicationUser_Id", "dbo.AspNetUsers");
            DropIndex("dbo.WorkflowStateForm", new[] { "WorkflowID" });
            DropIndex("dbo.WorkflowStateForm", new[] { "StateID" });
            DropIndex("dbo.WorkflowStateForm", new[] { "FormID" });
            DropIndex("dbo.UserStateTransition", new[] { "WorkflowStateTransitionID" });
            DropIndex("dbo.UserStateTransition", new[] { "UserID" });
            DropIndex("dbo.RoleStateTransition", new[] { "WorkflowStateTransitionID" });
            DropIndex("dbo.WorkflowStateTransition", new[] { "WorkflowID" });
            DropIndex("dbo.WorkflowStateTransition", new[] { "InitialStateID" });
            DropIndex("dbo.WorkflowStateTransition", new[] { "FinalStateID" });
            DropIndex("dbo.RoleStateTransition", new[] { "RoleID" });
            DropIndex("dbo.Case", new[] { "WorkflowID" });
            DropIndex("dbo.Case", new[] { "UserID" });
            DropIndex("dbo.CaseTransition", new[] { "UserID" });
            DropIndex("dbo.CaseTransition", new[] { "PreviousStateID" });
            DropIndex("dbo.CaseTransition", new[] { "NewStateID" });
            DropIndex("dbo.CaseTransition", new[] { "CaseID" });
            DropIndex("dbo.Case", new[] { "StateID" });
            DropIndex("dbo.Case", new[] { "CasePriorityID" });
            DropIndex("dbo.Alarm", new[] { "WorkflowID" });
            DropIndex("dbo.Alarm", new[] { "StateID" });
            DropIndex("exchange.personas", new[] { "id_tipo_documento" });
            DropIndex("dbo.PersonApplicationUser", new[] { "ApplicationUser_Id" });
            DropIndex("dbo.PersonApplicationUser", new[] { "Person_PersonID" });
            DropIndex("dbo.AspNetUserClaims", new[] { "User_Id" });
            DropIndex("dbo.AspNetUserRoles", new[] { "UserId" });
            DropIndex("dbo.AspNetUserRoles", new[] { "RoleId" });
            DropIndex("dbo.ApplicationRoleAlarm", new[] { "Alarm_AlarmID" });
            DropIndex("dbo.ApplicationRoleAlarm", new[] { "ApplicationRole_Id" });
            DropIndex("dbo.AspNetUserLogins", new[] { "UserId" });
            DropIndex("dbo.ApplicationUserAlarm", new[] { "Alarm_AlarmID" });
            DropIndex("dbo.ApplicationUserAlarm", new[] { "ApplicationUser_Id" });
            DropTable("dbo.PersonApplicationUser");
            DropTable("dbo.ApplicationRoleAlarm");
            DropTable("dbo.ApplicationUserAlarm");
            DropTable("dbo.WorkflowStateForm");
            DropTable("dbo.UserStateTransition");
            DropTable("dbo.WorkflowStateTransition");
            DropTable("dbo.RoleStateTransition");
            DropTable("dbo.Form");
            DropTable("dbo.CaseTransition");
            DropTable("dbo.Case");
            DropTable("dbo.CasePriority");
            DropTable("dbo.Workflow");
            DropTable("dbo.State");
            DropTable("exchange.Tipos_documentos");
            DropTable("exchange.personas");
            DropTable("dbo.AspNetRoles");
            DropTable("dbo.AspNetUserRoles");
            DropTable("dbo.AspNetUserLogins");
            DropTable("dbo.AspNetUserClaims");
            DropTable("dbo.AspNetUsers");
            DropTable("dbo.Alarm");
        }
    }
}
