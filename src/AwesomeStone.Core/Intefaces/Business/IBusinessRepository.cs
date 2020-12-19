using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AwesomeStone.Core.Intefaces.Business
{
    public interface IBusinessRepository
    {
        void Add(string key, string value);
        string GetAll(string key);
    }
}
