using AwesomeStone.Application.Command.Request;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Response;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AwesomeStone.Application.Interfaces
{
    public interface IBusinessApplication
    {
        ResponseResult Add(OperationProfitRequest operationProfitRequest);
        OperationProfit Get(string key);

    }
}
