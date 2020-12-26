using System;

namespace AwesomeStone.Core.Servicos
{
    public class WeigthCondition
    {
        public Func<float, bool> CanApply { get; private set; }

        public Func<float, int> Transform { get; private set; }

        public WeigthCondition(Func<float, bool> canApply, Func<float, int> transform)
        {
            CanApply = canApply;
            Transform = transform;
        }
    }
}
