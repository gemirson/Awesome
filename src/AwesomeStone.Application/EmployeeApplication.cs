using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.DTOs;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Core.Intefaces.Employees;
using AwesomeStone.Core.Response;
using Flunt.Notifications;
using Microsoft.Extensions.Logging;
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
        private readonly IBusinessRepository _businessRepository;
        private readonly ILogger<EmployeeApplication> _logger;

        public EmployeeApplication(IEmployeeService employeesService, IEmployeeRepository employeeRepository, ResponseResult response, IBusinessRepository businessRepository, ILogger<EmployeeApplication> logger)
        {
            _employeesService = employeesService;
            _employeeRepository = employeeRepository;
            _response = response;
            _businessRepository = businessRepository;
            _logger = logger;

            _logger.LogDebug(default(EventId), $"NLog injected into {nameof(EmployeeApplication)}");
        }

        public async Task<ResponseResult> AddAsync(IEnumerable<EmployeeRequest> employeesRequest)
        {
            try
            {

                var listParticipation = new List<ViewParticipation>();

                var Operation_Profit = _businessRepository.GetAll("teste");

                if (Operation_Profit == null)
                {
                    _response.AddNotification(new Notification(nameof(EmployeeApplication), $"Falha na operação, o valor disponibilizado não pode ser nulo"));
                    return _response;
                }

                foreach (EmployeeRequest employeeRequest in employeesRequest)
                {
                    employeeRequest.Validate();

                    if (employeeRequest.Notifications.Any())
                    {
                        _response.AddNotifications(employeeRequest.Notifications);
                        return _response;
                    }

                    var entidade = new Employee(employeeRequest.matricula, employeeRequest.nome, employeeRequest.area, employeeRequest.cargo, Convert.ToDecimal(employeeRequest.salario_bruto.Remove(0, 3)), 0.0m, employeeRequest.data_de_admissao);

                    decimal bonus = _employeesService.GetBonus(entidade);


                    if (Operation_Profit.CheckDistributed_Value(bonus))
                    {
                        _response.AddNotification(new Notification(nameof(EmployeeApplication), $"Falha na operação, o valor disponibilizado é insuficiente para atender todos o funcionarios "));
                        return _response;

                    }

                    entidade.SetBonus(bonus);
                    await _employeeRepository.AddAsync(entidade);

                    listParticipation.Add(new ViewParticipation
                    {
                        matricula = employeeRequest.matricula,
                        nome = employeeRequest.nome,
                        valor_da_participação = String.Format("{0:C}", bonus)
                    });
                }

                _response.AddValue(new Data
                {
                    participações = listParticipation,
                    total_de_funcionarios = listParticipation.Count.ToString(),
                    total_distribuido = String.Format("{0:C}", Operation_Profit.Total_Balance_Available()),
                    total_disponibilizado = String.Format("{0:C}", Operation_Profit.Total_Available()),
                    saldo_total_disponibilizado = String.Format("{0:C}", Operation_Profit.Value_Bonus),

                });
               
            }
            catch ( Exception ex)
            {
                _response.AddNotification(new Notification(nameof(EmployeeApplication), $"Falha na operação {ex.Message}"));
                _logger.LogDebug(999, $"Found fails to {nameof(EmployeeApplication)} in AddAsync {ex.Message}");
                throw;
                
            }

            return _response;

        }

        public async Task<ResponseResult> GetAllAsync()
        {
            try
            {
                var listParticipation = new List<ViewParticipation>();
                var employees = await _employeeRepository.GetAllAsync();
                foreach (Employee employee in employees)
                {
                    listParticipation.Add(new ViewParticipation
                    {
                        matricula = employee.Matricula,
                        nome = employee.Nome,
                        valor_da_participação = String.Format("{0:C}", employee.Bonus)
                    });
                }

                _response.AddValue(new Data
                {
                    participações = listParticipation,
                    total_de_funcionarios = listParticipation.Count.ToString(),
                });
                               
            }
            catch (Exception ex)
            {
                _response.AddNotification(new Notification(nameof(EmployeeApplication), $"Falha na operação {ex.Message}"));
                _logger.LogDebug(default(EventId), $"Found fails to {nameof(EmployeeApplication)} in GetAllAsync {ex.Message}");
                throw;
                
            }

            return _response;

        }
    }
}
