using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Application.DTOs
{
    internal class Data
    {
        public IEnumerable<ViewParticipation> participações { get;set;}
        public string total_de_funcionarios       { get; set; }
        public string total_distribuido           { get; set; }
        public string total_disponibilizado       { get; set; }
        public string saldo_total_disponibilizado { get; set; }
    }
}
