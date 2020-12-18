using Flunt.Notifications;
using Flunt.Validations;
using System;

namespace AwesomeStone.Application.Command.Request
{
    public class EmployeeRequest: Notifiable
    {
        public int Matricula { get; private set; }
        public string Nome { get; private set; }
        public string Cargo { get; private set; }
        public decimal Salario_bruto { get; private set; }
        public DateTime Data_de_Admissao { get; private set; }

        public void Validate()
        {
            AddNotifications(new Contract()
              .Requires()
              .IsGreaterThan(Salario_bruto, 0, nameof(Salario_bruto), "O valor do salaário bruto tem que ser maior que zero"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Data_de_Admissao, nameof(Data_de_Admissao), " A data de admissão não pode ser nula"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Cargo, nameof(Cargo), " O cargo não pode ser nulo"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Matricula, nameof(Matricula), " A matricula não pode ser nula"));

            AddNotifications(new Contract()
             .Requires()
             .IsGreaterThan(Matricula, 0, nameof(Matricula), "A matricula tem que ser maior que szero"));
        }
    }
}
