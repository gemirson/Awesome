using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;

namespace AwesomeStone.API.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class BusinessController : BaseController
    {
        private readonly ILogger<EmployeeController> _logger;
        private readonly IBusinessApplication _businessAplication;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="logger"></param>
        /// <param name="businessAplication"></param>
        public BusinessController(ILogger<EmployeeController> logger, IBusinessApplication businessAplication)
        {
            _logger = logger;
            _businessAplication = businessAplication;
            _logger.LogDebug(default(EventId), $"NLog injected into {nameof(BusinessController)}");
        }

        /// <summary>
        /// Criar Bonus
        /// </summary>
        /// <remarks>
        /// Sample request:
        ///
        ///     POST /api/busines/business
        ///     {
        ///        "Bonus_Distribuided": "R$ 1000000",
        ///        
        ///     }
        ///     
        /// </remarks>        
        /// <param name="Operation_ProfitRequest"></param>  
        [HttpPost("Business")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public ActionResult BonusCreate([FromBody] Operation_ProfitRequest operation_ProfitRequest)
        {
            var result =  _businessAplication.Add(operation_ProfitRequest);

            if (result.HasFails)
            {
                _logger.LogError(default(EventId), $"Found fails to {nameof(BusinessController)} in BonusCreate {result.Fails}");
                return BadRequest(result.Fails); 
            }
            return this.Ok(result.Data);

        }
    }
}
