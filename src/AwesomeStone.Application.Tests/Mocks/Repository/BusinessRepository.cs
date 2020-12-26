using System.Collections.Generic;
using System.Linq;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Business;

namespace AwesomeStone.Application.Tests.Mocks.Repository
{
    public class BusinessRepository:IBusinessRepository
    {
        private readonly Dictionary<string, Operation_Profit> _dataContextDictionary;

        public BusinessRepository()
        {
            _dataContextDictionary = new Dictionary<string, Operation_Profit>();
        }

        public void Add(string key, Operation_Profit operationProfit)
        {
            _dataContextDictionary.Add(key, value:operationProfit);
        }

        public Operation_Profit GetAll(string key)
        {
            if (!_dataContextDictionary.ContainsKey(key)) return new Operation_Profit(0.0m);
            _dataContextDictionary.TryGetValue(key, out var value);
            return value;

        }
    }
}