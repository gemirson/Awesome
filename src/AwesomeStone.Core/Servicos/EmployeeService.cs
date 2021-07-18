using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Employees;
using System;
using System.Globalization;
using System.Linq;

namespace AwesomeStone.Core.Servicos
{
    public class EmployeeService : IEmployeeService
    {

        const int MinimumSalary = 1040;

        private readonly IBonus _bonus;
        private readonly OfficeFactory _officeFactory;
        private readonly IWeigth _weigthAdmission;
        private readonly IWeigth _weigthSalary;

        public EmployeeService(IBonus bonus, OfficeFactory officeFactory, IWeigth weigthAdmission, IWeigth weigthSalary)
        {
            _bonus = bonus;
            _officeFactory = officeFactory;
            _weigthAdmission = weigthAdmission;
            _weigthSalary = weigthSalary;
        }

        public decimal GetBonus(Employee employee) {

            var numberSalary =  Calculate_Number_Salary(employee);
            var numberYear   = Calculate_Number_Year(employee);

            return _bonus.CalculateBonus(_officeFactory.GetWeightOffice(employee.Area),
                                         _weigthSalary.GetWeigth(numberSalary),
                                         _weigthAdmission.GetWeigth(numberYear), employee.SalarioBruto) ;
        }

        private static float Calculate_Number_Salary(Employee employee)
        {
            if (MinimumSalary == 0) throw new ArgumentNullException("employee","error salario minimi invalido");
            if (employee is { }) return (float) (employee.SalarioBruto / MinimumSalary);
            return 0.0f;
        }

        private static float Calculate_Number_Year(Employee employee)
        {
            var result = (float) (DateTime.Now.Subtract(employee.DataDeAdmissao).TotalDays / 365.0);
            return result > 0.0f ? result : 0.0f;
        }

        public decimal GetSalaryConvert(string salary)
        {
            var result = string.Empty;
            var provider = new CultureInfo("pt-BR"); 

            if (salary is { })
            {
                result = salary.Where(caracter => char.IsDigit(caracter) || char.IsPunctuation(caracter)).Aggregate(result, (current, caracter) => current + caracter);
              
                return Convert.ToDecimal(result,provider);
            }
            
            throw new ArgumentNullException("salary","Error o valor do salario é nulo");
        }
    }
}
