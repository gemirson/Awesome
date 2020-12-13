using AwesomeStone.Infra.Data;
using AwesomeStone.Core.Intefaces;
using System.Threading.Tasks;
using AwesomeStone.Core.Entidades;

namespace AwesomeStone.Infra.Repository
{
    public class EmployeeRepository: IEmployeeRepository
    {
        private readonly AwesomeMongoDbContext _awesomeMongoDbContext;

        public EmployeeRepository(AwesomeMongoDbContext awesomeMongoDbContext)
        {
            _awesomeMongoDbContext = awesomeMongoDbContext;
        }

        public async  Task AddAsync(Employee employee)
        {
            await _awesomeMongoDbContext.Operacao.InsertOneAsync(employee);
         
        }
    }
}
