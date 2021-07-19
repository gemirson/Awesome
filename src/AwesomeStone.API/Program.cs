using App.Metrics;
using App.Metrics.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NLog;
using NLog.Web;
using System;
using System.Diagnostics.CodeAnalysis;

namespace AwesomeStone.API
{
    /// <summary>
    /// 
    /// </summary>
    /// 
    [ExcludeFromCodeCoverage]
    public static class Program
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="args"></param>
        public static void Main(string[] args)
        {
            var logger = NLogBuilder.ConfigureNLog("nlog.config").GetCurrentClassLogger();

            try
            {
                logger.Debug("init main");
                CreateHostBuilder(args).Build().Run();
            }
            catch (Exception ex)
            {
                logger.Error(ex, "Stopped program because of exception");
                throw;
            }
            finally
            {
                // Flush and close down internal threads and timers
                LogManager.Shutdown();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="args"></param>
        /// <returns></returns>
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureMetricsWithDefaults(builder =>
                {
                 builder.Report.ToInfluxDb(
                     opt => {
                         opt.InfluxDb.BaseUri = new Uri("http://127.0.0.1:8086");
                         opt.InfluxDb.Database = "metricsdb";
                         opt.InfluxDb.CreateDataBaseIfNotExists = true;
                     }
                 );
                })
                .UseMetrics()
                .UseMetricsWebTracking()
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                }).ConfigureLogging(log =>
                {
                    log.ClearProviders();
                    log.SetMinimumLevel(Microsoft.Extensions.Logging.LogLevel.Information);
                })
                .UseNLog();
    }
}
