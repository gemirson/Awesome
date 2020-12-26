using AwesomeStone.Core.Entidades;
using Moq.AutoMock;
using System.Linq;
using Xunit;

namespace AwesomeStone.Core.Tests.Entidade
{
    public class OperationProfitTests
    {
        private readonly OperationProfit _sut;

        public OperationProfitTests()
        {
             _sut = new OperationProfit(100000.0m);
        }

        [Fact(DisplayName = "Check valor  a ser distribuido é maior que bonus")]
        [Trait("Entidade Business", "O valor do bonus deve ser menor que o saldo a ser distribuido")]
        public void Business_checkvalordistribuido_RetornarFalse()
        {
            // Arrange
            var bonusValue = 20000.0m;

            // Act
            var responseResult = _sut.CheckDistributed_Value(bonusValue);

            // Assert
            Assert.False( responseResult);
        }

        [Fact(DisplayName = "Check valor saldo restante")]
        [Trait("Entidade Business", "O valor do saldo restante")]
        public void Business_CheckValorCaldRestante_RetornarSaldo()
        {
            // Arrange
            var bonusValue = 20000.0m;

            // Act
            _sut.CheckDistributed_Value(bonusValue);
            var responseResult = _sut.ValueBonus;

            // Assert
            Assert.Equal(80000.0m,responseResult);
        }

        [Fact(DisplayName = "Check valor distribuido")]
        [Trait("Entidade Business", "O valor total distribuido")]
        public void Business_TotalBalanceAvailableOValorDistribuido_RetornarValor()
        {
            // Arrange
            var bonusValue = 20000.0m;

            // Act
            _sut.CheckDistributed_Value(bonusValue);
            var responseResult = _sut.Total_Balance_Available();

            // Assert
            Assert.Equal(20000.0m, responseResult);
        }

        [Fact(DisplayName = "Check valor é zero")]
        public void Business_CheckValorDistribuidoZero_RetornarTrue()
        {
            // Arrange
            var sutNulo = new OperationProfit(0.0m);

            // Act
            sutNulo.Validate();
            var responseResult = sutNulo.Notifications.Any();

            // Assert
            Assert.True(responseResult);
           
        }
    }
}
