namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class WorkFlowDefaultFormEdit : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Workflow", "DefaultFormID", "dbo.Form");
            DropIndex("dbo.Workflow", new[] { "DefaultFormID" });
            AlterColumn("dbo.Workflow", "DefaultFormID", c => c.Long());
            CreateIndex("dbo.Workflow", "DefaultFormID");
            AddForeignKey("dbo.Workflow", "DefaultFormID", "dbo.Form", "FormID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Workflow", "DefaultFormID", "dbo.Form");
            DropIndex("dbo.Workflow", new[] { "DefaultFormID" });
            AlterColumn("dbo.Workflow", "DefaultFormID", c => c.Long(nullable: false));
            CreateIndex("dbo.Workflow", "DefaultFormID");
            AddForeignKey("dbo.Workflow", "DefaultFormID", "dbo.Form", "FormID", cascadeDelete: true);
        }
    }
}
