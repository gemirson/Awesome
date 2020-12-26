using AwesomeStone.Core.Servicos;
using Moq.AutoMock;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace AwesomeStone.Core.Tests.Services
{
    public class OfficeFactoryTests
    {
        private readonly AutoMocker _mocker;
        private readonly OfficeFactory _sut;

        public OfficeFactoryTests()
        {
            _mocker = new AutoMocker();
            _sut = _mocker.CreateInstance<OfficeFactory>();
        }

        [Fact(DisplayName = "Calculo do Peso por Area")]
        public void ServiceEmployee_CalcularPesoPorArea_RetornarPeso()
        {
            // Arrange
            var command = new List<String>()
            {
               "Diretoria" ,
               "Serviços Gerais",
               "Relacionamento com o Cliente",
               "Contabilidade"
            };

            // Act
            var responseResult = new List<int>();

            foreach (string  item in command)
            {
               responseResult.Add( _sut.GetWeightOffice(item));
            }

            // Assert
            Assert.Equal(1, responseResult[0]);
            Assert.Equal(3, responseResult[1]);
            Assert.Equal(5, responseResult[2]);
            Assert.Equal(2, responseResult[3]);
           

        }
    }
}
