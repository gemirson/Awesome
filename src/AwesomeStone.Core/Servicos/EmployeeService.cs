using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Employees;
using System;

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

            float numberSalary =  Calculate_Number_Salary(employee);
            float numberYear   = Calculate_Number_Year(employee);

            return _bonus.CalculateBonus(_officeFactory.GetWeightOffice(employee.Area),
                                         _weigthSalary.GetWeigth(numberSalary),
                                         _weigthAdmission.GetWeigth(numberYear), employee.SalarioBruto) ;
        }
              
        internal float Calculate_Number_Salary(Employee employee) => (float)(employee.SalarioBruto / MinimumSalary);
        internal float Calculate_Number_Year(Employee employee) =>(float)(DateTime.Now.Subtract(employee.DataDeAdmissao).TotalDays / 365.0);

        public decimal GetSalaryConvert(string salary)
        {
            string result = String.Empty;

            foreach (var caracter in salary)
            {
                if (Char.IsDigit(caracter) || Char.IsPunctuation(caracter))
                {
                    result += caracter;
                }
            }
            return Convert.ToDecimal(result);
        }
    }
}
