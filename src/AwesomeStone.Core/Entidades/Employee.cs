using System;
using System.Collections.Generic;

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

            Validate();

        }

        public void SetBonus(decimal _bonus) {
            if (_bonus < 0.0m) throw new  DomainException("O valor do bonus não pode ser menor que zero");
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
            Validacoes.ValidarSeMenorQue(Salario_bruto, 0.0m, "O valor do salaário bruto tem que ser maior que zero");
            Validacoes.ValidarSeNulo(Data_de_Admissao,"O valor do salaário bruto tem que ser maior que zero");
            Validacoes.ValidarSeNulo(Cargo, "O cargo não pode ser nulo");
            Validacoes.ValidarSeNulo(Area, "A area não pode ser nula");
            Validacoes.ValidarSeNulo(Matricula, "A matricula não pode ser nula");
                  
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
