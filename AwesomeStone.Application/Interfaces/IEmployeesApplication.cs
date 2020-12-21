using AwesomeStone.Application.Command.Request;
using AwesomeStone.Core.Entidades;
using AwesomeStone.Core.Response;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AwesomeStone.Application.Interfaces
{
    public interface IEmployeesApplication
    {
        Task<ResponseResult> AddAsync(IEnumerable<EmployeeRequest> employeesRequest);
        Task<ResponseResult> GetAllAsync();


    }
}
