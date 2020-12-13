using AwesomeStone.Core.Entidades;
using Microsoft.Extensions.Options;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Text;

namespace AwesomeStone.Infra.Data
{
    public class AwesomeMongoDbContext
    {
        private readonly IMongoDatabase _database;

        public AwesomeMongoDbContext(IOptions<Config.MongoDbConfig> config)
        {
            var client = new MongoClient(config.Value.ConnectionString);
            _database = client.GetDatabase(config.Value.Database);
        }

        public IMongoCollection<Employee> Operacao => _database.GetCollection<Employee>("Employee");
    }
}
