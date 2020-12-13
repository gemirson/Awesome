using AwesomeStone.Core.Entidades;
using System.Threading.Tasks;

namespace AwesomeStone.Core.Intefaces
{
    public interface IEmployeeRepository
    {
        Task AddAsync(Employee employee);

    }
}
