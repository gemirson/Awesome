Î
eC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\ApplicationBase.cs
	namespace 	
AwesomeStone
 
. 
Application "
{ 
public 

class 
ApplicationBase !
{ 
public		 
ResponseResult		 
	_response		 (
=>		) +
new		, /
ResponseResult		0 >
(		> ?
)		? @
;		@ A
} 
} Î	
rC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\ApplicationEmployeeContainer.cs
	namespace 	
AwesomeStone
 
. 
Application "
{ 
public 

class (
ApplicationEmployeeContainer -
:- .)
IApplicationEmployeeContainer/ L
{ 
public		 
ILogger		 
<		 
EmployeeApplication		 *
>		* +
Logger		, 2
{		3 4
get		5 8
;		8 9
private		: A
set		B E
;		E F
}		G H
public

 
IUnitOfWork

 

UnitOfWork

 %
{

& '
get

( +
;

+ ,
private

, 3
set

4 7
;

7 8
}

8 9
public (
ApplicationEmployeeContainer +
(+ ,
ILogger, 3
<3 4
EmployeeApplication4 G
>G H
loggerI O
,O P
IUnitOfWorkQ \

unitOfWork] g
)g h
{ 	
Logger 
= 
logger 
; 

UnitOfWork 
= 

unitOfWork #
;# $
} 	
} 
} ‘4
iC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\BusinessApplication.cs
	namespace 	
AwesomeStone
 
. 
Application "
{ 
public 

class 
BusinessApplication $
:% & 
IBusinessApplication' ;
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
ILogger  
<  !
BusinessApplication! 4
>4 5
_logger6 =
;= >
private 
readonly 
IOptions !
<! "
CacheConfig" -
>- .
_cacheConfig/ ;
;; <
public 
BusinessApplication "
(" #
IUnitOfWork# .

unitOfWork/ 9
,9 :
ILogger; B
<B C
BusinessApplicationC V
>V W
loggerX ^
,^ _
IOptions` h
<h i
CacheConfigi t
>t u
cacheConfig	v Å
)
Å Ç
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_logger 
= 
logger 
; 
_cacheConfig 
= 
cacheConfig &
;& '
_logger 
. 
LogDebug 
( 
default $
($ %
EventId% ,
), -
,- .
$"/ 1
$str1 D
{D E
nameofE K
(K L
BusinessApplicationL _
)_ `
}` a
"a b
)b c
;c d
} 	
public 
ResponseResult 
Add !
(! ""
OperationProfitRequest" 8"
operationProfitRequest9 O
)O P
{ 	
var 
	_response 
= 
new 
ResponseResult  .
(. /
)/ 0
;0 1
try   
{!! "
operationProfitRequest"" &
.""& '
Validate""' /
(""/ 0
)""0 1
;""1 2
if$$ 
($$ "
operationProfitRequest$$ *
.$$* +
Notifications$$+ 8
.$$8 9
Any$$9 <
($$< =
)$$= >
)$$> ?
{%% 
	_response&& 
.&& 
AddNotifications&& .
(&&. /"
operationProfitRequest&&/ E
.&&E F
Notifications&&F S
)&&S T
;&&T U
return'' 
	_response'' $
;''$ %
}(( 
var** 
value** 
=** 
$num**  
;**  !
if++ 
(++ "
operationProfitRequest++ *
.++* +
IsValid+++ 2
(++2 3
)++3 4
)++4 5
{,, 
value.. 
=.. 
Convert.. #
...# $
	ToDecimal..$ -
(..- ."
operationProfitRequest... D
...D E
BonusDistribuided..E V
...V W
Remove..W ]
(..] ^
$num..^ _
,.._ `
$num..a b
)..b c
)..c d
;..d e
}// 
var11 
entidade11 
=11 
new11 "
OperationProfit11# 2
(112 3
value113 8
)118 9
;119 :
_unitOfWork22 
.22 
Business22 $
.22$ %
Add22% (
(22( )
_cacheConfig22) 5
.225 6
Value226 ;
.22; <
Key22< ?
,22? @
entidade22A I
)22I J
;22J K
	_response44 
.44 
AddValue44 "
(44" #
new44# &
{55 
Status66 
=66 
$str66 =
}77 
)77 
;77 
}:: 
catch;; 
(;; !
ArgumentNullException;; (
ex;;) +
);;+ ,
{;;- .
	_response== 
.== 
AddNotification== )
(==) *
new==* -
Notification==. :
(==: ;
nameof==; A
(==A B
BusinessApplication==B U
)==U V
,==V W
$"==X Z
$str==Z l
{==l m
ex==m o
.==o p
Message==p w
}==w x
"==x y
)==y z
)==z {
;=={ |
_logger>> 
.>> 
LogError>>  
(>>  !
default>>! (
(>>( )
EventId>>) 0
)>>0 1
,>>1 2
$">>3 5
$str>>5 D
{>>D E
nameof>>E K
(>>K L
BusinessApplication>>L _
)>>_ `
}>>` a
$str>>a m
{>>m n
ex>>n p
.>>p q
Message>>q x
}>>x y
$str>>y }
{>>} ~
nameof	>>~ Ñ
(
>>Ñ Ö$
operationProfitRequest
>>Ö õ
)
>>õ ú
}
>>ú ù
"
>>ù û
)
>>û ü
;
>>ü †
throw?? 
;?? 
}@@ 
catchAA 
(AA 
	ExceptionAA 
exAA 
)AA  
{BB 
	_responseCC 
.CC 
AddNotificationCC )
(CC) *
newCC* -
NotificationCC. :
(CC: ;
nameofCC; A
(CCA B
BusinessApplicationCCB U
)CCU V
,CCV W
$"CCX Z
$strCCZ l
{CCl m
exCCm o
.CCo p
MessageCCp w
}CCw x
"CCx y
)CCy z
)CCz {
;CC{ |
_loggerDD 
.DD 
LogErrorDD  
(DD  !
defaultDD! (
(DD( )
EventIdDD) 0
)DD0 1
,DD1 2
$"DD3 5
$strDD5 D
{DDD E
nameofDDE K
(DDK L
BusinessApplicationDDL _
)DD_ `
}DD` a
$strDDa m
{DDm n
exDDn p
.DDp q
MessageDDq x
}DDx y
$strDDy }
{DD} ~
nameof	DD~ Ñ
(
DDÑ Ö$
operationProfitRequest
DDÖ õ
)
DDõ ú
}
DDú ù
"
DDù û
)
DDû ü
;
DDü †
throwEE 
;EE 
}FF 
returnHH 
	_responseHH 
;HH 
}JJ 	
publicLL 
OperationProfitLL 
GetLL "
(LL" #
stringLL# )
keyLL* -
)LL- .
{MM 	
returnNN 
_unitOfWorkNN 
.NN 
BusinessNN '
.NN' (
GetAllNN( .
(NN. /
keyNN/ 2
)NN2 3
;NN3 4
}OO 	
}PP 
}QQ Ô
uC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\Command\Request\EmployeeRequest.cs
	namespace 	
AwesomeStone
 
. 
Application "
." #
Command# *
.* +
Request+ 2
{ 
public 

class 
EmployeeRequest  
:  !

Notifiable" ,
{ 
public		 
string		 
	Matricula		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
string

 
Nome

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Area 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Cargo 
{ 
get !
;! "
set$ '
;' (
}) *
public 
string 
SalarioBruto "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
DataDeAdmissao &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
void 
Validate 
( 
) 
{ 	
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 
	IsNotNull 
( 
DataDeAdmissao +
,+ ,
nameof- 3
(3 4
DataDeAdmissao4 B
)B C
,C D
$strE l
)l m
)m n
;n o
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 
	IsNotNull 
( 
Cargo "
," #
nameof$ *
(* +
Cargo+ 0
)0 1
,1 2
$str3 O
)O P
)P Q
;Q R
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 
	IsNotNull 
( 
Area !
,! "
nameof# )
() *
Area* .
). /
,/ 0
$str1 M
)M N
)N O
;O P
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 
	IsNotNull 
( 
	Matricula &
,& '
nameof( .
(. /
	Matricula/ 8
)8 9
,9 :
$str; [
)[ \
)\ ]
;] ^
}!! 	
}"" 
}## Ê
}C:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\Command\Request\Operation_ProfitRequest.cs
	namespace 	
AwesomeStone
 
. 
Application "
." #
Command# *
.* +
Request+ 2
{ 
public 

class "
OperationProfitRequest '
:( )

Notifiable* 4
{ 
public		 
string		 
BonusDistribuided		 '
{		( )
get		* -
;		- .
set		/ 2
;		2 3
}		4 5
public 
void 
Validate 
( 
) 
{ 	
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 
	IsNotNull 
( 
BonusDistribuided .
,. /
nameof/ 5
(5 6
BonusDistribuided6 G
)G H
,H I
$strJ w
)w x
)x y
;y z
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 
	IsNotNull 
( 
this  
,  !
nameof" (
(( )
BonusDistribuided) :
): ;
,; <
$"= ?
$str? H
{H I
nameofI O
(O P"
OperationProfitRequestP f
)f g
}g h
$strh z
"z {
){ |
)| }
;} ~
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 

IsNotEmpty 
( 
Guid  
.  !
NewGuid! (
(( )
)) *
,* +
nameof, 2
(2 3
BonusDistribuided3 D
)D E
,E F
$strG v
)v w
)w x
;x y
} 	
public 
bool 
IsValid 
( 
) 
{ 	
return 
BonusDistribuided $
.$ %
Contains% -
(- .
$str. 2
)2 3
;3 4
}   	
}!! 
}"" Ô
fC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\DTOs\CacheConfig.cs
	namespace 	
AwesomeStone
 
. 
Application "
." #
DTOs# '
{ 
public 

class 
CacheConfig 
{ 
public 
string 
Key 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 —	
_C:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\DTOs\Data.cs
	namespace 	
AwesomeStone
 
. 
Application "
." #
DTOs# '
{ 
internal 
class 
Data 
{ 
public		 
IEnumerable		 
<		 
ViewParticipation		 ,
>		, -
Participa√ß√µes		. ;
{		< =
get		> A
;		A B
set		B E
;		E F
}		F G
public

 
string

 
TotalDeFuncionarios

 )
{

0 1
get

2 5
;

5 6
set

7 :
;

: ;
}

< =
public 
string 
TotalDistribuido &
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
string  
TotalDisponibilizado *
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
string %
SaldoTotalDisponibilizado /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} Ø
lC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\DTOs\ViewParticipation.cs
	namespace 	
AwesomeStone
 
. 
Application "
." #
DTOs# '
{ 
struct 

ViewParticipation 
{ 
public		 
string		 
	Matricula		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
string

 
Nome

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string !
ValorDaParticipa√ß√£o )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} Áx
iC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\EmployeeApplication.cs
	namespace 	
AwesomeStone
 
. 
Application "
{ 
public 

class 
EmployeeApplication $
:% &!
IEmployeesApplication' <
{ 
private 
readonly 
IEmployeeService )
_employeesService* ;
;; <
private 
readonly 
IOptions !
<! "
CacheConfig" -
>- .
_cacheConfig/ ;
;; <
private 
readonly )
IApplicationEmployeeContainer 6
_employeeContainer7 I
;I J
private 
readonly 
ResponseResult '
	_response( 1
;1 2
public 
EmployeeApplication "
(" #)
IApplicationEmployeeContainer# @(
applicationEmployeeContainerA ]
,] ^
IEmployeeService_ o
employeesService	p Ä
,
Ä Å
IOptions
Ç ä
<
ä ã
CacheConfig
ã ñ
>
ñ ó
cacheConfig
ò £
)
£ §
{ 	
_employeesService 
= 
employeesService  0
;0 1
_cacheConfig 
= 
cacheConfig &
;& '
_employeeContainer 
=  (
applicationEmployeeContainer! =
;= >
_employeeContainer 
. 
Logger %
.% &
LogDebug& .
(. /
default/ 6
(6 7
EventId7 >
)> ?
,? @
$"A C
$strC V
{V W
nameofW ]
(] ^
EmployeeApplication^ q
)q r
}r s
"s t
)t u
;u v
	_response 
= 
new 
ResponseResult *
(* +
)+ ,
;, -
} 	
public!! 
async!! 
Task!! 
<!! 
ResponseResult!! (
>!!( )
AddAsync!!* 2
(!!2 3
IEnumerable!!3 >
<!!> ?
EmployeeRequest!!? N
>!!N O
employeesRequest!!P `
)!!` a
{"" 	
try$$ 
{%% 
var&& 
listParticipation&& %
=&&& '
new&&( +
List&&, 0
<&&0 1
ViewParticipation&&1 B
>&&B C
(&&C D
)&&D E
;&&E F
var'' 
operationProfit'' #
=''$ %
_employeeContainer''& 8
.''8 9

UnitOfWork''9 C
.''C D
Business''D L
.''L M
GetAll''M S
(''S T
_cacheConfig''T `
.''` a
Value''a f
.''f g
Key''g j
)''j k
;''k l
if(( 
((( 
operationProfit(( #
is(($ &
null((' +
)((+ ,
{)) 
	_response** 
.** 
AddNotification** -
(**- .
new**. 1
Notification**2 >
(**> ?
nameof**? E
(**E F
EmployeeApplication**F Y
)**Y Z
,**Z [
$"++ 
$str++ V
"++V W
)++W X
)++X Y
;++Y Z
return,, 
	_response,, $
;,,$ %
}-- 
await//  
CreateEmployeesAsync// *
(//* +
employeesRequest//+ ;
,//; <
operationProfit//= L
,//L M
listParticipation//N _
)//_ `
;//` a)
FillViewParticipationEmployee00 -
(00- .
listParticipation00. ?
,00? @
operationProfit00A P
)00P Q
;00Q R
}11 
catch22 
(22 
	Exception22 
ex22 
)22  
{33 
	_response44 
.44 
AddNotification44 )
(44) *
new44* -
Notification44. :
(44: ;
nameof44; A
(44A B
EmployeeApplication44B U
)44U V
,44V W
$"55 
$str55 (
{55( )
ex55) +
.55+ ,
Message55, 3
}553 4
"554 5
)555 6
)556 7
;557 8
_employeeContainer66 "
.66" #
Logger66# )
.66) *
LogError66* 2
(662 3
default663 :
(66: ;
EventId66; B
)66B C
,66C D
$"77 
$str77 %
{77% &
nameof77& ,
(77, -
EmployeeApplication77- @
)77@ A
}77A B
$str77B O
{77O P
ex77P R
.77R S
Message77S Z
}77Z [
"77[ \
)77\ ]
;77] ^
throw88 
;88 
}99 
return;; 
	_response;; 
;;; 
}<< 	
private>> 
async>> 
Task>> 
<>> 
bool>> 
>>>   
CreateEmployeesAsync>>! 5
(>>5 6
IEnumerable>>6 A
<>>A B
EmployeeRequest>>B Q
>>>Q R
employeesRequest>>S c
,>>c d
OperationProfit?? 
operationProfit?? +
,??+ ,
ICollection@@ 
<@@ 
ViewParticipation@@ )
>@@) *
listParticipation@@+ <
)@@< =
{AA 	
ifBB 
(BB 
employeesRequestBB  
isBB! #
{BB$ %
}BB& '
)BB' (
{CC 
foreachDD 
(DD 
varDD 
employeeRequestDD ,
inDD- /
employeesRequestDD0 @
)DD@ A
{EE 
employeeRequestFF #
.FF# $
ValidateFF$ ,
(FF, -
)FF- .
;FF. /
ifHH 
(HH 
employeeRequestHH '
.HH' (
NotificationsHH( 5
.HH5 6
AnyHH6 9
(HH9 :
)HH: ;
)HH; <
{II 
	_responseJJ !
.JJ! "
AddNotificationsJJ" 2
(JJ2 3
employeeRequestJJ3 B
.JJB C
NotificationsJJC P
)JJP Q
;JJQ R
returnKK 
trueKK #
;KK# $
}LL 
varNN 
entidadeNN  
=NN! "
newNN# &
EmployeeNN' /
(NN/ 0
employeeRequestNN0 ?
.NN? @
	MatriculaNN@ I
,NNI J
employeeRequestNNK Z
.NNZ [
NomeNN[ _
,NN_ `
employeeRequestNNa p
.NNp q
AreaNNq u
,NNu v
employeeRequestOO '
.OO' (
CargoOO( -
,OO- .
_employeesServiceOO/ @
.OO@ A
GetSalaryConvertOOA Q
(OOQ R
employeeRequestOOR a
.OOa b
SalarioBrutoOOb n
)OOn o
,OOo p
$numOOq u
,OOu v
employeeRequestPP '
.PP' (
DataDeAdmissaoPP( 6
)PP6 7
;PP7 8
ifRR 
(RR 
!RR $
VerifyBonusValueEmployeeRR 1
(RR1 2
operationProfitRR2 A
,RRA B
entidadeRRC K
,RRK L
outRRM P
varRRQ T
bonusRRU Z
)RRZ [
)RR[ \
{SS 
breakTT 
;TT 
}UU 
entidadeWW 
.WW 
SetBonusWW %
(WW% &
bonusWW& +
)WW+ ,
;WW, -
awaitYY 
_employeeContainerYY ,
.YY, -

UnitOfWorkYY- 7
.YY7 8
EmployeeYY8 @
.YY@ A
AddAsyncYYA I
(YYI J
entidadeYYJ R
)YYR S
;YYS T
FillParticipation[[ %
([[% &
listParticipation[[& 7
,[[7 8
employeeRequest[[9 H
,[[H I
bonus[[J O
)[[O P
;[[P Q
}\\ 
return^^ 
false^^ 
;^^ 
}__ 
throwaa 
newaa !
ArgumentNullExceptionaa +
(aa+ ,
$straa, >
,aa> ?
$straa@ [
)aa[ \
;aa\ ]
}bb 	
privatedd 
staticdd 
voiddd 
FillParticipationdd -
(dd- .
ICollectiondd. 9
<dd9 :
ViewParticipationdd: K
>ddK L
listParticipationddM ^
,dd^ _
EmployeeRequestdd` o
employeeRequestddp 
,	dd Ä
decimal
ddÅ à
bonus
ddâ é
)
ddé è
{ee 	
listParticipationff 
.ff 
Addff !
(ff! "
newff" %
ViewParticipationff& 7
{gg 
	Matriculahh 
=hh 
employeeRequesthh +
.hh+ ,
	Matriculahh, 5
,hh5 6
Nomeii 
=ii 
employeeRequestii &
.ii& '
Nomeii' +
,ii+ ,!
ValorDaParticipa√ß√£ojj #
=jj$ %
$"jj& (
{jj( )
bonusjj) .
:jj. /
$strjj/ 0
}jj0 1
"jj1 2
}kk 
)kk 
;kk 
}ll 	
privatenn 
boolnn $
VerifyBonusValueEmployeenn -
(nn- .
OperationProfitnn. =
operationProfitnn> M
,nnM N
EmployeennO W
entidadennX `
,nn` a
outnnb e
decimalnnf m
bonusnnn s
)nns t
{oo 	
bonuspp 
=pp 
_employeesServicepp %
.pp% &
GetBonuspp& .
(pp. /
entidadepp/ 7
)pp7 8
;pp8 9
ifrr 
(rr 
!rr 
operationProfitrr  
.rr  !"
CheckDistributed_Valuerr! 7
(rr7 8
bonusrr8 =
)rr= >
)rr> ?
returnrr@ F
truerrG K
;rrK L
	_responsess 
.ss 
AddNotificationss %
(ss% &
newss& )
Notificationss* 6
(ss6 7
nameofss7 =
(ss= >
EmployeeApplicationss> Q
)ssQ R
,ssR S
$"tt 
$strtt =
{tt= >
operationProfittt> M
.ttM N
Total_AvailablettN ]
(tt] ^
)tt^ _
}tt_ `
$str	tt` í
{
ttí ì
bonus
ttì ò
}
ttò ô
$str
ttô õ
"
ttõ ú
)
ttú ù
)
ttù û
;
ttû ü
returnuu 
falseuu 
;uu 
}ww 	
privateyy 
voidyy )
FillViewParticipationEmployeeyy 2
(yy2 3
IReadOnlyCollectionyy3 F
<yyF G
ViewParticipationyyG X
>yyX Y
listParticipationyyZ k
,yyk l
OperationProfityym |
operationProfit	yy} å
)
yyå ç
{zz 	
	_response{{ 
.{{ 
AddValue{{ 
({{ 
new{{ "
Data{{# '
{|| 
Participa√ß√µes}} 
=}} 
listParticipation}}  1
,}}1 2
TotalDeFuncionarios~~ #
=~~$ %
listParticipation~~& 7
.~~7 8
Count~~8 =
.~~= >
ToString~~> F
(~~F G
)~~G H
,~~H I
TotalDistribuido  
=! "
$"# %
{% &
operationProfit& 5
.5 6#
Total_Balance_Available6 M
(M N
)N O
:O P
$strP Q
}Q R
"R S
,S T"
TotalDisponibilizado
ÄÄ $
=
ÄÄ% &
$"
ÄÄ' )
{
ÄÄ) *
operationProfit
ÄÄ* 9
.
ÄÄ9 :
Total_Available
ÄÄ: I
(
ÄÄI J
)
ÄÄJ K
:
ÄÄK L
$str
ÄÄL M
}
ÄÄM N
"
ÄÄN O
,
ÄÄO P'
SaldoTotalDisponibilizado
ÅÅ )
=
ÅÅ* +
$"
ÅÅ, .
{
ÅÅ. /
operationProfit
ÅÅ/ >
.
ÅÅ> ?

ValueBonus
ÅÅ? I
:
ÅÅI J
$str
ÅÅJ K
}
ÅÅK L
"
ÅÅL M
,
ÅÅM N
}
ÉÉ 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
ÜÜ 
async
ÜÜ 
Task
ÜÜ 
<
ÜÜ 
ResponseResult
ÜÜ (
>
ÜÜ( )
GetAllAsync
ÜÜ* 5
(
ÜÜ5 6
)
ÜÜ6 7
{
áá 	
try
àà 
{
ââ 
var
ää 
	employees
ää 
=
ää 
await
ää  % 
_employeeContainer
ää& 8
.
ää8 9

UnitOfWork
ää9 C
.
ääC D
Employee
ääD L
.
ääL M
GetAllAsync
ääM X
(
ääX Y
)
ääY Z
;
ääZ [
var
ãã 
listParticipation
ãã %
=
ãã& '
	employees
ãã( 1
.
ãã1 2
Select
ãã2 8
(
ãã8 9
employee
ãã9 A
=>
ããB D
new
ããE H
ViewParticipation
ããI Z
{
ãã[ \
	Matricula
ãã\ e
=
ããf g
employee
ããh p
.
ããp q
	Matricula
ããq z
,
ããz {
Nomeãã| Ä
=ããÅ Ç
employeeããÉ ã
.ããã å
Nomeããå ê
,ããê ë%
ValorDaParticipa√ß√£oããí •
=ãã¶ ß
$"ãã® ™
{ãã™ ´
employeeãã´ ≥
.ãã≥ ¥
Bonusãã¥ π
:ããπ ∫
$strãã∫ ª
}ããª º
"ããº Ω
}ããΩ æ
)ããæ ø
.ããø ¿
ToListãã¿ ∆
(ãã∆ «
)ãã« »
;ãã» …
	_response
çç 
.
çç 
AddValue
çç "
(
çç" #
new
çç# &
Data
çç' +
{
éé 
Participa√ß√µes
èè !
=
èè" #
listParticipation
èè$ 5
,
èè5 6!
TotalDeFuncionarios
êê '
=
êê( )
listParticipation
êê* ;
.
êê; <
Count
êê< A
.
êêA B
ToString
êêB J
(
êêJ K
)
êêK L
,
êêL M
}
ëë 
)
ëë 
;
ëë 
}
ìì 
catch
îî 
(
îî 
	Exception
îî 
ex
îî 
)
îî  
{
ïï 
	_response
ññ 
.
ññ 
AddNotification
ññ )
(
ññ) *
new
ññ* -
Notification
ññ. :
(
ññ: ;
nameof
ññ; A
(
ññA B!
EmployeeApplication
ññB U
)
ññU V
,
ññV W
$"
ññX Z
$str
ññZ l
{
ññl m
ex
ññm o
.
ñño p
Message
ññp w
}
ññw x
"
ññx y
)
ññy z
)
ññz {
;
ññ{ | 
_employeeContainer
óó "
.
óó" #
Logger
óó# )
.
óó) *
LogError
óó* 2
(
óó2 3
default
óó3 :
(
óó: ;
EventId
óó; B
)
óóB C
,
óóC D
$"
óóE G
$str
óóG V
{
óóV W
nameof
óóW ]
(
óó] ^!
EmployeeApplication
óó^ q
)
óóq r
}
óór s
$stróós É
{óóÉ Ñ
exóóÑ Ü
.óóÜ á
Messageóóá é
}óóé è
"óóè ê
)óóê ë
;óóë í
throw
òò 
;
òò 
}
öö 
return
úú 
	_response
úú 
;
úú 
}
ûû 	
}
üü 
}†† °
~C:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\Interfaces\IApplicationEmployeeContainer.cs
	namespace 	
AwesomeStone
 
. 
Application "
." #

Interfaces# -
{ 
public 

	interface )
IApplicationEmployeeContainer 2
{ 
ILogger	 
< 
EmployeeApplication $
>$ %
Logger& ,
{- .
get/ 2
;2 3
}4 5
IUnitOfWork			 

UnitOfWork		 
{		  !
get		" %
;		% &
}		' (
} 
} ú
uC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\Interfaces\IBusinessApplication.cs
	namespace 	
AwesomeStone
 
. 
Application "
." #

Interfaces# -
{ 
public		 

	interface		  
IBusinessApplication		 )
{

 
ResponseResult 
Add 
( "
OperationProfitRequest 1"
operationProfitRequest2 H
)H I
;I J
OperationProfit 
Get 
( 
string "
key# &
)& '
;' (
} 
} è
vC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\Interfaces\IEmployeesApplication.cs
	namespace		 	
AwesomeStone		
 
.		 
Application		 "
.		" #

Interfaces		# -
{

 
public 

	interface !
IEmployeesApplication *
{ 
Task 
< 
ResponseResult 
> 
AddAsync %
(% &
IEnumerable& 1
<1 2
EmployeeRequest2 A
>A B
employeesRequestC S
)S T
;T U
Task 
< 
ResponseResult 
> 
GetAllAsync (
(( )
)) *
;* +
} 
} 