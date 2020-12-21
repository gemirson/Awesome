using Microsoft.AspNetCore.Mvc.Testing;
using System;
using System.Net.Http;
using Xunit;
using AwesomeStone.API;

namespace AwesomeStone.API.Tests.Config
{
    [CollectionDefinition(nameof(IntegrationTestsFixtureCollection))]
    public class IntegrationTestsFixtureCollection : ICollectionFixture<IntegrationTestsFixture<Startup>>
    { }
    public class IntegrationTestsFixture<TStartup> : IDisposable where TStartup : class
    {
        public readonly AwesomeStoneAppFactory<TStartup> Factory;
        public HttpClient Client;

        public IntegrationTestsFixture()
        {
            var clientOptions = new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = true,
                BaseAddress = new Uri("https://localhost")
            };

            Factory = new AwesomeStoneAppFactory<TStartup>();

            Client = Factory.CreateClient(clientOptions);
        }
        
        public void Dispose()
        {
            Factory.Dispose();
            Client.Dispose();
            
        }
    }
}
