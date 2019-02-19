using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SQL_Binding_UI_Test.Startup))]
namespace SQL_Binding_UI_Test
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
