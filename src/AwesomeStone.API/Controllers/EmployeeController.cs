
using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AwesomeStone.API.Controllers
{
   /// <summary>
   /// 
   /// </summary>
    public class EmployeeController : BaseController
    {
        
        private readonly ILogger<EmployeeController> _logger;
        private readonly IEmployeesApplication _employeesApplication;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="logger"></param>
        /// <param name="employeesApplication"></param>
        public EmployeeController(ILogger<EmployeeController> logger, IEmployeesApplication employeesApplication)
        {
            _logger = logger;
            _employeesApplication = employeesApplication;
            _logger.LogDebug(default(EventId), $"NLog injected into {nameof(EmployeeController)}");
        }
        
        /// <summary>
        /// Distribuir bonus entre funcionarios
        /// </summary>
        /// <remarks>
        /// Sample request:
        ///
        ///     POST /api/employee/bonus
        ///     {
        ///        "matricula": "0009968",
        ///        "nome": "Victor Wilson",
        ///        "area": "Diretoria",
        ///        "cargo": "Diretor Financeiro",
        ///        "salario_bruto": "R$ 12.696,20",
        ///        "data_de_admissao": "2012-01-05"
        ///     }
        ///     
        /// </remarks>        
        /// <param name="EmployeeRequest"></param>  
        [HttpPost("Bonus")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult> BonusAsync([FromBody] IEnumerable<EmployeeRequest> employeeRequest)
        {
            var result = await _employeesApplication.AddAsync(employeeRequest);

            if (result.HasFails)
            {
                _logger.LogError(default(EventId), $"Found fails to {nameof(EmployeeController)} in BonusCreate {result.Fails}");
                return BadRequest(result.Fails);
            }

            return Created(string.Empty,result.Data);

        }
    }
}
