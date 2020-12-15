using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Servicos
{
    public class BonusStrategy : Intefaces.Employees.IBonus
    {
        public decimal CalculateBonus(int Weight_position, int Weight_salary, int Weight_year,decimal salary)
        {
            return (salary*(Weight_position + Weight_salary) * 12) / Weight_year;
        }
    }
}
