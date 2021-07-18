using System.Collections.Generic;
using System.Linq;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Intefaces.Business;

namespace AwesomeStone.Application.Tests.Mocks.Repository
{
    public class BusinessRepository:IBusinessRepository
    {
        private readonly Dictionary<string, OperationProfit> _dataContextDictionary;

        public BusinessRepository()
        {
            _dataContextDictionary = new Dictionary<string, OperationProfit>();
        }

        public void Add(string key, OperationProfit operationProfit)
        {
            _dataContextDictionary.Add(key, value:operationProfit);
        }

        public OperationProfit GetAll(string key)
        {
            if (!_dataContextDictionary.ContainsKey(key)) return new OperationProfit(0.0m);
            _dataContextDictionary.TryGetValue(key, out var value);
            return value;

        }
    }
}