using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.DTOs;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Core.Intefaces.Employees;
using AwesomeStone.Core.Response;
using AwesomeStone.Infra.Data.Interfaces;
using Flunt.Notifications;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;

namespace AwesomeStone.Application
{
    public class EmployeeApplication : IEmployeesApplication
    {
        private readonly IEmployeeService _employeesService;
        private readonly ResponseResult _response;
        private readonly ILogger<EmployeeApplication> _logger;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IOptions<CacheConfig> _cacheConfig;

        public EmployeeApplication(IEmployeeService employeesService, ILogger<EmployeeApplication> logger, IUnitOfWork unitOfWork, IOptions<CacheConfig> cacheConfig)
        {
            _employeesService = employeesService;
            _response = new ResponseResult();
            _logger = logger;
            _unitOfWork = unitOfWork;
            _cacheConfig = cacheConfig;
            _logger.LogDebug(default(EventId), $"NLog injected into {nameof(EmployeeApplication)}");
        }
   

        public async Task<ResponseResult> AddAsync(IEnumerable<EmployeeRequest> employeesRequest)
        {
            try
            {
                var listParticipation = new List<ViewParticipation>();
                var operationProfit = _unitOfWork.Business.GetAll(_cacheConfig.Value.Key);
                if (operationProfit is null)
                {
                    _response.AddNotification(new Notification(nameof(EmployeeApplication),
                        $"Falha na operação, o valor disponibilizado não pode ser nulo"));
                    return _response;
                }
                await CreateEmployeesAsync(employeesRequest, operationProfit, listParticipation);
                FillViewParticipationEmployee(listParticipation, operationProfit);
            }
            catch (Exception ex)
            {
                _response.AddNotification(new Notification(nameof(EmployeeApplication),
                    $"Falha na operação {ex.Message}"));
                _logger.LogError(default(EventId),
                    $"Found fails to {nameof(EmployeeApplication)} in AddAsync {ex.Message}");
                throw;
            }
            return _response;
        }

        private async Task<bool> CreateEmployeesAsync(IEnumerable<EmployeeRequest> employeesRequest,
            Operation_Profit operationProfit,
            ICollection<ViewParticipation> listParticipation)
        {
            foreach (var employeeRequest in employeesRequest)
            {
                employeeRequest.Validate();

                if (employeeRequest.Notifications.Any())
                {
                    _response.AddNotifications(employeeRequest.Notifications);
                    return true;
                }

                var entidade = new Employee(employeeRequest.matricula, employeeRequest.nome, employeeRequest.area,
                    employeeRequest.cargo, _employeesService.GetSalaryConvert(employeeRequest.salario_bruto), 0.0m,
                    employeeRequest.data_de_admissao);

                if (VerifyBonusValueEmployee(operationProfit, entidade, out var bonus))
                {
                    break;
                }

                entidade.SetBonus(bonus);

                await _unitOfWork.Employee.AddAsync(entidade);

                FillParticipation(listParticipation, employeeRequest, bonus);
            }

            return false;
        }

        private static void FillParticipation(ICollection<ViewParticipation> listParticipation, EmployeeRequest employeeRequest, decimal bonus)
        {
            listParticipation.Add(new ViewParticipation
            {
                matricula = employeeRequest.matricula,
                nome = employeeRequest.nome,
                valor_da_participação = $"{bonus:C}"
            });
        }

        private bool VerifyBonusValueEmployee(Operation_Profit operationProfit, Employee entidade, out decimal bonus)
        {
            bonus = _employeesService.GetBonus(entidade);

            if (!operationProfit.CheckDistributed_Value(bonus)) return false;
            _response.AddNotification(new Notification(nameof(EmployeeApplication),
                $"Falha na operação, o valor disponibilizado {bonus} é insuficiente para atender todos o funcionarios  "));
            return true;

        }

        private void FillViewParticipationEmployee(IReadOnlyCollection<ViewParticipation> listParticipation, Operation_Profit operationProfit)
        {
            _response.AddValue(new Data
            {
                participações = listParticipation,
                total_de_funcionarios = listParticipation.Count.ToString(),
                total_distribuido = $"{operationProfit.Total_Balance_Available():C}",
                total_disponibilizado = $"{operationProfit.Total_Available():C}",
                saldo_total_disponibilizado = $"{operationProfit.Value_Bonus:C}",

            });
        }

        public async Task<ResponseResult> GetAllAsync()
        {
            try
            {
                var employees = await _unitOfWork.Employee.GetAllAsync();
                var listParticipation = employees.Select(employee => new ViewParticipation {matricula = employee.Matricula, nome = employee.Nome, valor_da_participação = $"{employee.Bonus:C}"}).ToList();

                _response.AddValue(new Data
                {
                    participações = listParticipation,
                    total_de_funcionarios = listParticipation.Count.ToString(),
                });
                               
            }
            catch (Exception ex)
            {
                _response.AddNotification(new Notification(nameof(EmployeeApplication), $"Falha na operação {ex.Message}"));
                _logger.LogError(default(EventId), $"Found fails to {nameof(EmployeeApplication)} in GetAllAsync {ex.Message}");
                throw;
                
            }

            return _response;

        }
    }
}
