using AwesomeStone.Core.Intefaces.Employees;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Servicos
{
    public class CustomerRelationship : IOfficeStrategy
    {
        public int GetWeightOffice()
        {
            return 5;
        }
    }
}
