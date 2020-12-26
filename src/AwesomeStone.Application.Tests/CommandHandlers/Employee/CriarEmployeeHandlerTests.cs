using AwesomeStone.Application.Command.Request;
using AwesomeStone.Application.DTOs;
using AwesomeStone.Application.Interfaces;
using AwesomeStone.Application.Tests.Mocks.Repository;
using AwesomeStone.Application.Tests.Mocks.UnitOfWork;
using Microsoft.Extensions.Options;
using Moq.AutoMock;
using System;
using System.Collections.Generic;
using AwesomeStone.Infra.Data.Interfaces;
using Xunit;


namespace AwesomeStone.Application.Tests
{
    public class CriarEmployeeHandlerTests
    {

        private readonly AutoMocker _mocker;
        private readonly EmployeeApplication _handler;
        private readonly IOptions<CacheConfig> _options;
        private readonly IUnitOfWork _unitOfWork; 
        public CriarEmployeeHandlerTests()
        {
            _mocker = new AutoMocker();
            _options   = Options.Create(new CacheConfig()
            { Key = "Value_Bonus" });
            _unitOfWork = new UnitOfWorkMocks(new EmployeeRepository(), new BusinessRepository());
            _mocker.Use(_unitOfWork);
             _mocker.Use(_options);
            _mocker.CreateInstance<BusinessApplication>();
            _handler = _mocker.CreateInstance<EmployeeApplication>();


        }

        [Fact(DisplayName = "Não deve criar um bonus para o funcionario  com command invalido")]
        [Trait("Employee","Criar Bonus com comando Invalido")]
        public async void Employee_AoCriarumEmployeeComComandoInvalido_RetornarNotificacoesComFalha()
        {
            //-------- -------------------------- Arrange -----------------------------//
            var commandBusiness = new Operation_ProfitRequest
            {
                Bonus_Distribuided = " "

            };
            var command = new List<EmployeeRequest>(){ new EmployeeRequest {
                matricula = null,
                nome = null,
                area = null,
                cargo = null,
                salario_bruto = "R$ 10000",
                data_de_admissao= DateTime.Now
            } };
            //adicionar pedido
            _mocker.GetMock<IBusinessApplication>()
                .Setup(p => p.Add(commandBusiness));

            //----------------------------------- Act --------------------------------//
            var responseResult = await  _handler.AddAsync(command);

            // ---------------------------------- Assert ------------------------------//
            Assert.True(responseResult.HasFails);
        }
        
        [Fact(DisplayName = "Não deve criar um bonus para o funcionario  com valor a ser distribuido insuficiente")]
        [Trait("Employee", "adicionar um valor de bonus com valor insuficiente")]
        public async void Employee_AdicionarUmBonusAoFuncionarioComValorSerDistribuidoInsuficiente_RetornarNotificacoesComFalha()
        {
            //---------------------------- Arrange -------------------------//
            
            var commandBusiness = new Operation_ProfitRequest
            {
                Bonus_Distribuided = "R$ "

            };
            
            //adicionar a valor ser a distribuido
            _mocker.GetMock<IBusinessApplication>()
                .Setup(p => p.Add(commandBusiness))
                ;

            var command = new List<EmployeeRequest>(){ new EmployeeRequest {
                matricula = "0007676",
                nome =  "Maricela Martin",
                area = "Serviços Gerais",
                cargo = "Copeiro",
                salario_bruto =  "R$ 1.591,69",
                data_de_admissao= DateTime.Parse("2018-01-17")
            } };

            //--------------------------------- Act ----------------------------//
            var responseResult = await _handler.AddAsync(command);

            //--------------------------------- Assert -------------------------//
            Assert.True(responseResult.HasFails);
        }
    }
}
