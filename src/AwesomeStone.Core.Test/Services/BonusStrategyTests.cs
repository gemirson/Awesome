using AwesomeStone.Core.Servicos;
using Moq.AutoMock;
using System;
using Xunit;

namespace AwesomeStone.Core.Test.Services
{
    public class BonusStrategyTests
    {

        private readonly AutoMocker _mocker;
        private readonly BonusStrategy sut;

        public BonusStrategyTests()
        {
            _mocker = new AutoMocker();
            sut= _mocker.CreateInstance<BonusStrategy>();
        }

        [Fact(DisplayName = "Calculo do Bonus")]
        public void ServiceEmployee_cauclarBonuscomTodososPesosCorretos_RetornarBonus()
        {
            // Arrange
            var command = new 
            {
                Weight_position = 1,
                Weight_salary=1,
                Weight_year=1,
                salary=5000.0m

            };

            // Act
            var responseResult = sut.CalculateBonus(command.Weight_position,command.Weight_salary,command.Weight_year,command.salary);

            // Assert
            Assert.Equal(120000,responseResult);
        }
    }
}
