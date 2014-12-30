namespace IAS.Migrations
{
    using IAS.Models;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.IO;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<IAS.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            ContextKey = "IAS.Models.ApplicationDbContext";
        }

        protected override void Seed(IAS.Models.ApplicationDbContext context)
        {

            //Roles
            var identityManager = new IdentityManager();
            identityManager.CreateRole("Identity Manager");
            identityManager.CreateRole("Master Data Manager");
            var elio = context.Users.SingleOrDefault(u => u.UserName == "elio");
            if (null != elio)
                identityManager.AddUserToRole(elio.Id, "Identity Manager");

            var marco = context.Users.SingleOrDefault(u => u.UserName == "marco");
            if (null != marco)
                identityManager.AddUserToRole(marco.Id, "Identity Manager");

            // Usuarios
            var store = new UserStore<ApplicationUser>(context);
            var manager = new UserManager<ApplicationUser>(store);
            var user = new ApplicationUser
            {
                UserName = "elio",
                FirstName = "Elio",
                LastName = "Batista",
                Email = "elio.rbg@gmail.com",
                Phone = "123456,789456"
            };
            manager.Create(user, "cuban*");

            var user2 = new ApplicationUser
            {
                UserName = "marco",
                FirstName = "Marco",
                LastName = "Gulino",
                Email = "marco.gulino@gmail.com",
                Phone = "0993595988"
            };
            manager.Create(user2, "futb*l");

            var user3 = new ApplicationUser
            {
                UserName = "christian",
                FirstName = "Christian",
                LastName = "Balbuena",
                Email = "cbalbuena.cazzola@gmail.com",
                Phone = "123456,789456"
            };
            manager.Create(user3, "@zure1");

            //context.Database.ExecuteSqlCommand("update AspNetUsers set FirstName ='Nombre', LastName='Apellido',Email='somebody@somedomain.com',Phone='123456,789456'");
            // CasePriority
            context.CasePriorities.AddOrUpdate(
                    s => s.PriorityName,
                    new CasePriority
                    {
                        PriorityName = "Alta"
                    },
                    new CasePriority
                    {
                        PriorityName = "Media"
                    },
                    new CasePriority
                    {
                        PriorityName = "Baja"
                    }
                );
            // State
            context.States.AddOrUpdate(
                s => s.StateName,
                new State
                {
                    StateName = "Pendiente",
                    Active = true
                },
                new State
                {
                    StateName = "Incontactable",
                    Active = true
                },
                new State
                {
                    StateName = "Promesa de pago",
                    Active = true
                },
                new State
                {
                    StateName = "Pago realizado",
                    Active = true
                },
                new State
                {
                    StateName = "Volver a contactar",
                    Active = true
                },
                new State
                {
                    StateName = "Pago condicionado",
                    Active = true
                },
                new State
                {
                    StateName = "Condición de pago procesada",
                    Active = true
                },
                new State
                {
                    StateName = "Condición de pago inviable",
                    Active = true
                },
                new State
                {
                    StateName = "Pago no registrado",
                    Active = true
                },
                new State
                {
                    StateName = "Notificado al cliente",
                    Active = true
                },
                new State
                {
                    StateName = "Notificado a la aseguradora",
                    Active = true
                }
            );

            // Workflow
            var wf1 = new Workflow
            {
                WorkflowName = "Siniestros"
            };
            var wf2 = new Workflow
            {
                WorkflowName = "Cobranzas"
            };

            var wf3 = new Workflow
            {
                WorkflowName = "Renovaciones"
            };
            context.Workflows.AddOrUpdate(
                w => w.WorkflowName,
                wf1, wf2, wf3
            );

            // Forms
            context.Forms.AddOrUpdate(
                f => f.FormName,
                new Form
                {
                    FormName = "SiniestroCargaFotoForm",
                    Url = "SiniestroCargaFotoForm.aspx"
                    //,Workflow = wf1
                },
                new Form
                {
                    FormName = "CobranzaLlamadaForm",
                    Url = "CobranzaLlamadaForm.aspx"
                    //,Workflow = wf2
                },
                new Form
                {
                    FormName = "NuevoClienteForm",
                    Url = "NuevoClienteForm.aspx"
                    //,Workflow = wf3
                }
            );

            // Money
            context.Currencies.AddOrUpdate(
                    s => s.Code,
                    new Currency
                    {
                        Code = "PYG",
                        Denomination = "Guaranies"
                    },
                    new Currency
                    {
                        Code = "USD",
                        Denomination = "Dolares"
                    }
           );

            // CollectionState
            context.CollectionStates.AddOrUpdate(
                    s => s.CollectionStateName,
                    new CollectionState
                    {
                        CollectionStateName = "Cobrado"
                    },
                    new CollectionState
                    {
                        CollectionStateName = "Vencido"
                    }
                    ,
                    new CollectionState
                    {
                        CollectionStateName = "A vencer"
                    },
                    new CollectionState
                    {
                        CollectionStateName = "Corroborar pago"
                    }  
           );

            // CollectionState
            context.CollectionMethods.AddOrUpdate(
                    s => s.CollectionMethodName,
                    new CollectionMethod
                    {
                        Code = "IN",
                        CollectionMethodName = "Indeterminado"

                    },
                    new CollectionMethod
                    {
                        Code = "CO",
                        CollectionMethodName = "Cobrador"
                    }
                    ,
                    new CollectionMethod
                    {
                        Code = "TA",
                        CollectionMethodName = "Tarjeta"
                    },
                    new CollectionMethod
                    {
                        Code = "DB",
                        CollectionMethodName = "Debito"
                    }
           );

           //context.Database.ExecuteSqlCommand( "update collection set CollectionMethodID=1" ); 
           //context.AppConfigs.AddOrUpdate(
           //     cfg => cfg.CollectionWorkflowID,
           //     new AppConfig
           //     {
           //         CollectionWorkflow = context.Workflows.Where( w => w.WorkflowID == 2 ).First(),
           //         DefaultCasePriority = context.CasePriorities.First(),
           //         CollectionInitialState = context.States.Single( s => s.StateID == 1 ),
           //         CollectionFinalState = context.States.Single( s => s.StateID == 4 ),                    
           //         DefaultUser = marco,
           //         EffectiveDaysThreshold = 2
           //     }                
           // );

            //DocumentType & Person Bulk Data
            //var dirBase = AppDomain.CurrentDomain.BaseDirectory.Replace(@"\bin", string.Empty) + @"\Migrations";
            //context.Database.ExecuteSqlCommand(File.ReadAllText(dirBase + @"\ExchangeSchemaData.sql"));

            // Workflow states transition
            //context.WorkflowStateTransitions.AddOrUpdate(
            //    wt => wt.WorkflowID,
            //    new WorkflowStateTransition
            //    {
            //        WorkflowID = context.Workflows.Take(1).Single().WorkflowID,
            //        InitialStateID = context.States.Take(1).Single().StateID,
            //        FinalStateID = context.States.Take(2).Last().StateID,
            //    },
            //    new WorkflowStateTransition
            //    {
            //        WorkflowID = context.Workflows.Take(1).Single().WorkflowID,
            //        InitialStateID = context.States.Take(2).Last().StateID,
            //        FinalStateID = context.States.Take(3).Last().StateID,
            //    }
            //);
        }
    }
}
