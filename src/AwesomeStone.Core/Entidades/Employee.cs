using Flunt.Validations;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Entidades
{
    public class Employee: Entidade
    {
        
        public string Matricula { get; private set; }
        public string Nome { get; private set; }
        public string Area { get; private set; }
        public string Cargo { get; private set; }

        public decimal Bonus { get; private set;}

        public decimal Salario_bruto { get; private set; }
       
        public DateTime Data_de_Admissao { get; private set; }

        public Employee(string _matricula, string _nome, string _area, string _cargo, decimal _salario_bruto, decimal _bonus,DateTime _data_de_Admissao)
        {
            Matricula = _matricula;
            Nome = _nome;
            Area = _area;
            Cargo = _cargo;
            Salario_bruto = _salario_bruto;
            Bonus = _bonus;
            Data_de_Admissao = _data_de_Admissao;

        }

        public void SetBonus(decimal _bonus) {
            Bonus = _bonus;
        }
        public override bool Equals(object obj)
        {
            return obj is Employee employee &&
                   Matricula == employee.Matricula &&
                   Nome == employee.Nome &&
                   Area == employee.Area &&
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
                 .IsNotNull(Area, nameof(Area), " A area não pode ser nula"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Matricula, nameof(Matricula), " A matricula não pode ser nula"));

            
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
