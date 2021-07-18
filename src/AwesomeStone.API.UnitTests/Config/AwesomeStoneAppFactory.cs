using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.API.Tests.Config
{
    public class AwesomeStoneAppFactory<TStartup> : WebApplicationFactory<TStartup> where TStartup : class
    {
        protected override void ConfigureWebHost(IWebHostBuilder builder)
        {
            builder.UseSetting("https_port", "5001");
            builder.UseEnvironment("Testing");

            builder.ConfigureServices(services =>
            {
               // services.AddScoped<IPagamentoHttpFactory, MockPagamentoHttpFactory>();
            });
        }
    }
}
