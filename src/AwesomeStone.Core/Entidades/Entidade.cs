using Flunt.Notifications;

namespace AwesomeStone.Core.Entidades
{
    public abstract class Entidade: Notifiable
    {
         public abstract void Validate();
    }
}
