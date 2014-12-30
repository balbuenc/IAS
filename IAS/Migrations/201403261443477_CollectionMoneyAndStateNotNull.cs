namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CollectionMoneyAndStateNotNull : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Collection", "CollectionStateID", "dbo.CollectionState");
            DropForeignKey("dbo.Collection", "CurrencyID", "dbo.Currency");
            DropIndex("dbo.Collection", new[] { "CollectionStateID" });
            DropIndex("dbo.Collection", new[] { "CurrencyID" });
            AlterColumn("dbo.Collection", "CurrencyID", c => c.Int(nullable: false));
            AlterColumn("dbo.Collection", "CollectionStateID", c => c.Int(nullable: false));
            CreateIndex("dbo.Collection", "CollectionStateID");
            CreateIndex("dbo.Collection", "CurrencyID");
            AddForeignKey("dbo.Collection", "CollectionStateID", "dbo.CollectionState", "CollectionStateID", cascadeDelete: true);
            AddForeignKey("dbo.Collection", "CurrencyID", "dbo.Currency", "CurrencyID", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Collection", "CurrencyID", "dbo.Currency");
            DropForeignKey("dbo.Collection", "CollectionStateID", "dbo.CollectionState");
            DropIndex("dbo.Collection", new[] { "CurrencyID" });
            DropIndex("dbo.Collection", new[] { "CollectionStateID" });
            AlterColumn("dbo.Collection", "CollectionStateID", c => c.Int());
            AlterColumn("dbo.Collection", "CurrencyID", c => c.Int());
            CreateIndex("dbo.Collection", "CurrencyID");
            CreateIndex("dbo.Collection", "CollectionStateID");
            AddForeignKey("dbo.Collection", "CurrencyID", "dbo.Currency", "CurrencyID");
            AddForeignKey("dbo.Collection", "CollectionStateID", "dbo.CollectionState", "CollectionStateID");
        }
    }
}
