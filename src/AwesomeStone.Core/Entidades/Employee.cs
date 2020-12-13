using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Entidades
{
    public class Employee
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
