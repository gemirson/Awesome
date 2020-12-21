using AwesomeStone.Application.Command.Request;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Response;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AwesomeStone.Application.Interfaces
{
    public interface IBusinessApplication
    {
        ResponseResult Add(Operation_ProfitRequest operation_ProfitRequest);
        Operation_Profit Get(string key);

    }
}
