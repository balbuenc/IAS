namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CollectionMethodNotNull : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Collection", "CollectionMethodID", "dbo.CollectionMethod");
            DropIndex("dbo.Collection", new[] { "CollectionMethodID" });
            AlterColumn("dbo.Collection", "CollectionMethodID", c => c.Int(nullable: false));
            CreateIndex("dbo.Collection", "CollectionMethodID");
            AddForeignKey("dbo.Collection", "CollectionMethodID", "dbo.CollectionMethod", "CollectionMethodID", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Collection", "CollectionMethodID", "dbo.CollectionMethod");
            DropIndex("dbo.Collection", new[] { "CollectionMethodID" });
            AlterColumn("dbo.Collection", "CollectionMethodID", c => c.Int());
            CreateIndex("dbo.Collection", "CollectionMethodID");
            AddForeignKey("dbo.Collection", "CollectionMethodID", "dbo.CollectionMethod", "CollectionMethodID");
        }
    }
}
