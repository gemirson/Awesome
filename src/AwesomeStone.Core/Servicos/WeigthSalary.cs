using AwesomeStone.Core.Intefaces.Employees;
using System.Linq;

namespace AwesomeStone.Core.Servicos
{
    public class WeigthSalary:IWeigth
    {         
        public WeigthCondition[] WeigthConditions
        {
            get
            {
                return new[]
                {
                    new WeigthCondition(m => m > 8.0f, m => 5 ),
                    new WeigthCondition(m => m < 8.0f && m > 5.0f, m => 3),
                    new WeigthCondition(m => m < 5.0f && m > 3.0f, m => 2),
                    new WeigthCondition(m => m <=3.0f && m >= 0.0f, m => 1),
                };
            }

        }

        public int GetWeigth(float parameter)
        {
            var executor = WeigthConditions?.First(t => t.CanApply(parameter));
            return executor.Transform(parameter);
        }
            
    }
}
