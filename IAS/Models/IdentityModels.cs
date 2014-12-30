//«Copyright 2014 Balcazz HT, http://www.balcazzht.com»

//This file is part of IAS | Insurance Advanced Services.

//IAS is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//IAS is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with Foobar.  If not, see <http://www.gnu.org/licenses/>.


using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Web;
using System;
using IAS.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using IAS.Mappings;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace IAS.Models
{
    // You can add User data for the user by adding more properties to your User class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public ApplicationUser() {
            Alarms = new HashSet<Alarm>();
        }
        [Required, StringLength(120)]
        public string FirstName { get; set; }
        [Required, StringLength(120)]
        public string LastName { get; set; }
        [Required, StringLength(120),DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required, StringLength(150)]
        public string Phone { get; set; }

        public virtual ICollection<Alarm> Alarms { get; set; }
        public virtual ICollection<Person> Persons { get; set; }

        [NotMapped]
        public virtual string FullName{
            get { return string.Format("{0} {1}", FirstName, LastName); } 
        }

        public override string ToString()
        {
            return string.Format("{0} {1}", FirstName, LastName); 
        }

        [NotMapped]
        public virtual ICollection<String> ApplicationRoles
        {
            get {
                return Roles.Select(r => r.RoleId).ToList(); 
            }
        }

    }

    #region Roles
    
    public class ApplicationRole : IdentityRole {

        public ApplicationRole( ):this(string.Empty) {            
        }

        public ApplicationRole( string name ):base(name) {
            Alarms = new HashSet<Alarm>();
        }

        //public ApplicationRole( IdentityUserRole role):base(role.Role.Name){
        //    Id = role.RoleId;                        
        //}

        public virtual ICollection<Alarm> Alarms { get; set; }
    }

    #endregion //Roles

    #region Context

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base( "IASDBContext" )
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Configurations.Add( new PersonMap() );
            modelBuilder.Configurations.Add( new DocumentTypeMap() );
            modelBuilder.Configurations.Add( new UserCaseAssigmentMap() );
            modelBuilder.Configurations.Add( new ApplicationRoleMap());

            //modelBuilder.Entity<State>().ToTable("State", "Workflow");
            //modelBuilder.Properties<string>().Configure(p => p.IsUnicode(false));
            modelBuilder.Properties<string>().Configure(x => x.HasColumnType("VARCHAR"));
        }

        public DbSet<State> States { get; set; }
        public DbSet<Workflow> Workflows { get; set; }
        public DbSet<Form> Forms { get; set; }
        public DbSet<WorkflowStateTransition> WorkflowStateTransitions { get; set; }
        public DbSet<Alarm> Alarms { get; set; }
        public DbSet<UserStateTransition> UserStateTransitions { get; set; }
        public DbSet<RoleStateTransition> RoleStateTransitions { get; set; }
        public DbSet<CasePriority> CasePriorities { get; set; }
        public DbSet<Case> Cases { get; set; }
        public DbSet<CaseTransition> CaseTransitions { get; set; }
        public DbSet<Person> Persons { get; set; }
        public DbSet<UserCaseAssigment> UserCaseAssigments { get; set; }
        public DbSet<ApplicationRole> ApplicationRoles { get; set; }
        public DbSet<WorkflowStateForm> WorkflowStatesForms { get; set; }
        public DbSet<Collection> Collections { get; set; }
        public DbSet<SMSNotification> SMSNotification { get; set; }
        public DbSet<AppConfig> AppConfigs { get; set; }
        public DbSet<Currency> Currencies { get; set; }
        public DbSet<CollectionState> CollectionStates { get; set; }
        public DbSet<CollectionMethod> CollectionMethods { get; set; }
        public DbSet<ClientPaymentDay> ClientPaymentDays { get; set; }

        public DbSet<ContactType> ContactTypes { get; set; }

        public DbSet<ContactDestination> ContactDestinations { get; set; }

        public DbSet<Liquidator> Liquidators { get; set; }

        public DbSet<WorkShop> WorkShops { get; set; }

        public DbSet<ClaimStatu> ClaimStatus { get; set; }

        public DbSet<Claim> Claims { get; set; }

        public DbSet<ClaimContactHistory> ClaimContactHistories { get; set; }
    }

    #endregion //Context

    #region Helpers
    public class UserManager : UserManager<ApplicationUser>
    {
        public UserManager()
            : base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
        {
        }
    }

    public class IdentityManager {
        public bool RoleExists( string name ) {
            var rm = new RoleManager<ApplicationRole>(
                new RoleStore<ApplicationRole>( new ApplicationDbContext() ) );
            return rm.RoleExists( name );
        }

        public bool CreateRole( string name ) {
            var rm = new RoleManager<ApplicationRole>(
                new RoleStore<ApplicationRole>( new ApplicationDbContext() ) );
            var idResult = rm.Create( new ApplicationRole( name ) );
            return idResult.Succeeded;
        }

        public bool CreateUser( ApplicationUser user, string password ) {
            var um = new UserManager<ApplicationUser>(
                new UserStore<ApplicationUser>( new ApplicationDbContext() ) );
            var idResult = um.Create( user, password );
            return idResult.Succeeded;
        }


        public bool AddUserToRole( string userId, string roleName ) {
            var um = new UserManager<ApplicationUser>(
                new UserStore<ApplicationUser>( new ApplicationDbContext() ) );
            var idResult = um.AddToRole( userId, roleName );
            return idResult.Succeeded;
        }

        public void ClearUserRoles( string userId ) {
            var um = new UserManager<ApplicationUser>(
                new UserStore<ApplicationUser>( new ApplicationDbContext() ) );
            var user = um.FindById( userId );
            var currentRoles = new List<IdentityUserRole>();
            currentRoles.AddRange( user.Roles );
            foreach ( var role in currentRoles ) {
                um.RemoveFromRole( userId, role.Role.Name );
            }
        }
    }
}

namespace IAS
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public static void SignIn(UserManager manager, ApplicationUser user, bool isPersistent)
        {
            IAuthenticationManager authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request[ProviderNameKey];
        }

        public static string GetExternalLoginRedirectUrl(string accountProvider)
        {
            return "/Account/RegisterExternalLogin?" + ProviderNameKey + "=" + accountProvider;
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/");
            }
        }
    }
    #endregion
}