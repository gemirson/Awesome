Ä
gC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.IOC\DependencyInjectionConfig.cs
	namespace 	
AwesomeStone
 
. 
IOC 
{ 
public 

static 
class %
DependencyInjectionConfig 1
{ 
public 
static 
IServiceCollection (
ResolveDependencies) <
(< =
this= A
IServiceCollectionB T
servicesU ]
,] ^
IConfiguration_ m
confign t
)t u
{ 	
services 
. 
	Configure 
< 
CacheConfig *
>* +
(+ ,
config, 2
.2 3

GetSection3 =
(= >
$str> K
)K L
)L M
;M N
services 
. 
	AddScoped 
< !
AwesomeMongoDbContext 4
>4 5
(5 6
)6 7
;7 8
services 
. 
	AddScoped 
< 
OfficeFactory ,
>, -
(- .
). /
;/ 0
services 
. 
	AddScoped 
< 
IWeigth &
,& '
WeigthAdmission( 7
>7 8
(8 9
)9 :
;: ;
services 
. 
	AddScoped 
< 
IWeigth &
,& '
WeigthSalary( 4
>4 5
(5 6
)6 7
;7 8
services 
. 
	AddScoped 
< 
IBonus %
,% &
BonusStrategy' 4
>4 5
(5 6
)6 7
;7 8
services 
. 
	AddScoped 
< 
IEmployeeService /
,/ 0
EmployeeService1 @
>@ A
(A B
)B C
;C D
services 
. 
	AddScoped 
< 
IEmployeeRepository 2
,2 3
EmployeeRepository5 G
>G H
(H I
)I J
;J K
services 
. 
	AddScoped 
< 
IBusinessRepository 2
,2 3
BusinessRepository4 F
>F G
(G H
)H I
;I J
services   
.   
	AddScoped   
<   
IUnitOfWork   *
,  * +

UnitOfWork  , 6
>  6 7
(  7 8
)  8 9
;  9 :
services!! 
.!! 
	AddScoped!! 
<!! )
IApplicationEmployeeContainer!! <
,!!< =(
ApplicationEmployeeContainer!!> Z
>!!Z [
(!![ \
)!!\ ]
;!!] ^
services"" 
."" 
	AddScoped"" 
<"" !
IEmployeesApplication"" 4
,""4 5
EmployeeApplication""6 I
>""I J
(""J K
)""K L
;""L M
services## 
.## 
	AddScoped## 
<##  
IBusinessApplication## 3
,##3 4
BusinessApplication##5 H
>##H I
(##I J
)##J K
;##K L
return%% 
services%% 
;%% 
}&& 	
}'' 
}(( 