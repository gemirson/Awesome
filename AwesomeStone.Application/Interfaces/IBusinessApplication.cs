using AwesomeStone.Application.Command.Request;
using AwesomeStone.Core.Response;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AwesomeStone.Application.Interfaces
{
    public interface IBusinessApplication
    {
        ResponseResult Add(Operation_ProfitRequest operation_ProfitRequest);
       
    }
}
