using AwesomeStone.Core.Intefaces.Employees;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Core.Servicos
{
    public class OfficeFactory
    {
        private readonly Dictionary<string, IOfficeStrategy> _map;

        public OfficeFactory()
        {
            _map = new Dictionary<string, IOfficeStrategy>();
            Initialize();
        }

        private void Initialize() {
             _map.Add("Diretoria",     new CFO());
             _map.Add("Contabilidade", new Accounting());
             _map.Add("Financeiro",    new Accounting());
             _map.Add("Tecnologia",    new Accounting());
             _map.Add("Serviços Gerais",    new GeneralServices());
             _map.Add("Relacionamento com o Cliente",    new CustomerRelationship());
        }

        public int GetWeightOffice(string office) {
            return _map[office].GetWeightOffice();
        }
    }
}
