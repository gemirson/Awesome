using AwesomeStone.Core.Servicos;
using Moq.AutoMock;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace AwesomeStone.Core.Tests.Services
{
    public class WeigthAdmissionTests
    {
        private readonly AutoMocker _mocker;
        private readonly WeigthAdmission sut;

        public WeigthAdmissionTests()
        {
            _mocker = new AutoMocker();
            sut = _mocker.CreateInstance<WeigthAdmission>();
        }

        [Fact(DisplayName = "Calculo por data de admissão")]
        public void ServiceEmployee_CalcularPesoPorDataAdmissao_RetornarPeso()
        {
            // Arrange
            var commandAnos = new List<float>()
            {
               8.30f ,
               6.5f,
               2.9f,
               0.9f
            };

            // Act
            var responseResult = new List<int>();

            foreach (float item in commandAnos)
            {
                responseResult.Add(sut.GetWeigth(item));
            }

            // Assert
            Assert.Equal(5, responseResult[0]);
            Assert.Equal(3, responseResult[1]);
            Assert.Equal(2, responseResult[2]);
            Assert.Equal(1, responseResult[3]);


        }
    }
}
