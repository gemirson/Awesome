using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.DTOs;
using Moq.AutoMock;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace AwesomeStone.Application.Tests.CommandHandlers.Business
{
    public class CriarBusinessHandlerTests
    {
        private readonly BusinessApplication _handler;

        public CriarBusinessHandlerTests()
        {
            var mocker = new AutoMocker();
            mocker.CreateInstance<CacheConfig>();
            mocker.Use(new CacheConfig { Key = "Value_Bonus" });
            _handler = mocker.CreateInstance<BusinessApplication>();
        }

        [Fact(DisplayName = "Não deve adicionar  um  valor ser distribuido com comamdo inválido")]
        [Trait("Business", "Adicionar um valor a ser distribuido")]
        public void Business_AdicionarUmValoraSerDistribuidoComComandoInvalido_RetornarNotificacoesComFalha()
        {
            //----------------------------------- Arrange -------------------------//
            var command = new Operation_ProfitRequest
            {
                Bonus_Distribuided = null

            };

            //----------------------------------- Act ----------------------------//
            var responseResult =  _handler.Add(command);

            //---------------------------------- Assert --------------------------//
            Assert.True(responseResult.HasFails);
        }
               
    }
}
