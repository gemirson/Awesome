using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.DTOs;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Application.Tests.Mocks.Repository;
using AwesomeStone.Application.Tests.Mocks.UnitOfWork;
using Microsoft.Extensions.Options;
using Moq.AutoMock;
using System;
using System.Collections.Generic;
using AwesomeStone.Application.Tests.Mocks.Loggers;
using AwesomeStone.Infra.Data.Interfaces;
using Microsoft.Extensions.Logging;
using Xunit;
using Xunit.Sdk;


namespace AwesomeStone.Application.Tests
{
    public class CriarEmployeeHandlerTests
    {

        private readonly AutoMocker _mocker;
        private readonly EmployeeApplication _handler;
        private readonly IOptions<CacheConfig> _options;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IApplicationEmployeeContainer _employeeContainer;
        private readonly ILogger<EmployeeApplication> _logger; 
        public CriarEmployeeHandlerTests()
        {
            _mocker = new AutoMocker();
            _options   = Options.Create(new CacheConfig()
            { Key = "Value_Bonus" });
            _unitOfWork = new UnitOfWorkMocks(new EmployeeRepository(), new BusinessRepository());
            _mocker.Use(_unitOfWork);
            _mocker.Use(_options);
            _logger = new  MocksLogger<EmployeeApplication>();
            _employeeContainer = new ApplicationEmployeeContainer(_logger, _unitOfWork); 
            _mocker.Use(_employeeContainer);
            _mocker.CreateInstance<BusinessApplication>();
            _handler = _mocker.CreateInstance<EmployeeApplication>();


        }

        [Fact(DisplayName = "N�o deve criar um bonus para o funcionario  com command invalido")]
        [Trait("Employee","Criar Bonus com comando Invalido")]
        public async void Employee_AoCriarumEmployeeComComandoInvalido_RetornarNotificacoesComFalha()
        {
            //-------- -------------------------- Arrange -----------------------------//
            var commandBusiness = new OperationProfitRequest
            {
                BonusDistribuided = " "

            };
            var command = new List<EmployeeRequest>(){ new EmployeeRequest {
                Matricula = null,
                Nome = null,
                Area = null,
                Cargo = null,
                SalarioBruto = "R$ 10000",
                DataDeAdmissao= DateTime.Now
            } };
            //adicionar pedido
            _mocker.GetMock<IBusinessApplication>()
                .Setup(p => p.Add(commandBusiness));

            //----------------------------------- Act --------------------------------//
            var responseResult = await  _handler.AddAsync(command);

            // ---------------------------------- Assert ------------------------------//
            Assert.True(responseResult.HasFails);
        }
        
        [Fact(DisplayName = "N�o deve criar um bonus para o funcionario  com valor a ser distribuido insuficiente")]
        [Trait("Employee", "adicionar um valor de bonus com valor insuficiente")]
        public async void Employee_AdicionarUmBonusAoFuncionarioComValorSerDistribuidoInsuficiente_RetornarNotificacoesComFalha()
        {
            //---------------------------- Arrange -------------------------//
            
            var commandBusiness = new OperationProfitRequest
            {
                BonusDistribuided = "R$ "

            };
            
            //adicionar a valor ser a distribuido
            _mocker.GetMock<IBusinessApplication>()
                .Setup(p => p.Add(commandBusiness))
                ;

            var command = new List<EmployeeRequest>(){ new EmployeeRequest {
                Matricula = "0007676",
                Nome =  "Maricela Martin",
                Area = "Servi�os Gerais",
                Cargo = "Copeiro",
                SalarioBruto =  "R$ 1.591,69",
                DataDeAdmissao= DateTime.Parse("2018-01-17")
            } };

            //--------------------------------- Act ----------------------------//
            var responseResult = await _handler.AddAsync(command);

            //--------------------------------- Assert -------------------------//
            Assert.True(responseResult.HasFails);
        }

        [Fact(DisplayName = "N�o deve criar um bonus para o funcionario  com comando null")]
        [Trait("Employee Application", "O valor do comando passado � nulo")]
        public async void Employee_AdicionarUmBonusAoFuncionarioComValorNuloParaComando_RetornarException()
        {
            //---------------------------- Arrange -------------------------//
           var commandBusiness = new OperationProfitRequest
            {
                BonusDistribuided = "R$ 1.000.000,00 "

            };

            //adicionar a valor ser a distribuido
            _mocker.GetMock<IBusinessApplication>()
                .Setup(p => p.Add(commandBusiness))
                ;

            var command = new List<EmployeeRequest>();
            command = null;
            var expected = "Error objeto passado nulo";
            //--------------------------------- Act ----------------------------//
            var actual = Assert.ThrowsAsync<NullReferenceException>(() =>  _handler.AddAsync(command));

            //--------------------------------- Assert -------------------------//
            Assert.Equal(expected:expected, actual:actual.Result.Message);
        }
    }
}
