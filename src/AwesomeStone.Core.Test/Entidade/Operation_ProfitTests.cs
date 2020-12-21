using AwesomeStone.Core.Entidades;
using Moq.AutoMock;
using System.Linq;
using Xunit;

namespace AwesomeStone.Core.Tests.Entidade
{
    public class Operation_ProfitTests
    {
        private readonly Operation_Profit sut;

        public Operation_ProfitTests()
        {
             sut = new Operation_Profit(100000.0m);
        }

        [Fact(DisplayName = "Check valor  a ser distribuido")]
        public void Business_checkvalordistribuido_RetornarFalse()
        {
            // Arrange
            var bonus_value = 20000.0m;

            // Act
            var responseResult = sut.CheckDistributed_Value(bonus_value);

            // Assert
            Assert.False( responseResult);
        }

        [Fact(DisplayName = "Check valor saldo restante")]
        public void Business_checkvalorsaldorestante_RetornarSaldo()
        {
            // Arrange
            var bonus_value = 20000.0m;

            // Act
            sut.CheckDistributed_Value(bonus_value);
            var responseResult = sut.Value_Bonus;

            // Assert
            Assert.Equal(80000.0m,responseResult);
        }

        [Fact(DisplayName = "Check valor distribuido")]
        public void Business_checkvalordistribuido_RetornarValor()
        {
            // Arrange
            var bonus_value = 20000.0m;

            // Act
            sut.CheckDistributed_Value(bonus_value);
            var responseResult = sut.Total_Balance_Available();

            // Assert
            Assert.Equal(20000.0m, responseResult);
        }

        [Fact(DisplayName = "Check valor é zero")]
        public void Business_checkvalordistribuidoZero_RetornarTrue()
        {
            // Arrange
            var sut_nulo = new Operation_Profit(0.0m);

            // Act
            sut_nulo.Validate();
            var responseResult = sut_nulo.Notifications.Any();

            // Assert
            Assert.True(responseResult);
        }
    }
}
