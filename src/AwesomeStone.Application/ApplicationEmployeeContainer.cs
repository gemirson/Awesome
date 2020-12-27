using AwesomeStone.Application.Interfaces;
using AwesomeStone.Infra.Data.Interfaces;
using Microsoft.Extensions.Logging;

namespace AwesomeStone.Application
{
    public class ApplicationEmployeeContainer: IApplicationEmployeeContainer
    {
        public ILogger<EmployeeApplication> Logger { get; private set; }
        public IUnitOfWork UnitOfWork { get;private set;}

        public ApplicationEmployeeContainer(ILogger<EmployeeApplication> logger, IUnitOfWork unitOfWork)
        {
            Logger = logger;
            UnitOfWork = unitOfWork;
        }


    }
}