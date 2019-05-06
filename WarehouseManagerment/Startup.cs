using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WarehouseManagerment.Startup))]
namespace WarehouseManagerment
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
