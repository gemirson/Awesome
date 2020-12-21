using AwesomeStone.Core.Servicos;
using Moq.AutoMock;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace AwesomeStone.Core.Tests.Services
{
    public class WeigthSalaryTests
    {
        private readonly AutoMocker _mocker;
        private readonly WeigthSalary sut;

        public WeigthSalaryTests()
        {
            _mocker = new AutoMocker();
            sut = _mocker.CreateInstance<WeigthSalary>();
        }

        [Fact(DisplayName = "Calculo por faixa salarial")]
        public void ServiceEmployee_CalcularPesoPorFaixaSalarial_RetornarPeso()
        {
            // Arrange
            var commandAnos = new List<float>()
            {
               8.30f,
               6.50f,
               4.30f,
               2.70f
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
