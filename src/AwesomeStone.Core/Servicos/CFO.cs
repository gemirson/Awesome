﻿using AwesomeStone.Core.Intefaces.Employees;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Servicos
{
    public class Cfo : IOfficeStrategy
    {
        public int GetWeightOffice()
        {
            return 1;
        }
    }
}
