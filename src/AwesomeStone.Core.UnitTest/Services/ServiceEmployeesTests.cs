using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Servicos;
using Moq.AutoMock;
using System;
using Xunit;

namespace AwesomeStone.Core.Tests.Services
{
    public class ServiceEmployeesTests
    {
        private readonly AutoMocker _mocker;
        private readonly EmployeeService _sut;

        public ServiceEmployeesTests()
        {
            _mocker = new AutoMocker();
            _sut = _mocker.CreateInstance<EmployeeService>();
        }

        [Fact(DisplayName = "Calculo bonus")]
        public void ServiceEmployee_CalcularPesoPorFaixaSalarial_RetornarPeso()
        {
            // Arrange
            var commandEmployee = new Employee("0009968", "Victor Wilson", "Diretoria", "Diretor Financeiro", 12696.20m,0.0m,DateTime.Parse("2012-01-05"));
          
            // Act
            var responseResult = _sut.GetBonus(commandEmployee);
                       
            // Assert
            Assert.Equal(0, responseResult);
           
        }

        [Fact(DisplayName = "Convert o salario bruto para padrão em decimal")]
        [Trait("Servico Employee","Convert o salario para decimal")]
        public void ServiceEmployee_ConverterSalarioBrutoParaDecimalRemovendoSimboloMonetario_RetornarSalario()
        {
            // Arrange
            var salary = "R$  2.215,00";

            // Act
            var responseResult = _sut.GetSalaryConvert(salary);

            // Assert
            Assert.Equal(2215.00m, responseResult);

        }

        [Fact(DisplayName = "Convert o salario bruto para padrão em decimal com valor nulo")]
        [Trait("Servico Employee", "O valor do salario passado é nulo")]
        public void ServiceEmployee_ConverterSalarioBrutoParaDecimalValorPassadonulo_RetornarNullReferenceException()
        {
            // Arrange
            var salary = String.Empty;
            salary = null;
            var expected = "Error o valor do salario é nulo";
            // Act
            var responseResult = Assert.Throws<ArgumentNullException>(() => _sut.GetSalaryConvert(salary));

            // Assert
            Assert.NotNull(expected);
          

        }

    }
}
