namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CaseTransitionEffectiveDateAdd : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CaseTransition", "EffectiveDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.CaseTransition", "EffectiveDate");
        }
    }
}
