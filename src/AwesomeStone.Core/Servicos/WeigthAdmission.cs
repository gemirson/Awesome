using AwesomeStone.Core.Intefaces.Employees;
using System.Linq;

namespace AwesomeStone.Core.Servicos
{
    public class WeigthAdmission : IWeigth
    {
               
        public WeigthCondition[] WeigthConditions
        {
            get {
                return new WeigthCondition[]
                {

                        new WeigthCondition(m => m > 8, m => 5 ),
                        new WeigthCondition(m => m< 8 && m> 3, m=>3),
                        new WeigthCondition(m => m< 3 && m> 1, m => 2),
                        new WeigthCondition(m => m <=1 && m > 0, m => 1),
                };
            }

        }

        public int GetWeigth(float parameter)
        {
            var executor = WeigthConditions.First(t => t.CanApply(parameter));
            return executor.Transform(parameter);

        }
    }

}
