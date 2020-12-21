using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Core.Response;
using Flunt.Notifications;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AwesomeStone.Application
{
    public class BusinessApplication : IBusinessApplication
    {
        private readonly IBusinessRepository _businessRepository;
        private readonly ResponseResult _response;

        public BusinessApplication(IBusinessRepository businessRepository, ResponseResult response)
        {
            _businessRepository = businessRepository;
            _response = response;
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
                _businessRepository.Add("teste", entidade);

                _response.AddValue(new
                {
                    Status = "Cadastro realizado com sucesso"
                });

               
            }
            catch (Exception ex)
            {
                _response.AddNotification(new Notification(nameof(BusinessApplication), $"Falha na operação {ex.Message}"));
                throw;
            }

            return _response;

        }

        public Operation_Profit Get(string key)
        {
           return  _businessRepository.GetAll(key);
        }
    }
}
