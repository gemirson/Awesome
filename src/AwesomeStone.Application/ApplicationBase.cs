using AwesomeStone.Core.Response;
using AwesomeStone.Infra.Data.Interfaces;
using Microsoft.Extensions.Logging;

namespace AwesomeStone.Application
{
    public  class ApplicationBase
    { 
        public  ResponseResult _response => new ResponseResult();

        
    }
}