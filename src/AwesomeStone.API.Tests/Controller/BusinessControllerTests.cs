using AwesomeStone.API.Tests.Config;
using AwesomeStone.Application.Command.Request;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace AwesomeStone.API.Tests.Controller
{
    [Collection(nameof(IntegrationTestsFixtureCollection))]
    public class BusinessControllerTests
    {
        private readonly IntegrationTestsFixture<Startup> _testsFixture;

        public BusinessControllerTests(IntegrationTestsFixture<Startup> testsFixture)
        {
            _testsFixture = testsFixture;
        }

        [Fact(DisplayName = "Deve criar um valor de bonus ser a distribuido no banco de dados")]
        public async Task Business_CriarValorBonusDistribuido_Retornar200OKSucesso()
        {
            // Arrange
            var command_business = new Operation_ProfitRequest
            {
                Bonus_Distribuided = "R$ 5000"
            };
           
            // Act
            var postResponseBusiness = await _testsFixture.Client.PostAsJsonAsync("/api/business/business", command_business);
            // Assert
            postResponseBusiness.EnsureSuccessStatusCode();
        }
    }
}
