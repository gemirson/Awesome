using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Employees;
using System;

namespace AwesomeStone.Core.Servicos
{
    public class EmployeeService : IEmployeeService
    {

        const int minimum_salary = 1040;

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

            float number_salary =  Calculate_Number_Salary(employee);
            float number_Year   = Calculate_Number_Year(employee);

            return _bonus.CalculateBonus(_officeFactory.GetWeightOffice(employee.Area),
                                         _weigthSalary.GetWeigth(number_salary),
                                         _weigthAdmission.GetWeigth(number_Year), employee.Salario_bruto) ;
        }
              
        internal float Calculate_Number_Salary(Employee employee) => (float)(employee.Salario_bruto / minimum_salary);
        internal float Calculate_Number_Year(Employee employee) =>(float)(DateTime.Now.Subtract(employee.Data_de_Admissao).TotalDays / 365.0);
    }
}
