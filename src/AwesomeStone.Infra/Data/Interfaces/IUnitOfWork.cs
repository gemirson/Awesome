using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Business;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Infra.Data.Interfaces
{
    public interface IUnitOfWork
    {
        IEmployeeRepository Employee { get; }
        IBusinessRepository Business { get; }
    }
}
