using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Intefaces.Employees
{
    public interface IBonus    {
        decimal CalculateBonus(int Weight_position, int Weight_salary, int Weight_year, decimal salary);
    }
}
