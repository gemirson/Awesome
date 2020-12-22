using AwesomeStone.Core.Servicos;

namespace AwesomeStone.Core.Intefaces.Employees
{
    public interface IWeigth
    {
        int GetWeigth(float parameter);
        WeigthCondition[] WeigthConditions { get;}

    }
}
