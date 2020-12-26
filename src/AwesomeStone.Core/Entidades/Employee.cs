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

        public decimal SalarioBruto { get; private set; }
       
        public DateTime DataDeAdmissao { get; private set; }

        public Employee(string matricula, string nome, string area, string cargo, decimal salarioBruto, decimal bonus,DateTime dataDeAdmissao)
        {
            Matricula = matricula;
            Nome = nome;
            Area = area;
            Cargo = cargo;
            SalarioBruto = salarioBruto;
            Bonus = bonus;
            DataDeAdmissao = dataDeAdmissao;

            Validate();

        }

        public void SetBonus(decimal bonus) {
            if (bonus < 0.0m) throw new  DomainException("O valor do bonus não pode ser menor que zero");
            Bonus = bonus;
        }
        public override bool Equals(object obj)
        {
            return obj is Employee employee &&
                   Matricula == employee.Matricula &&
                   Nome == employee.Nome &&
                   Area == employee.Area &&
                   Cargo == employee.Cargo &&
                   SalarioBruto == employee.SalarioBruto &&
                   DataDeAdmissao == employee.DataDeAdmissao;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(Matricula, Nome, Cargo, SalarioBruto, DataDeAdmissao);
        }

        public override void Validate()
        {
            Validacoes.ValidarSeMenorQue(SalarioBruto, 0.0m, "O valor do salaário bruto tem que ser maior que zero");
            Validacoes.ValidarSeNulo(DataDeAdmissao,"O valor do salaário bruto tem que ser maior que zero");
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
