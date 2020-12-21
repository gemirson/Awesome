using Flunt.Notifications;
using Flunt.Validations;
using System;

namespace AwesomeStone.Application.Command.Request
{
    public class EmployeeRequest: Notifiable
    {
        public string matricula { get; set; }
        public string nome { get; set; }
        public string area { get; set; }
        public string cargo { get;  set; }
        public string salario_bruto { get; set; }
        public DateTime data_de_admissao { get; set; }

        public void Validate()
        {
            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(data_de_admissao, nameof(data_de_admissao), " A data de admissão não pode ser nula"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(cargo, nameof(cargo), " O cargo não pode ser nulo"));
            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(area, nameof(area), " A area  não pode ser nulo"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(matricula, nameof(matricula), " A matricula não pode ser nula"));
                       
        }
    }
}
