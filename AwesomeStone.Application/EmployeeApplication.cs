using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Employees;
using AwesomeStone.Core.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AwesomeStone.Application
{
    public class EmployeeApplication : IEmployeesApplication
    {
        private readonly IEmployeeService _employeesService;
        private readonly IEmployeeRepository _employeeRepository;
        private readonly ResponseResult _response;

        public EmployeeApplication(IEmployeeService employeesService, IEmployeeRepository employeeRepository)
        {
            _employeesService = employeesService;
            _employeeRepository = employeeRepository;
        }
             
        public async Task<ResponseResult> AddAsync(IEnumerable<EmployeeRequest> employeesRequest)
        {
            foreach (EmployeeRequest employeeRequest in employeesRequest)
            {
                employeeRequest.Validate();

                if (employeeRequest.Notifications.Any())
                {
                    _response.AddNotifications(employeeRequest.Notifications);
                    return _response;
                }

                var entidade = new Employee(employeeRequest.Matricula, employeeRequest.Nome,employeeRequest.Cargo,employeeRequest.Salario_bruto,employeeRequest.Data_de_Admissao);

                decimal bonus = _employeesService.GetBonus(entidade);

                await _employeeRepository.AddAsync(entidade);
            }

            return _response;
           
        }

        public Task InsertBonus()
        {
            throw new NotImplementedException();
        }
    }
}
