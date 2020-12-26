using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Business;
using Microsoft.Extensions.Caching.Memory;

namespace AwesomeStone.Infra.Repository
{
    public class BusinessRepository : IBusinessRepository
    {
        private readonly IMemoryCache _memoryCache;

        public BusinessRepository(IMemoryCache memoryCache)
        {
            _memoryCache = memoryCache;
        }

        public void Add(string key, OperationProfit value)
        {
            _memoryCache.Set(key,value);
        }

        public OperationProfit GetAll(string key)
        {
            return  _memoryCache.Get<OperationProfit>(key);
        }
    }
}
