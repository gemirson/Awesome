using Flunt.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Entidades
{
    public class Operation_Profit : Entidade
    {

        public decimal Valor_Distribuido { get; private set;}
        public Operation_Profit(decimal valor_Distribuido)
        {
            Valor_Distribuido = valor_Distribuido;
        }

        public override void Validate()
        {
            AddNotifications(new Contract()
              .Requires()
              .IsGreaterThan(Valor_Distribuido, 0, nameof(Valor_Distribuido), "O valor a ser distribuido bruto tem que ser maior que zero"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Valor_Distribuido, nameof(Valor_Distribuido), " O valor a ser distribuido não pode ser nulo"));

        }

        bool CheckValorDistruido(decimal value) {
            if (Valor_Distribuido < value) return false;
            Valor_Distribuido -= value;
            return true;
        }
    }
}
