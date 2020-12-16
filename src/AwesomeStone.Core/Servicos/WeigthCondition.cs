using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Servicos
{
    public class WeigthCondition
    {
        public Func<float, bool> CanApply { get; private set; }

        public Func<float, int> Transform { get; private set; }

        public WeigthCondition(Func<float, bool> _canApply, Func<float, int> _transform)
        {
            CanApply = _canApply;
            Transform = _transform;
        }
    }
}
