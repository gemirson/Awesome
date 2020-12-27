using System;

namespace AwesomeStone.Core.Servicos
{
    public class BonusStrategy : Intefaces.Employees.IBonus
    {
        public decimal CalculateBonus(int weightPosition, int weightSalary, int weightYear,decimal salary)
        {
            return weightSalary == 0
                ? throw new Exception("error peso para o salario invalido")
                : (salary * (weightPosition + weightYear) * 12) / weightSalary;
        }
    }
}
