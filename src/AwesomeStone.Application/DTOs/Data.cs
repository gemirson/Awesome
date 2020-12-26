using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Application.DTOs
{
    internal class Data
    {
        public IEnumerable<ViewParticipation> Participações { get;set;}
        public string TotalDeFuncionarios       { get; set; }
        public string TotalDistribuido           { get; set; }
        public string TotalDisponibilizado       { get; set; }
        public string SaldoTotalDisponibilizado { get; set; }
    }
}
