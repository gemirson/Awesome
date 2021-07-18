using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces;

namespace AwesomeStone.Application.Tests.Mocks.Repository
{
    public class EmployeeRepository:IEmployeeRepository
    {
        private readonly IEnumerable<Employee> _employees;

        public EmployeeRepository()
        {
            _employees = new List<Employee>();
        }

        public  Task AddAsync(Employee employee)
        {
            _employees.Append(employee);
            return  Task.CompletedTask;
            ;
        }

        public Task<IEnumerable<Employee>> GetAllAsync()
        {
            return Task.FromResult<IEnumerable<Employee>>(_employees.ToList());
        }
    }
}