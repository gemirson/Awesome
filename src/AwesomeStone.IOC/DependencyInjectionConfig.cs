using AwesomeStone.Application;
using AwesomeStone.Application.DTOs;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Core.Intefaces.Employees;
using AwesomeStone.Core.Response;
using AwesomeStone.Core.Servicos;
using AwesomeStone.Infra.Data;
using AwesomeStone.Infra.Data.Interfaces;
using AwesomeStone.Infra.Repository;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace AwesomeStone.IOC
{
    public static class DependencyInjectionConfig
    {
        public static IServiceCollection ResolveDependencies(this IServiceCollection services, IConfiguration config)
        {
            services.Configure<CacheConfig>(config.GetSection("CacheConfig"));
            services.AddScoped<AwesomeMongoDbContext>();
            services.AddScoped<OfficeFactory>();
            services.AddScoped<IWeigth, WeigthAdmission>();
            services.AddScoped<IWeigth, WeigthSalary>();
            services.AddScoped<IBonus, BonusStrategy>();
            services.AddScoped<IEmployeeService, EmployeeService>();
            services.AddScoped<IEmployeeRepository,  EmployeeRepository>();
            services.AddScoped<IBusinessRepository, BusinessRepository>();


            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IApplicationEmployeeContainer, ApplicationEmployeeContainer>();
            services.AddScoped<IEmployeesApplication, EmployeeApplication>();
            services.AddScoped<IBusinessApplication, BusinessApplication>();
           
            return services;
        }
    }
}
