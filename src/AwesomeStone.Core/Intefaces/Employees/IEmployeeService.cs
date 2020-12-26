using AwesomeStone.Core.Entidades;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Intefaces.Employees
{
    public interface IEmployeeService
    {
        public decimal GetBonus(Employee employee);
        public decimal GetSalaryConvert(string salary);


    }
        
}
