namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class StateFormsMod : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.WorkflowStateTransition", "EditableEffectiveDate", c => c.Boolean(nullable: false));
            AddColumn("dbo.WorkflowStateForm", "ReadOnlyForm", c => c.Boolean(nullable: false));
            DropColumn("dbo.WorkflowStateTransition", "ReadOnlyForm");
        }
        
        public override void Down()
        {
            AddColumn("dbo.WorkflowStateTransition", "ReadOnlyForm", c => c.Boolean(nullable: false));
            DropColumn("dbo.WorkflowStateForm", "ReadOnlyForm");
            DropColumn("dbo.WorkflowStateTransition", "EditableEffectiveDate");
        }
    }
}
