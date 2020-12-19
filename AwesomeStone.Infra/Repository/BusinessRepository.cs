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

        public void Add(string key,string value)
        {
            _memoryCache.Set(key,value);
        }

        public string GetAll(string key)
        {
           return  (string)_memoryCache.Get(key);
        }
    }
}
