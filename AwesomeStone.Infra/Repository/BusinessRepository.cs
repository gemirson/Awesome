using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Business;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Threading.Tasks;

namespace AwesomeStone.Infra.Repository
{
    public class BusinessRepository : IBusinessRepository
    {
        private readonly IMemoryCache _memoryCache;

        public BusinessRepository(IMemoryCache memoryCache)
        {
            _memoryCache = memoryCache;
        }

        public void Add(string key, Operation_Profit value)
        {
            _memoryCache.Set(key,value);
        }

        public Operation_Profit GetAll(string key)
        {
            return  _memoryCache.Get<Operation_Profit>(key);
        }
    }
}
