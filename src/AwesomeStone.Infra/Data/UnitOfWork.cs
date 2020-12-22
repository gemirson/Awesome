using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Infra.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Infra.Data
{
    public class UnitOfWork : IUnitOfWork
    {

        public UnitOfWork(IEmployeeRepository employeeRepository, IBusinessRepository businessRepository)
        {
            Employee = employeeRepository;
            Business = businessRepository;
        }

        public IEmployeeRepository Employee { get; private set; }
        public IBusinessRepository Business { get; private set; }
}
}
