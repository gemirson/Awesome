using Flunt.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Entidades
{
    public class Operation_Profit : Entidade
    {
        private readonly decimal Distributed_Value;
        public decimal Value_Bonus { get; private set; }
        public Operation_Profit(decimal valor_Distribuido)
        {
            Value_Bonus = valor_Distribuido;
            Distributed_Value = valor_Distribuido;
        }

        public override void Validate()
        {
            AddNotifications(new Contract()
              .Requires()
              .IsGreaterThan(Value_Bonus, 0, nameof(Value_Bonus), "O valor a ser distribuido bruto tem que ser maior que zero"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(Value_Bonus, nameof(Value_Bonus), " O valor a ser distribuido não pode ser nulo"));

        }

        public bool CheckDistributed_Value(decimal value) {
            if (Value_Bonus <= value) return true;
            Value_Bonus -= value;
            return false;

        }

        public decimal Total_Available()
        {
            return Distributed_Value;
        }

        public decimal Total_Balance_Available()
        {
            return Distributed_Value -  Value_Bonus;
        }
       
    }
}
