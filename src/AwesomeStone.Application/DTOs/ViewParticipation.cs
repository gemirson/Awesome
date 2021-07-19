using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Text;

namespace AwesomeStone.Application.DTOs
{

    [ExcludeFromCodeCoverage]
    struct  ViewParticipation
    {
        public string Matricula { get; set; }
        public string Nome { get; set; }
        public string ValorDaParticipação { get; set; }
    }
}
