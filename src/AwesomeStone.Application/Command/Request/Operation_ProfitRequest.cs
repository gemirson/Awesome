using Flunt.Notifications;
using Flunt.Validations;
using System;

namespace AwesomeStone.Application.Command.Request
{
    public class OperationProfitRequest : Notifiable
    {
        public string BonusDistribuided { get; set; }

        public void Validate()
        {
            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(BonusDistribuided,nameof(BonusDistribuided), "O valor a ser distriduido não pode ser nula"));

            AddNotifications(new Contract()
                 .Requires()
                 .IsNotNull(this, nameof(BonusDistribuided), $"o objeto {nameof(OperationProfitRequest)} não pode ser nulo"));

            AddNotifications(new Contract()
                .Requires()
                .IsNotEmpty(Guid.NewGuid(), nameof(BonusDistribuided), "O valor a ser distriduido não pode ser vazio "));

            


        }
        public bool IsValid()
        {
            return BonusDistribuided.Contains("R$");
        }
    }
}

   
