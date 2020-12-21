using AwesomeStone.Core.Entidades;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AwesomeStone.Core.Intefaces
{
    public interface IEmployeeRepository
    {
        Task AddAsync(Employee employee);
        Task<IEnumerable<Employee>> GetAllAsync();

    }
}
