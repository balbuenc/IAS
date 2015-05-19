using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using IAS.Models.Mapping;

namespace IAS.Models
{
    public partial class IAS_DeveloperContext : DbContext
    {
        static IAS_DeveloperContext()
        {
            Database.SetInitializer<IAS_DeveloperContext>(null);
        }

        public IAS_DeveloperContext()
            : base("Name=IAS_DeveloperContext")
        {
        }

        public DbSet<Claim> Claims { get; set; }
        public DbSet<ClaimContactHistory> ClaimContactHistories { get; set; }
        public DbSet<ClaimStatu> ClaimStatus { get; set; }
        public DbSet<Liquidator> Liquidators { get; set; }
        public DbSet<WorkShop> WorkShops { get; set; }
        public DbSet<Alarm> Alarms { get; set; }
        public DbSet<AppConfig> AppConfigs { get; set; }
        public DbSet<AspNetRole> AspNetRoles { get; set; }
        public DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public DbSet<AspNetUser> AspNetUsers { get; set; }
        public DbSet<Case> Cases { get; set; }
        public DbSet<CasePriority> CasePriorities { get; set; }
        public DbSet<CaseTransition> CaseTransitions { get; set; }
        public DbSet<Claim1> Claim1 { get; set; }
        public DbSet<ClaimContactHistory1> ClaimContactHistory1 { get; set; }
        public DbSet<ClaimStatu1> ClaimStatus1 { get; set; }
        public DbSet<ClientPaymentDay> ClientPaymentDays { get; set; }
        public DbSet<Collection> Collections { get; set; }
        public DbSet<CollectionMethod> CollectionMethods { get; set; }
        public DbSet<CollectionState> CollectionStates { get; set; }
        public DbSet<ContactDestination> ContactDestinations { get; set; }
        public DbSet<ContactType> ContactTypes { get; set; }
        public DbSet<Currency> Currencies { get; set; }
        public DbSet<Form> Forms { get; set; }
        public DbSet<InsuranceManagerContact> InsuranceManagerContacts { get; set; }
        public DbSet<InsuranceManager> InsuranceManagers { get; set; }
        public DbSet<Liquidator1> Liquidator1 { get; set; }
        public DbSet<RoleStateTransition> RoleStateTransitions { get; set; }
        public DbSet<SMSMessage> SMSMessages { get; set; }
        public DbSet<SMSNotification> SMSNotifications { get; set; }
        public DbSet<State> States { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<UserStateTransition> UserStateTransitions { get; set; }
        public DbSet<Workflow> Workflows { get; set; }
        public DbSet<WorkflowStateForm> WorkflowStateForms { get; set; }
        public DbSet<WorkflowStateTransition> WorkflowStateTransitions { get; set; }
        public DbSet<WorkShop1> WorkShop1 { get; set; }
        public DbSet<caso> casos { get; set; }
        public DbSet<Cotizacione> Cotizaciones { get; set; }
        public DbSet<mapfre_collections> mapfre_collections { get; set; }
        public DbSet<mapfre_collections_history> mapfre_collections_history { get; set; }
        public DbSet<persona> personas { get; set; }
        public DbSet<personas_import> personas_import { get; set; }
        public DbSet<receipts_expired> receipts_expired { get; set; }
        public DbSet<receipts_to_expire> receipts_to_expire { get; set; }
        public DbSet<sancor_collections_history> sancor_collections_history { get; set; }
        public DbSet<sendmail> sendmails { get; set; }
        public DbSet<Tipos_documentos> Tipos_documentos { get; set; }
        public DbSet<ActualMonthCollected> ActualMonthCollecteds { get; set; }
        public DbSet<ActualMonthGoal> ActualMonthGoals { get; set; }
        public DbSet<AllCollectionsDetail> AllCollectionsDetails { get; set; }
        public DbSet<CasesManaged> CasesManageds { get; set; }
        public DbSet<CasesResume> CasesResumes { get; set; }
        public DbSet<CaseTransitionResume> CaseTransitionResumes { get; set; }
        public DbSet<CollectionProcastination> CollectionProcastinations { get; set; }
        public DbSet<CollectionsDetailsGoal> CollectionsDetailsGoals { get; set; }
        public DbSet<CollectionsDetailsStatu> CollectionsDetailsStatus { get; set; }
        public DbSet<ExpiredGoal> ExpiredGoals { get; set; }
        public DbSet<UserCaseAssigment> UserCaseAssigments { get; set; }
        public DbSet<v_alarmas_activas> v_alarmas_activas { get; set; }
        public DbSet<v_mapfre_join> v_mapfre_join { get; set; }
        public DbSet<v_personas_fisicas> v_personas_fisicas { get; set; }
        public DbSet<v_personas_juridicas> v_personas_juridicas { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new ClaimMap());
            modelBuilder.Configurations.Add(new ClaimContactHistoryMap());
            modelBuilder.Configurations.Add(new ClaimStatuMap());
            modelBuilder.Configurations.Add(new LiquidatorMap());
            modelBuilder.Configurations.Add(new WorkShopMap());
            modelBuilder.Configurations.Add(new AlarmMap());
            modelBuilder.Configurations.Add(new AppConfigMap());
            modelBuilder.Configurations.Add(new AspNetRoleMap());
            modelBuilder.Configurations.Add(new AspNetUserClaimMap());
            modelBuilder.Configurations.Add(new AspNetUserLoginMap());
            modelBuilder.Configurations.Add(new AspNetUserMap());
            modelBuilder.Configurations.Add(new CaseMap());
            modelBuilder.Configurations.Add(new CasePriorityMap());
            modelBuilder.Configurations.Add(new CaseTransitionMap());
            modelBuilder.Configurations.Add(new Claim1Map());
            modelBuilder.Configurations.Add(new ClaimContactHistory1Map());
            modelBuilder.Configurations.Add(new ClaimStatu1Map());
            modelBuilder.Configurations.Add(new ClientPaymentDayMap());
            modelBuilder.Configurations.Add(new CollectionMap());
            modelBuilder.Configurations.Add(new CollectionMethodMap());
            modelBuilder.Configurations.Add(new CollectionStateMap());
            modelBuilder.Configurations.Add(new ContactDestinationMap());
            modelBuilder.Configurations.Add(new ContactTypeMap());
            modelBuilder.Configurations.Add(new CurrencyMap());
            modelBuilder.Configurations.Add(new FormMap());
            modelBuilder.Configurations.Add(new InsuranceManagerContactMap());
            modelBuilder.Configurations.Add(new InsuranceManagerMap());
            modelBuilder.Configurations.Add(new Liquidator1Map());
            modelBuilder.Configurations.Add(new RoleStateTransitionMap());
            modelBuilder.Configurations.Add(new SMSMessageMap());
            modelBuilder.Configurations.Add(new SMSNotificationMap());
            modelBuilder.Configurations.Add(new StateMap());
            modelBuilder.Configurations.Add(new sysdiagramMap());
            modelBuilder.Configurations.Add(new UserStateTransitionMap());
            modelBuilder.Configurations.Add(new WorkflowMap());
            modelBuilder.Configurations.Add(new WorkflowStateFormMap());
            modelBuilder.Configurations.Add(new WorkflowStateTransitionMap());
            modelBuilder.Configurations.Add(new WorkShop1Map());
            modelBuilder.Configurations.Add(new casoMap());
            modelBuilder.Configurations.Add(new CotizacioneMap());
            modelBuilder.Configurations.Add(new mapfre_collectionsMap());
            modelBuilder.Configurations.Add(new mapfre_collections_historyMap());
            modelBuilder.Configurations.Add(new personaMap());
            modelBuilder.Configurations.Add(new personas_importMap());
            modelBuilder.Configurations.Add(new receipts_expiredMap());
            modelBuilder.Configurations.Add(new receipts_to_expireMap());
            modelBuilder.Configurations.Add(new sancor_collections_historyMap());
            modelBuilder.Configurations.Add(new sendmailMap());
            modelBuilder.Configurations.Add(new Tipos_documentosMap());
            modelBuilder.Configurations.Add(new ActualMonthCollectedMap());
            modelBuilder.Configurations.Add(new ActualMonthGoalMap());
            modelBuilder.Configurations.Add(new AllCollectionsDetailMap());
            modelBuilder.Configurations.Add(new CasesManagedMap());
            modelBuilder.Configurations.Add(new CasesResumeMap());
            modelBuilder.Configurations.Add(new CaseTransitionResumeMap());
            modelBuilder.Configurations.Add(new CollectionProcastinationMap());
            modelBuilder.Configurations.Add(new CollectionsDetailsGoalMap());
            modelBuilder.Configurations.Add(new CollectionsDetailsStatuMap());
            modelBuilder.Configurations.Add(new ExpiredGoalMap());
            modelBuilder.Configurations.Add(new UserCaseAssigmentMap());
            modelBuilder.Configurations.Add(new v_alarmas_activasMap());
            modelBuilder.Configurations.Add(new v_mapfre_joinMap());
            modelBuilder.Configurations.Add(new v_personas_fisicasMap());
            modelBuilder.Configurations.Add(new v_personas_juridicasMap());
        }
    }
}
