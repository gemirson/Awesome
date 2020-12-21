using Flunt.Notifications;
using Flunt.Validations;

namespace AwesomeStone.Application.Command.Request
{
    public class Operation_ProfitRequest : Notifiable
    {
        public string Bonus_Distribuided { get; set; }

        public void Validate()
        {
            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Bonus_Distribuided, nameof(Bonus_Distribuided), "O valor a ser distriduido não pode ser nula"));
                      

        }
        public bool IsValid()
        {
            return Bonus_Distribuided.Contains("R$");
        }
    }
}

   
