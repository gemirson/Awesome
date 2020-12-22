using AwesomeStone.API.Common.Configuration;
using AwesomeStone.API.Middeware;
using AwesomeStone.Infra.Data;
using AwesomeStone.Infra.Data.Config;
using AwesomeStone.IOC;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.Diagnostics.CodeAnalysis;

namespace AwesomeStone.API
{
    /// <summary>
    /// 
    /// </summary>
    [ExcludeFromCodeCoverage]
    public class Startup
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="configuration"></param>
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        /// <summary>
        /// 
        /// </summary>
        public IConfiguration Configuration { get; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="services"></param>
        public void ConfigureTestingServices(IServiceCollection services)
        {
            services.Configure<MongoDbConfig>(Configuration.GetSection("Mongo_Testing"));
            services.AddTransient<AwesomeMongoDbContext>();
            ConfigureServices(services);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="services"></param>
        public void ConfigureDevelopmentServices(IServiceCollection services)
        {
            services.Configure<MongoDbConfig>(Configuration.GetSection("Mongo_Development"));
            services.AddTransient<AwesomeMongoDbContext>();
            ConfigureServices(services);
          
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="services"></param>
        public void ConfigureProductionServices(IServiceCollection services)
        {
            services.Configure<MongoDbConfig>(Configuration.GetSection("Mongo_Production"));
            services.AddTransient<AwesomeMongoDbContext>();
            ConfigureServices(services);
        }

        /// <summary>
        /// /
        /// </summary>
        /// <param name="services"></param>
        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {           
            services.AddMemoryCache();
            services.AddControllers();
            services.AddSwaggerConfig();
            services.ResolveDependencies(this.Configuration);
            services.AddMetricsTrackingMiddleware();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="app"></param>
        /// <param name="env"></param>
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseMiddleware(typeof(ErrorHandlerMiddleware));

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseMetricsAllEndpoints();

            app.UseMetricsAllMiddleware();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
            app.UseSwagger();
            app.UseSwaggerUI(
                options =>
                {
                    options.SwaggerEndpoint("/swagger/v1/swagger.json", "V1");
                    options.RoutePrefix = string.Empty;
                });
        }
    }
}
