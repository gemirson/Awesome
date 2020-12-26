using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Infra.Data.Interfaces;

namespace AwesomeStone.Application.Tests.Mocks.UnitOfWork
{
    public class UnitOfWorkMocks :IUnitOfWork
    {
        public IEmployeeRepository Employee { get; }
        public IBusinessRepository Business { get; }

        public UnitOfWorkMocks(IEmployeeRepository employee, IBusinessRepository business)
        {
            Employee = employee;
            Business = business;
        }
    }
}