using AwesomeStone.Application.Command.Request;
using Moq.AutoMock;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace AwesomeStone.Application.Tests.CommandHandlers.Business
{
    public class CriarBusinessHandlerTests
    {
        private readonly AutoMocker _mocker;
        private readonly BusinessApplication _handler;

        public CriarBusinessHandlerTests()
        {
            _mocker = new AutoMocker();
            _handler = _mocker.CreateInstance<BusinessApplication>();
        }

        [Fact(DisplayName = "Não deve criar um bonus com comamdo inválido")]
        public void Business_AoCriarumBusinessComComandoInvalido_RetornarNotificacoesComFalha()
        {

            // Arrange
            var command = new Operation_ProfitRequest
            {
                Bonus_Distribuided = null

            };

            // Act
            var responseResult =  _handler.Add(command);

            // Assert
            Assert.True(responseResult.HasFails);
        }
               
    }
}
