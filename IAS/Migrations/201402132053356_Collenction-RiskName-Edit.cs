namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CollenctionRiskNameEdit : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Collection", "RiskName", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Collection", "RiskName", c => c.Long(nullable: false));
        }
    }
}
