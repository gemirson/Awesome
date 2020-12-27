namespace AwesomeStone.Core.Servicos
{
    public class BonusStrategy : Intefaces.Employees.IBonus
    {
        public decimal CalculateBonus(int weightPosition, int weightSalary, int weightYear,decimal salary)
        {
            return (salary*(weightPosition + weightYear) * 12) / weightSalary;
        }
    }
}
