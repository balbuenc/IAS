namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CollectionMethodAdded : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CollectionMethod",
                c => new
                    {
                        CollectionMethodID = c.Int(nullable: false, identity: true),
                        Code = c.String(nullable: false, maxLength: 2, fixedLength: true, unicode: false),
                        CollectionMethodName = c.String(nullable: false, maxLength: 50, unicode: false),
                    })
                .PrimaryKey(t => t.CollectionMethodID);
            
            AddColumn("dbo.Collection", "CollectionMethodID", c => c.Int());
            CreateIndex("dbo.Collection", "CollectionMethodID");
            AddForeignKey("dbo.Collection", "CollectionMethodID", "dbo.CollectionMethod", "CollectionMethodID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Collection", "CollectionMethodID", "dbo.CollectionMethod");
            DropIndex("dbo.Collection", new[] { "CollectionMethodID" });
            DropColumn("dbo.Collection", "CollectionMethodID");
            DropTable("dbo.CollectionMethod");
        }
    }
}
