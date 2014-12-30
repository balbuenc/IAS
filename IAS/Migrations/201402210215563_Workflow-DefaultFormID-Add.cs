namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class WorkflowDefaultFormIDAdd : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Workflow", "DefaultFormID", c => c.Long(nullable: true));
            CreateIndex("dbo.Workflow", "DefaultFormID");
            AddForeignKey("dbo.Workflow", "DefaultFormID", "dbo.Form", "FormID", cascadeDelete: false);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Workflow", "DefaultFormID", "dbo.Form");
            DropIndex("dbo.Workflow", new[] { "DefaultFormID" });
            DropColumn("dbo.Workflow", "DefaultFormID");
        }
    }
}
