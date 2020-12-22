using Flunt.Notifications;
using Flunt.Validations;
using System;

namespace AwesomeStone.Application.Command.Request
{
    public class Operation_ProfitRequest : Notifiable
    {
        public string Bonus_Distribuided { get; set; }

        public void Validate()
        {
            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Bonus_Distribuided,nameof(Bonus_Distribuided), "O valor a ser distriduido não pode ser nula"));

            AddNotifications(new Contract()
                 .Requires()
                 .IsNotNull(this, nameof(Bonus_Distribuided), $"o objeto {nameof(Operation_ProfitRequest)} não pode ser nulo"));

            AddNotifications(new Contract()
                .Requires()
                .IsNotEmpty(Guid.NewGuid(), nameof(Bonus_Distribuided), "O valor a ser distriduido não pode ser vazio "));

            


        }
        public bool IsValid()
        {
            return Bonus_Distribuided.Contains("R$");
        }
    }
}

   
