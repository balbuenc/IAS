namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AppConfigAdded : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AppConfig",
                c => new
                    {
                        AppConfigID = c.Int(nullable: false, identity: true),
                        CollectionWorkflowID = c.Long(nullable: false),
                        DefaultCasePriorityID = c.Int(nullable: false),
                        CollectionInitialStateID = c.Long(nullable: false),
                        CollectionFinalStateID = c.Long(nullable: false),
                        DefaultUserID = c.String(maxLength: 128),
                        EffectiveDaysThreshold = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.AppConfigID)
                .ForeignKey( "dbo.State", t => t.CollectionFinalStateID, cascadeDelete: false )
                .ForeignKey( "dbo.State", t => t.CollectionInitialStateID, cascadeDelete: false )
                .ForeignKey( "dbo.Workflow", t => t.CollectionWorkflowID, cascadeDelete: false )
                .ForeignKey( "dbo.CasePriority", t => t.DefaultCasePriorityID, cascadeDelete: false )
                .ForeignKey("dbo.AspNetUsers", t => t.DefaultUserID)
                .Index(t => t.CollectionFinalStateID)
                .Index(t => t.CollectionInitialStateID)
                .Index(t => t.CollectionWorkflowID)
                .Index(t => t.DefaultCasePriorityID)
                .Index(t => t.DefaultUserID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AppConfig", "DefaultUserID", "dbo.AspNetUsers");
            DropForeignKey("dbo.AppConfig", "DefaultCasePriorityID", "dbo.CasePriority");
            DropForeignKey("dbo.AppConfig", "CollectionWorkflowID", "dbo.Workflow");
            DropForeignKey("dbo.AppConfig", "CollectionInitialStateID", "dbo.State");
            DropForeignKey("dbo.AppConfig", "CollectionFinalStateID", "dbo.State");
            DropIndex("dbo.AppConfig", new[] { "DefaultUserID" });
            DropIndex("dbo.AppConfig", new[] { "DefaultCasePriorityID" });
            DropIndex("dbo.AppConfig", new[] { "CollectionWorkflowID" });
            DropIndex("dbo.AppConfig", new[] { "CollectionInitialStateID" });
            DropIndex("dbo.AppConfig", new[] { "CollectionFinalStateID" });
            DropTable("dbo.AppConfig");
        }
    }
}
