namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CollectionMoneyAndState : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CollectionState",
                c => new
                    {
                        CollectionStateID = c.Int(nullable: false, identity: true),
                        CollectionStateName = c.String(nullable: false, maxLength: 50, unicode: false),
                    })
                .PrimaryKey(t => t.CollectionStateID);
            
            CreateTable(
                "dbo.Currency",
                c => new
                    {
                        CurrencyID = c.Int(nullable: false, identity: true),
                        Code = c.String(nullable: false, maxLength: 3, fixedLength: true, unicode: false),
                        Denomination = c.String(nullable: false, maxLength: 50, unicode: false),
                    })
                .PrimaryKey(t => t.CurrencyID);
            
            AddColumn("dbo.Collection", "Collected", c => c.Boolean(nullable: false));
            AddColumn("dbo.Collection", "CollectedDate", c => c.DateTime());
            AddColumn("dbo.Collection", "CurrencyID", c => c.Int());
            AddColumn("dbo.Collection", "CollectionStateID", c => c.Int());
            CreateIndex("dbo.Collection", "CollectionStateID");
            CreateIndex("dbo.Collection", "CurrencyID");
            AddForeignKey("dbo.Collection", "CollectionStateID", "dbo.CollectionState", "CollectionStateID");
            AddForeignKey("dbo.Collection", "CurrencyID", "dbo.Currency", "CurrencyID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Collection", "CurrencyID", "dbo.Currency");
            DropForeignKey("dbo.Collection", "CollectionStateID", "dbo.CollectionState");
            DropIndex("dbo.Collection", new[] { "CurrencyID" });
            DropIndex("dbo.Collection", new[] { "CollectionStateID" });
            DropColumn("dbo.Collection", "CollectionStateID");
            DropColumn("dbo.Collection", "CurrencyID");
            DropColumn("dbo.Collection", "CollectedDate");
            DropColumn("dbo.Collection", "Collected");
            DropTable("dbo.Currency");
            DropTable("dbo.CollectionState");
        }
    }
}
