using Flunt.Validations;

namespace AwesomeStone.Core.Entidades
{
    public class OperationProfit : Entidade
    {
        private readonly decimal _distributedValue;
        public decimal ValueBonus { get; private set; }
        public OperationProfit(decimal valorDistribuido)
        {
            ValueBonus = valorDistribuido;
            _distributedValue = valorDistribuido;
        }

        public override void Validate()
        {
            AddNotifications(new Contract()
              .Requires()
              .IsGreaterThan(ValueBonus, 0, nameof(ValueBonus), "O valor a ser distribuido bruto tem que ser maior que zero"));

            AddNotifications(new Contract()
                  .Requires()
                  .IsNotNull(ValueBonus, nameof(ValueBonus), " O valor a ser distribuido não pode ser nulo"));

        }

        public bool CheckDistributed_Value(decimal value) {
            if (ValueBonus <= value) return true;
            ValueBonus -= value;
            return false;

        }

        public decimal Total_Available()
        {
            return _distributedValue;
        }

        public decimal Total_Balance_Available()
        {
            return _distributedValue -  ValueBonus;
        }
       
    }
}
