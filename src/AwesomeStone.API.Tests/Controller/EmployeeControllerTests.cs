using AwesomeStone.API.Tests.Config;
using AwesomeStone.Application.Command.Request;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace AwesomeStone.API.Tests.Controller
{
    [Collection(nameof(IntegrationTestsFixtureCollection))]
    public class EmployeeControllerTests
    {
        private readonly IntegrationTestsFixture<Startup> _testsFixture;

        public EmployeeControllerTests(IntegrationTestsFixture<Startup> testsFixture)
        {
            _testsFixture = testsFixture;
        }

        [Fact(DisplayName = "Deve criar um bonus de um employee no banco de dados")]
        public async Task Employee_CriarBonus_Retornar200OKSucesso()
        {
            // Arrange
            var command_business = new Operation_ProfitRequest
            {
                Bonus_Distribuided = "R$ 500000"

            };
                       
            var commandEmployeeRequest = new List<EmployeeRequest>(){ new EmployeeRequest {
                matricula = "0007676",
                nome =  "Maricela Martin",
                area = "Serviços Gerais",
                cargo =  "Copeiro",
                salario_bruto =  "R$ 1.591,69",
                data_de_admissao= DateTime.Parse("2018-01-17")
            } };

            // Act
            var postResponseBusiness = await _testsFixture.Client.PostAsJsonAsync("/api/business/business", command_business);

            var postResponse = await _testsFixture.Client.PostAsJsonAsync("/api/employee/bonus", commandEmployeeRequest);

           // Assert
            Assert.Equal(HttpStatusCode.Created, postResponse.StatusCode);
        }

        [Fact(DisplayName = "Deve criar um bonus de um employee com valor a ser distribuido insuficiente")]
        public async Task Employee_CriarBonusComValorDistribuidoInsuficiente_Retornar400BadRequest()
        {
            // Arrange
            var command_business = new Operation_ProfitRequest
            {
                Bonus_Distribuided = "R$ 30000"

            };

            var commandEmployeeRequest = new List<EmployeeRequest>(){ new EmployeeRequest {
                matricula = "0007676",
                nome =  "Maricela Martin",
                area = "Serviços Gerais",
                cargo =  "Copeiro",
                salario_bruto =  "R$ 1.591,69",
                data_de_admissao= DateTime.Parse("2018-01-17")
            } };

            // Act
            var postResponseBusiness = await _testsFixture.Client.PostAsJsonAsync("/api/business/business", command_business);

            var postResponse = await _testsFixture.Client.PostAsJsonAsync("/api/employee/bonus", commandEmployeeRequest);

            // Assert
            Assert.Equal(HttpStatusCode.BadRequest, postResponse.StatusCode);
        }


        [Fact(DisplayName = "Não deve criar um bonus de um employee no banco de dados")]
        public async Task Employee_NaoCriarEmployee_Retornar400BadRequest()
        {
            var command_business = new Operation_ProfitRequest
            {
                Bonus_Distribuided = " "

            };
            var commandEmployeeRequest = new List<EmployeeRequest>(){ new EmployeeRequest {
                matricula = "0007676",
                nome =  "Maricela Martin",
                area = "Serviços Gerais",
                cargo =  "Copeiro",
                salario_bruto =  "R$ 1.591,69",
                data_de_admissao= DateTime.Parse("2018-01-17")
            } };

            // Act
            var postResponseBusiness = _testsFixture.Client.PostAsJsonAsync("/api/business/business", command_business);

            var postResponse = await _testsFixture.Client.PostAsJsonAsync("/api/employee/bonus", commandEmployeeRequest);

            // Assert
            Assert.Equal(HttpStatusCode.BadRequest, postResponse.StatusCode);
        }
    }
}
