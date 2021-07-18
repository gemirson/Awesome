∞
hC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Entidades\DomainException.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Entidades %
{ 
public 

class 
DomainException  
:! "
	Exception# ,
{ 
public 
DomainException 
( 
)  
{ 	
}
 
public

 
DomainException

 
(

 
string

 %
message

& -
)

- .
:

/ 0
base

1 5
(

5 6
message

6 =
)

= >
{ 	
}
 
public 
DomainException 
( 
string %
message& -
,- .
	Exception/ 8
innerException9 G
)G H
:I J
baseK O
(O P
messageP W
,W X
innerExceptionY g
)g h
{ 	
}
 
} 
} æ2
aC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Entidades\Employee.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Entidades %
{ 
public 

class 
Employee 
: 
Entidade #
{ 
public 
string 
	Matricula 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public		 
string		 
Nome		 
{		 
get		  
;		  !
private		" )
set		* -
;		- .
}		/ 0
public

 
string

 
Area
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
  !
private

" )
set

* -
;

- .
}

/ 0
public 
string 
Cargo 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
decimal 
Bonus 
{ 
get "
;" #
private$ +
set, /
;/ 0
}0 1
public 
decimal 
SalarioBruto #
{$ %
get& )
;) *
private+ 2
set3 6
;6 7
}8 9
public 
DateTime 
DataDeAdmissao &
{' (
get) ,
;, -
private. 5
set6 9
;9 :
}; <
public 
Employee 
( 
string 
	matricula (
,( )
string* 0
nome1 5
,5 6
string7 =
area> B
,B C
stringD J
cargoK P
,P Q
decimalR Y
salarioBrutoZ f
,f g
decimalh o
bonusp u
,u v
DateTimev ~
dataDeAdmissao	 ç
)
ç é
{ 	
	Matricula 
= 
	matricula !
;! "
Nome 
= 
nome 
; 
Area 
= 
area 
; 
Cargo 
= 
cargo 
; 
SalarioBruto 
= 
salarioBruto '
;' (
Bonus 
= 
bonus 
; 
DataDeAdmissao 
= 
dataDeAdmissao +
;+ ,
Validate 
( 
) 
; 
} 	
public!! 
void!! 
SetBonus!! 
(!! 
decimal!! $
bonus!!% *
)!!* +
{!!, -
if"" 
("" 
bonus"" 
<"" 
$num"" 
)"" 
throw"" #
new""$ '
DomainException"") 8
(""8 9
$str""9 g
)""g h
;""h i
Bonus## 
=## 
bonus## 
;## 
}$$ 	
public%% 
override%% 
bool%% 
Equals%% #
(%%# $
object%%$ *
obj%%+ .
)%%. /
{&& 	
return'' 
obj'' 
is'' 
Employee'' "
employee''# +
&&'', .
	Matricula(( 
==(( 
employee((  (
.((( )
	Matricula(() 2
&&((3 5
Nome)) 
==)) 
employee)) #
.))# $
Nome))$ (
&&))) +
Area** 
==** 
employee** #
.**# $
Area**$ (
&&**) +
Cargo++ 
==++ 
employee++ $
.++$ %
Cargo++% *
&&+++ -
SalarioBruto,, 
==,,  "
employee,,# +
.,,+ ,
SalarioBruto,,, 8
&&,,9 ;
DataDeAdmissao-- !
==--" $
employee--% -
.--- .
DataDeAdmissao--. <
;--< =
}.. 	
public00 
override00 
int00 
GetHashCode00 '
(00' (
)00( )
{11 	
return22 
HashCode22 
.22 
Combine22 #
(22# $
	Matricula22$ -
,22- .
Nome22/ 3
,223 4
Cargo225 :
,22: ;
SalarioBruto22< H
,22H I
DataDeAdmissao22J X
)22X Y
;22Y Z
}33 	
public55 
override55 
void55 
Validate55 %
(55% &
)55& '
{66 	

Validacoes77 
.77 
ValidarSeMenorQue77 (
(77( )
SalarioBruto77) 5
,775 6
$num777 ;
,77; <
$str77= s
)77s t
;77t u

Validacoes88 
.88 
ValidarSeNulo88 $
(88$ %
DataDeAdmissao88% 3
,883 4
$str884 j
)88j k
;88k l

Validacoes99 
.99 
ValidarSeNulo99 $
(99$ %
Cargo99% *
,99* +
$str99, G
)99G H
;99H I

Validacoes:: 
.:: 
ValidarSeNulo:: $
(::$ %
Area::% )
,::) *
$str::+ E
)::E F
;::F G

Validacoes;; 
.;; 
ValidarSeNulo;; $
(;;$ %
	Matricula;;% .
,;;. /
$str;;0 O
);;O P
;;;P Q
}== 	
public?? 
static?? 
bool?? 
operator?? #
==??$ &
(??& '
Employee??' /
left??0 4
,??4 5
Employee??6 >
right??? D
)??D E
{@@ 	
returnAA 
EqualityComparerAA #
<AA# $
EmployeeAA$ ,
>AA, -
.AA- .
DefaultAA. 5
.AA5 6
EqualsAA6 <
(AA< =
leftAA= A
,AAA B
rightAAC H
)AAH I
;AAI J
}BB 	
publicDD 
staticDD 
boolDD 
operatorDD #
!=DD$ &
(DD& '
EmployeeDD' /
leftDD0 4
,DD4 5
EmployeeDD6 >
rightDD? D
)DDD E
{EE 	
returnFF 
!FF 
(FF 
leftFF 
==FF 
rightFF "
)FF" #
;FF# $
}GG 	
}HH 
}II †
aC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Entidades\Entidade.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Entidades %
{ 
public 

abstract 
class 
Entidade "
:" #

Notifiable$ .
{		 
public

 
Guid

 
Id

 
{

 
get

 
;

 
	protected

 '
set

( +
;

+ ,
}

- .
	protected 
Entidade 
( 
) 
{ 	
Id 
= 
Guid 
. 
NewGuid 
( 
) 
;  
} 	
public 
abstract 
void 
Validate %
(% &
)& '
;' (
} 
} ˙
hC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Entidades\OperationProfit.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Entidades %
{ 
public 

class 
OperationProfit  
:! "
Entidade# +
{ 
private 
readonly 
decimal  
_distributedValue! 2
;2 3
public 
decimal 

ValueBonus !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public		 
OperationProfit		 
(		 
decimal		 &
valorDistribuido		' 7
)		7 8
{

 	

ValueBonus 
= 
valorDistribuido )
;) *
_distributedValue 
= 
valorDistribuido  0
;0 1
} 	
public 
override 
void 
Validate %
(% &
)& '
{ 	
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 
IsGreaterThan 
( 

ValueBonus '
,' (
$num) *
,* +
nameof, 2
(2 3

ValueBonus3 =
)= >
,> ?
$str@ |
)| }
)} ~
;~ 
AddNotifications 
( 
new  
Contract! )
() *
)* +
. 
Requires 
( 
) 
. 
	IsNotNull 
( 

ValueBonus '
,' (
nameof) /
(/ 0

ValueBonus0 :
): ;
,; <
$str= k
)k l
)l m
;m n
} 	
public 
bool "
CheckDistributed_Value *
(* +
decimal+ 2
value3 8
)8 9
{: ;
if 
( 

ValueBonus 
<= 
value #
)# $
return% +
true, 0
;0 1

ValueBonus 
-= 
value 
;  
return 
false 
; 
}   	
public"" 
decimal"" 
Total_Available"" &
(""& '
)""' (
{## 	
return$$ 
_distributedValue$$ $
;$$$ %
}%% 	
public'' 
decimal'' #
Total_Balance_Available'' .
(''. /
)''/ 0
{(( 	
return)) 
_distributedValue)) $
-))% &

ValueBonus))( 2
;))2 3
}** 	
},, 
}-- „_
cC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Entidades\Validacoes.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Entidades %
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 

Validacoes 
{		 
public

 
static

 
void

 
ValidarSeIgual

 )
(

) *
object

* 0
object1

1 8
,

8 9
object

: @
object2

A H
,

H I
string

J P
mensagem

Q Y
)

Y Z
{ 	
if 
( 
object1 
. 
Equals 
( 
object2 &
)& '
)' (
{ 
throw 
new 
DomainException )
() *
mensagem* 2
)2 3
;3 4
} 
} 	
public 
static 
void 
ValidarSeDiferente -
(- .
object. 4
object15 <
,< =
object> D
object2E L
,L M
stringN T
mensagemU ]
)] ^
{ 	
if 
( 
! 
object1 
. 
Equals 
(  
object2  '
)' (
)( )
{ 
throw 
new 
DomainException )
() *
mensagem* 2
)2 3
;3 4
} 
} 	
public 
static 
void 
ValidarSeDiferente -
(- .
string. 4
pattern5 <
,< =
string> D
valorE J
,J K
stringL R
mensagemS [
)[ \
{ 	
var 
regex 
= 
new 
Regex !
(! "
pattern" )
)) *
;* +
if 
( 
! 
regex 
. 
IsMatch 
( 
valor $
)$ %
)% &
{ 
throw   
new   
DomainException   )
(  ) *
mensagem  * 2
)  2 3
;  3 4
}!! 
}"" 	
public$$ 
static$$ 
void$$ 
ValidarTamanho$$ )
($$) *
string$$* 0
valor$$1 6
,$$6 7
int$$8 ;
maximo$$< B
,$$B C
string$$D J
mensagem$$K S
)$$S T
{%% 	
var&& 
length&& 
=&& 
valor&& 
.&& 
Trim&& #
(&&# $
)&&$ %
.&&% &
Length&&& ,
;&&, -
if'' 
('' 
length'' 
>'' 
maximo'' 
)''  
{(( 
throw)) 
new)) 
DomainException)) )
())) *
mensagem))* 2
)))2 3
;))3 4
}** 
}++ 	
public-- 
static-- 
void-- 
ValidarTamanho-- )
(--) *
string--* 0
valor--1 6
,--6 7
int--8 ;
minimo--< B
,--B C
int--D G
maximo--H N
,--N O
string--P V
mensagem--W _
)--_ `
{.. 	
var// 
length// 
=// 
valor// 
.// 
Trim// #
(//# $
)//$ %
.//% &
Length//& ,
;//, -
if00 
(00 
length00 
<00 
minimo00 
||00  "
length00# )
>00* +
maximo00, 2
)002 3
{11 
throw22 
new22 
DomainException22 )
(22) *
mensagem22* 2
)222 3
;223 4
}33 
}44 	
public66 
static66 
void66 
ValidarSeVazio66 )
(66) *
string66* 0
valor661 6
,666 7
string668 >
mensagem66? G
)66G H
{77 	
if88 
(88 
valor88 
==88 
null88 
||88  
valor88! &
.88& '
Trim88' +
(88+ ,
)88, -
.88- .
Length88. 4
==885 7
$num888 9
)889 :
{99 
throw:: 
new:: 
DomainException:: )
(::) *
mensagem::* 2
)::2 3
;::3 4
};; 
}<< 	
public>> 
static>> 
void>> 
ValidarSeNulo>> (
(>>( )
object>>) /
object1>>0 7
,>>7 8
string>>9 ?
mensagem>>@ H
)>>H I
{?? 	
if@@ 
(@@ 
object1@@ 
==@@ 
null@@ 
)@@  
{AA 
throwBB 
newBB 
DomainExceptionBB )
(BB) *
$"BB* ,
$strBB, :
{BB: ;
nameofBB; A
(BBA B
object1BBB I
)BBI J
}BBJ K
$strBBK M
{BBM N
mensagemBBN V
}BBV W
"BBW X
)BBX Y
;BBY Z
}CC 
}DD 	
publicFF 
staticFF 
voidFF 
ValidarMinimoMaximoFF .
(FF. /
doubleFF/ 5
valorFF6 ;
,FF; <
doubleFF= C
minimoFFD J
,FFJ K
doubleFFL R
maximoFFS Y
,FFY Z
stringFF[ a
mensagemFFb j
)FFj k
{GG 	
ifHH 
(HH 
valorHH 
<HH 
minimoHH 
||HH !
valorHH" '
>HH( )
maximoHH* 0
)HH0 1
{II 
throwJJ 
newJJ 
DomainExceptionJJ )
(JJ) *
mensagemJJ* 2
)JJ2 3
;JJ3 4
}KK 
}LL 	
publicNN 
staticNN 
voidNN 
ValidarMinimoMaximoNN .
(NN. /
floatNN/ 4
valorNN5 :
,NN: ;
floatNN< A
minimoNNB H
,NNH I
floatNNJ O
maximoNNP V
,NNV W
stringNNX ^
mensagemNN_ g
)NNg h
{OO 	
ifPP 
(PP 
valorPP 
<PP 
minimoPP 
||PP !
valorPP" '
>PP( )
maximoPP* 0
)PP0 1
{QQ 
throwRR 
newRR 
DomainExceptionRR )
(RR) *
mensagemRR* 2
)RR2 3
;RR3 4
}SS 
}TT 	
publicVV 
staticVV 
voidVV 
ValidarMinimoMaximoVV .
(VV. /
intVV/ 2
valorVV3 8
,VV8 9
intVV: =
minimoVV> D
,VVD E
intVVF I
maximoVVJ P
,VVP Q
stringVVR X
mensagemVVY a
)VVa b
{WW 	
ifXX 
(XX 
valorXX 
<XX 
minimoXX 
||XX !
valorXX" '
>XX( )
maximoXX* 0
)XX0 1
{YY 
throwZZ 
newZZ 
DomainExceptionZZ )
(ZZ) *
mensagemZZ* 2
)ZZ2 3
;ZZ3 4
}[[ 
}\\ 	
public^^ 
static^^ 
void^^ 
ValidarMinimoMaximo^^ .
(^^. /
long^^/ 3
valor^^4 9
,^^9 :
long^^; ?
minimo^^@ F
,^^F G
long^^H L
maximo^^M S
,^^S T
string^^U [
mensagem^^\ d
)^^d e
{__ 	
if`` 
(`` 
valor`` 
<`` 
minimo`` 
||`` !
valor``" '
>``( )
maximo``* 0
)``0 1
{aa 
throwbb 
newbb 
DomainExceptionbb )
(bb) *
mensagembb* 2
)bb2 3
;bb3 4
}cc 
}dd 	
publicff 
staticff 
voidff 
ValidarMinimoMaximoff .
(ff. /
decimalff/ 6
valorff7 <
,ff< =
decimalff> E
minimoffF L
,ffL M
decimalffN U
maximoffV \
,ff\ ]
stringff^ d
mensagemffe m
)ffm n
{gg 	
ifhh 
(hh 
valorhh 
<hh 
minimohh 
||hh !
valorhh" '
>hh( )
maximohh* 0
)hh0 1
{ii 
throwjj 
newjj 
DomainExceptionjj )
(jj) *
mensagemjj* 2
)jj2 3
;jj3 4
}kk 
}ll 	
publicnn 
staticnn 
voidnn 
ValidarSeMenorQuenn ,
(nn, -
longnn- 1
valornn2 7
,nn7 8
longnn9 =
minimonn> D
,nnD E
stringnnF L
mensagemnnM U
)nnU V
{oo 	
ifpp 
(pp 
valorpp 
<pp 
minimopp 
)pp 
{qq 
throwrr 
newrr 
DomainExceptionrr )
(rr) *
mensagemrr* 2
)rr2 3
;rr3 4
}ss 
}tt 	
publicvv 
staticvv 
voidvv 
ValidarSeMenorQuevv ,
(vv, -
doublevv- 3
valorvv4 9
,vv9 :
doublevv; A
minimovvB H
,vvH I
stringvvJ P
mensagemvvQ Y
)vvY Z
{ww 	
ifxx 
(xx 
valorxx 
<xx 
minimoxx 
)xx 
{yy 
throwzz 
newzz 
DomainExceptionzz )
(zz) *
mensagemzz* 2
)zz2 3
;zz3 4
}{{ 
}|| 	
public~~ 
static~~ 
void~~ 
ValidarSeMenorQue~~ ,
(~~, -
decimal~~- 4
valor~~5 :
,~~: ;
decimal~~< C
minimo~~D J
,~~J K
string~~L R
mensagem~~S [
)~~[ \
{ 	
if
ÄÄ 
(
ÄÄ 
valor
ÄÄ 
<
ÄÄ 
minimo
ÄÄ 
)
ÄÄ 
{
ÅÅ 
throw
ÇÇ 
new
ÇÇ 
DomainException
ÇÇ )
(
ÇÇ) *
mensagem
ÇÇ* 2
)
ÇÇ2 3
;
ÇÇ3 4
}
ÉÉ 
}
ÑÑ 	
public
ÜÜ 
static
ÜÜ 
void
ÜÜ 
ValidarSeMenorQue
ÜÜ ,
(
ÜÜ, -
int
ÜÜ- 0
valor
ÜÜ1 6
,
ÜÜ6 7
int
ÜÜ8 ;
minimo
ÜÜ< B
,
ÜÜB C
string
ÜÜD J
mensagem
ÜÜK S
)
ÜÜS T
{
áá 	
if
àà 
(
àà 
valor
àà 
<
àà 
minimo
àà 
)
àà 
{
ââ 
throw
ää 
new
ää 
DomainException
ää )
(
ää) *
mensagem
ää* 2
)
ää2 3
;
ää3 4
}
ãã 
}
åå 	
public
éé 
static
éé 
void
éé 
ValidarSeFalso
éé )
(
éé) *
bool
éé* .
	boolvalor
éé/ 8
,
éé8 9
string
éé: @
mensagem
ééA I
)
ééI J
{
èè 	
if
êê 
(
êê 
!
êê 
	boolvalor
êê 
)
êê 
{
ëë 
throw
íí 
new
íí 
DomainException
íí )
(
íí) *
mensagem
íí* 2
)
íí2 3
;
íí3 4
}
ìì 
}
îî 	
public
ññ 
static
ññ 
void
ññ !
ValidarSeVerdadeiro
ññ .
(
ññ. /
bool
ññ/ 3
	boolvalor
ññ4 =
,
ññ= >
string
ññ? E
mensagem
ññF N
)
ññN O
{
óó 	
if
òò 
(
òò 
	boolvalor
òò 
)
òò 
{
ôô 
throw
öö 
new
öö 
DomainException
öö )
(
öö) *
mensagem
öö* 2
)
öö2 3
;
öö3 4
}
õõ 
}
úú 	
}
ùù 
}ûû ◊
uC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Intefaces\Business\IBusinessRepository.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Intefaces %
.% &
Business& .
{ 
public		 

	interface		 
IBusinessRepository		 (
{

 
void 
Add 
( 
string 
key 
, 
OperationProfit ,
operationProfit- <
)< =
;= >
OperationProfit 
GetAll 
( 
string %
key& )
)) *
;* +
} 
} ≥
iC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Intefaces\Employees\IBonus.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Intefaces %
.% &
	Employees& /
{ 
public 

	interface 
IBonus 
{  
decimal 
CalculateBonus 
( 
int "
weightPosition# 1
,1 2
int3 6
weightSalary7 C
,C D
intE H

weightYearI S
,S T
decimalU \
salary] c
)c d
;d e
}		 
}

 ∆
sC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Intefaces\Employees\IEmployeeService.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Intefaces %
.% &
	Employees& /
{ 
public 

	interface 
IEmployeeService %
{		 
public

 
decimal

 
GetBonus

 
(

  
Employee

  (
employee

) 1
)

1 2
;

2 3
public 
decimal 
GetSalaryConvert '
(' (
string( .
salary/ 5
)5 6
;6 7
} 
} ˛
sC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Intefaces\Employees\IExtractedWeigth.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Intefaces %
.% &
	Employees& /
{ 
	interface 
IExtractedWeigth 
{ 
}		 
}

 Î
rC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Intefaces\Employees\IOfficeStrategy.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Intefaces %
.% &
	Employees& /
{ 
public 

	interface 
IOfficeStrategy $
{ 
int 
GetWeightOffice 
( 
) 
; 
} 
} ñ
jC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Intefaces\Employees\IWeigth.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Intefaces %
.% &
	Employees& /
{ 
public 

	interface 
IWeigth 
{ 
int 
	GetWeigth 
( 
float 
	parameter %
)% &
;& '
WeigthCondition 
[ 
] 
WeigthConditions *
{+ ,
get- 0
;0 1
}1 2
}

 
} ¨
lC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Intefaces\IEmployeeRepository.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
	Intefaces %
{ 
public 

	interface 
IEmployeeRepository (
{ 
Task		 
AddAsync		 
(		 
Employee		 
employee		 '
)		' (
;		( )
Task

 
<

 
IEnumerable

 
<

 
Employee

 !
>

! "
>

" #
GetAllAsync

$ /
(

/ 0
)

0 1
;

1 2
} 
} ˝
fC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Response\ResponseResult.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Response $
{ 
public 

class 
ResponseResult 
{ 
private		 
readonly		 
IList		 
<		 
Notification		 +
>		+ ,
_failMessages		- :
;		: ;
public 
IReadOnlyCollection "
<" #
Notification# /
>/ 0
Fails1 6
=>7 9
_failMessages: G
.G H
ToListH N
(N O
)O P
;P Q
public 
bool 
HasFails 
=> 
_failMessages  -
.- .
Any. 1
(1 2
)2 3
;3 4
public 
object 
Data 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
ResponseResult 
( 
) 
{ 	
_failMessages 
= 
new 
List  $
<$ %
Notification% 1
>1 2
(2 3
)3 4
;4 5
} 	
public 
ResponseResult 
( 
object $
@object% ,
), -
:. /
this0 4
(4 5
)5 6
{ 	
AddValue 
( 
@object 
) 
; 
}   	
public&& 
void&& 
AddValue&& 
(&& 
object&& #
@object&&$ +
)&&+ ,
{'' 	
Data(( 
=(( 
@object(( 
;(( 
})) 	
public// 
void// 
AddNotification// #
(//# $
Notification//$ 0
notification//1 =
)//= >
{00 	
_failMessages11 
.11 
Add11 
(11 
notification11 *
)11* +
;11+ ,
}22 	
public99 
void99 
AddNotifications99 $
(99$ %
IEnumerable99% 0
<990 1
Notification991 =
>99= >
notifications99? L
)99L M
{:: 	
foreach;; 
(;; 
var;; 
notification;; %
in;;& (
notifications;;) 6
);;6 7
{<< 
AddNotification== 
(==  
notification==  ,
)==, -
;==- .
}>> 
}?? 	
publicAA 
overrideAA 
stringAA 
ToStringAA '
(AA' (
)AA( )
{BB 	
returnCC 
stringCC 
.CC 
JoinCC 
(CC 
$strCC $
,CC$ %
FailsCC& +
.CC+ ,
SelectCC, 2
(CC2 3
xCC3 4
=>CC5 7
xCC8 9
.CC9 :
MessageCC: A
)CCA B
)CCB C
;CCC D
}DD 	
}EE 
}FF Ø
bC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\Accounting.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 

Accounting 
: 
IOfficeStrategy -
{		 
public

 
int

 
GetWeightOffice

 "
(

" #
)

# $
{ 	
return 
$num 
; 
} 	
} 
} Ò	
eC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\BonusStrategy.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 
BonusStrategy 
:  
	Intefaces! *
.* +
	Employees+ 4
.4 5
IBonus5 ;
{ 
public 
decimal 
CalculateBonus %
(% &
int& )
weightPosition* 8
,8 9
int: =
weightSalary> J
,J K
intL O

weightYearP Z
,Z [
decimal[ b
salaryc i
)i j
{ 	
return		 
weightSalary		 
==		  "
$num		# $
?

 
throw

 
new

 
	Exception

 %
(

% &
$str

& J
)

J K
: 
( 
salary 
* 
( 
weightPosition +
+, -

weightYear. 8
)8 9
*: ;
$num< >
)> ?
/@ A
weightSalaryB N
;N O
} 	
} 
} °
[C:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\CFO.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 
Cfo 
: 
IOfficeStrategy &
{		 
public

 
int

 
GetWeightOffice

 "
(

" #
)

# $
{ 	
return 
$num 
; 
} 	
} 
} √
lC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\CustomerRelationship.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class  
CustomerRelationship %
:& '
IOfficeStrategy( 7
{		 
public

 
int

 
GetWeightOffice

 "
(

" #
)

# $
{ 	
return 
$num 
; 
} 	
} 
} è-
gC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\EmployeeService.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 
EmployeeService  
:! "
IEmployeeService# 3
{		 
const 
int 
MinimumSalary 
=  !
$num" &
;& '
private 
readonly 
IBonus 
_bonus  &
;& '
private 
readonly 
OfficeFactory &
_officeFactory' 5
;5 6
private 
readonly 
IWeigth  
_weigthAdmission! 1
;1 2
private 
readonly 
IWeigth  
_weigthSalary! .
;. /
public 
EmployeeService 
( 
IBonus %
bonus& +
,+ ,
OfficeFactory- :
officeFactory; H
,H I
IWeigthJ Q
weigthAdmissionR a
,a b
IWeigthc j
weigthSalaryk w
)w x
{ 	
_bonus 
= 
bonus 
; 
_officeFactory 
= 
officeFactory *
;* +
_weigthAdmission 
= 
weigthAdmission .
;. /
_weigthSalary 
= 
weigthSalary (
;( )
} 	
public 
decimal 
GetBonus 
(  
Employee  (
employee) 1
)1 2
{3 4
var 
numberSalary 
= #
Calculate_Number_Salary  7
(7 8
employee8 @
)@ A
;A B
var 

numberYear 
= !
Calculate_Number_Year 4
(4 5
employee5 =
)= >
;> ?
return 
_bonus 
. 
CalculateBonus (
(( )
_officeFactory) 7
.7 8
GetWeightOffice8 G
(G H
employeeH P
.P Q
AreaQ U
)U V
,V W
_weigthSalary  ) 6
.  6 7
	GetWeigth  7 @
(  @ A
numberSalary  A M
)  M N
,  N O
_weigthAdmission!!) 9
.!!9 :
	GetWeigth!!: C
(!!C D

numberYear!!D N
)!!N O
,!!O P
employee!!Q Y
.!!Y Z
SalarioBruto!!Z f
)!!f g
;!!h i
}"" 	
private$$ 
static$$ 
float$$ #
Calculate_Number_Salary$$ 4
($$4 5
Employee$$5 =
employee$$> F
)$$F G
{%% 	
if&& 
(&& 
MinimumSalary&& 
==&&  
$num&&! "
)&&" #
throw&&$ )
new&&* -!
ArgumentNullException&&. C
(&&C D
$str&&D N
,&&N O
$str&&O n
)&&n o
;&&o p
if'' 
('' 
employee'' 
is'' 
{'' 
}'' 
)''  
return''! '
(''( )
float'') .
)''. /
(''0 1
employee''1 9
.''9 :
SalarioBruto'': F
/''G H
MinimumSalary''I V
)''V W
;''W X
return(( 
$num(( 
;(( 
})) 	
private++ 
static++ 
float++ !
Calculate_Number_Year++ 2
(++2 3
Employee++3 ;
employee++< D
)++D E
{,, 	
var-- 
result-- 
=-- 
(-- 
float-- 
)--  
(--! "
DateTime--" *
.--* +
Now--+ .
.--. /
Subtract--/ 7
(--7 8
employee--8 @
.--@ A
DataDeAdmissao--A O
)--O P
.--P Q
	TotalDays--Q Z
/--[ \
$num--] b
)--b c
;--c d
return.. 
result.. 
>.. 
$num..  
?..! "
result..# )
:..* +
$num.., 0
;..0 1
}// 	
public11 
decimal11 
GetSalaryConvert11 '
(11' (
string11( .
salary11/ 5
)115 6
{22 	
var33 
result33 
=33 
string33 
.33  
Empty33  %
;33% &
if55 
(55 
salary55 
is55 
{55 
}55 
)55 
{66 
result77 
=77 
salary77 
.77  
Where77  %
(77% &
caracter77& .
=>77/ 1
char772 6
.776 7
IsDigit777 >
(77> ?
caracter77? G
)77G H
||77I K
char77L P
.77P Q
IsPunctuation77Q ^
(77^ _
caracter77_ g
)77g h
)77h i
.77i j
	Aggregate77j s
(77s t
result77t z
,77z {
(77| }
current	77} Ñ
,
77Ñ Ö
caracter
77Ü é
)
77é è
=>
77ê í
current
77ì ö
+
77õ ú
caracter
77ù •
)
77• ¶
;
77¶ ß
return88 
Convert88 
.88 
	ToDecimal88 (
(88( )
result88) /
)88/ 0
;880 1
}99 
throw;; 
new;; !
ArgumentNullException;; +
(;;+ ,
$str;;, 4
,;;4 5
$str;;5 V
);;V W
;;;W X
}<< 	
}== 
}>> π
gC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\GeneralServices.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 
GeneralServices  
:! "
IOfficeStrategy# 2
{		 
public

 
int

 
GetWeightOffice

 "
(

" #
)

# $
{ 	
return 
$num 
; 
} 	
} 
} °
eC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\OfficeFactory.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 
OfficeFactory 
{		 
private

 
readonly

 

Dictionary

 #
<

# $
string

$ *
,

* +
IOfficeStrategy

, ;
>

; <
_map

= A
;

A B
public 
OfficeFactory 
( 
) 
{ 	
_map 
= 
new 

Dictionary !
<! "
string" (
,( )
IOfficeStrategy* 9
>9 :
(: ;
); <
;< =

Initialize 
( 
) 
; 
} 	
private 
void 

Initialize 
(  
)  !
{" #
_map 
. 
Add 
( 
$str !
,! "
new' *
Cfo+ .
(. /
)/ 0
)0 1
;1 2
_map 
. 
Add 
( 
$str %
,% &
new' *

Accounting+ 5
(5 6
)6 7
)7 8
;8 9
_map 
. 
Add 
( 
$str "
," #
new' *

Accounting+ 5
(5 6
)6 7
)7 8
;8 9
_map 
. 
Add 
( 
$str "
," #
new' *

Accounting+ 5
(5 6
)6 7
)7 8
;8 9
_map 
. 
Add 
( 
$str '
,' (
new, /
GeneralServices0 ?
(? @
)@ A
)A B
;B C
_map 
. 
Add 
( 
$str 4
,4 5
new9 < 
CustomerRelationship= Q
(Q R
)R S
)S T
;T U
} 	
public 
int 
GetWeightOffice "
(" #
string# )
office* 0
)0 1
{2 3
return 
_map 
[ 
office 
] 
.  
GetWeightOffice  /
(/ 0
)0 1
;1 2
} 	
} 
} Ç
gC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\WeigthAdmission.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 
WeigthAdmission  
:! "
IWeigth# *
{ 
public		 
WeigthCondition		 
[		 
]		  
WeigthConditions		! 1
{

 	
get 
{ 
return 
new 
[ 
] 
{ 
new 
WeigthCondition +
(+ ,
m, -
=>. 0
m1 2
>3 4
$num5 6
,6 7
m8 9
=>: <
$num= >
)? @
,@ A
new 
WeigthCondition +
(+ ,
m, -
=>. 0
m1 2
<2 3
$num4 5
&&6 8
m9 :
>: ;
$num< =
,= >
m? @
=>@ B
$numB C
)C D
,D E
new 
WeigthCondition +
(+ ,
m, -
=>. 0
m1 2
<2 3
$num4 5
&&6 8
m9 :
>: ;
$num< =
,= >
m? @
=>A C
$numD E
)E F
,F G
new 
WeigthCondition +
(+ ,
m, -
=>. 0
m1 2
<=3 5
$num5 6
&&7 9
m: ;
>=< >
$num? C
,C D
mE F
=>G I
$numJ K
)K L
,L M
} 
; 
} 
} 	
public 
int 
	GetWeigth 
( 
float "
	parameter# ,
), -
{ 	
var 
executor 
= 
WeigthConditions +
?+ ,
., -
First- 2
(2 3
t3 4
=>5 7
t8 9
.9 :
CanApply: B
(B C
	parameterC L
)L M
)M N
;N O
return 
executor 
. 
	Transform %
(% &
	parameter& /
)/ 0
;0 1
} 	
}   
}"" ‚

gC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\WeigthCondition.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 
WeigthCondition  
{ 
public 
Func 
< 
float 
, 
bool 
>  
CanApply! )
{* +
get, /
;/ 0
private1 8
set9 <
;< =
}> ?
public		 
Func		 
<		 
float		 
,		 
int		 
>		 
	Transform		  )
{		* +
get		, /
;		/ 0
private		1 8
set		9 <
;		< =
}		> ?
public 
WeigthCondition 
( 
Func #
<# $
float$ )
,) *
bool+ /
>/ 0
canApply1 9
,9 :
Func; ?
<? @
float@ E
,E F
intG J
>J K
	transformL U
)U V
{ 	
CanApply 
= 
canApply 
;  
	Transform 
= 
	transform !
;! "
} 	
} 
} ¸
dC:\Users\gemir\source\repos\AwesomeStone\AwesomeStone\src\AwesomeStone.Core\Servicos\WeigthSalary.cs
	namespace 	
AwesomeStone
 
. 
Core 
. 
Servicos $
{ 
public 

class 
WeigthSalary 
: 
IWeigth %
{ 
public 
WeigthCondition 
[ 
]  
WeigthConditions! 1
{		 	
get

 
{ 
return 
new 
[ 
] 
{ 
new 
WeigthCondition '
(' (
m( )
=>* ,
m- .
>/ 0
$num1 5
,5 6
m7 8
=>9 ;
$num< =
)> ?
,? @
new 
WeigthCondition '
(' (
m( )
=>* ,
m- .
</ 0
$num1 5
&&6 8
m9 :
>; <
$num= A
,A B
mC D
=>E G
$numH I
)I J
,J K
new 
WeigthCondition '
(' (
m( )
=>* ,
m- .
</ 0
$num1 5
&&6 8
m9 :
>; <
$num= A
,A B
mC D
=>E G
$numH I
)I J
,J K
new 
WeigthCondition '
(' (
m( )
=>* ,
m- .
<=/ 1
$num1 5
&&6 8
m9 :
>=; =
$num> B
,B C
mD E
=>F H
$numI J
)J K
,K L
} 
; 
} 
} 	
public 
int 
	GetWeigth 
( 
float "
	parameter# ,
), -
{ 	
var 
executor 
= 
WeigthConditions +
?+ ,
., -
First- 2
(2 3
t3 4
=>5 7
t8 9
.9 :
CanApply: B
(B C
	parameterC L
)L M
)M N
;N O
return 
executor 
. 
	Transform %
(% &
	parameter& /
)/ 0
;0 1
} 	
} 
} 