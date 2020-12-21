using Flunt.Notifications;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson.Serialization.IdGenerators;
using System;

namespace AwesomeStone.Core.Entidades
{
    public abstract class Entidade: Notifiable
    {
        public Guid Id { get; protected set; }

        protected Entidade()
        {
            Id = Guid.NewGuid();
        }
        public abstract void Validate();
    }
}
