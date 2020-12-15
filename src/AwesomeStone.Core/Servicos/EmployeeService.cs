using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Employees;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Servicos
{
    public class EmployeeService : IEmployeeService
    {

        const int minimum_salary = 1040;

        private readonly IBonus _bonus;

        public EmployeeService(IBonus bonus)
        {
            _bonus = bonus;
        }

        public decimal GetBonus(Employee employee) {

            int number_salary =  Calculate_Number_Salary(employee);

            return _bonus.CalculateBonus(Calculate_Admission_Diference_Date(employee),
                                         Calculate_Weight_per_Salary_Range(number_salary),
                                         Calculate_Number_Year(employee),employee.Salario_bruto );
        }

        public int Calculate_Admission_Diference_Date(Employee employee)
        {
            throw new NotImplementedException();
        }

        public int Calculate_Weight_per_Salary_Range(int number_salary)
        {
            if (number_salary > 8) return 5;
            if (number_salary > 5 && number_salary < 8) return 3;
            if (number_salary > 3 && number_salary < 3) return 2;

            return 1;   
        }

        private int Calculate_Number_Salary(Employee employee) => (int)(employee.Salario_bruto / minimum_salary);
        private int Calculate_Number_Year(Employee employee) => (int)(DateTime.Now.Subtract(employee.Data_de_Admissao).TotalDays / 365);
    }
}
