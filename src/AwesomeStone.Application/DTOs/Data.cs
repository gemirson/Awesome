using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Text;

namespace AwesomeStone.Application.DTOs
{
    [ExcludeFromCodeCoverage]
    internal class Data
    {
        public IEnumerable<ViewParticipation> Participações { get;set;}
        public string TotalDeFuncionarios       { get; set; }
        public string TotalDistribuido           { get; set; }
        public string TotalDisponibilizado       { get; set; }
        public string SaldoTotalDisponibilizado { get; set; }
    }
}
