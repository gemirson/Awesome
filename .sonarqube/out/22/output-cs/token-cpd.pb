ß
pC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.API\Common\Configuration\SwaggerConfig.cs
	namespace		 	
AwesomeStone		
 
.		 
API		 
.		 
Common		 !
.		! "
Configuration		" /
{

 
[ #
ExcludeFromCodeCoverage 
] 
public 

static 
class 
SwaggerConfig %
{ 
public 
static 
IServiceCollection (
AddSwaggerConfig) 9
(9 :
this: >
IServiceCollection? Q
servicesR Z
)Z [
{ 	
services 
. 
AddSwaggerGen "
(" #
options# *
=>+ -
{ 
options 
. 

SwaggerDoc "
(" #
$str# '
,' (
new) ,
OpenApiInfo- 8
{ 
Title 
= 
$str %
,% &
Version 
= 
$str "
," #
Description 
=  !
$str" +
,+ ,
} 
) 
; 
options 
. !
AddSecurityDefinition -
(- .
$str. 6
,6 7
new8 ;!
OpenApiSecurityScheme< Q
{ 
In 
= 
ParameterLocation *
.* +
Header+ 1
,1 2
Description 
=  !
$str" V
,V W
Name 
= 
$str *
,* +
Type 
= 
SecuritySchemeType -
.- .
ApiKey. 4
} 
) 
; 
options   
.   
OperationFilter   '
<  ' (
AuthOperationFilter  ( ;
>  ; <
(  < =
)  = >
;  > ?
var## 
xmlFile## 
=## 
$"##  
{##  !
Assembly##! )
.##) * 
GetExecutingAssembly##* >
(##> ?
)##? @
.##@ A
GetName##A H
(##H I
)##I J
.##J K
Name##K O
}##O P
$str##P T
"##T U
;##U V
var$$ 
xmlPath$$ 
=$$ 
Path$$ "
.$$" #
Combine$$# *
($$* +

AppContext$$+ 5
.$$5 6
BaseDirectory$$6 C
,$$C D
xmlFile$$E L
)$$L M
;$$M N
options%% 
.%% 
IncludeXmlComments%% *
(%%* +
xmlPath%%+ 2
)%%2 3
;%%3 4
}&& 
)&& 
;&& 
return)) 
services)) 
;)) 
}** 	
}++ 
},, ö
oC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.API\Common\Filter\AuthOperationFilter.cs
	namespace 	
AwesomeStone
 
. 
API 
. 
Common !
.! "
Filter" (
{		 
[

 #
ExcludeFromCodeCoverage

 
]

 
public 

class 
AuthOperationFilter $
:% &
IOperationFilter' 7
{ 
public 
void 
Apply 
( 
OpenApiOperation *
	operation+ 4
,4 5"
OperationFilterContext6 L
contextM T
)T U
{ 	
var 
isAuthorized 
= 
context &
.& '

MethodInfo' 1
.1 2
DeclaringType2 ?
.? @
GetCustomAttributes@ S
(S T
trueT X
)X Y
.Y Z
OfTypeZ `
<` a
AuthorizeAttributea s
>s t
(t u
)u v
.v w
Anyw z
(z {
){ |
||} 
context( /
./ 0

MethodInfo0 :
.: ;
GetCustomAttributes; N
(N O
trueO S
)S T
.T U
OfTypeU [
<[ \
AuthorizeAttribute\ n
>n o
(o p
)p q
.q r
Anyr u
(u v
)v w
;w x
if 
( 
! 
isAuthorized 
) 
return %
;% &
	operation 
. 
	Responses 
.  
TryAdd  &
(& '
$str' ,
,, -
new. 1
OpenApiResponse2 A
{B C
DescriptionD O
=P Q
$strR `
}a b
)b c
;c d
	operation 
. 
	Responses 
.  
TryAdd  &
(& '
$str' ,
,, -
new. 1
OpenApiResponse2 A
{B C
DescriptionD O
=P Q
$strR ]
}^ _
)_ `
;` a
var 
jwtbearerScheme 
=  !
new" %!
OpenApiSecurityScheme& ;
{ 
	Reference 
= 
new 
OpenApiReference  0
{1 2
Type3 7
=8 9
ReferenceType: G
.G H
SecuritySchemeH V
,V W
IdX Z
=[ \
$str] e
}f g
} 
; 
	operation 
. 
Security 
=  
new! $
List% )
<) *&
OpenApiSecurityRequirement* D
>D E
{ 
new &
OpenApiSecurityRequirement 1
{ 
[   
jwtbearerScheme   (
]  ) *
=  + ,
new  - 0
string  1 7
[  8 9
]  9 :
{  ; <
}  = >
}!! 
}"" 
;"" 
}## 	
}$$ 
}%% Ë
hC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.API\Controllers\BaseController.cs
	namespace 	
AwesomeStone
 
. 
API 
. 
Controllers &
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
BaseController 
:  !
ControllerBase" 0
{ 
} 
}		 ˝
lC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.API\Controllers\BusinessController.cs
	namespace 	
AwesomeStone
 
. 
API 
. 
Controllers &
{		 
public 

class 
BusinessController #
:$ %
BaseController& 4
{ 
private 
readonly 
ILogger  
<  !
EmployeeController! 3
>3 4
_logger5 <
;< =
private 
readonly  
IBusinessApplication -
_businessAplication. A
;A B
public 
BusinessController !
(! "
ILogger" )
<) *
EmployeeController* <
>< =
logger> D
,D E 
IBusinessApplicationF Z
businessAplication[ m
)m n
{ 	
_logger 
= 
logger 
; 
_businessAplication 
=  !
businessAplication" 4
;4 5
_logger 
. 
LogDebug 
( 
default $
($ %
EventId% ,
), -
,- .
$"/ 1
$str1 D
{D E
nameofE K
(K L
BusinessControllerL ^
)^ _
}_ `
"` a
)a b
;b c
} 	
[,, 	
HttpPost,,	 
(,, 
$str,, 
),, 
],, 
[-- 	 
ProducesResponseType--	 
(-- 
StatusCodes-- )
.--) *
Status200OK--* 5
)--5 6
]--6 7
[.. 	 
ProducesResponseType..	 
(.. 
StatusCodes.. )
...) *
Status400BadRequest..* =
)..= >
]..> ?
[// 	 
ProducesResponseType//	 
(// 
StatusCodes// )
.//) *(
Status500InternalServerError//* F
)//F G
]//G H
public00 
ActionResult00 
BonusCreate00 '
(00' (
[00( )
FromBody00) 1
]001 2"
OperationProfitRequest003 I"
operationProfitRequest00J `
)00` a
{11 	
var22 
result22 
=22 
_businessAplication22 -
.22- .
Add22. 1
(221 2"
operationProfitRequest222 H
)22H I
;22I J
if44 
(44 
result44 
.44 
HasFails44 
)44  
{55 
_logger66 
.66 
LogError66  
(66  !
default66! (
(66( )
EventId66) 0
)660 1
,661 2
$"663 5
$str665 D
{66D E
nameof66E K
(66K L
BusinessController66L ^
)66^ _
}66_ `
$str66` p
{66p q
result66q w
.66w x
Fails66x }
}66} ~
"66~ 
)	66 Ä
;
66Ä Å
return77 

BadRequest77 !
(77! "
result77" (
.77( )
Fails77) .
)77. /
;77/ 0
}88 
return99 
this99 
.99 
Ok99 
(99 
result99 !
.99! "
Data99" &
)99& '
;99' (
};; 	
}<< 
}== ≥
lC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.API\Controllers\EmployeeController.cs
	namespace

 	
AwesomeStone


 
.

 
API

 
.

 
Controllers

 &
{ 
public 

class 
EmployeeController #
:$ %
BaseController& 4
{ 
private 
readonly 
ILogger  
<  !
EmployeeController! 3
>3 4
_logger5 <
;< =
private 
readonly !
IEmployeesApplication .!
_employeesApplication/ D
;D E
public 
EmployeeController !
(! "
ILogger" )
<) *
EmployeeController* <
>< =
logger> D
,D E!
IEmployeesApplicationF [ 
employeesApplication\ p
)p q
{ 	
_logger 
= 
logger 
; !
_employeesApplication !
=" # 
employeesApplication$ 8
;8 9
_logger 
. 
LogDebug 
( 
default $
($ %
EventId% ,
), -
,- .
$"/ 1
$str1 D
{D E
nameofE K
(K L
EmployeeControllerL ^
)^ _
}_ `
"` a
)a b
;b c
} 	
[33 	
HttpPost33	 
(33 
$str33 
)33 
]33 
[44 	 
ProducesResponseType44	 
(44 
StatusCodes44 )
.44) *
Status201Created44* :
)44: ;
]44; <
[55 	 
ProducesResponseType55	 
(55 
StatusCodes55 )
.55) *
Status400BadRequest55* =
)55= >
]55> ?
[66 	 
ProducesResponseType66	 
(66 
StatusCodes66 )
.66) *(
Status500InternalServerError66* F
)66F G
]66G H
public77 
async77 
Task77 
<77 
ActionResult77 &
>77& '

BonusAsync77( 2
(772 3
[773 4
FromBody774 <
]77< =
IEnumerable77> I
<77I J
EmployeeRequest77J Y
>77Y Z
employeeRequest77[ j
)77j k
{88 	
var99 
result99 
=99 
await99 !
_employeesApplication99 4
.994 5
AddAsync995 =
(99= >
employeeRequest99> M
)99M N
;99N O
if;; 
(;; 
result;; 
.;; 
HasFails;; 
);;  
{<< 
_logger== 
.== 
LogError==  
(==  !
default==! (
(==( )
EventId==) 0
)==0 1
,==1 2
$"==3 5
$str==5 D
{==D E
nameof==E K
(==K L
EmployeeController==L ^
)==^ _
}==_ `
$str==` p
{==p q
result==q w
.==w x
Fails==x }
}==} ~
"==~ 
)	== Ä
;
==Ä Å
return>> 

BadRequest>> !
(>>! "
result>>" (
.>>( )
Fails>>) .
)>>. /
;>>/ 0
}?? 
returnAA 
CreatedAA 
(AA 
stringAA !
.AA! "
EmptyAA" '
,AA' (
resultAA( .
.AA. /
DataAA/ 3
)AA3 4
;AA4 5
}CC 	
}DD 
}EE ∑
nC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.API\Middeware\ErrorHandlerMiddleware.cs
	namespace

 	
AwesomeStone


 
.

 
API

 
.

 
	Middeware

 $
{ 
public 

class "
ErrorHandlerMiddleware '
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
public "
ErrorHandlerMiddleware %
(% &
RequestDelegate& 5
next6 :
): ;
{ 	
_next 
= 
next 
; 
} 	
public!! 
async!! 
Task!! 
Invoke!!  
(!!  !
HttpContext!!! ,
context!!- 4
)!!4 5
{"" 	
try## 
{$$ 
await%% 
_next%% 
(%% 
context%% #
)%%# $
;%%$ %
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
var)) 
response)) 
=)) 
new)) "
ResponseResult))# 1
())1 2
)))2 3
;))3 4
response** 
.** 
AddNotification** (
(**( )
new**) ,
Notification**- 9
(**9 :
$str**: H
,**H I
(**J K
ex**K M
.**M N
InnerException**N \
!=**] _
null**` d
)**d e
?**f g
ex**h j
.**j k
InnerException**k y
.**y z
Message	**z Å
:
**Ç É
ex
**Ñ Ü
.
**Ü á
Message
**á é
)
**é è
)
**è ê
;
**ê ë
context,, 
.,, 
Response,,  
.,,  !

StatusCode,,! +
=,,, -
$num,,. 1
;,,1 2
context-- 
.-- 
Response--  
.--  !
ContentType--! ,
=--- .
$str--/ A
;--A B
var.. 
result.. 
=.. 
JsonSerializer.. +
...+ ,
	Serialize.., 5
(..5 6
new// 
{00 
erros11 
=11 
response11  (
.11( )
Fails11) .
.11. /
Select11/ 5
(115 6
x116 7
=>118 :
x11; <
.11< =
Message11= D
)11D E
}22 
)22 
;22 
await44 
context44 
.44 
Response44 &
.44& '

WriteAsync44' 1
(441 2
result442 8
)448 9
;449 :
}55 
}66 	
}77 
}88 ˚
UC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.API\Program.cs
	namespace

 	
AwesomeStone


 
.

 
API

 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
var 
logger 
= 
NLogBuilder $
.$ %
ConfigureNLog% 2
(2 3
$str3 @
)@ A
.A B!
GetCurrentClassLoggerB W
(W X
)X Y
;Y Z
try 
{ 
logger 
. 
Debug 
( 
$str (
)( )
;) *
CreateHostBuilder !
(! "
args" &
)& '
.' (
Build( -
(- .
). /
./ 0
Run0 3
(3 4
)4 5
;5 6
} 
catch 
( 
	Exception 
ex 
)  
{ 
logger   
.   
Error   
(   
ex   
,    
$str  ! G
)  G H
;  H I
throw!! 
;!! 
}"" 
finally## 
{$$ 

LogManager&& 
.&& 
Shutdown&& #
(&&# $
)&&$ %
;&&% &
}'' 
}(( 	
public// 
static// 
IHostBuilder// "
CreateHostBuilder//# 4
(//4 5
string//5 ;
[//; <
]//< =
args//> B
)//B C
=>//D F
Host00 
.00  
CreateDefaultBuilder00 %
(00% &
args00& *
)00* +
.11 (
ConfigureMetricsWithDefaults11 -
(11- .
builder11. 5
=>116 8
{22 
builder33 
.33 
Report33 
.33  

ToInfluxDb33  *
(33* +
opt44 
=>44 
{44 
opt55 
.55 
InfluxDb55 %
.55% &
BaseUri55& -
=55. /
new550 3
Uri554 7
(557 8
$str558 O
)55O P
;55P Q
opt66 
.66 
InfluxDb66 %
.66% &
Database66& .
=66/ 0
$str661 <
;66< =
opt77 
.77 
InfluxDb77 %
.77% &%
CreateDataBaseIfNotExists77& ?
=77@ A
true77B F
;77F G
}88 
)99 
;99 
}:: 
):: 
.;; 

UseMetrics;; 
(;; 
);; 
.<< !
UseMetricsWebTracking<< &
(<<& '
)<<' (
.== $
ConfigureWebHostDefaults== )
(==) *

webBuilder==* 4
=>==5 7
{>> 

webBuilder?? 
.?? 

UseStartup?? )
<??) *
Startup??* 1
>??1 2
(??2 3
)??3 4
;??4 5
}@@ 
)@@ 
.@@ 
ConfigureLogging@@ #
(@@# $
log@@$ '
=>@@( *
{AA 
logBB 
.BB 
ClearProvidersBB &
(BB& '
)BB' (
;BB( )
logCC 
.CC 
SetMinimumLevelCC '
(CC' (
	MicrosoftCC( 1
.CC1 2

ExtensionsCC2 <
.CC< =
LoggingCC= D
.CCD E
LogLevelCCE M
.CCM N
InformationCCN Y
)CCY Z
;CCZ [
}DD 
)DD 
.EE 
UseNLogEE 
(EE 
)EE 
;EE 
}FF 
}GG Û(
UC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.API\Startup.cs
	namespace 	
AwesomeStone
 
. 
API 
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public   
IConfiguration   
Configuration   +
{  , -
get  . 1
;  1 2
}  3 4
public&& 
void&& $
ConfigureTestingServices&& ,
(&&, -
IServiceCollection&&- ?
services&&@ H
)&&H I
{'' 	
services(( 
.(( 
	Configure(( 
<(( 
MongoDbConfig(( ,
>((, -
(((- .
Configuration((. ;
.((; <

GetSection((< F
(((F G
$str((G V
)((V W
)((W X
;((X Y
ConfigureServices)) 
()) 
services)) &
)))& '
;))' (
}** 	
public00 
void00 (
ConfigureDevelopmentServices00 0
(000 1
IServiceCollection001 C
services00D L
)00L M
{11 	
services22 
.22 
	Configure22 
<22 
MongoDbConfig22 ,
>22, -
(22- .
Configuration22. ;
.22; <

GetSection22< F
(22F G
$str22G Z
)22Z [
)22[ \
;22\ ]
ConfigureServices33 
(33 
services33 &
)33& '
;33' (
}55 	
public;; 
void;; '
ConfigureProductionServices;; /
(;;/ 0
IServiceCollection;;0 B
services;;C K
);;K L
{<< 	
services== 
.== 
	Configure== 
<== 
MongoDbConfig== ,
>==, -
(==- .
Configuration==. ;
.==; <

GetSection==< F
(==F G
$str==G Y
)==Y Z
)==Z [
;==[ \
ConfigureServices>> 
(>> 
services>> &
)>>& '
;>>' (
}?? 	
publicFF 
voidFF 
ConfigureServicesFF %
(FF% &
IServiceCollectionFF& 8
servicesFF9 A
)FFA B
{GG 	
servicesHH 
.HH 
AddMemoryCacheHH #
(HH# $
)HH$ %
;HH% &
servicesII 
.II 
AddControllersII #
(II# $
)II$ %
;II% &
servicesJJ 
.JJ 
AddSwaggerConfigJJ %
(JJ% &
)JJ& '
;JJ' (
servicesKK 
.KK 
ResolveDependenciesKK (
(KK( )
thisKK) -
.KK- .
ConfigurationKK. ;
)KK; <
;KK< =
servicesLL 
.LL (
AddMetricsTrackingMiddlewareLL 1
(LL1 2
)LL2 3
;LL3 4
}MM 	
publicUU 
voidUU 
	ConfigureUU 
(UU 
IApplicationBuilderUU 1
appUU2 5
,UU5 6
IWebHostEnvironmentUU7 J
envUUK N
)UUN O
{VV 	
appWW 
.WW 
UseMiddlewareWW 
(WW 
typeofWW $
(WW$ %"
ErrorHandlerMiddlewareWW% ;
)WW; <
)WW< =
;WW= >
ifYY 
(YY 
envYY 
.YY 
IsDevelopmentYY !
(YY! "
)YY" #
)YY# $
{ZZ 
}\\ 
app^^ 
.^^ 
UseHttpsRedirection^^ #
(^^# $
)^^$ %
;^^% &
app`` 
.`` "
UseMetricsAllEndpoints`` &
(``& '
)``' (
;``( )
appbb 
.bb #
UseMetricsAllMiddlewarebb '
(bb' (
)bb( )
;bb) *
appdd 
.dd 

UseRoutingdd 
(dd 
)dd 
;dd 
appff 
.ff 
UseAuthorizationff  
(ff  !
)ff! "
;ff" #
apphh 
.hh 
UseEndpointshh 
(hh 
	endpointshh &
=>hh' )
{ii 
	endpointsjj 
.jj 
MapControllersjj (
(jj( )
)jj) *
;jj* +
}kk 
)kk 
;kk 
appll 
.ll 

UseSwaggerll 
(ll 
)ll 
;ll 
appmm 
.mm 
UseSwaggerUImm 
(mm 
optionsnn 
=>nn 
{oo 
optionspp 
.pp 
SwaggerEndpointpp +
(pp+ ,
$strpp, F
,ppF G
$strppH L
)ppL M
;ppM N
optionsqq 
.qq 
RoutePrefixqq '
=qq( )
stringqq* 0
.qq0 1
Emptyqq1 6
;qq6 7
}rr 
)rr 
;rr 
}ss 	
}tt 
}uu 