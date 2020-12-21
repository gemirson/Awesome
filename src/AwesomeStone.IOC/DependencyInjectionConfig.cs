using AwesomeStone.Application;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Core.Intefaces;
using AwesomeStone.Core.Intefaces.Business;
using AwesomeStone.Core.Intefaces.Employees;
using AwesomeStone.Core.Response;
using AwesomeStone.Core.Servicos;
using AwesomeStone.Infra.Data;
using AwesomeStone.Infra.Data.Config;
using AwesomeStone.Infra.Repository;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace AwesomeStone.IOC
{
    public static class DependencyInjectionConfig
    {
        public static IServiceCollection ResolveDependencies(this IServiceCollection services, IConfiguration config)
        {
          

            services.AddTransient<IOfficeStrategy, Accounting>();
            services.AddTransient<IOfficeStrategy, CFO>();
            services.AddTransient<IOfficeStrategy, CustomerRelationship>();
            services.AddTransient<IOfficeStrategy, GeneralServices>();
            services.AddTransient<OfficeFactory>();
            services.AddTransient<IWeigth, WeigthAdmission>();
            services.AddTransient<IWeigth, WeigthSalary>();
            services.AddTransient<IBonus, BonusStrategy>();
            services.AddTransient<ResponseResult>();
            services.AddTransient<IEmployeeService, EmployeeService>();
            services.AddTransient<IEmployeeRepository,  EmployeeRepository>();
            services.AddTransient<IBusinessRepository, BusinessRepository>();
            services.AddTransient<IEmployeesApplication, EmployeeApplication>();
            services.AddTransient<IBusinessApplication, BusinessApplication>();


            services.AddScoped<IEmployeesApplication, EmployeeApplication>();

            return services;
        }
    }
}
