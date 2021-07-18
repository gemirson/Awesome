Þ
jC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Infra\Data\AwesomeMongoDbContext.cs
	namespace 	
AwesomeStone
 
. 
Infra 
. 
Data !
{		 
public

 

class

 !
AwesomeMongoDbContext

 &
{ 
private 
readonly 
IMongoDatabase '
	_database( 1
;1 2
public !
AwesomeMongoDbContext $
($ %
IOptions% -
<- .
Config. 4
.4 5
MongoDbConfig5 B
>B C
configD J
)J K
{ 	
var 
client 
= 
new 
MongoClient (
(( )
config) /
./ 0
Value0 5
.5 6
ConnectionString6 F
)F G
;G H
	_database 
= 
client 
. 
GetDatabase *
(* +
config+ 1
.1 2
Value2 7
.7 8
Database8 @
)@ A
;A B
} 	
public 
IMongoCollection 
<  
Employee  (
>( )
Operacao* 2
=>3 5
	_database6 ?
.? @
GetCollection@ M
<M N
EmployeeN V
>V W
(W X
$strX b
)b c
;c d
} 
} º
iC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Infra\Data\Config\MongoDbConfig.cs
	namespace 	
AwesomeStone
 
. 
Infra 
. 
Data !
.! "
Config" (
{ 
public 

class 
MongoDbConfig 
{ 
public		 
string		 
ConnectionString		 &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
public

 
string

 
Database

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
} 
} ì
kC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Infra\Data\Interfaces\IUnitOfWork.cs
	namespace 	
AwesomeStone
 
. 
Infra 
. 
Data !
.! "

Interfaces" ,
{ 
public		 

	interface		 
IUnitOfWork		  
{

 
IEmployeeRepository 
Employee $
{% &
get' *
;* +
}, -
IBusinessRepository 
Business $
{% &
get' *
;* +
}, -
} 
} 	
_C:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Infra\Data\UnitOfWork.cs
	namespace 	
AwesomeStone
 
. 
Infra 
. 
Data !
{		 
public

 

class

 

UnitOfWork

 
:

 
IUnitOfWork

 )
{ 
public 

UnitOfWork 
( 
IEmployeeRepository -
employeeRepository. @
,@ A
IBusinessRepositoryB U
businessRepositoryV h
)h i
{ 	
Employee 
= 
employeeRepository )
;) *
Business 
= 
businessRepository )
;) *
} 	
public 
IEmployeeRepository "
Employee# +
{, -
get. 1
;1 2
private3 :
set; >
;> ?
}@ A
public 
IBusinessRepository "
Business# +
{, -
get. 1
;1 2
private3 :
set; >
;> ?
}@ A
} 
} Ö
mC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Infra\Repository\BusinessRepository.cs
	namespace 	
AwesomeStone
 
. 
Infra 
. 

Repository '
{ 
public 

class 
BusinessRepository #
:$ %
IBusinessRepository& 9
{ 
private		 
readonly		 
IMemoryCache		 %
_memoryCache		& 2
;		2 3
public 
BusinessRepository !
(! "
IMemoryCache" .
memoryCache/ :
): ;
{ 	
_memoryCache 
= 
memoryCache &
;& '
} 	
public 
void 
Add 
( 
string 
key "
," #
OperationProfit$ 3
value4 9
)9 :
{ 	
_memoryCache 
. 
Set 
( 
key  
,  !
value! &
)& '
;' (
} 	
public 
OperationProfit 
GetAll %
(% &
string& ,
key- 0
)0 1
{ 	
return 
_memoryCache  
.  !
Get! $
<$ %
OperationProfit% 4
>4 5
(5 6
key6 9
)9 :
;: ;
} 	
} 
} ù
mC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Infra\Repository\EmployeeRepository.cs
	namespace		 	
AwesomeStone		
 
.		 
Infra		 
.		 

Repository		 '
{

 
public 

class 
EmployeeRepository #
:# $
IEmployeeRepository% 8
{ 
private 
readonly !
AwesomeMongoDbContext ."
_awesomeMongoDbContext/ E
;E F
public 
EmployeeRepository !
(! "!
AwesomeMongoDbContext" 7!
awesomeMongoDbContext8 M
)M N
{ 	"
_awesomeMongoDbContext "
=# $!
awesomeMongoDbContext% :
;: ;
} 	
public 
async 
Task 
AddAsync #
(# $
Employee$ ,
employee- 5
)5 6
{ 	
await "
_awesomeMongoDbContext (
.( )
Operacao) 1
.1 2
InsertOneAsync2 @
(@ A
employeeA I
)I J
;J K
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Employee& .
>. /
>/ 0
GetAllAsync1 <
(< =
)= >
{ 	
return 
await "
_awesomeMongoDbContext 0
.0 1
Operacao1 9
.9 :
Find: >
(> ?
new? B
BsonDocumentC O
(O P
)P Q
)Q R
.R S
ToListAsyncS ^
(^ _
)_ `
;` a
} 	
} 
} 