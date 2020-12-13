using Flunt.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Entidades
{
    public class Employee: Entidade
    {
        public int Matricula { get; private set; }
        public string Nome { get; private set; }
        public string  Cargo { get; private set; }

        public decimal Salario_bruto { get; private set; }
       
        public DateTime Data_de_Admissao { get; private set; }

        public Employee(int matricula, string nome, string cargo, decimal salario_bruto, DateTime data_de_Admissao)
        {
            Matricula = matricula;
            Nome = nome;
            Cargo = cargo;
            Salario_bruto = salario_bruto;
            Data_de_Admissao = data_de_Admissao;
        }

        public override bool Equals(object obj)
        {
            return obj is Employee employee &&
                   Matricula == employee.Matricula &&
                   Nome == employee.Nome &&
                   Cargo == employee.Cargo &&
                   Salario_bruto == employee.Salario_bruto &&
                   Data_de_Admissao == employee.Data_de_Admissao;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(Matricula, Nome, Cargo, Salario_bruto, Data_de_Admissao);
        }

        public override void Validate()
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

        public static bool operator ==(Employee left, Employee right)
        {
            return EqualityComparer<Employee>.Default.Equals(left, right);
        }

        public static bool operator !=(Employee left, Employee right)
        {
            return !(left == right);
        }
    }
}
