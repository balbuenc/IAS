using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IAS.Startup))]
namespace IAS
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
