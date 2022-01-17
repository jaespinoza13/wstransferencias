��
bC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Dat\BeneficiariosDat.cs
	namespace		 	
wsTransferencias		
 
.		 
Dat		 
{

 
public 

class 
BeneficiariosDat !
{ 
private 
InfoLog 
infoLog 
;  
private 
readonly 
SettingsApi $
	_settings% .
;. /
private 
readonly 
	DALClient "
objClienteDal# 0
;0 1
private 
readonly 
string 
str_ruta  (
;( )
private 
const 
string 
str_salida_error -
=. /
$str0 6
;6 7
public 
BeneficiariosDat 
(  !
SettingsApi" -
serviceSettings. =
)> ?
{ 	
	_settings 
= 
serviceSettings '
;' (
this 
. 
str_ruta 
= 
serviceSettings +
.+ ,$
path_logs_transferencias, D
;D E
infoLog 
. 
	str_clase 
= 
GetType  '
(' (
)( )
.) *
FullName* 2
;2 3
infoLog 
. 
	str_fecha 
= 
DateTime  (
.( )
Now) ,
;, -
var 
canal 
= 
GrpcChannel #
.# $

ForAddress$ .
(. /
serviceSettings0 ?
.? @ 
servicio_grpc_sybase@ T
)U V
;V W
objClienteDal 
= 
new 
	DALClient  )
() *
canal+ 0
)1 2
;2 3
} 	
public    
RespuestaTransaccion   #%
add_cuentas_beneficiarios  $ =
(  > ?
ReqAddBeneficiario  @ R
obj_beneficiario  S c
)  d e
{!! 	
var"" 
	respuesta"" 
="" 
new""  
RespuestaTransaccion""  4
(""4 5
)""5 6
;""6 7
try$$ 
{%% 
DatosSolicitud&& 
ds&& !
=&&" #
new&&$ '
DatosSolicitud&&( 6
(&&6 7
)&&7 8
;&&8 9
ds(( 
.(( 
ListaPEntrada((  
.((  !
Add((! $
((($ %
new((& )
ParametroEntrada((* :
{((; <
StrNameParameter((= M
=((N O
$str((P a
,((a b
TipoDato((c k
=((l m
TipoDato((n v
.((v w
VarChar((w ~
,((~ 
ObjValue
((� �
=
((� �
obj_beneficiario
((� �
.
((� �
str_codigo_ifi
((� �
.
((� �
ToString
((� �
(
((� �
)
((� �
}
((� �
)
((� �
;
((� �
ds)) 
.)) 
ListaPEntrada))  
.))  !
Add))! $
())$ %
new))& )
ParametroEntrada))* :
{)); <
StrNameParameter))= M
=))N O
$str))P d
,))d e
TipoDato))f n
=))o p
TipoDato))q y
.))y z
Integer	))z �
,
))� �
ObjValue
))� �
=
))� �
obj_beneficiario
))� �
.
))� �
int_tipo_producto
))� �
.
))� �
ToString
))� �
(
))� �
)
))� �
}
))� �
)
))� �
;
))� �
ds** 
.** 
ListaPEntrada**  
.**  !
Add**! $
(**$ %
new**& )
ParametroEntrada*** :
{**; <
StrNameParameter**= M
=**N O
$str**P ^
,**^ _
TipoDato**` h
=**i j
TipoDato**k s
.**s t
VarChar**t {
,**{ |
ObjValue	**} �
=
**� �
obj_beneficiario
**� �
.
**� �
str_numero_cuenta
**� �
.
**� �
ToString
**� �
(
**� �
)
**� �
}
**� �
)
**� �
;
**� �
ds++ 
.++ 
ListaPEntrada++  
.++  !
Add++! $
(++$ %
new++& )
ParametroEntrada++* :
{++; <
StrNameParameter++= M
=++N O
$str++P d
,++d e
TipoDato++f n
=++o p
TipoDato++q y
.++y z
VarChar	++z �
,
++� �
ObjValue
++� �
=
++� �
obj_beneficiario
++� �
.
++� �"
str_numero_documento
++� �
.
++� �
ToString
++� �
(
++� �
)
++� �
}
++� �
)
++� �
;
++� �
ds,, 
.,, 
ListaPEntrada,,  
.,,  !
Add,,! $
(,,$ %
new,,& )
ParametroEntrada,,* :
{,,; <
StrNameParameter,,= M
=,,N O
$str,,P ^
,,,^ _
TipoDato,,` h
=,,i j
TipoDato,,k s
.,,s t
VarChar,,t {
,,,{ |
ObjValue	,,} �
=
,,� �
obj_beneficiario
,,� �
.
,,� �
str_nombres
,,� �
.
,,� �
ToString
,,� �
(
,,� �
)
,,� �
}
,,� �
)
,,� �
;
,,� �
ds-- 
.-- 
ListaPEntrada--  
.--  !
Add--! $
(--$ %
new--& )
ParametroEntrada--* :
{--; <
StrNameParameter--= M
=--N O
$str--P \
,--\ ]
TipoDato--^ f
=--g h
TipoDato--i q
.--q r
VarChar--r y
,--y z
ObjValue	--{ �
=
--� �
obj_beneficiario
--� �
.
--� �
	str_email
--� �
.
--� �
ToString
--� �
(
--� �
)
--� �
}
--� �
)
--� �
;
--� �
ds.. 
... 
ListaPEntrada..  
...  !
Add..! $
(..$ %
new..& )
ParametroEntrada..* :
{..; <
StrNameParameter..= M
=..N O
$str..P `
,..` a
TipoDato..b j
=..k l
TipoDato..m u
...u v
VarChar..v }
,..} ~
ObjValue	.. �
=
..� �
obj_beneficiario
..� �
.
..� �
str_alias_cta
..� �
.
..� �
ToString
..� �
(
..� �
)
..� �
}
..� �
)
..� �
;
..� �
ds// 
.// 
ListaPEntrada//  
.//  !
Add//! $
(//$ %
new//& )
ParametroEntrada//* :
{//; <
StrNameParameter//= M
=//N O
$str//P h
,//h i
TipoDato//j r
=//s t
TipoDato//u }
.//} ~
VarChar	//~ �
,
//� �
ObjValue
//� �
=
//� �
obj_beneficiario
//� �
.
//� �#
str_tipo_beneficiario
//� �
.
//� �
ToString
//� �
(
//� �
)
//� �
}
//� �
)
//� �
;
//� �
ds00 
.00 
ListaPEntrada00  
.00  !
Add00! $
(00$ %
new00& )
ParametroEntrada00* :
{00; <
StrNameParameter00= M
=00N O
$str00P d
,00d e
TipoDato00f n
=00o p
TipoDato00q y
.00y z
Integer	00z �
,
00� �
ObjValue
00� �
=
00� �
obj_beneficiario
00� �
.
00� �
int_ente_registra
00� �
.
00� �
ToString
00� �
(
00� �
)
00� �
}
00� �
)
00� �
;
00� �
ds33 
.33 
ListaPEntrada33  
.33  !
Add33! $
(33$ %
new33& )
ParametroEntrada33* :
{33; <
StrNameParameter33= M
=33N O
$str33P e
,33e f
TipoDato33g o
=33p q
TipoDato33r z
.33z {
VarChar	33{ �
,
33� �
ObjValue
33� �
=
33� �
obj_beneficiario
33� �
.
33� � 
str_id_transaccion
33� �
.
33� �
ToString
33� �
(
33� �
)
33� �
}
33� �
)
33� �
;
33� �
ds44 
.44 
ListaPEntrada44  
.44  !
Add44! $
(44$ %
new44& )
ParametroEntrada44* :
{44; <
StrNameParameter44= M
=44N O
$str44P a
,44a b
TipoDato44c k
=44l m
TipoDato44n v
.44v w
Integer44w ~
,44~ 
ObjValue
44� �
=
44� �
obj_beneficiario
44� �
.
44� �
str_id_sistema
44� �
}
44� �
)
44� �
;
44� �
ds55 
.55 
ListaPEntrada55  
.55  !
Add55! $
(55$ %
new55& )
ParametroEntrada55* :
{55; <
StrNameParameter55= M
=55N O
$str55P \
,55\ ]
TipoDato55^ f
=55g h
TipoDato55i q
.55q r
VarChar55r y
,55y z
ObjValue	55{ �
=
55� �
obj_beneficiario
55� �
.
55� �
	str_login
55� �
.
55� �
ToString
55� �
(
55� �
)
55� �
}
55� �
)
55� �
;
55� �
ds66 
.66 
ListaPEntrada66  
.66  !
Add66! $
(66$ %
new66& )
ParametroEntrada66* :
{66; <
StrNameParameter66= M
=66N O
$str66P `
,66` a
TipoDato66b j
=66k l
TipoDato66m u
.66u v
Integer66v }
,66} ~
ObjValue	66 �
=
66� �
obj_beneficiario
66� �
.
66� �
str_id_perfil
66� �
.
66� �
ToString
66� �
(
66� �
)
66� �
}
66� �
)
66� �
;
66� �
ds77 
.77 
ListaPEntrada77  
.77  !
Add77! $
(77$ %
new77& )
ParametroEntrada77* :
{77; <
StrNameParameter77= M
=77N O
$str77P a
,77a b
TipoDato77c k
=77l m
TipoDato77n v
.77v w
Integer77w ~
,77~ 
ObjValue
77� �
=
77� �
obj_beneficiario
77� �
.
77� �
str_id_oficina
77� �
.
77� �
ToString
77� �
(
77� �
)
77� �
}
77� �
)
77� �
;
77� �
ds88 
.88 
ListaPEntrada88  
.88  !
Add88! $
(88$ %
new88& )
ParametroEntrada88* :
{88; <
StrNameParameter88= M
=88N O
$str88P e
,88e f
TipoDato88g o
=88p q
TipoDato88r z
.88z {
VarChar	88{ �
,
88� �
ObjValue
88� �
=
88� �
obj_beneficiario
88� �
.
88� � 
str_nemonico_canal
88� �
.
88� �
ToString
88� �
(
88� �
)
88� �
}
88� �
)
88� �
;
88� �
ds99 
.99 
ListaPEntrada99  
.99  !
Add99! $
(99$ %
new99& )
ParametroEntrada99* :
{99; <
StrNameParameter99= M
=99N O
$str99P e
,99e f
TipoDato99g o
=99p q
TipoDato99r z
.99z {
VarChar	99{ �
,
99� �
ObjValue
99� �
=
99� �
obj_beneficiario
99� �
.
99� � 
str_ip_dispositivo
99� �
.
99� �
ToString
99� �
(
99� �
)
99� �
}
99� �
)
99� �
;
99� �
ds:: 
.:: 
ListaPEntrada::  
.::  !
Add::! $
(::$ %
new::& )
ParametroEntrada::* :
{::; <
StrNameParameter::= M
=::N O
$str::P ]
,::] ^
TipoDato::_ g
=::h i
TipoDato::j r
.::r s
VarChar::s z
,::z {
ObjValue	::| �
=
::� �
obj_beneficiario
::� �
.
::� �

str_sesion
::� �
.
::� �
ToString
::� �
(
::� �
)
::� �
}
::� �
)
::� �
;
::� �
ds;; 
.;; 
ListaPEntrada;;  
.;;  !
Add;;! $
(;;$ %
new;;& )
ParametroEntrada;;* :
{;;; <
StrNameParameter;;= M
=;;N O
$str;;P f
,;;f g
TipoDato;;h p
=;;q r
TipoDato;;s {
.;;{ |
VarChar	;;| �
,
;;� �
ObjValue
;;� �
=
;;� �
obj_beneficiario
;;� �
.
;;� �!
str_mac_dispositivo
;;� �
.
;;� �
ToString
;;� �
(
;;� �
)
;;� �
}
;;� �
)
;;� �
;
;;� �
ds>> 
.>> 
ListaPSalida>> 
.>>  
Add>>  #
(>># $
new>>% (
ParametroSalida>>) 8
{>>9 :
StrNameParameter>>; K
=>>L M
$str>>N \
,>>\ ]
TipoDato>>^ f
=>>g h
TipoDato>>i q
.>>q r
VarChar>>r y
}>>z {
)>>| }
;>>} ~
ds?? 
.?? 
ListaPSalida?? 
.??  
Add??  #
(??# $
new??% (
ParametroSalida??) 8
{??9 :
StrNameParameter??; K
=??L M
$str??N `
,??` a
TipoDato??b j
=??k l
TipoDato??m u
.??u v
Integer??v }
}??~ 
)
??� �
;
??� �
dsAA 
.AA 
NombreSPAA 
=AA 
$strAA <
;AA< =
dsBB 
.BB 
NombreBDBB 
=BB 
	_settingsBB '
.BB' (
BD_megserviciosBB( 7
;BB7 8
varDD 
	resultadoDD 
=DD 
objClienteDalDD  -
.DD- .
ExecuteDataSetDD. <
(DD< =
dsDD> @
)DDA B
;DDB C
varEE 
lst_valoresEE 
=EE  !
newEE" %
ListEE& *
<EE* +"
ParametroSalidaValoresEE+ A
>EEA B
(EEB C
)EEC D
;EED E
foreachGG 
(GG 
varGG 
itemGG  
inGG! #
	resultadoGG$ -
.GG- .
ListaPSalidaValoresGG. A
)GGA B
lst_valoresGGC N
.GGN O
AddGGO R
(GGR S
itemGGT X
)GGY Z
;GGZ [
varHH 

str_codigoHH 
=HH  
lst_valoresHH! ,
.HH, -
FindHH- 1
(HH1 2
xHH3 4
=>HH5 7
xHH8 9
.HH9 :
StrNameParameterHH: J
==HHK M
$strHHN `
)HHa b
!HHb c
.HHc d
ObjValueHHd l
;HHl m
varII 
	str_errorII 
=II 
lst_valoresII  +
.II+ ,
FindII, 0
(II0 1
xII2 3
=>II4 6
xII7 8
.II8 9
StrNameParameterII9 I
==IIJ L
$strIIM [
)II\ ]
!II] ^
.II^ _
ObjValueII_ g
.IIg h
TrimIIh l
(IIl m
)IIm n
;IIn o
	respuestaKK 
.KK 
codigoKK  
=KK! "

str_codigoKK# -
.KK- .
ToStringKK. 6
(KK6 7
)KK7 8
.KK8 9
TrimKK9 =
(KK= >
)KK> ?
.KK? @
PadLeftKK@ G
(KKG H
$numKKI J
,KKJ K
$charKKL O
)KKP Q
;KKQ R
	respuestaLL 
.LL 
cuerpoLL  
=LL! "
	FuncionesLL# ,
.LL, -
ObtenerDatosLL- 9
(LL9 :
	resultadoLL; D
)LLE F
;LLF G
	respuestaMM 
.MM 
diccionarioMM %
.MM% &
AddMM& )
(MM) *
$strMM+ 6
,MM6 7
	str_errorMM8 A
.MMA B
ToStringMMB J
(MMJ K
)MMK L
)MMM N
;MMN O
}NN 
catchOO 
(OO 
	ExceptionOO 
	exceptionOO %
)OO% &
{PP 
	respuestaQQ 
.QQ 
codigoQQ  
=QQ! "
$strQQ# (
;QQ( )
	respuestaRR 
.RR 
diccionarioRR %
.RR% &
AddRR& )
(RR) *
$strRR+ 6
,RR6 7
	exceptionRR8 A
.RRA B
ToStringRRB J
(RRJ K
)RRK L
)RRM N
;RRN O
infoLogTT 
.TT 
str_id_transaccionTT *
=TT+ ,
obj_beneficiarioTT- =
.TT= >
str_id_transaccionTT> P
;TTP Q
infoLogUU 
.UU 
str_tipoUU  
=UU! "
str_salida_errorUU# 3
;UU3 4
infoLogVV 
.VV 

str_objetoVV "
=VV# $
	exceptionVV% .
;VV. /
infoLogWW 
.WW 

str_metodoWW "
=WW# $

MethodBaseWW% /
.WW/ 0
GetCurrentMethodWW0 @
(WW@ A
)WWA B
!WWB C
.WWC D
NameWWD H
;WWH I
infoLogXX 
.XX 
str_operacionXX %
=XX& '
obj_beneficiarioXX( 8
.XX8 9
str_id_servicioXX9 H
;XXH I
LogServiciosZZ 
.ZZ 
RegistrarTramasZZ ,
(ZZ, -
str_salida_errorZZ. >
,ZZ> ?
infoLogZZ@ G
,ZZG H
str_rutaZZI Q
)ZZR S
;ZZS T
}[[ 
return\\ 
	respuesta\\ 
;\\ 
}]] 	
public__  
RespuestaTransaccion__ #(
update_cuentas_beneficiarios__$ @
(__A B!
ReqUpdateBeneficiario__C X
obj_beneficiario__Y i
)__j k
{`` 	 
RespuestaTransaccionaa  
	respuestaaa! *
=aa+ ,
newaa- 0 
RespuestaTransaccionaa1 E
(aaE F
)aaF G
;aaG H
trycc 
{dd 
DatosSolicitudee 
dsee !
=ee" #
newee$ '
DatosSolicitudee( 6
(ee6 7
)ee7 8
;ee8 9
dsgg 
.gg 
ListaPEntradagg  
.gg  !
Addgg! $
(gg$ %
newgg& )
ParametroEntradagg* :
{gg; <
StrNameParametergg= M
=ggN O
$strggP a
,gga b
TipoDatoggc k
=ggl m
TipoDatoggn v
.ggv w
VarCharggw ~
,gg~ 
ObjValue
gg� �
=
gg� �
obj_beneficiario
gg� �
.
gg� �
str_codigo_ifi
gg� �
.
gg� �
ToString
gg� �
(
gg� �
)
gg� �
}
gg� �
)
gg� �
;
gg� �
dshh 
.hh 
ListaPEntradahh  
.hh  !
Addhh! $
(hh$ %
newhh& )
ParametroEntradahh* :
{hh; <
StrNameParameterhh= M
=hhN O
$strhhP d
,hhd e
TipoDatohhf n
=hho p
TipoDatohhq y
.hhy z
Integer	hhz �
,
hh� �
ObjValue
hh� �
=
hh� �
obj_beneficiario
hh� �
.
hh� �
int_tipo_producto
hh� �
.
hh� �
ToString
hh� �
(
hh� �
)
hh� �
}
hh� �
)
hh� �
;
hh� �
dsii 
.ii 
ListaPEntradaii  
.ii  !
Addii! $
(ii$ %
newii& )
ParametroEntradaii* :
{ii; <
StrNameParameterii= M
=iiN O
$striiP ^
,ii^ _
TipoDatoii` h
=iii j
TipoDatoiik s
.iis t
VarChariit {
,ii{ |
ObjValue	ii} �
=
ii� �
obj_beneficiario
ii� �
.
ii� �
str_num_cta
ii� �
.
ii� �
ToString
ii� �
(
ii� �
)
ii� �
}
ii� �
)
ii� �
;
ii� �
dsjj 
.jj 
ListaPEntradajj  
.jj  !
Addjj! $
(jj$ %
newjj& )
ParametroEntradajj* :
{jj; <
StrNameParameterjj= M
=jjN O
$strjjP d
,jjd e
TipoDatojjf n
=jjo p
TipoDatojjq y
.jjy z
VarChar	jjz �
,
jj� �
ObjValue
jj� �
=
jj� �
obj_beneficiario
jj� �
.
jj� �
str_num_documento
jj� �
.
jj� �
ToString
jj� �
(
jj� �
)
jj� �
}
jj� �
)
jj� �
;
jj� �
dskk 
.kk 
ListaPEntradakk  
.kk  !
Addkk! $
(kk$ %
newkk& )
ParametroEntradakk* :
{kk; <
StrNameParameterkk= M
=kkN O
$strkkP ^
,kk^ _
TipoDatokk` h
=kki j
TipoDatokkk s
.kks t
VarCharkkt {
,kk{ |
ObjValue	kk} �
=
kk� �
obj_beneficiario
kk� �
.
kk� �
str_nombres
kk� �
.
kk� �
ToString
kk� �
(
kk� �
)
kk� �
}
kk� �
)
kk� �
;
kk� �
dsll 
.ll 
ListaPEntradall  
.ll  !
Addll! $
(ll$ %
newll& )
ParametroEntradall* :
{ll; <
StrNameParameterll= M
=llN O
$strllP \
,ll\ ]
TipoDatoll^ f
=llg h
TipoDatolli q
.llq r
VarCharllr y
,lly z
ObjValue	ll{ �
=
ll� �
obj_beneficiario
ll� �
.
ll� �
	str_email
ll� �
.
ll� �
ToString
ll� �
(
ll� �
)
ll� �
}
ll� �
)
ll� �
;
ll� �
dsmm 
.mm 
ListaPEntradamm  
.mm  !
Addmm! $
(mm$ %
newmm& )
ParametroEntradamm* :
{mm; <
StrNameParametermm= M
=mmN O
$strmmP `
,mm` a
TipoDatommb j
=mmk l
TipoDatommm u
.mmu v
VarCharmmv }
,mm} ~
ObjValue	mm �
=
mm� �
obj_beneficiario
mm� �
.
mm� �
str_alias_cta
mm� �
.
mm� �
ToString
mm� �
(
mm� �
)
mm� �
}
mm� �
)
mm� �
;
mm� �
dsnn 
.nn 
ListaPEntradann  
.nn  !
Addnn! $
(nn$ %
newnn& )
ParametroEntradann* :
{nn; <
StrNameParameternn= M
=nnN O
$strnnP h
,nnh i
TipoDatonnj r
=nns t
TipoDatonnu }
.nn} ~
VarChar	nn~ �
,
nn� �
ObjValue
nn� �
=
nn� �
obj_beneficiario
nn� �
.
nn� �#
str_tipo_beneficiario
nn� �
.
nn� �
ToString
nn� �
(
nn� �
)
nn� �
}
nn� �
)
nn� �
;
nn� �
dsoo 
.oo 
ListaPEntradaoo  
.oo  !
Addoo! $
(oo$ %
newoo& )
ParametroEntradaoo* :
{oo; <
StrNameParameteroo= M
=ooN O
$strooP d
,ood e
TipoDatooof n
=ooo p
TipoDatoooq y
.ooy z
Integer	ooz �
,
oo� �
ObjValue
oo� �
=
oo� �
obj_beneficiario
oo� �
.
oo� �
int_ente_registra
oo� �
.
oo� �
ToString
oo� �
(
oo� �
)
oo� �
}
oo� �
)
oo� �
;
oo� �
dspp 
.pp 
ListaPEntradapp  
.pp  !
Addpp! $
(pp$ %
newpp& )
ParametroEntradapp* :
{pp; <
StrNameParameterpp= M
=ppN O
$strppP Y
,ppY Z
TipoDatopp[ c
=ppd e
TipoDatoppf n
.ppn o
Integerppo v
,ppv w
ObjValue	ppx �
=
pp� �
obj_beneficiario
pp� �
.
pp� �
int_id
pp� �
.
pp� �
ToString
pp� �
(
pp� �
)
pp� �
}
pp� �
)
pp� �
;
pp� �
dsss 
.ss 
ListaPEntradass  
.ss  !
Addss! $
(ss$ %
newss& )
ParametroEntradass* :
{ss; <
StrNameParameterss= M
=ssN O
$strssP e
,sse f
TipoDatossg o
=ssp q
TipoDatossr z
.ssz {
VarChar	ss{ �
,
ss� �
ObjValue
ss� �
=
ss� �
obj_beneficiario
ss� �
.
ss� � 
str_id_transaccion
ss� �
.
ss� �
ToString
ss� �
(
ss� �
)
ss� �
}
ss� �
)
ss� �
;
ss� �
dstt 
.tt 
ListaPEntradatt  
.tt  !
Addtt! $
(tt$ %
newtt& )
ParametroEntradatt* :
{tt; <
StrNameParametertt= M
=ttN O
$strttP a
,tta b
TipoDatottc k
=ttl m
TipoDatottn v
.ttv w
Integerttw ~
,tt~ 
ObjValue
tt� �
=
tt� �
obj_beneficiario
tt� �
.
tt� �
str_id_sistema
tt� �
}
tt� �
)
tt� �
;
tt� �
dsuu 
.uu 
ListaPEntradauu  
.uu  !
Adduu! $
(uu$ %
newuu& )
ParametroEntradauu* :
{uu; <
StrNameParameteruu= M
=uuN O
$struuP \
,uu\ ]
TipoDatouu^ f
=uug h
TipoDatouui q
.uuq r
VarCharuur y
,uuy z
ObjValue	uu{ �
=
uu� �
obj_beneficiario
uu� �
.
uu� �
	str_login
uu� �
.
uu� �
ToString
uu� �
(
uu� �
)
uu� �
}
uu� �
)
uu� �
;
uu� �
dsvv 
.vv 
ListaPEntradavv  
.vv  !
Addvv! $
(vv$ %
newvv& )
ParametroEntradavv* :
{vv; <
StrNameParametervv= M
=vvN O
$strvvP `
,vv` a
TipoDatovvb j
=vvk l
TipoDatovvm u
.vvu v
Integervvv }
,vv} ~
ObjValue	vv �
=
vv� �
obj_beneficiario
vv� �
.
vv� �
str_id_perfil
vv� �
.
vv� �
ToString
vv� �
(
vv� �
)
vv� �
}
vv� �
)
vv� �
;
vv� �
dsww 
.ww 
ListaPEntradaww  
.ww  !
Addww! $
(ww$ %
newww& )
ParametroEntradaww* :
{ww; <
StrNameParameterww= M
=wwN O
$strwwP a
,wwa b
TipoDatowwc k
=wwl m
TipoDatowwn v
.wwv w
Integerwww ~
,ww~ 
ObjValue
ww� �
=
ww� �
obj_beneficiario
ww� �
.
ww� �
str_id_oficina
ww� �
.
ww� �
ToString
ww� �
(
ww� �
)
ww� �
}
ww� �
)
ww� �
;
ww� �
dsxx 
.xx 
ListaPEntradaxx  
.xx  !
Addxx! $
(xx$ %
newxx& )
ParametroEntradaxx* :
{xx; <
StrNameParameterxx= M
=xxN O
$strxxP e
,xxe f
TipoDatoxxg o
=xxp q
TipoDatoxxr z
.xxz {
VarChar	xx{ �
,
xx� �
ObjValue
xx� �
=
xx� �
obj_beneficiario
xx� �
.
xx� � 
str_nemonico_canal
xx� �
.
xx� �
ToString
xx� �
(
xx� �
)
xx� �
}
xx� �
)
xx� �
;
xx� �
dsyy 
.yy 
ListaPEntradayy  
.yy  !
Addyy! $
(yy$ %
newyy& )
ParametroEntradayy* :
{yy; <
StrNameParameteryy= M
=yyN O
$stryyP e
,yye f
TipoDatoyyg o
=yyp q
TipoDatoyyr z
.yyz {
VarChar	yy{ �
,
yy� �
ObjValue
yy� �
=
yy� �
obj_beneficiario
yy� �
.
yy� � 
str_ip_dispositivo
yy� �
.
yy� �
ToString
yy� �
(
yy� �
)
yy� �
}
yy� �
)
yy� �
;
yy� �
dszz 
.zz 
ListaPEntradazz  
.zz  !
Addzz! $
(zz$ %
newzz& )
ParametroEntradazz* :
{zz; <
StrNameParameterzz= M
=zzN O
$strzzP ]
,zz] ^
TipoDatozz_ g
=zzh i
TipoDatozzj r
.zzr s
VarCharzzs z
,zzz {
ObjValue	zz| �
=
zz� �
obj_beneficiario
zz� �
.
zz� �

str_sesion
zz� �
.
zz� �
ToString
zz� �
(
zz� �
)
zz� �
}
zz� �
)
zz� �
;
zz� �
ds{{ 
.{{ 
ListaPEntrada{{  
.{{  !
Add{{! $
({{$ %
new{{& )
ParametroEntrada{{* :
{{{; <
StrNameParameter{{= M
={{N O
$str{{P f
,{{f g
TipoDato{{h p
={{q r
TipoDato{{s {
.{{{ |
VarChar	{{| �
,
{{� �
ObjValue
{{� �
=
{{� �
obj_beneficiario
{{� �
.
{{� �!
str_mac_dispositivo
{{� �
.
{{� �
ToString
{{� �
(
{{� �
)
{{� �
}
{{� �
)
{{� �
;
{{� �
ds~~ 
.~~ 
ListaPSalida~~ 
.~~  
Add~~  #
(~~# $
new~~% (
ParametroSalida~~) 8
{~~9 :
StrNameParameter~~; K
=~~L M
$str~~N \
,~~\ ]
TipoDato~~^ f
=~~g h
TipoDato~~i q
.~~q r
VarChar~~r y
}~~z {
)~~| }
;~~} ~
ds 
. 
ListaPSalida 
.  
Add  #
(# $
new% (
ParametroSalida) 8
{9 :
StrNameParameter; K
=L M
$strN `
,` a
TipoDatob j
=k l
TipoDatom u
.u v
Integerv }
}~ 
)
� �
;
� �
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� ?
;
��? @
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteNonQuery
��. =
(
��= >
ds
��? A
)
��B C
;
��C D
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
��  
in
��! #
	resultado
��$ -
.
��- .!
ListaPSalidaValores
��. A
)
��A B
lst_valores
��C N
.
��N O
Add
��O R
(
��R S
item
��T X
)
��Y Z
;
��Z [
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
StrNameParameter
��: J
==
��K M
$str
��N `
)
��a b
!
��b c
.
��c d
ObjValue
��d l
;
��l m
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��\ ]
!
��] ^
.
��^ _
ObjValue
��_ g
.
��g h
Trim
��h l
(
��l m
)
��m n
;
��n o
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��I J
,
��J K
$char
��L O
)
��P Q
;
��Q R
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	resultado
��# ,
.
��, -
NumAfectados
��- 9
;
��9 :
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	str_error
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� %
)
��% &
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	exception
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
obj_beneficiario
��- =
.
��= > 
str_id_transaccion
��> P
;
��P Q
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
obj_beneficiario
��( 8
.
��8 9
str_id_servicio
��9 H
;
��H I
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��. >
,
��> ?
infoLog
��@ G
,
��G H
str_ruta
��I Q
)
��R S
;
��S T
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #*
delete_cuentas_beneficiarios
��$ @
(
��A B#
ReqDeleteBeneficiario
��C X
obj_beneficiario
��Y i
)
��j k
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P Y
,
��Y Z
TipoDato
��[ c
=
��d e
TipoDato
��f n
.
��n o
Integer
��o v
,
��v w
ObjValue��x �
=��� � 
obj_beneficiario��� �
.��� �
int_id��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
Integer��z �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �!
int_ente_registra��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_motivo_elimina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
Integer
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� � 
obj_beneficiario��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
Integer
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ]
,
��] ^
TipoDato
��_ g
=
��h i
TipoDato
��j r
.
��r s
VarChar
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P f
,
��f g
TipoDato
��h p
=
��q r
TipoDato
��s {
.
��{ |
VarChar��| �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
}
��z {
)
��| }
;
��} ~
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
}
��~ 
)��� �
;��� �
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� ?
;
��? @
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteNonQuery
��. =
(
��= >
ds
��? A
)
��B C
;
��C D
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
��  
in
��! #
	resultado
��$ -
.
��- .!
ListaPSalidaValores
��. A
)
��A B
lst_valores
��C N
.
��N O
Add
��O R
(
��R S
item
��T X
)
��Y Z
;
��Z [
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
StrNameParameter
��: J
==
��K M
$str
��N `
)
��a b
!
��b c
.
��c d
ObjValue
��d l
;
��l m
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��\ ]
!
��] ^
.
��^ _
ObjValue
��_ g
.
��g h
Trim
��h l
(
��l m
)
��m n
;
��n o
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��I J
,
��J K
$char
��L O
)
��P Q
;
��Q R
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	resultado
��# ,
.
��, -
NumAfectados
��- 9
;
��9 :
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	str_error
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� %
)
��% &
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	exception
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
obj_beneficiario
��- =
.
��= > 
str_id_transaccion
��> P
;
��P Q
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
obj_beneficiario
��( 8
.
��8 9
str_id_servicio
��9 H
;
��H I
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��. >
,
��> ?
infoLog
��@ G
,
��G H
str_ruta
��I Q
)
��R S
;
��S T
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #%
get_datos_beneficiarios
��$ ;
(
��< = 
ReqGetBeneficiario
��> P
obj_beneficiario
��Q a
)
��b c
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
Integer��z �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �!
int_ente_registra��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
Integer
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� � 
obj_beneficiario��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
Integer
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ]
,
��] ^
TipoDato
��_ g
=
��h i
TipoDato
��j r
.
��r s
VarChar
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P f
,
��f g
TipoDato
��h p
=
��q r
TipoDato
��s {
.
��{ |
VarChar��| �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
}
��z {
)
��| }
;
��} ~
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
}
��~ 
)��� �
;��� �
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� 8
;
��8 9
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteDataSet
��. <
(
��< =
ds
��> @
)
��A B
;
��B C
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
��  
in
��! #
	resultado
��$ -
.
��- .!
ListaPSalidaValores
��. A
)
��A B
lst_valores
��C N
.
��N O
Add
��O R
(
��R S
item
��T X
)
��Y Z
;
��Z [
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
StrNameParameter
��: J
==
��K M
$str
��N `
)
��a b
!
��b c
.
��c d
ObjValue
��d l
;
��l m
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��\ ]
!
��] ^
.
��^ _
ObjValue
��_ g
.
��g h
Trim
��h l
(
��l m
)
��m n
;
��n o
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��I J
,
��J K
$char
��L O
)
��P Q
;
��Q R
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	Funciones
��# ,
.
��, -
ObtenerDatos
��- 9
(
��9 :
	resultado
��; D
)
��E F
;
��F G
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	str_error
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� %
)
��% &
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	exception
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
obj_beneficiario
��- =
.
��= > 
str_id_transaccion
��> P
;
��P Q
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
obj_beneficiario
��( 8
.
��8 9
str_id_servicio
��9 H
;
��H I
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��. >
,
��> ?
infoLog
��@ G
,
��G H
str_ruta
��I Q
)
��R S
;
��S T
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #,
validar_registro_beneficiarios
��$ B
(
��C D#
ReqValidaBeneficiario
��E Z
obj_beneficiario
��[ k
)
��l m
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
VarChar
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_codigo_ifi��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
Integer��z �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �!
int_tipo_producto��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ^
,
��^ _
TipoDato
��` h
=
��i j
TipoDato
��k s
.
��s t
VarChar
��t {
,
��{ |
ObjValue��} �
=��� � 
obj_beneficiario��� �
.��� �!
str_numero_cuenta��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �$
str_numero_documento��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
Integer��z �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �!
int_ente_registra��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
Integer
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� � 
obj_beneficiario��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
Integer
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ]
,
��] ^
TipoDato
��_ g
=
��h i
TipoDato
��j r
.
��r s
VarChar
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P f
,
��f g
TipoDato
��h p
=
��q r
TipoDato
��s {
.
��{ |
VarChar��| �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
}
��z {
)
��| }
;
��} ~
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
}
��~ 
)��� �
;��� �
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� >
;
��> ?
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteNonQuery
��. =
(
��= >
ds
��? A
)
��B C
;
��C D
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
��  
in
��! #
	resultado
��$ -
.
��- .!
ListaPSalidaValores
��. A
)
��A B
lst_valores
��C N
.
��N O
Add
��O R
(
��R S
item
��T X
)
��Y Z
;
��Z [
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
StrNameParameter
��: J
==
��K M
$str
��N `
)
��a b
!
��b c
.
��c d
ObjValue
��d l
;
��l m
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��\ ]
!
��] ^
.
��^ _
ObjValue
��_ g
.
��g h
Trim
��h l
(
��l m
)
��m n
;
��n o
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��I J
,
��J K
$char
��L O
)
��P Q
;
��Q R
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	resultado
��# ,
.
��, -
NumAfectados
��- 9
;
��9 :
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	str_error
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� %
)
��% &
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	exception
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
obj_beneficiario
��- =
.
��= > 
str_id_transaccion
��> P
;
��P Q
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
obj_beneficiario
��( 8
.
��8 9
str_id_servicio
��9 H
;
��H I
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��. >
,
��> ?
infoLog
��@ G
,
��G H
str_ruta
��I Q
)
��R S
;
��S T
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #+
validar_benef_otras_ctas_mego
��$ A
(
��B C 
ReqAddBeneficiario
��D V
obj_beneficiario
��W g
)
��h i
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ^
,
��^ _
TipoDato
��` h
=
��i j
TipoDato
��k s
.
��s t
VarChar
��t {
,
��{ |
ObjValue��} �
=��� � 
obj_beneficiario��� �
.��� �!
str_numero_cuenta��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �!
int_ente_registra��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ^
,
��^ _
TipoDato
��` h
=
��i j
TipoDato
��k s
.
��s t
VarChar
��t {
,
��{ |
ObjValue��} �
=��� � 
obj_beneficiario��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
VarChar
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ^
,
��^ _
TipoDato
��` h
=
��i j
TipoDato
��k s
.
��s t
VarChar
��t {
,
��{ |
ObjValue��} �
=��� � 
obj_beneficiario��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ^
,
��^ _
TipoDato
��` h
=
��i j
TipoDato
��k s
.
��s t
Integer
��t {
,
��{ |
ObjValue��} �
=��� � 
obj_beneficiario��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� � 
obj_beneficiario��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P Y
,
��Y Z
TipoDato
��[ c
=
��d e
TipoDato
��f n
.
��n o
VarChar
��o v
,
��v w
ObjValue��x �
=��� � 
obj_beneficiario��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P Z
,
��Z [
TipoDato
��\ d
=
��e f
TipoDato
��g o
.
��o p
VarChar
��p w
,
��w x
ObjValue��y �
=��� � 
obj_beneficiario��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N V
,
��V W
TipoDato
��X `
=
��a b
TipoDato
��c k
.
��k l
VarChar
��l s
}
��t u
)
��v w
;
��w x
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N Z
,
��Z [
TipoDato
��\ d
=
��e f
TipoDato
��g o
.
��o p
Integer
��p w
}
��x y
)
��z {
;
��{ |
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� =
;
��= >
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteDataSet
��. <
(
��< =
ds
��> @
)
��A B
;
��B C
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
��  
in
��! #
	resultado
��$ -
.
��- .!
ListaPSalidaValores
��. A
)
��A B
lst_valores
��C N
.
��N O
Add
��O R
(
��R S
item
��T X
)
��Y Z
;
��Z [
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
StrNameParameter
��: J
==
��K M
$str
��N Z
)
��[ \
!
��\ ]
.
��] ^
ObjValue
��^ f
;
��f g
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M U
)
��V W
!
��W X
.
��X Y
ObjValue
��Y a
.
��a b
Trim
��b f
(
��f g
)
��g h
;
��h i
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��I J
,
��J K
$char
��L O
)
��P Q
;
��Q R
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	Funciones
��# ,
.
��, -
ObtenerDatos
��- 9
(
��9 :
	resultado
��; D
)
��E F
;
��F G
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	str_error
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� %
)
��% &
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	exception
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
obj_beneficiario
��- =
.
��= > 
str_id_transaccion
��> P
;
��P Q
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
obj_beneficiario
��( 8
.
��8 9
str_id_servicio
��9 H
;
��H I
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��. >
,
��> ?
infoLog
��@ G
,
��G H
str_ruta
��I Q
)
��R S
;
��S T
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� ##
get_ctas_beneficiario
��$ 9
(
��: ;$
ReqCuentasBeneficiario
��< R
obj_beneficiario
��S c
)
��d e
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
Integer
��q x
,
��x y
ObjValue��z �
=��� � 
obj_beneficiario��� �
.��� �
int_ente��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P n
,
��n o
TipoDato
��p x
=
��y z
TipoDato��{ �
.��� �
VarChar��� �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �/
str_nemonico_tipo_transferencia��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
Integer
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� � 
obj_beneficiario��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P a
,
��a b
TipoDato
��c k
=
��l m
TipoDato
��n v
.
��v w
Integer
��w ~
,
��~ 
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P ]
,
��] ^
TipoDato
��_ g
=
��h i
TipoDato
��j r
.
��r s
VarChar
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��& )
ParametroEntrada
��* :
{
��; <
StrNameParameter
��= M
=
��N O
$str
��P f
,
��f g
TipoDato
��h p
=
��q r
TipoDato
��s {
.
��{ |
VarChar��| �
,��� �
ObjValue��� �
=��� � 
obj_beneficiario��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
}
��z {
)
��| }
;
��} ~
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��% (
ParametroSalida
��) 8
{
��9 :
StrNameParameter
��; K
=
��L M
$str
��N `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
}
��~ 
)��� �
;��� �
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� 5
;
��5 6
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteDataSet
��. <
(
��< =
ds
��> @
)
��A B
;
��B C
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
��  
in
��! #
	resultado
��$ -
.
��- .!
ListaPSalidaValores
��. A
)
��A B
lst_valores
��C N
.
��N O
Add
��O R
(
��R S
item
��T X
)
��Y Z
;
��Z [
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
StrNameParameter
��: J
==
��K M
$str
��N `
)
��a b
!
��b c
.
��c d
ObjValue
��d l
;
��l m
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��\ ]
!
��] ^
.
��^ _
ObjValue
��_ g
.
��g h
Trim
��h l
(
��l m
)
��m n
;
��n o
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��I J
,
��J K
$char
��L O
)
��P Q
;
��Q R
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	Funciones
��# ,
.
��, -
ObtenerDatos
��- 9
(
��9 :
	resultado
��; D
)
��E F
;
��F G
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	str_error
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� %
)
��% &
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
	exception
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��M N
;
��N O
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
obj_beneficiario
��- =
.
��= > 
str_id_transaccion
��> P
;
��P Q
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
obj_beneficiario
��( 8
.
��8 9
str_id_servicio
��9 H
;
��H I
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��. >
,
��> ?
infoLog
��@ G
,
��G H
str_ruta
��I Q
)
��R S
;
��S T
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
}
�� 
}�� �
[C:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Dat\Funciones.cs
	namespace 	
wsTransferencias
 
. 
Dat 
{ 
public 

static 
class 
	Funciones !
{ 
public 
static 
ConjuntoDatos #
ObtenerDatos$ 0
(1 2
DatosRespuesta3 A
	resultadoB K
)L M
{ 	
ConjuntoDatos 
cd 
= 
new "
ConjuntoDatos# 0
(0 1
)1 2
;2 3
var 

lst_tablas 
= 
new  
List! %
<% &
Tabla& +
>+ ,
(, -
)- .
;. /
for 
( 
int 
k 
= 
$num 
; 
k 
< 
	resultado  )
.) *
ListaTablas* 5
.5 6
Count6 ;
;; <
k= >
++> @
)@ A
{ 
var 
	lst_filas 
= 
new  #
List$ (
<( )
Dto) ,
., -
Fila- 1
>1 2
(2 3
)3 4
;4 5
for 
( 
int 
i 
= 
$num 
; 
i  !
<" #
	resultado$ -
.- .
ListaTablas. 9
[9 :
k: ;
]; <
.< =

ListaFilas= G
.G H
CountH M
;M N
iO P
++P R
)R S
{ 
Dto 
. 
Fila 
fila !
=" #
new$ '
Dto( +
.+ ,
Fila, 0
(0 1
)1 2
;2 3
for 
( 
int 
j 
=  
$num! "
;" #
j$ %
<& '
	resultado( 1
.1 2
ListaTablas2 =
[= >
k> ?
]? @
.@ A

ListaFilasA K
[K L
iL M
]M N
.N O
ListaColumnasO \
.\ ]
Count] b
;b c
jd e
++e g
)g h
{ 
fila 
. 
nombre_valor )
.) *
Add* -
(- .
	resultado. 7
.7 8
ListaTablas8 C
[C D
kD E
]E F
.F G

ListaFilasG Q
[Q R
iR S
]S T
.T U
ListaColumnasU b
[b c
jc d
]d e
.e f
NombreCampof q
,q r
	resultados |
.| }
ListaTablas	} �
[
� �
k
� �
]
� �
.
� �

ListaFilas
� �
[
� �
i
� �
]
� �
.
� �
ListaColumnas
� �
[
� �
j
� �
]
� �
.
� �
Valor
� �
)
� �
;
� �
} 
	lst_filas 
. 
Add !
(! "
new" %
Dto& )
.) *
Fila* .
{/ 0
nombre_valor1 =
=> ?
fila@ D
.D E
nombre_valorE Q
}R S
)S T
;T U
} 

lst_tablas 
. 
Add 
( 
new "
Tabla# (
{) *
	lst_filas+ 4
=5 6
	lst_filas7 @
}A B
)B C
;C D
}   
cd!! 
.!! 

lst_tablas!! 
=!! 

lst_tablas!! &
;!!& '
return"" 
cd"" 
;"" 
}## 	
}'' 
}(( ��
^C:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Dat\LogsMongoDat.cs
	namespace		 	
wsTransferencias		
 
.		 
Dat		 
{

 
public 

class 
LogsMongoDat 
{ 
private 
InfoLog 
infoLog 
;  
private 
const 
string 
str_salida_error -
=. /
$str0 6
;6 7
private 
readonly 
DALMongoClient '
objClienteMongo( 7
;7 8
private 
readonly 
string 
str_servicio  ,
=- .
$str/ A
;A B
public 
LogsMongoDat 
( 
SettingsApi )
	_settings* 3
)4 5
{ 	
infoLog 
. 
	str_clase 
= 
$str  .
;. /
infoLog 
. 
str_tipo 
= 
str_salida_error /
;/ 0
var 
canal 
= 
GrpcChannel #
.# $

ForAddress$ .
(. /
	_settings0 9
.9 :
servicio_grpc_mongo: M
)N O
;O P
objClienteMongo 
= 
new !
DALMongoClient" 0
(0 1
canal2 7
)8 9
;9 :
} 	
public  
RespuestaTransaccion # 
GuardarCabeceraMongo$ 8
(9 :
object; A
?A B
cabeceraC K
)L M
{ 	
var 
	respuesta 
= 
new  
RespuestaTransaccion  4
(4 5
)5 6
;6 7
var 
ds 
= 
new 
DatosSolicitud '
(' (
)( )
;) *
try   
{!! 
String"" 
ser_cabecera"" #
=""$ %
JsonSerializer""& 4
.""4 5
	Serialize""5 >
(""> ?
cabecera""@ H
)""I J
;""J K
ds## 
.## 
	StrNameBD## 
=## 
str_servicio## +
;##+ ,
ds$$ 
.$$ 
NombreColeccion$$ "
=$$# $
$str$$% 1
;$$1 2
ds%% 
.%% 
Filter%% 
=%% 
String%% "
.%%" #
Empty%%# (
;%%( )
ds&& 
.&& 
SolTran&& 
=&& 
ser_cabecera&& )
;&&) *
DatosRespuesta)) 
res)) "
=))# $
objClienteMongo))% 4
.))4 5
insertar_documento))5 G
())G H
ds))I K
)))L M
;))M N
	respuesta** 
.** 
codigo**  
=**! "
$str**# (
;**( )
	respuesta++ 
.++ 
cuerpo++  
=++! "
res++# &
.++& '
Mensaje++' .
;++. /
},, 
catch-- 
(-- 
	Exception-- 
ex-- 
)-- 
{.. 
	respuesta// 
.// 
codigo//  
=//! "
$str//# (
;//( )
	respuesta00 
.00 
diccionario00 %
.00% &
Add00& )
(00) *
$str00+ 6
,006 7
ex008 :
.00: ;
ToString00; C
(00C D
)00D E
)00F G
;00G H
}11 
return33 
	respuesta33 
;33 
}44 	
public77  
RespuestaTransaccion77 #!
GuardarRespuestaMongo77$ 9
(77: ;
ResComun77< D
obj_respuesta77E R
)77S T
{88 	
var99 
	respuesta99 
=99 
new99  
RespuestaTransaccion99  4
(994 5
)995 6
;996 7
var:: 
ds:: 
=:: 
new:: 
DatosSolicitud:: '
(::' (
)::( )
;::) *
try;; 
{<< 
var== 
bjson== 
=== 
new== 
{>> 
idHeader?? 
=?? 
obj_respuesta?? ,
.??, -
str_id_transaccion??- ?
,??? @#
rsc_res_original_id_msj@@ +
=@@, -
obj_respuesta@@. ;
.@@; <#
str_res_original_id_msj@@< S
,@@S T(
rsc_res_original_id_servicioAA 0
=AA1 2
obj_respuestaAA3 @
.AA@ A(
str_res_original_id_servicioAAA ]
,AA] ^"
rsc_res_fecha_msj_creaBB *
=BB+ ,
obj_respuestaBB- :
.BB: ;!
dt_res_fecha_msj_creaBB; P
,BBP Q&
rsc_res_estado_transaccionCC .
=CC/ 0
obj_respuestaCC1 >
.CC> ?&
str_res_estado_transaccionCC? Y
,CCY Z
rsc_res_codigoDD "
=DD# $
obj_respuestaDD% 2
.DD2 3
str_res_codigoDD3 A
,DDA B
rsc_res_id_servidorEE '
=EE( )
obj_respuestaEE* 7
.EE7 8
str_id_servicioEE8 G
,EEG H"
rsc_res_info_adicionalFF *
=FF+ ,
obj_respuestaFF- :
.FF: ;"
str_res_info_adicionalFF; Q
}GG 
;GG 
StringII 
ser_cabeceraII #
=II$ %
JsonSerializerII& 4
.II4 5
	SerializeII5 >
(II> ?
bjsonII@ E
)IIF G
;IIG H
dsJJ 
.JJ 
	StrNameBDJJ 
=JJ 
str_servicioJJ +
;JJ+ ,
dsKK 
.KK 
NombreColeccionKK "
=KK# $
$strKK% 0
;KK0 1
dsLL 
.LL 
FilterLL 
=LL 
StringLL "
.LL" #
EmptyLL# (
;LL( )
dsMM 
.MM 
SolTranMM 
=MM 
ser_cabeceraMM )
;MM) *
DatosRespuestaOO 
resOO "
=OO# $
objClienteMongoOO% 4
.OO4 5
insertar_documentoOO5 G
(OOG H
dsOOI K
)OOL M
;OOM N
	respuestaPP 
.PP 
codigoPP  
=PP! "
$strPP# (
;PP( )
	respuestaQQ 
.QQ 
cuerpoQQ  
=QQ! "
resQQ# &
.QQ& '
MensajeQQ' .
;QQ. /
}RR 
catchSS 
(SS 
	ExceptionSS 
exSS 
)SS 
{TT 
	respuestaUU 
.UU 
codigoUU  
=UU! "
$strUU# (
;UU( )
	respuestaVV 
.VV 
diccionarioVV %
.VV% &
AddVV& )
(VV) *
$strVV+ 6
,VV6 7
exVV8 :
.VV: ;
ToStringVV; C
(VVC D
)VVD E
)VVF G
;VVG H
}WW 
returnYY 
	respuestaYY 
;YY 
}ZZ 	
public\\  
RespuestaTransaccion\\ ##
GuardarExcepcionesMongo\\$ ;
(\\< =
ResComun\\> F
obj_respuesta\\G T
,\\T U
object\\V \
	excepcion\\] f
)\\g h
{]] 	
var^^ 
	respuesta^^ 
=^^ 
new^^  
RespuestaTransaccion^^  4
(^^4 5
)^^5 6
;^^6 7
var__ 
ds__ 
=__ 
new__ 
DatosSolicitud__ '
(__' (
)__( )
;__) *
try`` 
{aa 
varbb 
bjsonbb 
=bb 
newbb 
{cc 
idHeaderdd 
=dd 
obj_respuestadd ,
.dd, -
str_id_transacciondd- ?
,dd? @
str_id_servicioee #
=ee$ %
obj_respuestaee& 3
.ee3 4
str_id_servicioee4 C
,eeC D
str_nemonico_canalff &
=ff' (
obj_respuestaff) 6
.ff6 7
str_nemonico_canalff7 I
,ffI J
dt_fecha_operaciongg &
=gg' (
obj_respuestagg) 6
.gg6 7
dt_fecha_operaciongg7 I
,ggI J
str_ip_dispositivohh &
=hh' (
obj_respuestahh) 6
.hh6 7
str_ip_dispositivohh7 I
,hhI J
	str_loginii 
=ii 
obj_respuestaii  -
.ii- .
	str_loginii. 7
,ii7 8
str_id_oficinajj "
=jj# $
obj_respuestajj% 2
.jj2 3
str_id_oficinajj3 A
,jjA B"
rsc_res_info_adicionalkk *
=kk+ ,
obj_respuestakk- :
.kk: ;"
str_res_info_adicionalkk; Q
,kkQ R
errorll 
=ll 
	excepcionll %
.ll% &
ToStringll& .
(ll. /
)ll/ 0
}mm 
;mm 
Stringoo 
ser_cabeceraoo #
=oo$ %
JsonSerializeroo& 4
.oo4 5
	Serializeoo5 >
(oo> ?
bjsonoo@ E
)ooF G
;ooG H
dspp 
.pp 
	StrNameBDpp 
=pp 
str_serviciopp +
;pp+ ,
dsqq 
.qq 
NombreColeccionqq "
=qq# $
$strqq% .
;qq. /
dsrr 
.rr 
Filterrr 
=rr 
Stringrr "
.rr" #
Emptyrr# (
;rr( )
dsss 
.ss 
SolTranss 
=ss 
ser_cabecerass )
;ss) *
DatosRespuestauu 
resuu "
=uu# $
objClienteMongouu% 4
.uu4 5
insertar_documentouu5 G
(uuG H
dsuuI K
)uuL M
;uuM N
	respuestavv 
.vv 
codigovv  
=vv! "
$strvv# (
;vv( )
	respuestaww 
.ww 
cuerpoww  
=ww! "
resww# &
.ww& '
Mensajeww' .
;ww. /
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy 
{zz 
	respuesta{{ 
.{{ 
codigo{{  
={{! "
$str{{# (
;{{( )
	respuesta|| 
.|| 
diccionario|| %
.||% &
Add||& )
(||) *
$str||+ 6
,||6 7
ex||8 :
.||: ;
ToString||; C
(||C D
)||D E
)||F G
;||G H
}}} 
return 
	respuesta 
; 
}
�� 	
public
�� "
RespuestaTransaccion
�� #"
GuardarAmenazasMongo
��$ 8
(
��9 :!
ValidacionInyeccion
��; N
obj_respuesta
��O \
)
��] ^
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� "
RespuestaTransaccion
��  4
(
��4 5
)
��5 6
;
��6 7
var
�� 
ds
�� 
=
�� 
new
�� 
DatosSolicitud
�� '
(
��' (
)
��( )
;
��) *
try
�� 
{
�� 
String
�� 
ser_cabecera
�� #
=
��$ %
JsonSerializer
��& 4
.
��4 5
	Serialize
��5 >
(
��> ?
obj_respuesta
��@ M
)
��N O
;
��O P
ds
�� 
.
�� 
	StrNameBD
�� 
=
�� 
str_servicio
�� +
;
��+ ,
ds
�� 
.
�� 
NombreColeccion
�� "
=
��# $
$str
��% /
;
��/ 0
ds
�� 
.
�� 
Filter
�� 
=
�� 
String
�� "
.
��" #
Empty
��# (
;
��( )
ds
�� 
.
�� 
SolTran
�� 
=
�� 
ser_cabecera
�� )
;
��) *
DatosRespuesta
�� 
res
�� "
=
��# $
objClienteMongo
��% 4
.
��4 5 
insertar_documento
��5 G
(
��G H
ds
��I K
)
��L M
;
��M N
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
res
��# &
.
��& '
Mensaje
��' .
;
��. /
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
�� 
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
ex
��8 :
.
��: ;
ToString
��; C
(
��C D
)
��D E
)
��F G
;
��G H
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #'
buscar_peticiones_diarias
��$ =
(
��> ?
string
��@ F
filtro
��G M
)
��N O
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� "
RespuestaTransaccion
��  4
(
��4 5
)
��5 6
;
��6 7
var
�� 
ds
�� 
=
�� 
new
�� 
DatosSolicitud
�� '
(
��' (
)
��( )
;
��) *
try
�� 
{
�� 
ds
�� 
.
�� 
	StrNameBD
�� 
=
�� 
str_servicio
�� +
;
��+ ,
ds
�� 
.
�� 
NombreColeccion
�� "
=
��# $
$str
��% 9
;
��9 :
ds
�� 
.
�� 
Filter
�� 
=
�� 
filtro
�� "
;
��" #
ds
�� 
.
�� 
SolTran
�� 
=
�� 
String
�� #
.
��# $
Empty
��$ )
;
��) *
DatosRespuesta
�� 
res
�� "
=
��# $
objClienteMongo
��% 4
.
��4 5
buscar_documentos
��5 F
(
��F G
ds
��H J
)
��K L
;
��L M
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
res
��# &
.
��& '
Mensaje
��' .
;
��. /
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
�� 
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
ex
��8 :
.
��: ;
ToString
��; C
(
��C D
)
��D E
)
��F G
;
��G H
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #%
guardar_peticion_diaria
��$ ;
(
��< =
string
��> D
filtro
��E K
,
��K L
object
��M S
peticion
��T \
)
��] ^
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� "
RespuestaTransaccion
��  4
(
��4 5
)
��5 6
;
��6 7
var
�� 
ds
�� 
=
�� 
new
�� 
DatosSolicitud
�� '
(
��' (
)
��( )
;
��) *
try
�� 
{
�� 
String
�� 
ser_cabecera
�� #
=
��$ %
JsonSerializer
��& 4
.
��4 5
	Serialize
��5 >
(
��> ?
peticion
��@ H
)
��I J
;
��J K
ds
�� 
.
�� 
	StrNameBD
�� 
=
�� 
str_servicio
�� +
;
��+ ,
ds
�� 
.
�� 
NombreColeccion
�� "
=
��# $
$str
��% 9
;
��9 :
ds
�� 
.
�� 
Filter
�� 
=
�� 
filtro
�� "
;
��" #
ds
�� 
.
�� 
SolTran
�� 
=
�� 
ser_cabecera
�� )
;
��) *
DatosRespuesta
�� 
res
�� "
=
��# $
objClienteMongo
��% 4
.
��4 5 
insertar_documento
��5 G
(
��G H
ds
��I K
)
��L M
;
��M N
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
res
��# &
.
��& '
Mensaje
��' .
;
��. /
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
�� 
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
ex
��8 :
.
��: ;
ToString
��; C
(
��C D
)
��D E
)
��F G
;
��G H
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #(
actualizar_peticion_diaria
��$ >
(
��? @
string
��A G
filtro
��H N
,
��N O
string
��P V
peticion
��W _
)
��` a
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� "
RespuestaTransaccion
��  4
(
��4 5
)
��5 6
;
��6 7
var
�� 
ds
�� 
=
�� 
new
�� 
DatosSolicitud
�� '
(
��' (
)
��( )
;
��) *
try
�� 
{
�� 
ds
�� 
.
�� 
	StrNameBD
�� 
=
�� 
str_servicio
�� +
;
��+ ,
ds
�� 
.
�� 
NombreColeccion
�� "
=
��# $
$str
��% 9
;
��9 :
ds
�� 
.
�� 
Filter
�� 
=
�� 
filtro
�� "
;
��" #
ds
�� 
.
�� 
SolTran
�� 
=
�� 
peticion
�� %
;
��% &
DatosRespuesta
�� 
res
�� "
=
��# $
objClienteMongo
��% 4
.
��4 5"
actualizar_documento
��5 I
(
��I J
ds
��K M
)
��N O
;
��O P
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
res
��# &
.
��& '
Mensaje
��' .
;
��. /
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
�� 
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
ex
��8 :
.
��: ;
ToString
��; C
(
��C D
)
��D E
)
��F G
;
��G H
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #.
 guardar_promedio_peticion_diaria
��$ D
(
��E F
string
��G M
str_operacion
��N [
,
��[ \
string
��] c
	str_fecha
��d m
)
��n o
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� "
RespuestaTransaccion
��  4
(
��4 5
)
��5 6
;
��6 7
var
�� 
ds
�� 
=
�� 
new
�� 
DatosSolicitud
�� '
(
��' (
)
��( )
;
��) *
try
�� 
{
�� 
string
�� 

str_filtro
�� !
=
��" #
$str
��$ 8
+
��9 :
str_operacion
��; H
+
��I J
$str
��K O
;
��O P
ds
�� 
.
�� 
	StrNameBD
�� 
=
�� 
str_servicio
�� +
;
��+ ,
ds
�� 
.
�� 
NombreColeccion
�� "
=
��# $
$str
��% B
;
��B C
ds
�� 
.
�� 
Filter
�� 
=
�� 

str_filtro
�� &
;
��& '
ds
�� 
.
�� 
SolTran
�� 
=
�� 
String
�� #
.
��# $
Empty
��$ )
;
��) *
DatosRespuesta
�� 
res
�� "
=
��# $
objClienteMongo
��% 4
.
��4 5
buscar_documentos
��5 F
(
��F G
ds
��H J
)
��K L
;
��L M
var
�� 

resp_mongo
�� 
=
��  
res
��! $
.
��$ %
Mensaje
��% ,
;
��, -
int
�� 
promedio
�� 
=
�� 
calcular_promedio
�� 0
(
��0 1
str_operacion
��2 ?
)
��@ A
;
��A B
if
�� 
(
�� 

resp_mongo
�� 
!=
��  
null
��! %
&&
��& (

resp_mongo
��) 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
!=
��? A
$str
��B F
)
��F G
{
�� 
var
�� 
res_datos_mongo
�� '
=
��( )

resp_mongo
��* 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
!
��? @
.
��@ A
Replace
��A H
(
��H I
$str
��J U
,
��U V
$str
��W Z
)
��[ \
.
��\ ]
Replace
��] d
(
��d e
$str
��f i
,
��i j
$str
��k n
)
��o p
;
��p q
res_datos_mongo
�� #
=
��$ %
res_datos_mongo
��& 5
.
��5 6
Replace
��6 =
(
��= >
$str
��? B
,
��B C
$str
��D F
)
��G H
.
��H I
Replace
��I P
(
��P Q
$str
��R U
,
��U V
$str
��W Y
)
��Z [
;
��[ \
var
�� "
prom_peticion_diaria
�� ,
=
��- .
JsonSerializer
��/ =
.
��= >
Deserialize
��> I
<
��I J$
PromedioPeticionDiaria
��J `
>
��` a
(
��a b
res_datos_mongo
��c r
)
��s t
;
��t u
if
�� 
(
�� "
prom_peticion_diaria
�� +
!
��+ ,
.
��, -
_id
��- 0
!=
��1 3
null
��4 8
)
��8 9
{
�� 
string
�� 
str_datos_update
�� /
=
��0 1
$str
��2 S
+
��T U
promedio
��V ^
+
��_ `
$str
��a 
+��� �
	str_fecha��� �
+��� �
$str��� �
;��� �
ds
�� 
.
�� 
Filter
�� !
=
��" #

str_filtro
��$ .
;
��. /
ds
�� 
.
�� 
SolTran
�� "
=
��# $
str_datos_update
��% 5
;
��5 6
objClienteMongo
�� '
.
��' ("
actualizar_documento
��( <
(
��< =
ds
��> @
)
��A B
;
��B C
}
�� 
}
�� 
else
�� 
{
�� 
object
�� 
obj_sol
�� "
=
��# $
new
��% (
{
��) *#
dbl_promedio_peticion
��+ @
=
��A B
promedio
��C K
,
��K L
str_operacion
��M Z
,
��Z [%
str_fecha_actualizacion
��\ s
=
��t u
	str_fecha
��v 
}��� �
;��� �
ds
�� 
.
�� 
Filter
�� 
=
�� 
String
��  &
.
��& '
Empty
��' ,
;
��, -
ds
�� 
.
�� 
SolTran
�� 
=
��  
JsonSerializer
��! /
.
��/ 0
	Serialize
��0 9
(
��9 :
obj_sol
��; B
)
��C D
;
��D E
objClienteMongo
�� #
.
��# $ 
insertar_documento
��$ 6
(
��6 7
ds
��8 :
)
��; <
;
��< =
}
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
res
��# &
.
��& '
Mensaje
��' .
;
��. /
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
�� 
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��+ 6
,
��6 7
ex
��8 :
.
��: ;
ToString
��; C
(
��C D
)
��D E
)
��F G
;
��G H
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� 
int
�� 
calcular_promedio
�� $
(
��% &
string
��' -
str_operacion
��. ;
)
��< =
{
�� 	
string
�� 

str_filtro
�� 
=
�� 
$str
��  >
+
��? @
str_operacion
��A N
+
��O P
$str
��Q X
+
��Y Z
$str
�� g
;
��g h
int
�� 
int_respuesta
�� 
=
�� 
$num
��  !
;
��! "
var
�� 
ds
�� 
=
�� 
new
�� 
DatosSolicitud
�� '
(
��' (
)
��( )
;
��) *
try
�� 
{
�� 
ds
�� 
.
�� 
	StrNameBD
�� 
=
�� 
str_servicio
�� +
;
��+ ,
ds
�� 
.
�� 
NombreColeccion
�� "
=
��# $
$str
��% 9
;
��9 :
ds
�� 
.
�� 
Filter
�� 
=
�� 

str_filtro
�� &
;
��& '
ds
�� 
.
�� 
SolTran
�� 
=
�� 
String
�� #
.
��# $
Empty
��$ )
;
��) *
DatosRespuesta
�� 
res
�� "
=
��# $
objClienteMongo
��% 4
.
��4 5(
buscar_documentos_avanzado
��5 O
(
��O P
ds
��Q S
)
��T U
;
��U V
string
�� 
res_datos_mongo
�� &
=
��' (
res
��) ,
.
��, -
Mensaje
��- 4
;
��4 5
if
�� 
(
�� 
res_datos_mongo
�� "
!=
��# %
null
��& *
&&
��+ -
res_datos_mongo
��. =
.
��= >
ToString
��> F
(
��F G
)
��G H
!=
��I K
$str
��L P
)
��P Q
{
�� 
res_datos_mongo
�� #
=
��$ %
res_datos_mongo
��& 5
.
��5 6
Replace
��6 =
(
��= >
$str
��? B
,
��B C
$str
��D F
)
��G H
.
��H I
Replace
��I P
(
��P Q
$str
��R U
,
��U V
$str
��W Y
)
��Z [
;
��[ \
var
�� 
peticion_diaria
�� '
=
��( )
JsonSerializer
��* 8
.
��8 9
Deserialize
��9 D
<
��D E$
PromedioPeticionDiaria
��E [
>
��[ \
(
��\ ]
res_datos_mongo
��^ m
)
��n o
;
��o p
int_respuesta
�� !
=
��" #
Convert
��$ +
.
��+ ,
ToInt32
��, 3
(
��3 4
peticion_diaria
��5 D
!
��D E
.
��E F#
dbl_promedio_peticion
��F [
)
��\ ]
;
��] ^
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
int_respuesta
�� 
=
�� 
$num
��  !
;
��! "
}
�� 
return
�� 
int_respuesta
��  
;
��  !
}
�� 	
public
�� 
int
�� 
obtener_promedio
�� #
(
��$ %
string
��& ,
str_operacion
��- :
)
��; <
{
�� 	
string
�� 

str_filtro
�� 
=
�� 
$str
��  4
+
��5 6
str_operacion
��7 D
+
��E F
$str
��G K
;
��K L
int
�� 
int_respuesta
�� 
=
�� 
$num
��  !
;
��! "
var
�� 
ds
�� 
=
�� 
new
�� 
DatosSolicitud
�� '
(
��' (
)
��( )
;
��) *
try
�� 
{
�� 
ds
�� 
.
�� 
	StrNameBD
�� 
=
�� 
str_servicio
�� +
;
��+ ,
ds
�� 
.
�� 
NombreColeccion
�� "
=
��# $
$str
��% B
;
��B C
ds
�� 
.
�� 
Filter
�� 
=
�� 

str_filtro
�� &
;
��& '
ds
�� 
.
�� 
SolTran
�� 
=
�� 
String
�� #
.
��# $
Empty
��$ )
;
��) *
DatosRespuesta
�� 
res
�� "
=
��# $
objClienteMongo
��% 4
.
��4 5
buscar_documentos
��5 F
(
��F G
ds
��H J
)
��K L
;
��L M
string
�� 
res_datos_mongo
�� &
=
��' (
res
��) ,
.
��, -
Mensaje
��- 4
;
��4 5
if
�� 
(
�� 
res_datos_mongo
�� "
!=
��# %
null
��& *
&&
��+ -
res_datos_mongo
��. =
.
��= >
ToString
��> F
(
��F G
)
��G H
!=
��I K
$str
��L P
)
��P Q
{
�� 
res_datos_mongo
�� #
=
��$ %
res_datos_mongo
��& 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
!
��@ A
.
��A B
Replace
��B I
(
��I J
$str
��K V
,
��V W
$str
��X [
)
��\ ]
.
��] ^
Replace
��^ e
(
��e f
$str
��g j
,
��j k
$str
��l o
)
��p q
;
��q r
res_datos_mongo
�� #
=
��$ %
res_datos_mongo
��& 5
.
��5 6
Replace
��6 =
(
��= >
$str
��? B
,
��B C
$str
��D F
)
��G H
.
��H I
Replace
��I P
(
��P Q
$str
��R U
,
��U V
$str
��W Y
)
��Z [
;
��[ \
var
�� 
peticion_diaria
�� '
=
��( )
JsonSerializer
��* 8
.
��8 9
Deserialize
��9 D
<
��D E$
PromedioPeticionDiaria
��E [
>
��[ \
(
��\ ]
res_datos_mongo
��^ m
)
��n o
;
��o p
int_respuesta
�� !
=
��" #
Convert
��$ +
.
��+ ,
ToInt32
��, 3
(
��3 4
peticion_diaria
��5 D
!
��D E
.
��E F#
dbl_promedio_peticion
��F [
)
��\ ]
;
��] ^
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
int_respuesta
�� 
=
�� 
$num
��  !
;
��! "
}
�� 
return
�� 
int_respuesta
��  
;
��  !
}
�� 	
}
�� 
}�� �l
_C:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Dat\ParametrosDat.cs
	namespace

 	
wsTransferencias


 
.

 
Dat

 
{ 
public 

class 
ParametrosDat 
{ 
private 
InfoLog 
infoLog 
;  
private 
readonly 
	DALClient "
objClienteDal# 0
;0 1
private 
readonly 
SettingsApi $
	_settings% .
;. /
private 
readonly 
string 
str_ruta  (
;( )
private 
const 
string 
str_salida_error -
=. /
$str0 6
;6 7
public 
ParametrosDat 
( 
SettingsApi *
settings+ 3
)5 6
{ 	
	_settings 
= 
settings  
;  !
this 
. 
str_ruta 
= 
settings $
.$ %$
path_logs_transferencias% =
;= >
infoLog 
. 
	str_clase 
= 
GetType  '
(' (
)( )
.) *
FullName* 2
;2 3
var 
httpHandler 
= 
new !
HttpClientHandler" 3
(3 4
)4 5
;5 6
var 
canal 
= 
GrpcChannel #
.# $

ForAddress$ .
(. /
settings0 8
.8 9 
servicio_grpc_sybase9 M
,M N
newO R
GrpcChannelOptionsS e
{f g
HttpHandlerh s
=t u
httpHandler	v �
}
� �
)
� �
;
� �
objClienteDal 
= 
new 
	DALClient  )
() *
canal+ 0
)1 2
;2 3
} 	
public    
RespuestaTransaccion   #
get_parametros  $ 2
(  3 4
ReqGetParametros  5 E 
req_get_config_token  F Z
)  [ \
{!! 	
var"" 
	respuesta"" 
="" 
new""  
RespuestaTransaccion""  4
(""4 5
)""5 6
;""6 7
try$$ 
{%% 
DatosSolicitud&& 
ds&& !
=&&" #
new&&$ '
DatosSolicitud&&( 6
(&&6 7
)&&7 8
;&&8 9
ds(( 
.(( 
ListaPEntrada((  
.((  !
Add((! $
((($ %
new((& )
ParametroEntrada((* :
{((; <
StrNameParameter((= M
=((N O
$str((P ]
,((] ^
TipoDato((_ g
=((h i
TipoDato((j r
.((r s
VarChar((s z
,((z {
ObjValue	((| �
=
((� �"
req_get_config_token
((� �
.
((� �

str_nombre
((� �
.
((� �
ToString
((� �
(
((� �
)
((� �
}
((� �
)
((� �
;
((� �
ds** 
.** 
ListaPEntrada**  
.**  !
Add**! $
(**$ %
new**& )
ParametroEntrada*** :
{**; <
StrNameParameter**= M
=**N O
$str**P e
,**e f
TipoDato**g o
=**p q
TipoDato**r z
.**z {
VarChar	**{ �
,
**� �
ObjValue
**� �
=
**� �"
req_get_config_token
**� �
.
**� � 
str_id_transaccion
**� �
.
**� �
ToString
**� �
(
**� �
)
**� �
}
**� �
)
**� �
;
**� �
ds++ 
.++ 
ListaPEntrada++  
.++  !
Add++! $
(++$ %
new++& )
ParametroEntrada++* :
{++; <
StrNameParameter++= M
=++N O
$str++P a
,++a b
TipoDato++c k
=++l m
TipoDato++n v
.++v w
Integer++w ~
,++~ 
ObjValue
++� �
=
++� �
Convert
++� �
.
++� �
ToInt32
++� �
(
++� �"
req_get_config_token
++� �
.
++� �
str_id_sistema
++� �
)
++� �
.
++� �
ToString
++� �
(
++� �
)
++� �
}
++� �
)
++� �
;
++� �
ds,, 
.,, 
ListaPEntrada,,  
.,,  !
Add,,! $
(,,$ %
new,,& )
ParametroEntrada,,* :
{,,; <
StrNameParameter,,= M
=,,N O
$str,,P \
,,,\ ]
TipoDato,,^ f
=,,g h
TipoDato,,i q
.,,q r
VarChar,,r y
,,,y z
ObjValue	,,{ �
=
,,� �"
req_get_config_token
,,� �
.
,,� �
	str_login
,,� �
.
,,� �
ToString
,,� �
(
,,� �
)
,,� �
}
,,� �
)
,,� �
;
,,� �
ds-- 
.-- 
ListaPEntrada--  
.--  !
Add--! $
(--$ %
new--& )
ParametroEntrada--* :
{--; <
StrNameParameter--= M
=--N O
$str--P `
,--` a
TipoDato--b j
=--k l
TipoDato--m u
.--u v
Integer--v }
,--} ~
ObjValue	-- �
=
--� �
Convert
--� �
.
--� �
ToInt32
--� �
(
--� �"
req_get_config_token
--� �
.
--� �
str_id_perfil
--� �
)
--� �
.
--� �
ToString
--� �
(
--� �
)
--� �
}
--� �
)
--� �
;
--� �
ds.. 
... 
ListaPEntrada..  
...  !
Add..! $
(..$ %
new..& )
ParametroEntrada..* :
{..; <
StrNameParameter..= M
=..N O
$str..P a
,..a b
TipoDato..c k
=..l m
TipoDato..n v
...v w
Integer..w ~
,..~ 
ObjValue
..� �
=
..� �
Convert
..� �
.
..� �
ToInt32
..� �
(
..� �"
req_get_config_token
..� �
.
..� �
str_id_oficina
..� �
)
..� �
.
..� �
ToString
..� �
(
..� �
)
..� �
}
..� �
)
..� �
;
..� �
ds// 
.// 
ListaPEntrada//  
.//  !
Add//! $
(//$ %
new//& )
ParametroEntrada//* :
{//; <
StrNameParameter//= M
=//N O
$str//P e
,//e f
TipoDato//g o
=//p q
TipoDato//r z
.//z {
VarChar	//{ �
,
//� �
ObjValue
//� �
=
//� �"
req_get_config_token
//� �
.
//� � 
str_nemonico_canal
//� �
.
//� �
ToString
//� �
(
//� �
)
//� �
}
//� �
)
//� �
;
//� �
ds00 
.00 
ListaPEntrada00  
.00  !
Add00! $
(00$ %
new00& )
ParametroEntrada00* :
{00; <
StrNameParameter00= M
=00N O
$str00P e
,00e f
TipoDato00g o
=00p q
TipoDato00r z
.00z {
VarChar	00{ �
,
00� �
ObjValue
00� �
=
00� �"
req_get_config_token
00� �
.
00� � 
str_ip_dispositivo
00� �
.
00� �
ToString
00� �
(
00� �
)
00� �
}
00� �
)
00� �
;
00� �
ds11 
.11 
ListaPEntrada11  
.11  !
Add11! $
(11$ %
new11& )
ParametroEntrada11* :
{11; <
StrNameParameter11= M
=11N O
$str11P _
,11_ `
TipoDato11a i
=11j k
TipoDato11l t
.11t u
VarChar11u |
,11| }
ObjValue	11~ �
=
11� �"
req_get_config_token
11� �
.
11� �

str_sesion
11� �
.
11� �
ToString
11� �
(
11� �
)
11� �
}
11� �
)
11� �
;
11� �
ds22 
.22 
ListaPEntrada22  
.22  !
Add22! $
(22$ %
new22& )
ParametroEntrada22* :
{22; <
StrNameParameter22= M
=22N O
$str22P f
,22f g
TipoDato22h p
=22q r
TipoDato22s {
.22{ |
VarChar	22| �
,
22� �
ObjValue
22� �
=
22� �"
req_get_config_token
22� �
.
22� �!
str_mac_dispositivo
22� �
.
22� �
ToString
22� �
(
22� �
)
22� �
}
22� �
)
22� �
;
22� �
ds55 
.55 
ListaPSalida55 
.55  
Add55  #
(55# $
new55% (
ParametroSalida55) 8
{559 :
StrNameParameter55; K
=55L M
$str55N \
,55\ ]
TipoDato55^ f
=55g h
TipoDato55i q
.55q r
VarChar55r y
}55z {
)55| }
;55} ~
ds66 
.66 
ListaPSalida66 
.66  
Add66  #
(66# $
new66% (
ParametroSalida66) 8
{669 :
StrNameParameter66; K
=66L M
$str66N `
,66` a
TipoDato66b j
=66k l
TipoDato66m u
.66u v
Integer66v }
}66~ 
)
66� �
;
66� �
ds88 
.88 
NombreSP88 
=88 
$str88 .
;88. /
ds99 
.99 
NombreBD99 
=99 
	_settings99 '
.99' (
BD_megonline99( 4
;994 5
var;; 
	resultado;; 
=;; 
objClienteDal;;  -
.;;- .
ExecuteDataSet;;. <
(;;< =
ds;;> @
);;A B
;;;B C
var<< 
lst_valores<< 
=<<  !
new<<" %
List<<& *
<<<* +"
ParametroSalidaValores<<+ A
><<A B
(<<B C
)<<C D
;<<D E
foreach>> 
(>> 
var>> 
item>>  
in>>! #
	resultado>>$ -
.>>- .
ListaPSalidaValores>>. A
)>>A B
lst_valores>>C N
.>>N O
Add>>O R
(>>R S
item>>T X
)>>Y Z
;>>Z [
var?? 

str_codigo?? 
=??  
lst_valores??! ,
.??, -
Find??- 1
(??1 2
x??3 4
=>??5 7
x??8 9
.??9 :
StrNameParameter??: J
==??K M
$str??N `
)??a b
!??b c
.??c d
ObjValue??d l
;??l m
var@@ 
	str_error@@ 
=@@ 
lst_valores@@  +
.@@+ ,
Find@@, 0
(@@0 1
x@@2 3
=>@@4 6
x@@7 8
.@@8 9
StrNameParameter@@9 I
==@@J L
$str@@M [
)@@\ ]
!@@] ^
.@@^ _
ObjValue@@_ g
.@@g h
Trim@@h l
(@@l m
)@@m n
;@@n o
	respuestaBB 
.BB 
codigoBB  
=BB! "

str_codigoBB# -
.BB- .
ToStringBB. 6
(BB6 7
)BB7 8
.BB8 9
TrimBB9 =
(BB= >
)BB> ?
.BB? @
PadLeftBB@ G
(BBG H
$numBBI J
,BBJ K
$charBBL O
)BBP Q
;BBQ R
	respuestaCC 
.CC 
cuerpoCC  
=CC! "
	FuncionesCC# ,
.CC, -
ObtenerDatosCC- 9
(CC9 :
	resultadoCC; D
)CCE F
;CCF G
	respuestaDD 
.DD 
diccionarioDD %
.DD% &
AddDD& )
(DD) *
$strDD+ 6
,DD6 7
	str_errorDD8 A
.DDA B
ToStringDDB J
(DDJ K
)DDK L
)DDM N
;DDN O
}EE 
catchFF 
(FF 
	ExceptionFF 
	exceptionFF %
)FF% &
{GG 
	respuestaHH 
.HH 
codigoHH  
=HH! "
$strHH# (
;HH( )
	respuestaII 
.II 
diccionarioII %
.II% &
AddII& )
(II) *
$strII+ 6
,II6 7
	exceptionII8 A
.IIA B
ToStringIIB J
(IIJ K
)IIK L
)IIM N
;IIN O
infoLogKK 
.KK 
str_id_transaccionKK *
=KK+ , 
req_get_config_tokenKK- A
.KKA B
str_id_transaccionKKB T
;KKT U
infoLogLL 
.LL 
str_tipoLL  
=LL! "
str_salida_errorLL# 3
;LL3 4
infoLogMM 
.MM 

str_objetoMM "
=MM# $
	exceptionMM% .
;MM. /
infoLogNN 
.NN 

str_metodoNN "
=NN# $

MethodBaseNN% /
.NN/ 0
GetCurrentMethodNN0 @
(NN@ A
)NNA B
!NNB C
.NNC D
NameNND H
;NNH I
infoLogOO 
.OO 
str_operacionOO %
=OO& ' 
req_get_config_tokenOO( <
.OO< =
str_id_servicioOO= L
;OOL M
LogServiciosPP 
.PP 
RegistrarTramasPP ,
(PP, -
str_salida_errorPP. >
,PP> ?
infoLogPP@ G
,PPG H
str_rutaPPI Q
)PPR S
;PPS T
}QQ 
returnRR 
	respuestaRR 
;RR 
}SS 	
}VV 
}WW ��
cC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Dat\TransferenciasDat.cs
	namespace 	
wsTransferencias
 
. 
Dat 
{ 
public 

class 
TransferenciasDat "
{ 
private 
InfoLog 
infoLog 
;  
private 
readonly 
SettingsApi $
	_settings% .
;. /
private 
readonly 
	DALClient "
objClienteDal# 0
;0 1
private 
readonly 
string 
str_ruta  (
;( )
private 
const 
string 
str_salida_error -
=. /
$str0 6
;6 7
public 
TransferenciasDat  
(  !
SettingsApi! ,
serviceSettings- <
)< =
{ 	
	_settings 
= 
serviceSettings '
;' (
this 
. 
str_ruta 
= 
serviceSettings +
.+ ,$
path_logs_transferencias, D
;D E
infoLog 
. 
	str_clase 
= 
GetType  '
(' (
)( )
.) *
FullName* 2
;2 3
infoLog 
. 
	str_fecha 
= 
DateTime  (
.( )
Now) ,
;, -
var!! 
httpHandler!! 
=!! 
new!! !
HttpClientHandler!!" 3
(!!3 4
)!!4 5
;!!5 6
var"" 
canal"" 
="" 
GrpcChannel"" #
.""# $

ForAddress""$ .
("". /
serviceSettings""/ >
.""> ? 
servicio_grpc_sybase""? S
,""S T
new""U X
GrpcChannelOptions""Y k
{""l m
HttpHandler""n y
=""z {
httpHandler	""| �
}
""� �
)
""� �
;
""� �
objClienteDal## 
=## 
new## 
	DALClient##  )
(##) *
canal##* /
)##/ 0
;##0 1
}$$ 	
public&&  
RespuestaTransaccion&& #'
get_consulta_transferencias&&$ ?
(&&? @ 
ReqGetTransferencias&&@ T"
req_get_transferencias&&U k
)&&k l
{'' 	 
RespuestaTransaccion((  
	respuesta((! *
=((+ ,
new((- 0 
RespuestaTransaccion((1 E
(((E F
)((F G
;((G H
try** 
{++ 
DatosSolicitud-- 
ds-- !
=--" #
new--$ '
DatosSolicitud--( 6
(--6 7
)--7 8
;--8 9
ds// 
.// 
ListaPEntrada//  
.//  !
Add//! $
(//$ %
new//% (
ParametroEntrada//) 9
{//: ;
StrNameParameter//< L
=//M N
$str//O g
,//g h
TipoDato//i q
=//r s
TipoDato//t |
.//| }
VarChar	//} �
,
//� �
ObjValue
//� �
=
//� �$
req_get_transferencias
//� �
.
//� �#
str_num_cta_ordenante
//� �
.
//� �
ToString
//� �
(
//� �
)
//� �
}
//� �
)
//� �
;
//� �
ds00 
.00 
ListaPEntrada00  
.00  !
Add00! $
(00$ %
new00% (
ParametroEntrada00) 9
{00: ;
StrNameParameter00< L
=00M N
$str00O b
,00b c
TipoDato00d l
=00m n
TipoDato00o w
.00w x
VarChar00x 
,	00 �
ObjValue
00� �
=
00� �$
req_get_transferencias
00� �
.
00� �
str_fecha_inicio
00� �
.
00� �
ToString
00� �
(
00� �
)
00� �
}
00� �
)
00� �
;
00� �
ds11 
.11 
ListaPEntrada11  
.11  !
Add11! $
(11$ %
new11% (
ParametroEntrada11) 9
{11: ;
StrNameParameter11< L
=11M N
$str11O _
,11_ `
TipoDato11a i
=11j k
TipoDato11l t
.11t u
VarChar11u |
,11| }
ObjValue	11~ �
=
11� �$
req_get_transferencias
11� �
.
11� �
str_fecha_fin
11� �
.
11� �
ToString
11� �
(
11� �
)
11� �
}
11� �
)
11� �
;
11� �
ds22 
.22 
ListaPEntrada22  
.22  !
Add22! $
(22$ %
new22% (
ParametroEntrada22) 9
{22: ;
StrNameParameter22< L
=22M N
$str22O \
,22\ ]
TipoDato22^ f
=22g h
TipoDato22i q
.22q r
VarChar22r y
,22y z
ObjValue	22{ �
=
22� �$
req_get_transferencias
22� �
.
22� �

str_filtro
22� �
.
22� �
ToString
22� �
(
22� �
)
22� �
}
22� �
)
22� �
;
22� �
ds55 
.55 
ListaPEntrada55  
.55  !
Add55! $
(55$ %
new55% (
ParametroEntrada55) 9
{55: ;
StrNameParameter55< L
=55M N
$str55O d
,55d e
TipoDato55f n
=55o p
TipoDato55q y
.55y z
VarChar	55z �
,
55� �
ObjValue
55� �
=
55� �$
req_get_transferencias
55� �
.
55� � 
str_id_transaccion
55� �
.
55� �
ToString
55� �
(
55� �
)
55� �
}
55� �
)
55� �
;
55� �
ds66 
.66 
ListaPEntrada66  
.66  !
Add66! $
(66$ %
new66% (
ParametroEntrada66) 9
{66: ;
StrNameParameter66< L
=66M N
$str66O `
,66` a
TipoDato66b j
=66k l
TipoDato66m u
.66u v
Integer66v }
,66} ~
ObjValue	66 �
=
66� �$
req_get_transferencias
66� �
.
66� �
str_id_sistema
66� �
}
66� �
)
66� �
;
66� �
ds77 
.77 
ListaPEntrada77  
.77  !
Add77! $
(77$ %
new77% (
ParametroEntrada77) 9
{77: ;
StrNameParameter77< L
=77M N
$str77O [
,77[ \
TipoDato77] e
=77f g
TipoDato77h p
.77p q
VarChar77q x
,77x y
ObjValue	77z �
=
77� �$
req_get_transferencias
77� �
.
77� �
	str_login
77� �
.
77� �
ToString
77� �
(
77� �
)
77� �
}
77� �
)
77� �
;
77� �
ds88 
.88 
ListaPEntrada88  
.88  !
Add88! $
(88$ %
new88% (
ParametroEntrada88) 9
{88: ;
StrNameParameter88< L
=88M N
$str88O _
,88_ `
TipoDato88a i
=88j k
TipoDato88l t
.88t u
Integer88u |
,88| }
ObjValue	88~ �
=
88� �$
req_get_transferencias
88� �
.
88� �
str_id_perfil
88� �
.
88� �
ToString
88� �
(
88� �
)
88� �
}
88� �
)
88� �
;
88� �
ds99 
.99 
ListaPEntrada99  
.99  !
Add99! $
(99$ %
new99% (
ParametroEntrada99) 9
{99: ;
StrNameParameter99< L
=99M N
$str99O `
,99` a
TipoDato99b j
=99k l
TipoDato99m u
.99u v
Integer99v }
,99} ~
ObjValue	99 �
=
99� �$
req_get_transferencias
99� �
.
99� �
str_id_oficina
99� �
.
99� �
ToString
99� �
(
99� �
)
99� �
}
99� �
)
99� �
;
99� �
ds:: 
.:: 
ListaPEntrada::  
.::  !
Add::! $
(::$ %
new::% (
ParametroEntrada::) 9
{::: ;
StrNameParameter::< L
=::M N
$str::O d
,::d e
TipoDato::f n
=::o p
TipoDato::q y
.::y z
VarChar	::z �
,
::� �
ObjValue
::� �
=
::� �$
req_get_transferencias
::� �
.
::� � 
str_nemonico_canal
::� �
.
::� �
ToString
::� �
(
::� �
)
::� �
}
::� �
)
::� �
;
::� �
ds;; 
.;; 
ListaPEntrada;;  
.;;  !
Add;;! $
(;;$ %
new;;% (
ParametroEntrada;;) 9
{;;: ;
StrNameParameter;;< L
=;;M N
$str;;O d
,;;d e
TipoDato;;f n
=;;o p
TipoDato;;q y
.;;y z
VarChar	;;z �
,
;;� �
ObjValue
;;� �
=
;;� �$
req_get_transferencias
;;� �
.
;;� � 
str_ip_dispositivo
;;� �
.
;;� �
ToString
;;� �
(
;;� �
)
;;� �
}
;;� �
)
;;� �
;
;;� �
ds<< 
.<< 
ListaPEntrada<<  
.<<  !
Add<<! $
(<<$ %
new<<% (
ParametroEntrada<<) 9
{<<: ;
StrNameParameter<<< L
=<<M N
$str<<O \
,<<\ ]
TipoDato<<^ f
=<<g h
TipoDato<<i q
.<<q r
VarChar<<r y
,<<y z
ObjValue	<<{ �
=
<<� �$
req_get_transferencias
<<� �
.
<<� �

str_sesion
<<� �
.
<<� �
ToString
<<� �
(
<<� �
)
<<� �
}
<<� �
)
<<� �
;
<<� �
ds== 
.== 
ListaPEntrada==  
.==  !
Add==! $
(==$ %
new==% (
ParametroEntrada==) 9
{==: ;
StrNameParameter==< L
===M N
$str==O e
,==e f
TipoDato==g o
===p q
TipoDato==r z
.==z {
VarChar	=={ �
,
==� �
ObjValue
==� �
=
==� �$
req_get_transferencias
==� �
.
==� �!
str_mac_dispositivo
==� �
.
==� �
ToString
==� �
(
==� �
)
==� �
}
==� �
)
==� �
;
==� �
ds@@ 
.@@ 
ListaPSalida@@ 
.@@  
Add@@  #
(@@# $
new@@$ '
ParametroSalida@@( 7
{@@8 9
StrNameParameter@@: J
=@@K L
$str@@M [
,@@[ \
TipoDato@@] e
=@@f g
TipoDato@@h p
.@@p q
VarChar@@q x
}@@y z
)@@z {
;@@{ |
dsAA 
.AA 
ListaPSalidaAA 
.AA  
AddAA  #
(AA# $
newAA$ '
ParametroSalidaAA( 7
{AA8 9
StrNameParameterAA: J
=AAK L
$strAAM _
,AA_ `
TipoDatoAAa i
=AAj k
TipoDatoAAl t
.AAt u
IntegerAAu |
}AA} ~
)AA~ 
;	AA �
dsCC 
.CC 
NombreSPCC 
=CC 
$strCC 9
;CC9 :
dsDD 
.DD 
NombreBDDD 
=DD 
	_settingsDD '
.DD' (
BD_megserviciosDD( 7
;DD7 8
varFF 
	resultadoFF 
=FF 
objClienteDalFF  -
.FF- .
ExecuteDataSetFF. <
(FF< =
dsFF= ?
)FF? @
;FF@ A
varGG 
lst_valoresGG 
=GG  !
newGG" %
ListGG& *
<GG* +"
ParametroSalidaValoresGG+ A
>GGA B
(GGB C
)GGC D
;GGD E
foreachII 
(II 
varII 
itemII !
inII" $
	resultadoII% .
.II. /
ListaPSalidaValoresII/ B
)IIB C
lst_valoresIID O
.IIO P
AddIIP S
(IIS T
itemIIT X
)IIX Y
;IIY Z
varJJ 

str_codigoJJ 
=JJ  
lst_valoresJJ! ,
.JJ, -
FindJJ- 1
(JJ1 2
xJJ2 3
=>JJ4 6
xJJ7 8
.JJ8 9
StrNameParameterJJ9 I
==JJJ L
$strJJM _
)JJ_ `
!JJ` a
.JJa b
ObjValueJJb j
;JJj k
varKK 
	str_errorKK 
=KK 
lst_valoresKK  +
.KK+ ,
FindKK, 0
(KK0 1
xKK1 2
=>KK3 5
xKK6 7
.KK7 8
StrNameParameterKK8 H
==KKI K
$strKKL Z
)KKZ [
!KK[ \
.KK\ ]
ObjValueKK] e
.KKe f
TrimKKf j
(KKj k
)KKk l
;KKl m
	respuestaMM 
.MM 
codigoMM  
=MM! "

str_codigoMM# -
.MM- .
ToStringMM. 6
(MM6 7
)MM7 8
.MM8 9
TrimMM9 =
(MM= >
)MM> ?
.MM? @
PadLeftMM@ G
(MMG H
$numMMH I
,MMI J
$charMMK N
)MMN O
;MMO P
	respuestaNN 
.NN 
cuerpoNN  
=NN! "
	FuncionesNN# ,
.NN, -
ObtenerDatosNN- 9
(NN9 :
	resultadoNN: C
)NNC D
;NND E
	respuestaOO 
.OO 
diccionarioOO %
.OO% &
AddOO& )
(OO) *
$strOO* 5
,OO5 6
	str_errorOO7 @
.OO@ A
ToStringOOA I
(OOI J
)OOJ K
)OOK L
;OOL M
}QQ 
catchRR 
(RR 
	ExceptionRR 
	exceptionRR &
)RR& '
{SS 
	respuestaTT 
.TT 
codigoTT  
=TT! "
$strTT# (
;TT( )
	respuestaUU 
.UU 
diccionarioUU %
.UU% &
AddUU& )
(UU) *
$strUU* 5
,UU5 6
	exceptionUU7 @
.UU@ A
ToStringUUA I
(UUI J
)UUJ K
)UUK L
;UUL M
infoLogWW 
.WW 
str_id_transaccionWW *
=WW+ ,"
req_get_transferenciasWW- C
.WWC D
str_id_transaccionWWD V
;WWV W
infoLogXX 
.XX 
str_tipoXX  
=XX! "
str_salida_errorXX# 3
;XX3 4
infoLogYY 
.YY 

str_objetoYY "
=YY# $
	exceptionYY% .
;YY. /
infoLogZZ 
.ZZ 

str_metodoZZ "
=ZZ# $

MethodBaseZZ% /
.ZZ/ 0
GetCurrentMethodZZ0 @
(ZZ@ A
)ZZA B
!ZZB C
.ZZC D
NameZZD H
;ZZH I
infoLog[[ 
.[[ 
str_operacion[[ %
=[[& '"
req_get_transferencias[[( >
.[[> ?
str_id_servicio[[? N
;[[N O
LogServicios\\ 
.\\ 
RegistrarTramas\\ ,
(\\, -
str_salida_error\\- =
,\\= >
infoLog\\? F
,\\F G
str_ruta\\H P
)\\P Q
;\\Q R
throw]] 
;]] 
}^^ 
return__ 
	respuesta__ 
;__ 
}`` 	
publicbb  
RespuestaTransaccionbb #'
get_reimpresion_comprobantebb$ ?
(bb? @
ReqTransferenciabb@ P
req_transferenciabbQ b
)bbb c
{cc 	 
RespuestaTransacciondd  
	respuestadd! *
=dd+ ,
newdd- 0 
RespuestaTransacciondd1 E
(ddE F
)ddF G
;ddG H
tryff 
{gg 
DatosSolicitudhh 
dshh !
=hh" #
newhh$ '
DatosSolicitudhh( 6
(hh6 7
)hh7 8
;hh8 9
dsjj 
.jj 
ListaPEntradajj  
.jj  !
Addjj! $
(jj$ %
newjj% (
ParametroEntradajj) 9
{jj: ;
StrNameParameterjj< L
=jjM N
$strjjO d
,jjd e
TipoDatojjf n
=jjo p
TipoDatojjq y
.jjy z
Integer	jjz �
,
jj� �
ObjValue
jj� �
=
jj� �
req_transferencia
jj� �
.
jj� � 
int_num_referencia
jj� �
.
jj� �
ToString
jj� �
(
jj� �
)
jj� �
}
jj� �
)
jj� �
;
jj� �
dskk 
.kk 
ListaPEntradakk  
.kk  !
Addkk! $
(kk$ %
newkk% (
ParametroEntradakk) 9
{kk: ;
StrNameParameterkk< L
=kkM N
$strkkO Z
,kkZ [
TipoDatokk\ d
=kke f
TipoDatokkg o
.kko p
Integerkkp w
,kkw x
ObjValue	kky �
=
kk� �
req_transferencia
kk� �
.
kk� �
int_ente
kk� �
.
kk� �
ToString
kk� �
(
kk� �
)
kk� �
}
kk� �
)
kk� �
;
kk� �
dsnn 
.nn 
ListaPEntradann  
.nn  !
Addnn! $
(nn$ %
newnn% (
ParametroEntradann) 9
{nn: ;
StrNameParameternn< L
=nnM N
$strnnO d
,nnd e
TipoDatonnf n
=nno p
TipoDatonnq y
.nny z
VarChar	nnz �
,
nn� �
ObjValue
nn� �
=
nn� �
req_transferencia
nn� �
.
nn� � 
str_id_transaccion
nn� �
.
nn� �
ToString
nn� �
(
nn� �
)
nn� �
}
nn� �
)
nn� �
;
nn� �
dsoo 
.oo 
ListaPEntradaoo  
.oo  !
Addoo! $
(oo$ %
newoo% (
ParametroEntradaoo) 9
{oo: ;
StrNameParameteroo< L
=ooM N
$strooO `
,oo` a
TipoDatooob j
=ook l
TipoDatooom u
.oou v
Integeroov }
,oo} ~
ObjValue	oo �
=
oo� �
req_transferencia
oo� �
.
oo� �
str_id_sistema
oo� �
}
oo� �
)
oo� �
;
oo� �
dspp 
.pp 
ListaPEntradapp  
.pp  !
Addpp! $
(pp$ %
newpp% (
ParametroEntradapp) 9
{pp: ;
StrNameParameterpp< L
=ppM N
$strppO [
,pp[ \
TipoDatopp] e
=ppf g
TipoDatopph p
.ppp q
VarCharppq x
,ppx y
ObjValue	ppz �
=
pp� �
req_transferencia
pp� �
.
pp� �
	str_login
pp� �
.
pp� �
ToString
pp� �
(
pp� �
)
pp� �
}
pp� �
)
pp� �
;
pp� �
dsqq 
.qq 
ListaPEntradaqq  
.qq  !
Addqq! $
(qq$ %
newqq% (
ParametroEntradaqq) 9
{qq: ;
StrNameParameterqq< L
=qqM N
$strqqO _
,qq_ `
TipoDatoqqa i
=qqj k
TipoDatoqql t
.qqt u
Integerqqu |
,qq| }
ObjValue	qq~ �
=
qq� �
req_transferencia
qq� �
.
qq� �
str_id_perfil
qq� �
.
qq� �
ToString
qq� �
(
qq� �
)
qq� �
}
qq� �
)
qq� �
;
qq� �
dsrr 
.rr 
ListaPEntradarr  
.rr  !
Addrr! $
(rr$ %
newrr% (
ParametroEntradarr) 9
{rr: ;
StrNameParameterrr< L
=rrM N
$strrrO `
,rr` a
TipoDatorrb j
=rrk l
TipoDatorrm u
.rru v
Integerrrv }
,rr} ~
ObjValue	rr �
=
rr� �
req_transferencia
rr� �
.
rr� �
str_id_oficina
rr� �
.
rr� �
ToString
rr� �
(
rr� �
)
rr� �
}
rr� �
)
rr� �
;
rr� �
dsss 
.ss 
ListaPEntradass  
.ss  !
Addss! $
(ss$ %
newss% (
ParametroEntradass) 9
{ss: ;
StrNameParameterss< L
=ssM N
$strssO d
,ssd e
TipoDatossf n
=sso p
TipoDatossq y
.ssy z
VarChar	ssz �
,
ss� �
ObjValue
ss� �
=
ss� �
req_transferencia
ss� �
.
ss� � 
str_nemonico_canal
ss� �
.
ss� �
ToString
ss� �
(
ss� �
)
ss� �
}
ss� �
)
ss� �
;
ss� �
dstt 
.tt 
ListaPEntradatt  
.tt  !
Addtt! $
(tt$ %
newtt% (
ParametroEntradatt) 9
{tt: ;
StrNameParametertt< L
=ttM N
$strttO d
,ttd e
TipoDatottf n
=tto p
TipoDatottq y
.tty z
VarChar	ttz �
,
tt� �
ObjValue
tt� �
=
tt� �
req_transferencia
tt� �
.
tt� � 
str_ip_dispositivo
tt� �
.
tt� �
ToString
tt� �
(
tt� �
)
tt� �
}
tt� �
)
tt� �
;
tt� �
dsuu 
.uu 
ListaPEntradauu  
.uu  !
Adduu! $
(uu$ %
newuu% (
ParametroEntradauu) 9
{uu: ;
StrNameParameteruu< L
=uuM N
$struuO \
,uu\ ]
TipoDatouu^ f
=uug h
TipoDatouui q
.uuq r
VarCharuur y
,uuy z
ObjValue	uu{ �
=
uu� �
req_transferencia
uu� �
.
uu� �

str_sesion
uu� �
.
uu� �
ToString
uu� �
(
uu� �
)
uu� �
}
uu� �
)
uu� �
;
uu� �
dsvv 
.vv 
ListaPEntradavv  
.vv  !
Addvv! $
(vv$ %
newvv% (
ParametroEntradavv) 9
{vv: ;
StrNameParametervv< L
=vvM N
$strvvO e
,vve f
TipoDatovvg o
=vvp q
TipoDatovvr z
.vvz {
VarChar	vv{ �
,
vv� �
ObjValue
vv� �
=
vv� �
req_transferencia
vv� �
.
vv� �!
str_mac_dispositivo
vv� �
.
vv� �
ToString
vv� �
(
vv� �
)
vv� �
}
vv� �
)
vv� �
;
vv� �
dsyy 
.yy 
ListaPSalidayy 
.yy  
Addyy  #
(yy# $
newyy$ '
ParametroSalidayy( 7
{yy8 9
StrNameParameteryy: J
=yyK L
$stryyM W
,yyW X
TipoDatoyyY a
=yyb c
TipoDatoyyd l
.yyl m
VarCharyym t
}yyu v
)yyv w
;yyw x
dszz 
.zz 
ListaPSalidazz 
.zz  
Addzz  #
(zz# $
newzz$ '
ParametroSalidazz( 7
{zz8 9
StrNameParameterzz: J
=zzK L
$strzzM [
,zz[ \
TipoDatozz] e
=zzf g
TipoDatozzh p
.zzp q
Integerzzq x
}zzy z
)zzz {
;zz{ |
ds|| 
.|| 
NombreSP|| 
=|| 
$str|| <
;||< =
ds}} 
.}} 
NombreBD}} 
=}} 
	_settings}} '
.}}' (
BD_megservicios}}( 7
;}}7 8
var 
	resultado 
= 
objClienteDal  -
.- .
ExecuteNonQuery. =
(= >
ds> @
)@ A
;A B
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	resultado
��% .
.
��. /!
ListaPSalidaValores
��/ B
)
��B C
lst_valores
��D O
.
��O P
Add
��P S
(
��S T
item
��T X
)
��X Y
;
��Y Z
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��[ \
!
��\ ]
.
��] ^
ObjValue
��^ f
;
��f g
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
StrNameParameter
��8 H
==
��I K
$str
��L V
)
��V W
!
��W X
.
��X Y
ObjValue
��Y a
.
��a b
Trim
��b f
(
��f g
)
��g h
;
��h i
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��H I
,
��I J
$char
��K N
)
��N O
;
��O P
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	resultado
��# ,
.
��, -
NumAfectados
��- 9
;
��9 :
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	str_error
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� &
)
��& '
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	exception
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
req_transferencia
��- >
.
��> ? 
str_id_transaccion
��? Q
;
��Q R
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
req_transferencia
��( 9
.
��9 :
str_id_servicio
��: I
;
��I J
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��- =
,
��= >
infoLog
��? F
,
��F G
str_ruta
��H P
)
��P Q
;
��Q R
throw
�� 
;
�� 
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #&
validar_transfer_interna
��$ <
(
��< =(
ReqValidacionTransferencia
��= W'
req_validar_transferencia
��X q
)
��q r
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �/
str_nemonico_tipo_transferencia��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O f
,
��f g
TipoDato
��h p
=
��q r
TipoDato
��s {
.
��{ |
Integer��| �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �$
int_id_cta_ordenante��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O i
,
��i j
TipoDato
��k s
=
��t u
TipoDato
��v ~
.
��~ 
Integer�� �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �'
int_id_cta_beneficiario��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
Decimal
��q x
,
��x y
ObjValue��z �
=��� �)
req_validar_transferencia��� �
.��� �
dec_monto_tran��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �)
req_validar_transferencia��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
,
��x y
ObjValue��z �
=��� �)
req_validar_transferencia��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
,
��| }
ObjValue��~ �
=��� �)
req_validar_transferencia��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �)
req_validar_transferencia��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� �)
req_validar_transferencia��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
}
��y z
)
��z {
;
��{ |
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
}
��} ~
)
��~ 
;�� �
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� ;
;
��; <
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteDataSet
��. <
(
��< =
ds
��= ?
)
��? @
;
��@ A
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	resultado
��% .
.
��. /!
ListaPSalidaValores
��/ B
)
��B C
lst_valores
��D O
.
��O P
Add
��P S
(
��S T
item
��T X
)
��X Y
;
��Y Z
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M _
)
��_ `
!
��` a
.
��a b
ObjValue
��b j
;
��j k
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
StrNameParameter
��8 H
==
��I K
$str
��L Z
)
��Z [
!
��[ \
.
��\ ]
ObjValue
��] e
.
��e f
Trim
��f j
(
��j k
)
��k l
;
��l m
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��H I
,
��I J
$char
��K N
)
��N O
;
��O P
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	Funciones
��# ,
.
��, -
ObtenerDatos
��- 9
(
��9 :
	resultado
��: C
)
��C D
;
��D E
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	str_error
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� &
)
��& '
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	exception
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,'
req_validar_transferencia
��- F
.
��F G 
str_id_transaccion
��G Y
;
��Y Z
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& ''
req_validar_transferencia
��( A
.
��A B
str_id_servicio
��B Q
;
��Q R
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��- =
,
��= >
infoLog
��? F
,
��F G
str_ruta
��H P
)
��P Q
;
��Q R
throw
�� 
;
�� 
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #'
add_transferencia_interna
��$ =
(
��= >
ReqTransferencia
��> N+
req_add_transferencia_interna
��O l
)
��l m
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� �-
req_add_transferencia_interna��� �
.��� �/
str_nemonico_tipo_transferencia��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O f
,
��f g
TipoDato
��h p
=
��q r
TipoDato
��s {
.
��{ |
Integer��| �
,��� �
ObjValue��� �
=��� �-
req_add_transferencia_interna��� �
.��� �$
int_id_cta_ordenante��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O i
,
��i j
TipoDato
��k s
=
��t u
TipoDato
��v ~
.
��~ 
Integer�� �
,��� �
ObjValue��� �
=��� �-
req_add_transferencia_interna��� �
.��� �'
int_id_cta_beneficiario��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
Money
��q v
,
��v w
ObjValue��x �
=��� �-
req_add_transferencia_interna��� �
.��� �
dec_monto_tran��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O c
,
��c d
TipoDato
��e m
=
��n o
TipoDato
��p x
.
��x y
VarChar��y �
,��� �
ObjValue��� �
=��� �-
req_add_transferencia_interna��� �
.��� �!
str_observaciones��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �-
req_add_transferencia_interna��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �-
req_add_transferencia_interna��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
,
��x y
ObjValue��z �
=��� �-
req_add_transferencia_interna��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
,
��| }
ObjValue��~ �
=��� �-
req_add_transferencia_interna��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �-
req_add_transferencia_interna��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �-
req_add_transferencia_interna��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �-
req_add_transferencia_interna��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� �-
req_add_transferencia_interna��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� �-
req_add_transferencia_interna��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M V
,
��V W
TipoDato
��X `
=
��a b
TipoDato
��c k
.
��k l
Integer
��l s
}
��t u
)
��u v
;
��v w
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
}
��y z
)
��z {
;
��{ |
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
}
��} ~
)
��~ 
;�� �
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� <
;
��< =
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteDataSet
��. <
(
��< =
ds
��= ?
)
��? @
;
��@ A
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	resultado
��% .
.
��. /!
ListaPSalidaValores
��/ B
)
��B C
lst_valores
��D O
.
��O P
Add
��P S
(
��S T
item
��T X
)
��X Y
;
��Y Z
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M _
)
��_ `
!
��` a
.
��a b
ObjValue
��b j
;
��j k
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
StrNameParameter
��8 H
==
��I K
$str
��L Z
)
��Z [
!
��[ \
.
��\ ]
ObjValue
��] e
.
��e f
Trim
��f j
(
��j k
)
��k l
;
��l m
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��H I
,
��I J
$char
��K N
)
��N O
;
��O P
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	Funciones
��# ,
.
��, -
ObtenerDatos
��- 9
(
��9 :
	resultado
��: C
)
��C D
;
��D E
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	str_error
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� &
)
��& '
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	exception
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,+
req_add_transferencia_interna
��- J
.
��J K 
str_id_transaccion
��K ]
;
��] ^
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '+
req_add_transferencia_interna
��( E
.
��E F
str_id_servicio
��F U
;
��U V
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��- =
,
��= >
infoLog
��? F
,
��F G
str_ruta
��H P
)
��P Q
;
��Q R
throw
�� 
;
�� 
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #+
get_val_transf_interbancarias
��$ A
(
��A B(
ReqValidacionTransferencia
��B \'
req_validar_transferencia
��] v
)
��v w
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O Z
,
��Z [
TipoDato
��\ d
=
��e f
TipoDato
��g o
.
��o p
Integer
��p w
,
��w x
ObjValue��y �
=��� �)
req_validar_transferencia��� �
.��� �
int_ente��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O f
,
��f g
TipoDato
��h p
=
��q r
TipoDato
��s {
.
��{ |
Integer��| �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �$
int_id_cta_ordenante��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O i
,
��i j
TipoDato
��k s
=
��t u
TipoDato
��v ~
.
��~ 
Integer�� �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �'
int_id_cta_beneficiario��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
Decimal��z �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �
dec_monto_tran��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �)
req_validar_transferencia��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
,
��x y
ObjValue��z �
=��� �)
req_validar_transferencia��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
,
��| }
ObjValue��~ �
=��� �)
req_validar_transferencia��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �)
req_validar_transferencia��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� �)
req_validar_transferencia��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� �)
req_validar_transferencia��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M W
,
��W X
TipoDato
��Y a
=
��b c
TipoDato
��d l
.
��l m
VarChar
��m t
}
��u v
)
��v w
;
��w x
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
Integer
��q x
}
��y z
)
��z {
;
��{ |
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
}
��} ~
)
��~ 
;�� �
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� >
;
��> ?
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteDataSet
��. <
(
��< =
ds
��= ?
)
��? @
;
��@ A
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	resultado
��% .
.
��. /!
ListaPSalidaValores
��/ B
)
��B C
lst_valores
��D O
.
��O P
Add
��P S
(
��S T
item
��T X
)
��X Y
;
��Y Z
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��[ \
!
��\ ]
.
��] ^
ObjValue
��^ f
;
��f g
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
StrNameParameter
��8 H
==
��I K
$str
��L V
)
��V W
!
��W X
.
��X Y
ObjValue
��Y a
.
��a b
Trim
��b f
(
��f g
)
��g h
;
��h i
var
�� 
str_enviar_banred
�� %
=
��& '
lst_valores
��( 3
.
��3 4
Find
��4 8
(
��8 9
x
��9 :
=>
��; =
x
��> ?
.
��? @
StrNameParameter
��@ P
==
��Q S
$str
��T f
)
��f g
!
��g h
.
��h i
ObjValue
��i q
.
��q r
Trim
��r v
(
��v w
)
��w x
;
��x y
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��H I
,
��I J
$char
��K N
)
��N O
;
��O P
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	Funciones
��# ,
.
��, -
ObtenerDatos
��- 9
(
��9 :
	resultado
��: C
)
��C D
;
��D E
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	str_error
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* =
,
��= >
str_enviar_banred
��? P
.
��P Q
ToString
��Q Y
(
��Y Z
)
��Z [
)
��[ \
;
��\ ]
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� &
)
��& '
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	exception
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,'
req_validar_transferencia
��- F
.
��F G 
str_id_transaccion
��G Y
;
��Y Z
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& ''
req_validar_transferencia
��( A
.
��A B
str_id_servicio
��B Q
;
��Q R
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��- =
,
��= >
infoLog
��? F
,
��F G
str_ruta
��H P
)
��P Q
;
��Q R
throw
�� 
;
�� 
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #'
add_transf_interbancarias
��$ =
(
��= >
ReqTransferencia
��> N
req_transferencia
��O `
)
��` a
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O Z
,
��Z [
TipoDato
��\ d
=
��e f
TipoDato
��g o
.
��o p
Integer
��p w
,
��w x
ObjValue��y �
=��� �!
req_transferencia��� �
.��� �
int_ente��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O f
,
��f g
TipoDato
��h p
=
��q r
TipoDato
��s {
.
��{ |
Integer��| �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �$
int_id_cta_ordenante��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O i
,
��i j
TipoDato
��k s
=
��t u
TipoDato
��v ~
.
��~ 
Integer�� �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �'
int_id_cta_beneficiario��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
Decimal��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �
dec_monto_tran��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O c
,
��c d
TipoDato
��e m
=
��n o
TipoDato
��p x
.
��x y
VarChar��y �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �!
str_observaciones��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O k
,
��k l
TipoDato
��m u
=
��v w
TipoDato��x �
.��� �
Integer��� �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �)
int_id_comprobar_transfer��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O i
,
��i j
TipoDato
��k s
=
��t u
TipoDato
��v ~
.
��~ 
VarChar�� �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �'
str_correo_beneficiario��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �!
req_transferencia��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
,
��x y
ObjValue��z �
=��� �!
req_transferencia��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
,
��| }
ObjValue��~ �
=��� �!
req_transferencia��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �!
req_transferencia��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� �!
req_transferencia��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
}
��} ~
)
��~ 
;�� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
}
��y z
)
��z {
;
��{ |
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� :
;
��: ;
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteDataSet
��. <
(
��< =
ds
��= ?
)
��? @
;
��@ A
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	resultado
��% .
.
��. /!
ListaPSalidaValores
��/ B
)
��B C
lst_valores
��D O
.
��O P
Add
��P S
(
��S T
item
��T X
)
��X Y
;
��Y Z
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M _
)
��_ `
!
��` a
.
��a b
ObjValue
��b j
;
��j k
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
StrNameParameter
��8 H
==
��I K
$str
��L Z
)
��Z [
!
��[ \
.
��\ ]
ObjValue
��] e
.
��e f
Trim
��f j
(
��j k
)
��k l
;
��l m
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��H I
,
��I J
$char
��K N
)
��N O
;
��O P
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	Funciones
��# ,
.
��, -
ObtenerDatos
��- 9
(
��9 :
	resultado
��: C
)
��C D
;
��D E
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	str_error
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� &
)
��& '
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	exception
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
req_transferencia
��- >
.
��> ? 
str_id_transaccion
��? Q
;
��Q R
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
req_transferencia
��( 9
.
��9 :
str_id_servicio
��: I
;
��I J
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��- =
,
��= >
infoLog
��? F
,
��F G
str_ruta
��H P
)
��P Q
;
��Q R
throw
�� 
;
�� 
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #&
set_envio_transf_por_spi
��$ <
(
��< =
ReqTransferencia
��= M
req_transferencia
��N _
)
��_ `
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O k
,
��k l
TipoDato
��m u
=
��v w
TipoDato��x �
.��� �
Integer��� �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �)
int_id_comprobar_transfer��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �!
req_transferencia��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
,
��x y
ObjValue��z �
=��� �!
req_transferencia��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
,
��| }
ObjValue��~ �
=��� �!
req_transferencia��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �!
req_transferencia��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� �!
req_transferencia��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O e
,
��e f
TipoDato
��g o
=
��p q
TipoDato
��r z
.
��z {
VarChar��{ �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �#
str_mac_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M W
,
��W X
TipoDato
��Y a
=
��b c
TipoDato
��d l
.
��l m
VarChar
��m t
}
��u v
)
��v w
;
��w x
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
Integer
��q x
}
��y z
)
��z {
;
��{ |
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� 9
;
��9 :
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteNonQuery
��. =
(
��= >
ds
��> @
)
��@ A
;
��A B
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	resultado
��% .
.
��. /!
ListaPSalidaValores
��/ B
)
��B C
lst_valores
��D O
.
��O P
Add
��P S
(
��S T
item
��T X
)
��X Y
;
��Y Z
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��[ \
!
��\ ]
.
��] ^
ObjValue
��^ f
;
��f g
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
StrNameParameter
��8 H
==
��I K
$str
��L V
)
��V W
!
��W X
.
��X Y
ObjValue
��Y a
.
��a b
Trim
��b f
(
��f g
)
��g h
;
��h i
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��H I
,
��I J
$char
��K N
)
��N O
;
��O P
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	resultado
��# ,
.
��, -
NumAfectados
��- 9
;
��9 :
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	str_error
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� &
)
��& '
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	exception
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
req_transferencia
��- >
.
��> ? 
str_id_transaccion
��? Q
;
��Q R
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
req_transferencia
��( 9
.
��9 :
str_id_servicio
��: I
;
��I J
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��- =
,
��= >
infoLog
��? F
,
��F G
str_ruta
��H P
)
��P Q
;
��Q R
throw
�� 
;
�� 
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� #,
obtener_datos_req_pago_directo
��$ B
(
��B C
ReqTransferencia
��C S
req_transferencia
��T e
)
��e f
{
�� 	"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
new
��- 0"
RespuestaTransaccion
��1 E
(
��E F
)
��F G
;
��G H
try
�� 
{
�� 
DatosSolicitud
�� 
ds
�� !
=
��" #
new
��$ '
DatosSolicitud
��( 6
(
��6 7
)
��7 8
;
��8 9
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_id_transaccion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �!
req_transferencia��� �
.��� �
str_id_sistema��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
VarChar
��q x
,
��x y
ObjValue��z �
=��� �!
req_transferencia��� �
.��� �
	str_login��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O _
,
��_ `
TipoDato
��a i
=
��j k
TipoDato
��l t
.
��t u
Integer
��u |
,
��| }
ObjValue��~ �
=��� �!
req_transferencia��� �
.��� �
str_id_perfil��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
Integer
��v }
,
��} ~
ObjValue�� �
=��� �!
req_transferencia��� �
.��� �
str_id_oficina��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_nemonico_canal��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O d
,
��d e
TipoDato
��f n
=
��o p
TipoDato
��q y
.
��y z
VarChar��z �
,��� �
ObjValue��� �
=��� �!
req_transferencia��� �
.��� �"
str_ip_dispositivo��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O \
,
��\ ]
TipoDato
��^ f
=
��g h
TipoDato
��i q
.
��q r
VarChar
��r y
,
��y z
ObjValue��{ �
=��� �!
req_transferencia��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPEntrada
��  
.
��  !
Add
��! $
(
��$ %
new
��% (
ParametroEntrada
��) 9
{
��: ;
StrNameParameter
��< L
=
��M N
$str
��O `
,
��` a
TipoDato
��b j
=
��k l
TipoDato
��m u
.
��u v
VarChar
��v }
,
��} ~
ObjValue�� �
=��� �!
req_transferencia��� �
.��� �

str_sesion��� �
.��� �
ToString��� �
(��� �
)��� �
}��� �
)��� �
;��� �
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M W
,
��W X
TipoDato
��Y a
=
��b c
TipoDato
��d l
.
��l m
VarChar
��m t
}
��u v
)
��v w
;
��w x
ds
�� 
.
�� 
ListaPSalida
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
ParametroSalida
��( 7
{
��8 9
StrNameParameter
��: J
=
��K L
$str
��M [
,
��[ \
TipoDato
��] e
=
��f g
TipoDato
��h p
.
��p q
Integer
��q x
}
��y z
)
��z {
;
��{ |
ds
�� 
.
�� 
NombreSP
�� 
=
�� 
$str
�� 9
;
��9 :
ds
�� 
.
�� 
NombreBD
�� 
=
�� 
	_settings
�� '
.
��' (
BD_megservicios
��( 7
;
��7 8
var
�� 
	resultado
�� 
=
�� 
objClienteDal
��  -
.
��- .
ExecuteNonQuery
��. =
(
��= >
ds
��> @
)
��@ A
;
��A B
var
�� 
lst_valores
�� 
=
��  !
new
��" %
List
��& *
<
��* +$
ParametroSalidaValores
��+ A
>
��A B
(
��B C
)
��C D
;
��D E
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	resultado
��% .
.
��. /!
ListaPSalidaValores
��/ B
)
��B C
lst_valores
��D O
.
��O P
Add
��P S
(
��S T
item
��T X
)
��X Y
;
��Y Z
var
�� 

str_codigo
�� 
=
��  
lst_valores
��! ,
.
��, -
Find
��- 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
StrNameParameter
��9 I
==
��J L
$str
��M [
)
��[ \
!
��\ ]
.
��] ^
ObjValue
��^ f
;
��f g
var
�� 
	str_error
�� 
=
�� 
lst_valores
��  +
.
��+ ,
Find
��, 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
StrNameParameter
��8 H
==
��I K
$str
��L V
)
��V W
!
��W X
.
��X Y
ObjValue
��Y a
.
��a b
Trim
��b f
(
��f g
)
��g h
;
��h i
	respuesta
�� 
.
�� 
codigo
��  
=
��! "

str_codigo
��# -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
.
��? @
PadLeft
��@ G
(
��G H
$num
��H I
,
��I J
$char
��K N
)
��N O
;
��O P
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
	resultado
��# ,
.
��, -
NumAfectados
��- 9
;
��9 :
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	str_error
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
}
�� 
catch
�� 
(
�� 
	Exception
�� 
	exception
�� &
)
��& '
{
�� 
	respuesta
�� 
.
�� 
codigo
��  
=
��! "
$str
��# (
;
��( )
	respuesta
�� 
.
�� 
diccionario
�� %
.
��% &
Add
��& )
(
��) *
$str
��* 5
,
��5 6
	exception
��7 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
;
��L M
infoLog
�� 
.
��  
str_id_transaccion
�� *
=
��+ ,
req_transferencia
��- >
.
��> ? 
str_id_transaccion
��? Q
;
��Q R
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_salida_error
��# 3
;
��3 4
infoLog
�� 
.
�� 

str_objeto
�� "
=
��# $
	exception
��% .
;
��. /
infoLog
�� 
.
�� 

str_metodo
�� "
=
��# $

MethodBase
��% /
.
��/ 0
GetCurrentMethod
��0 @
(
��@ A
)
��A B
!
��B C
.
��C D
Name
��D H
;
��H I
infoLog
�� 
.
�� 
str_operacion
�� %
=
��& '
req_transferencia
��( 9
.
��9 :
str_id_servicio
��: I
;
��I J
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_salida_error
��- =
,
��= >
infoLog
��? F
,
��F G
str_ruta
��H P
)
��P Q
;
��Q R
throw
�� 
;
�� 
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
}
�� 
}�� 