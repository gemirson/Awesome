﻿using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Intefaces.Employees
{
    public interface IBonus    {
        decimal CalculateBonus(int weightPosition, int weightSalary, int weightYear, decimal salary);
    }
}
