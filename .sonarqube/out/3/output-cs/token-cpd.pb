�
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
} �	
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
} �4
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
cacheConfig	v �
)
� �
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
nameof	>>~ �
(
>>� �$
operationProfitRequest
>>� �
)
>>� �
}
>>� �
"
>>� �
)
>>� �
;
>>� �
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
nameof	DD~ �
(
DD� �$
operationProfitRequest
DD� �
)
DD� �
}
DD� �
"
DD� �
)
DD� �
;
DD� �
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
}QQ �
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
}## �
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
}"" �
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
}		 �	
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
Participações		. ;
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
} �
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
ValorDaParticipação )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} �x
iC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Application\EmployeeApplication.cs
	namespace 	
AwesomeStone
 
. 
Application "
{ 
public 

class 
EmployeeApplication $
:% &!
IEmployeesApplication' <
{ 
private 
readonly 
IEmployeeService )
_employeesService* ;
;; <
private 
readonly 
IOptions !
<! "
CacheConfig" -
>- .
_cacheConfig/ ;
;; <
private 
readonly )
IApplicationEmployeeContainer 6
_employeeContainer7 I
;I J
private 
readonly 
ResponseResult '
	_response( 1
;1 2
public 
EmployeeApplication "
(" #)
IApplicationEmployeeContainer# @(
applicationEmployeeContainerA ]
,] ^
IEmployeeService_ o
employeesService	p �
,
� �
IOptions
� �
<
� �
CacheConfig
� �
>
� �
cacheConfig
� �
)
� �
{ 	
_employeesService 
= 
employeesService  0
;0 1
_cacheConfig 
= 
cacheConfig &
;& '
_employeeContainer 
=  (
applicationEmployeeContainer! =
;= >
_employeeContainer   
.   
Logger   %
.  % &
LogDebug  & .
(  . /
default  / 6
(  6 7
EventId  7 >
)  > ?
,  ? @
$"  A C
$str  C V
{  V W
nameof  W ]
(  ] ^
EmployeeApplication  ^ q
)  q r
}  r s
"  s t
)  t u
;  u v
	_response!! 
=!! 
new!! 
ResponseResult!! *
(!!* +
)!!+ ,
;!!, -
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
ResponseResult$$ (
>$$( )
AddAsync$$* 2
($$2 3
IEnumerable$$3 >
<$$> ?
EmployeeRequest$$? N
>$$N O
employeesRequest$$P `
)$$` a
{%% 	
try'' 
{(( 
var)) 
listParticipation)) %
=))& '
new))( +
List)), 0
<))0 1
ViewParticipation))1 B
>))B C
())C D
)))D E
;))E F
var** 
operationProfit** #
=**$ %
_employeeContainer**& 8
.**8 9

UnitOfWork**9 C
.**C D
Business**D L
.**L M
GetAll**M S
(**S T
_cacheConfig**T `
.**` a
Value**a f
.**f g
Key**g j
)**j k
;**k l
if++ 
(++ 
operationProfit++ #
is++$ &
null++' +
)+++ ,
{,, 
	_response-- 
.-- 
AddNotification-- -
(--- .
new--. 1
Notification--2 >
(--> ?
nameof--? E
(--E F
EmployeeApplication--F Y
)--Y Z
,--Z [
$".. 
$str.. V
"..V W
)..W X
)..X Y
;..Y Z
return// 
	_response// $
;//$ %
}00 
await22  
CreateEmployeesAsync22 *
(22* +
employeesRequest22+ ;
,22; <
operationProfit22= L
,22L M
listParticipation22N _
)22_ `
;22` a)
FillViewParticipationEmployee33 -
(33- .
listParticipation33. ?
,33? @
operationProfit33A P
)33P Q
;33Q R
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
	_response77 
.77 
AddNotification77 )
(77) *
new77* -
Notification77. :
(77: ;
nameof77; A
(77A B
EmployeeApplication77B U
)77U V
,77V W
$"88 
$str88 (
{88( )
ex88) +
.88+ ,
Message88, 3
}883 4
"884 5
)885 6
)886 7
;887 8
_employeeContainer99 "
.99" #
Logger99# )
.99) *
LogError99* 2
(992 3
default993 :
(99: ;
EventId99; B
)99B C
,99C D
$":: 
$str:: %
{::% &
nameof::& ,
(::, -
EmployeeApplication::- @
)::@ A
}::A B
$str::B O
{::O P
ex::P R
.::R S
Message::S Z
}::Z [
"::[ \
)::\ ]
;::] ^
throw;; 
;;; 
}<< 
return>> 
	_response>> 
;>> 
}?? 	
privateAA 
asyncAA 
TaskAA 
<AA 
boolAA 
>AA   
CreateEmployeesAsyncAA! 5
(AA5 6
IEnumerableAA6 A
<AAA B
EmployeeRequestAAB Q
>AAQ R
employeesRequestAAS c
,AAc d
OperationProfitBB 
operationProfitBB +
,BB+ ,
ICollectionCC 
<CC 
ViewParticipationCC )
>CC) *
listParticipationCC+ <
)CC< =
{DD 	
ifEE 
(EE 
employeesRequestEE  
isEE! #
{EE$ %
}EE& '
)EE' (
{FF 
foreachGG 
(GG 
varGG 
employeeRequestGG ,
inGG- /
employeesRequestGG0 @
)GG@ A
{HH 
employeeRequestII #
.II# $
ValidateII$ ,
(II, -
)II- .
;II. /
ifKK 
(KK 
employeeRequestKK '
.KK' (
NotificationsKK( 5
.KK5 6
AnyKK6 9
(KK9 :
)KK: ;
)KK; <
{LL 
	_responseMM !
.MM! "
AddNotificationsMM" 2
(MM2 3
employeeRequestMM3 B
.MMB C
NotificationsMMC P
)MMP Q
;MMQ R
returnNN 
trueNN #
;NN# $
}OO 
varQQ 
entidadeQQ  
=QQ! "
newQQ# &
EmployeeQQ' /
(QQ/ 0
employeeRequestQQ0 ?
.QQ? @
	MatriculaQQ@ I
,QQI J
employeeRequestQQK Z
.QQZ [
NomeQQ[ _
,QQ_ `
employeeRequestQQa p
.QQp q
AreaQQq u
,QQu v
employeeRequestRR '
.RR' (
CargoRR( -
,RR- .
_employeesServiceRR/ @
.RR@ A
GetSalaryConvertRRA Q
(RRQ R
employeeRequestRRR a
.RRa b
SalarioBrutoRRb n
)RRn o
,RRo p
$numRRq u
,RRu v
employeeRequestSS '
.SS' (
DataDeAdmissaoSS( 6
)SS6 7
;SS7 8
ifUU 
(UU 
!UU $
VerifyBonusValueEmployeeUU 1
(UU1 2
operationProfitUU2 A
,UUA B
entidadeUUC K
,UUK L
outUUM P
varUUQ T
bonusUUU Z
)UUZ [
)UU[ \
{VV 
breakWW 
;WW 
}XX 
entidadeZZ 
.ZZ 
SetBonusZZ %
(ZZ% &
bonusZZ& +
)ZZ+ ,
;ZZ, -
await\\ 
_employeeContainer\\ ,
.\\, -

UnitOfWork\\- 7
.\\7 8
Employee\\8 @
.\\@ A
AddAsync\\A I
(\\I J
entidade\\J R
)\\R S
;\\S T
FillParticipation^^ %
(^^% &
listParticipation^^& 7
,^^7 8
employeeRequest^^9 H
,^^H I
bonus^^J O
)^^O P
;^^P Q
}__ 
returnaa 
falseaa 
;aa 
}bb 
throwdd 
newdd !
ArgumentNullExceptiondd +
(dd+ ,
$strdd, G
)ddG H
;ddH I
}ee 	
privategg 
staticgg 
voidgg 
FillParticipationgg -
(gg- .
ICollectiongg. 9
<gg9 :
ViewParticipationgg: K
>ggK L
listParticipationggM ^
,gg^ _
EmployeeRequestgg` o
employeeRequestggp 
,	gg �
decimal
gg� �
bonus
gg� �
)
gg� �
{hh 	
listParticipationii 
.ii 
Addii !
(ii! "
newii" %
ViewParticipationii& 7
{jj 
	Matriculakk 
=kk 
employeeRequestkk +
.kk+ ,
	Matriculakk, 5
,kk5 6
Nomell 
=ll 
employeeRequestll &
.ll& '
Nomell' +
,ll+ ,!
ValorDaParticipaçãomm #
=mm$ %
$"mm& (
{mm( )
bonusmm) .
:mm. /
$strmm/ 0
}mm0 1
"mm1 2
}nn 
)nn 
;nn 
}oo 	
privateqq 
boolqq $
VerifyBonusValueEmployeeqq -
(qq- .
OperationProfitqq. =
operationProfitqq> M
,qqM N
EmployeeqqO W
entidadeqqX `
,qq` a
outqqb e
decimalqqf m
bonusqqn s
)qqs t
{rr 	
bonusss 
=ss 
_employeesServicess %
.ss% &
GetBonusss& .
(ss. /
entidadess/ 7
)ss7 8
;ss8 9
ifuu 
(uu 
!uu 
operationProfituu  
.uu  !"
CheckDistributed_Valueuu! 7
(uu7 8
bonusuu8 =
)uu= >
)uu> ?
returnuu@ F
trueuuG K
;uuK L
	_responsevv 
.vv 
AddNotificationvv %
(vv% &
newvv& )
Notificationvv* 6
(vv6 7
nameofvv7 =
(vv= >
EmployeeApplicationvv> Q
)vvQ R
,vvR S
$"ww 
$strww =
{ww= >
operationProfitww> M
.wwM N
Total_AvailablewwN ]
(ww] ^
)ww^ _
}ww_ `
$str	ww` �
{
ww� �
bonus
ww� �
}
ww� �
$str
ww� �
"
ww� �
)
ww� �
)
ww� �
;
ww� �
returnxx 
falsexx 
;xx 
}zz 	
private|| 
void|| )
FillViewParticipationEmployee|| 2
(||2 3
IReadOnlyCollection||3 F
<||F G
ViewParticipation||G X
>||X Y
listParticipation||Z k
,||k l
OperationProfit||m |
operationProfit	||} �
)
||� �
{}} 	
	_response~~ 
.~~ 
AddValue~~ 
(~~ 
new~~ "
Data~~# '
{ 
Participações
�� 
=
�� 
listParticipation
��  1
,
��1 2!
TotalDeFuncionarios
�� #
=
��$ %
listParticipation
��& 7
.
��7 8
Count
��8 =
.
��= >
ToString
��> F
(
��F G
)
��G H
,
��H I
TotalDistribuido
��  
=
��! "
$"
��# %
{
��% &
operationProfit
��& 5
.
��5 6%
Total_Balance_Available
��6 M
(
��M N
)
��N O
:
��O P
$str
��P Q
}
��Q R
"
��R S
,
��S T"
TotalDisponibilizado
�� $
=
��% &
$"
��' )
{
��) *
operationProfit
��* 9
.
��9 :
Total_Available
��: I
(
��I J
)
��J K
:
��K L
$str
��L M
}
��M N
"
��N O
,
��O P'
SaldoTotalDisponibilizado
�� )
=
��* +
$"
��, .
{
��. /
operationProfit
��/ >
.
��> ?

ValueBonus
��? I
:
��I J
$str
��J K
}
��K L
"
��L M
,
��M N
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ResponseResult
�� (
>
��( )
GetAllAsync
��* 5
(
��5 6
)
��6 7
{
�� 	
try
�� 
{
�� 
var
�� 
	employees
�� 
=
�� 
await
��  % 
_employeeContainer
��& 8
.
��8 9

UnitOfWork
��9 C
.
��C D
Employee
��D L
.
��L M
GetAllAsync
��M X
(
��X Y
)
��Y Z
;
��Z [
var
�� 
listParticipation
�� %
=
��& '
	employees
��( 1
.
��1 2
Select
��2 8
(
��8 9
employee
��9 A
=>
��B D
new
��E H
ViewParticipation
��I Z
{
��[ \
	Matricula
��\ e
=
��f g
employee
��h p
.
��p q
	Matricula
��q z
,
��z {
Nome��| �
=��� �
employee��� �
.��� �
Nome��� �
,��� �%
ValorDaParticipação��� �
=��� �
$"��� �
{��� �
employee��� �
.��� �
Bonus��� �
:��� �
$str��� �
}��� �
"��� �
}��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
	_response
�� 
.
�� 
AddValue
�� "
(
��" #
new
��# &
Data
��' +
{
�� 
Participações
�� !
=
��" #
listParticipation
��$ 5
,
��5 6!
TotalDeFuncionarios
�� '
=
��( )
listParticipation
��* ;
.
��; <
Count
��< A
.
��A B
ToString
��B J
(
��J K
)
��K L
,
��L M
}
�� 
)
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
	_response
�� 
.
�� 
AddNotification
�� )
(
��) *
new
��* -
Notification
��. :
(
��: ;
nameof
��; A
(
��A B!
EmployeeApplication
��B U
)
��U V
,
��V W
$"
��X Z
$str
��Z l
{
��l m
ex
��m o
.
��o p
Message
��p w
}
��w x
"
��x y
)
��y z
)
��z {
;
��{ | 
_employeeContainer
�� "
.
��" #
Logger
��# )
.
��) *
LogError
��* 2
(
��2 3
default
��3 :
(
��: ;
EventId
��; B
)
��B C
,
��C D
$"
��E G
$str
��G V
{
��V W
nameof
��W ]
(
��] ^!
EmployeeApplication
��^ q
)
��q r
}
��r s
$str��s �
{��� �
ex��� �
.��� �
Message��� �
}��� �
"��� �
)��� �
;��� �
throw
�� 
;
�� 
}
�� 
return
�� 
	_response
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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
} �
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
} �
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