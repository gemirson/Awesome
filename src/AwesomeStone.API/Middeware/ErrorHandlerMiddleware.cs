using AwesomeStone.Core.Response;
using Flunt.Notifications;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace AwesomeStone.API.Middeware
{
    /// <summary>
    /// 
    /// </summary>
    public class ErrorHandlerMiddleware
    {
        private readonly RequestDelegate _next;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="next"></param>
        public ErrorHandlerMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                var response = new ResponseResult();
                response.AddNotification(new Notification("erro interno", (ex.InnerException != null) ? ex.InnerException.Message : ex.Message));

                context.Response.StatusCode = 500;
                context.Response.ContentType = "application/json";
                var result = JsonSerializer.Serialize(
                    new
                    {
                        erros = response.Fails.Select(x => x.Message)
                    });

                await context.Response.WriteAsync(result);
            }
        }
    }
}
