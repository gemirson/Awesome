using Flunt.Notifications;
using Flunt.Validations;
using System;

namespace AwesomeStone.Application.Command.Request
{
    public class EmployeeRequest: Notifiable
    {
        public string Matricula { get; set; }
        public string Nome { get; set; }
        public string Area { get; set; }
        public string Cargo { get;  set; }
        public string SalarioBruto { get; set; }
        public DateTime DataDeAdmissao { get; set; }

        public void Validate()
        {
            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(DataDeAdmissao, nameof(DataDeAdmissao), " A data de admissão não pode ser nula"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Cargo, nameof(Cargo), " O cargo não pode ser nulo"));
            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Area, nameof(Area), " A area  não pode ser nulo"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Matricula, nameof(Matricula), " A matricula não pode ser nula"));
                       
        }
    }
}
