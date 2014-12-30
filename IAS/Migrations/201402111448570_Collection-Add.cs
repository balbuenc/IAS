namespace IAS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CollectionAdd : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Collection",
                c => new
                    {
                        CollectionID = c.Long(nullable: false, identity: true),
                        CaseID = c.Long(nullable: false),
                        PaymentDueDate = c.DateTime(nullable: false),
                        PolicyNumber = c.Long(nullable: false),
                        ReceiptNumber = c.Long(nullable: false),
                        RiskName = c.Long(nullable: false),
                        DebtAmount = c.Decimal(nullable: false, precision: 18, scale: 2),
                        PaymentNumber = c.Int(nullable: false),
                        PersonID = c.Long(nullable: false),
                    })
                .PrimaryKey(t => t.CollectionID)
                .ForeignKey("dbo.Case", t => t.CaseID, cascadeDelete: true)
                .ForeignKey("exchange.personas", t => t.PersonID, cascadeDelete: true)
                .Index(t => t.CaseID)
                .Index(t => t.PersonID);
            
            CreateTable(
                "dbo.SMSNotification",
                c => new
                    {
                        SMSNotificationID = c.Long(nullable: false, identity: true),
                        CaseID = c.Long(nullable: false),
                        MobilePhone = c.String(nullable: false, maxLength: 30),
                        Message = c.String(nullable: false),
                        CreationDate = c.DateTime(nullable: false),
                        ScheduledDendDate = c.DateTime(nullable: false),
                        SendDate = c.DateTime(nullable: true),
                        Sent = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.SMSNotificationID)
                .ForeignKey("dbo.Case", t => t.CaseID, cascadeDelete: true)
                .Index(t => t.CaseID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.SMSNotification", "CaseID", "dbo.Case");
            DropForeignKey("dbo.Collection", "PersonID", "exchange.personas");
            DropForeignKey("dbo.Collection", "CaseID", "dbo.Case");
            DropIndex("dbo.SMSNotification", new[] { "CaseID" });
            DropIndex("dbo.Collection", new[] { "PersonID" });
            DropIndex("dbo.Collection", new[] { "CaseID" });
            DropTable("dbo.SMSNotification");
            DropTable("dbo.Collection");
        }
    }
}
