’
tC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias\Controllers\wsTransferenciasController.cs
	namespace 	
wsTransferencias
 
. 
Controllers &
{		 
[

 
Route

 

(


 
$str

 
)

  
]

  !
[ 
ApiController 
] 
public 

class &
WsTransferenciasController +
:, -
ControllerBase. <
{ 
private 
readonly 
SettingsApi $
	_settings% .
;. /
public &
WsTransferenciasController )
(* +
IOptionsMonitor, ;
<; <
SettingsApi< G
>G H
settingsI Q
,Q R
IWebHostEnvironmentS f
webHostg n
)o p
{ 	
	_settings 
= 
settings  
.  !
CurrentValue! -
;- .
string 
	path_logs 
= 
webHost &
.& '
WebRootPath' 2
+3 4
	_settings5 >
.> ?$
path_logs_transferencias? W
;W X
	_settings 
. $
path_logs_transferencias .
=/ 0
	path_logs1 :
;: ;
if 
( 
DateTime 
. 
Compare 
(  
DateTime! )
.) *
Now* -
,- .
LoadConfigService/ @
.@ A
dt_fecha_codigosA Q
.Q R
AddDaysR Y
(Y Z
$num[ \
)] ^
)_ `
>a b
$numc d
||e g
LoadConfigServiceh y
.y z
lst_errores	z …
.
… †
Count
† ‹
<=
Œ Ž
$num
 
)
 ‘
{ 
LoadConfigService !
.! "
LoadConfiguration" 3
(3 4
	_settings5 >
)? @
;@ A
} 
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
Transaccion (
() *
Object+ 1
raw2 5
,5 6
string7 =
str_operacion> K
)L M
{ 	
WsTransferenciasNeg 
objConsultas  ,
=- .
new/ 2
WsTransferenciasNeg3 F
(F G
	_settingsH Q
)R S
;S T
object 
	respuesta 
= 
objConsultas +
.+ ,
procesarSolicitud, =
(= >
raw? B
,B C
str_operacionD Q
)R S
;S T
return   
Ok   
(   
	respuesta    
)  ! "
;  " #
}!! 	
}## 
}$$ œ
lC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias\Middleware\BasicAuthentication.cs
	namespace 	
wsTransferencias
 
. 

Middleware %
{ 
public 

class 
BasicAuthentication $
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private		 
readonly		 
SettingsApi		 $
	_settings		% .
;		. /
public 
BasicAuthentication "
(" #
RequestDelegate# 2
next3 7
,7 8
IOptionsMonitor9 H
<H I
SettingsApiI T
>T U
settingsV ^
)^ _
{ 	
_next 
= 
next 
; 
	_settings 
= 
settings  
.  !
CurrentValue! -
;- .
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
httpContext- 8
)8 9
{ 	
string 

authHeader 
= 
httpContext  +
.+ ,
Request, 3
.3 4
Headers4 ;
[; <
$str< K
]K L
;L M
if 
( 

authHeader 
!= 
null "
&&# %

authHeader& 0
.0 1

StartsWith1 ;
(; <
$str< C
)C D
)D E
{ 
string 
encodeAuthorization *
=+ ,

authHeader- 7
.7 8
	Substring8 A
(A B
$strB J
.J K
LengthK Q
)Q R
.R S
TrimS W
(W X
)X Y
;Y Z
if 
( 
encodeAuthorization '
.' (
Equals( .
(. /
	_settings/ 8
.8 9"
auth_ws_transferencias9 O
)O P
)P Q
{ 
await 
_next 
.  
Invoke  &
(& '
httpContext' 2
)2 3
;3 4
} 
else 
{ 
httpContext   
.    
Response    (
.  ( )

StatusCode  ) 3
=  4 5
Convert  6 =
.  = >
ToInt32  > E
(  E F
System  F L
.  L M
Net  M P
.  P Q
HttpStatusCode  Q _
.  _ `
Unauthorized  ` l
)  l m
;  m n
}!! 
}## 
else$$ 
{%% 
httpContext'' 
.'' 
Response'' $
.''$ %

StatusCode''% /
=''0 1
Convert''2 9
.''9 :
ToInt32'': A
(''A B
System''B H
.''H I
Net''I L
.''L M
HttpStatusCode''M [
.''[ \
Unauthorized''\ h
)''h i
;''i j
}(( 
})) 	
}** 
public.. 

static.. 
class.. )
BasicAuthenticationExtensions.. 5
{// 
public00 
static00 
IApplicationBuilder00 )"
UseBasicAuthentication00* @
(00@ A
this00A E
IApplicationBuilder00F Y
builder00Z a
,00a b
IOptionsMonitor00c r
<00r s
SettingsApi00s ~
>00~ 
settings
00€ ˆ
)
00ˆ ‰
{11 	
return22 
builder22 
.22 
UseMiddleware22 (
<22( )
BasicAuthentication22) <
>22< =
(22= >
settings22> F
)22F G
;22G H
}33 	
}44 
}55 Ù%
UC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args, 0
)1 2
;2 3
builder		 
.		 
Services		 
.		 
AddControllers		 
(		  
)		  !
;		! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
c  !
=>" $
{ 
c 
. 

SwaggerDoc 
( 
$str 
, 
new 
OpenApiInfo (
{ 
Title	 
= 
$str -
,- .
Version	 
= 
$str 
, 
Description	 
= 
$str R
,R S
} 
) 
; 	
c 
. !
AddSecurityDefinition 
( 
$str %
,% &
new' *!
OpenApiSecurityScheme+ @
{ 
Name	 
= 
$str 
,  
Type	 
= 
SecuritySchemeType "
." #
Http# '
,' (
Scheme	 
= 
$str 
, 
In	 
= 
ParameterLocation 
.  
Header  &
,& '
Description	 
= 
$str 1
,1 2
} 
) 
; 	
} 
) 
; 
builder## 
.## 
Services## 
.## 
	Configure## 
<## 
SettingsApi## &
>##& '
(##' (
builder##) 0
.##0 1
Configuration##1 >
.##> ?

GetSection##? I
(##I J
$str##K b
)##c d
)##e f
;##f g
builder$$ 
.$$ 
Services$$ 
.$$ 
	Configure$$ 
<$$ 
SettingsApi$$ &
>$$& '
($$' (
builder$$) 0
.$$0 1
Configuration$$1 >
.$$> ?

GetSection$$? I
($$I J
$str$$K b
)$$c d
)$$e f
;$$f g
builder%% 
.%% 
Services%% 
.%% 
	Configure%% 
<%% 
SettingsApi%% &
>%%& '
(%%' (
builder%%) 0
.%%0 1
Configuration%%1 >
.%%> ?

GetSection%%? I
(%%I J
$str%%K b
)%%c d
)%%e f
;%%f g
builder&& 
.&& 
Services&& 
.&& 
	Configure&& 
<&& 
SettingsApi&& &
>&&& '
(&&' (
builder&&) 0
.&&0 1
Configuration&&1 >
.&&> ?

GetSection&&? I
(&&I J
$str&&K a
)&&b c
)&&d e
;&&e f
builder'' 
.'' 
Services'' 
.'' 
	Configure'' 
<'' 
SettingsApi'' &
>''& '
(''' (
builder'') 0
.''0 1
Configuration''1 >
.''> ?

GetSection''? I
(''I J
$str''K _
)''` a
)''b c
;''c d
builder)) 
.)) 
Services)) 
.)) 

AddOptions)) 
()) 
))) 
;)) 
var,, 
app,, 
=,, 	
builder,,
 
.,, 
Build,, 
(,, 
),, 
;,, 
if// 
(// 
app// 
.// 
Environment// 
.// 
IsDevelopment//  
(//  !
)//! "
)//" #
{00 
app11 
.11 

UseSwagger11 
(11 
)11 
;11 
app22 
.22 
UseSwaggerUI22 
(22 
)22 
;22 
}33 
app55 
.55 
UseHttpsRedirection55 
(55 
)55 
;55 
app77 
.77 
UseMiddleware77 
<77 
BasicAuthentication77 %
>77% &
(77& '
)77' (
;77( )
app99 
.99 
UseAuthorization99 
(99 
)99 
;99 
app;; 
.;; 
MapControllers;; 
(;; 
);; 
;;; 
app== 
.== 
Run== 
(== 
)== 	
;==	 
