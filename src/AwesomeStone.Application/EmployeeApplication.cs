using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.DTOs;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Employees;
using AwesomeStone.Core.Response;
using Flunt.Notifications;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AwesomeStone.Application
{
    public class EmployeeApplication : IEmployeesApplication
    {
        private readonly IEmployeeService _employeesService;
        private readonly IOptions<CacheConfig> _cacheConfig;
        private readonly IApplicationEmployeeContainer _employeeContainer;
        private readonly ResponseResult _response;

        public EmployeeApplication(IApplicationEmployeeContainer applicationEmployeeContainer, IEmployeeService employeesService, IOptions<CacheConfig> cacheConfig) 
        {
            _employeesService = employeesService;
            _cacheConfig = cacheConfig;
            _employeeContainer = applicationEmployeeContainer;
            _employeeContainer.Logger.LogDebug(default(EventId), $"NLog injected into {nameof(EmployeeApplication)}");
            _response = new ResponseResult();
        }
     
        public async Task<ResponseResult> AddAsync(IEnumerable<EmployeeRequest> employeesRequest)
        {

            try
            {
                var listParticipation = new List<ViewParticipation>();
                var operationProfit = _employeeContainer.UnitOfWork.Business.GetAll(_cacheConfig.Value.Key);
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
                _employeeContainer.Logger.LogError(default(EventId),
                    $"Found fails to {nameof(EmployeeApplication)} in AddAsync {ex.Message}");
                throw;
            }
            
            return _response;
        }

        private async Task<bool> CreateEmployeesAsync(IEnumerable<EmployeeRequest> employeesRequest,
            OperationProfit operationProfit,
            ICollection<ViewParticipation> listParticipation)
        {
            if (employeesRequest is { })
            {
                foreach (var employeeRequest in employeesRequest)
                {
                    employeeRequest.Validate();

                    if (employeeRequest.Notifications.Any())
                    {
                        _response.AddNotifications(employeeRequest.Notifications);
                        return true;
                    }

                    var entidade = new Employee(employeeRequest.Matricula, employeeRequest.Nome, employeeRequest.Area,
                        employeeRequest.Cargo, _employeesService.GetSalaryConvert(employeeRequest.SalarioBruto), 0.0m,
                        employeeRequest.DataDeAdmissao);

                    if (!VerifyBonusValueEmployee(operationProfit, entidade, out var bonus))
                    {
                        break;
                    }

                    entidade.SetBonus(bonus);

                    await _employeeContainer.UnitOfWork.Employee.AddAsync(entidade);

                    FillParticipation(listParticipation, employeeRequest, bonus);
                }

                return false;
            }

            throw new ArgumentNullException("employeesRequest", "Error objeto passado nulo");
        }

        private static void FillParticipation(ICollection<ViewParticipation> listParticipation, EmployeeRequest employeeRequest, decimal bonus)
        {
            listParticipation.Add(new ViewParticipation
            {
                Matricula = employeeRequest.Matricula,
                Nome = employeeRequest.Nome,
                ValorDaParticipação = $"{bonus:C}"
            });
        }

        private bool VerifyBonusValueEmployee(OperationProfit operationProfit, Employee entidade, out decimal bonus)
        {
            bonus = _employeesService.GetBonus(entidade);

            if (!operationProfit.CheckDistributed_Value(bonus)) return true;
            _response.AddNotification(new Notification(nameof(EmployeeApplication),
                $"Falha na operação, o valor disponibilizado {operationProfit.Total_Available()} é insuficiente para atender todos o funcionarios {bonus}  "));
            return false;

        }

        private void FillViewParticipationEmployee(IReadOnlyCollection<ViewParticipation> listParticipation, OperationProfit operationProfit)
        {
            _response.AddValue(new Data
            {
                Participações = listParticipation,
                TotalDeFuncionarios = listParticipation.Count.ToString(),
                TotalDistribuido = $"{operationProfit.Total_Balance_Available():C}",
                TotalDisponibilizado = $"{operationProfit.Total_Available():C}",
                SaldoTotalDisponibilizado = $"{operationProfit.ValueBonus:C}",

            });
        }

        public async Task<ResponseResult> GetAllAsync()
        {
            try
            {
                var employees = await _employeeContainer.UnitOfWork.Employee.GetAllAsync();
                var listParticipation = employees.Select(employee => new ViewParticipation {Matricula = employee.Matricula, Nome = employee.Nome, ValorDaParticipação = $"{employee.Bonus:C}"}).ToList();

                _response.AddValue(new Data
                {
                    Participações = listParticipation,
                    TotalDeFuncionarios = listParticipation.Count.ToString(),
                });
                               
            }
            catch (Exception ex)
            {
                _response.AddNotification(new Notification(nameof(EmployeeApplication), $"Falha na operação {ex.Message}"));
                _employeeContainer.Logger.LogError(default(EventId), $"Found fails to {nameof(EmployeeApplication)} in GetAllAsync {ex.Message}");
                throw;
                
            }

            return _response;

        }
    }
}
