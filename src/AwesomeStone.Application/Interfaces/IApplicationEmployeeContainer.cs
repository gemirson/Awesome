using AwesomeStone.Infra.Data.Interfaces;
using Microsoft.Extensions.Logging;

namespace AwesomeStone.Application.Interfaces
{
    public interface IApplicationEmployeeContainer
    {
         ILogger<EmployeeApplication> Logger { get; }
         IUnitOfWork UnitOfWork { get; }
        
    }
}