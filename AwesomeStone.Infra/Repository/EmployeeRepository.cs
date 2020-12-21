using AwesomeStone.Infra.Data;
using AwesomeStone.Core.Intefaces;
using System.Threading.Tasks;
using AwesomeStone.Core.Entidades;
using System.Collections.Generic;
using MongoDB.Driver;
using MongoDB.Bson;

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

        public async Task<IEnumerable<Employee>> GetAllAsync()
        {
            return await  _awesomeMongoDbContext.Operacao.Find(new BsonDocument()).ToListAsync();
        }
    }
}
