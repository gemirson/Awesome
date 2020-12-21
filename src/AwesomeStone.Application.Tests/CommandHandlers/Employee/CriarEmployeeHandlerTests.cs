using AwesomeStone.Application.Command.Request;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Infra.Repository;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.DependencyInjection;
using Moq.AutoMock;
using System;
using System.Collections.Generic;
using Xunit;

namespace AwesomeStone.Application.Tests
{
    public class CriarEmployeeHandlerTests
    {

        private readonly AutoMocker _mocker;
        private readonly EmployeeApplication _handler;
        private readonly BusinessApplication _handler_Business;
        public CriarEmployeeHandlerTests()
        {
            _mocker = new AutoMocker();
            _handler_Business = _mocker.CreateInstance<BusinessApplication>();
            _handler = _mocker.CreateInstance<EmployeeApplication>();
          
        }

        [Fact(DisplayName = "Não deve criar um bonus para o funcionario  com command invalido")]
        public async void Employee_AoCriarumEmployeeComComandoInvalido_RetornarNotificacoesComFalha()
        {            
            // Arrange
            var command = new List<EmployeeRequest>(){ new EmployeeRequest {
                matricula = null,
                nome = null,
                area = null,
                cargo = null,
                salario_bruto = null,
                data_de_admissao= DateTime.Now
            } };
            
            // Act
            var responseResult = await  _handler.AddAsync(command);

            // Assert
            Assert.True(responseResult.HasFails);
        }
        
        [Fact(DisplayName = "Não deve criar um bonus para o funcionario  com valor a ser distribuido insuficiente")]
        public async void Employee_AoCriarumEmployeeComValorBonusInsuficiente_RetornarNotificacoesComFalha()
        {
            // Arrange
            var command_business = new Operation_ProfitRequest
            {
                Bonus_Distribuided = " "

            };
            
            _handler_Business.Add(command_business);

            var command = new List<EmployeeRequest>(){ new EmployeeRequest {
                matricula = "0007676",
                nome =  "Maricela Martin",
                area = "Serviços Gerais",
                cargo =  "Copeiro",
                salario_bruto =  "R$ 1.591,69",
                data_de_admissao= DateTime.Parse("2018-01-17")
            } };

            // Act
            var responseResult = await _handler.AddAsync(command);

            // Assert
            Assert.True(responseResult.HasFails);
        }
    }
}
