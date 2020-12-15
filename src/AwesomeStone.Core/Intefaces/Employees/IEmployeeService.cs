using AwesomeStone.Core.Entidades;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Intefaces.Employees
{
    public interface IEmployeeService
    {
        int Calculate_Admission_Diference_Date(Employee employee);
        int Calculate_Weight_per_Salary_Range(int number_salary);
    }
        
}
