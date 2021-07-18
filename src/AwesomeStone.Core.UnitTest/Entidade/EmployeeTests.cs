using AwesomeStone.Core.Entidades;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace AwesomeStone.Core.Tests.Entidade
{
    public class EmployeeTests
    {
        [Fact(DisplayName = "Não deve permitir inserir um valor de bonus negativo")]
        [Trait("Entidade Employee", "O valor inserido no bonus menor que zero")]
        public void Business_EntidadeEmployeeSetValorBonusNegativo_RetornarDomainException()
        {
            // Arrange
            var sut= new Employee("0009968", "Victor Wilson", "Diretoria", "Diretor Financeiro", 12696.20m, 0.0m, DateTime.Parse("2012-01-05"));
            // Act
           var result = Assert.Throws<DomainException>(() => sut.SetBonus(-10.0m));
            // Assert
            Assert.Equal("O valor do bonus não pode ser menor que zero", result.Message);
        }
    }
}
