using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Core.Response;
using AwesomeStone.Infra.Data.Interfaces;
using Flunt.Notifications;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;

namespace AwesomeStone.Application
{
    public class BusinessApplication : IBusinessApplication
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ResponseResult _response;
        private readonly ILogger<BusinessApplication> _logger;

        public BusinessApplication(IUnitOfWork unitOfWork, ResponseResult response, ILogger<BusinessApplication> logger)
        {
            _unitOfWork = unitOfWork;
            _response = response;
            _logger = logger;
            _logger.LogDebug(default(EventId), $"NLog injected into {nameof(BusinessApplication)}");
        }

        public ResponseResult Add(Operation_ProfitRequest operation_ProfitRequest)
        {
            try
            {
                operation_ProfitRequest.Validate();

                if (operation_ProfitRequest.Notifications.Any())
                {
                    _response.AddNotifications(operation_ProfitRequest.Notifications);
                    return _response;
                }

                var value = 0.0m;
                if (operation_ProfitRequest.IsValid())
                {
                    value = Convert.ToDecimal(operation_ProfitRequest.Bonus_Distribuided.Remove(0, 3));
                }

                var entidade = new Operation_Profit(value);
                _unitOfWork.Business.Add("teste", entidade);

                _response.AddValue(new
                {
                    Status = "Cadastro realizado com sucesso"
                });


            }
            catch (ArgumentNullException ex) {

                _response.AddNotification(new Notification(nameof(BusinessApplication), $"Falha na operação {ex.Message}"));
                _logger.LogError(default(EventId), $"Found fails to {nameof(BusinessApplication)} in AddAsync{ex.Message} to {nameof(operation_ProfitRequest)}");
                throw;
            }
            catch (Exception ex)
            {
                _response.AddNotification(new Notification(nameof(BusinessApplication), $"Falha na operação {ex.Message}"));
                _logger.LogError(default(EventId), $"Found fails to {nameof(BusinessApplication)} in AddAsync{ex.Message} to {nameof(operation_ProfitRequest)}");
                throw;
            }

            return _response;

        }

        public Operation_Profit Get(string key)
        {
           return  _unitOfWork.Business.GetAll(key);
        }
    }
}
