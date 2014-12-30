namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PaymentDayAdded : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ClientPaymentDay",
                c => new
                    {
                        ClientPaymentDayID = c.Long(nullable: false, identity: true),
                        PaymentDay = c.Int(nullable: false),
                        PersonID = c.Long(nullable: false),
                    })
                .PrimaryKey(t => t.ClientPaymentDayID)
                .ForeignKey("exchange.personas", t => t.PersonID, cascadeDelete: false)
                .Index(t => t.PersonID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.ClientPaymentDay", "PersonID", "exchange.personas");
            DropIndex("dbo.ClientPaymentDay", new[] { "PersonID" });
            DropTable("dbo.ClientPaymentDay");
        }
    }
}
