using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Response;
using AwesomeStone.Infra.Data.Interfaces;
using Flunt.Notifications;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using AwesomeStone.Application.DTOs;
using Microsoft.Extensions.Options;

namespace AwesomeStone.Application
{
    public class BusinessApplication : IBusinessApplication
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ILogger<BusinessApplication> _logger;
        private readonly IOptions<CacheConfig> _cacheConfig;

        public BusinessApplication(IUnitOfWork unitOfWork, ILogger<BusinessApplication> logger, IOptions<CacheConfig> cacheConfig)
        {
            _unitOfWork = unitOfWork;
           _logger = logger;
            _cacheConfig = cacheConfig;
            _logger.LogDebug(default(EventId), $"NLog injected into {nameof(BusinessApplication)}");
        }

        public ResponseResult Add(OperationProfitRequest operationProfitRequest)
        {
            var _response = new ResponseResult();
            try
            {
                operationProfitRequest.Validate();

                if (operationProfitRequest.Notifications.Any())
                {
                    _response.AddNotifications(operationProfitRequest.Notifications);
                    return _response;
                }

                var value = 0.0m;
                if (operationProfitRequest.IsValid())
                {
                    
                    value = Convert.ToDecimal(operationProfitRequest.BonusDistribuided.Remove(0, 3));
                }

                var entidade = new OperationProfit(value);
                _unitOfWork.Business.Add(_cacheConfig.Value.Key, entidade);

                _response.AddValue(new
                {
                    Status = "Cadastro realizado com sucesso"
                });


            }
            catch (ArgumentNullException ex) {

                _response.AddNotification(new Notification(nameof(BusinessApplication), $"Falha na operação {ex.Message}"));
                _logger.LogError(default(EventId), $"Found fails to {nameof(BusinessApplication)} in AddAsync{ex.Message} to {nameof(operationProfitRequest)}");
                throw;
            }
            catch (Exception ex)
            {
                _response.AddNotification(new Notification(nameof(BusinessApplication), $"Falha na operação {ex.Message}"));
                _logger.LogError(default(EventId), $"Found fails to {nameof(BusinessApplication)} in AddAsync{ex.Message} to {nameof(operationProfitRequest)}");
                throw;
            }

            return _response;

        }

        public OperationProfit Get(string key)
        {
           return  _unitOfWork.Business.GetAll(key);
        }
    }
}
