Έ
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
((€ 
=
((‰ 
obj_beneficiario
((‹ ›
.
((› 
str_codigo_ifi
(( ª
.
((ª «
ToString
((« ³
(
((³ ΄
)
((΄ µ
}
((¶ ·
)
((Έ Ή
;
((Ή Ί
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
Integer	))z 
,
)) ‚
ObjValue
))ƒ ‹
=
)) 
obj_beneficiario
)) 
.
)) 
int_tipo_producto
)) °
.
))° ±
ToString
))± Ή
(
))Ή Ί
)
))Ί »
}
))Ό ½
)
))Ύ Ώ
;
))Ώ ΐ
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
ObjValue	**} …
=
**† ‡
obj_beneficiario
** 
.
** ™
str_numero_cuenta
**™ ª
.
**ª «
ToString
**« ³
(
**³ ΄
)
**΄ µ
}
**¶ ·
)
**Έ Ή
;
**Ή Ί
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
VarChar	++z 
,
++ ‚
ObjValue
++ƒ ‹
=
++ 
obj_beneficiario
++ 
.
++ "
str_numero_documento
++ ³
.
++³ ΄
ToString
++΄ Ό
(
++Ό ½
)
++½ Ύ
}
++Ώ ΐ
)
++Α Β
;
++Β Γ
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
ObjValue	,,} …
=
,,† ‡
obj_beneficiario
,, 
.
,, ™
str_nombres
,,™ ¤
.
,,¤ ¥
ToString
,,¥ ­
(
,,­ ®
)
,,® ―
}
,,° ±
)
,,² ³
;
,,³ ΄
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
ObjValue	--{ ƒ
=
--„ …
obj_beneficiario
--† –
.
--– —
	str_email
--—  
.
--  ΅
ToString
--΅ ©
(
--© ª
)
--ª «
}
--¬ ­
)
--® ―
;
--― °
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
ObjValue	.. ‡
=
.. ‰
obj_beneficiario
.. 
.
.. ›
str_alias_cta
..› ¨
.
..¨ ©
ToString
..© ±
(
..± ²
)
..² ³
}
..΄ µ
)
..¶ ·
;
..· Έ
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
VarChar	//~ …
,
//… †
ObjValue
//‡ 
=
// ‘
obj_beneficiario
//’ Ά
.
//Ά £#
str_tipo_beneficiario
//£ Έ
.
//Έ Ή
ToString
//Ή Α
(
//Α Β
)
//Β Γ
}
//Δ Ε
)
//Ζ Η
;
//Η Θ
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
Integer	00z 
,
00 ‚
ObjValue
00ƒ ‹
=
00 
obj_beneficiario
00 
.
00 
int_ente_registra
00 °
.
00° ±
ToString
00± Ή
(
00Ή Ί
)
00Ί »
}
00Ό ½
)
00Ύ Ώ
;
00Ώ ΐ
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
VarChar	33{ ‚
,
33‚ ƒ
ObjValue
33„ 
=
33 
obj_beneficiario
33 
.
33   
str_id_transaccion
33  ²
.
33² ³
ToString
33³ »
(
33» Ό
)
33Ό ½
}
33Ύ Ώ
)
33ΐ Α
;
33Α Β
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
44€ 
=
44‰ 
obj_beneficiario
44‹ ›
.
44› 
str_id_sistema
44 ª
}
44« ¬
)
44­ ®
;
44® ―
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
ObjValue	55{ ƒ
=
55„ …
obj_beneficiario
55† –
.
55– —
	str_login
55—  
.
55  ΅
ToString
55΅ ©
(
55© ª
)
55ª «
}
55¬ ­
)
55® ―
;
55― °
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
ObjValue	66 ‡
=
66 ‰
obj_beneficiario
66 
.
66 ›
str_id_perfil
66› ¨
.
66¨ ©
ToString
66© ±
(
66± ²
)
66² ³
}
66΄ µ
)
66¶ ·
;
66· Έ
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
77€ 
=
77‰ 
obj_beneficiario
77‹ ›
.
77› 
str_id_oficina
77 ª
.
77ª «
ToString
77« ³
(
77³ ΄
)
77΄ µ
}
77¶ ·
)
77Έ Ή
;
77Ή Ί
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
VarChar	88{ ‚
,
88‚ ƒ
ObjValue
88„ 
=
88 
obj_beneficiario
88 
.
88   
str_nemonico_canal
88  ²
.
88² ³
ToString
88³ »
(
88» Ό
)
88Ό ½
}
88Ύ Ώ
)
88ΐ Α
;
88Α Β
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
VarChar	99{ ‚
,
99‚ ƒ
ObjValue
99„ 
=
99 
obj_beneficiario
99 
.
99   
str_ip_dispositivo
99  ²
.
99² ³
ToString
99³ »
(
99» Ό
)
99Ό ½
}
99Ύ Ώ
)
99ΐ Α
;
99Α Β
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
ObjValue	::| „
=
::… †
obj_beneficiario
::‡ —
.
::— 

str_sesion
:: Ά
.
::Ά £
ToString
::£ «
(
::« ¬
)
::¬ ­
}
::® ―
)
::° ±
;
::± ²
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
VarChar	;;| ƒ
,
;;ƒ „
ObjValue
;;… 
=
;; 
obj_beneficiario
;;  
.
;;  ΅!
str_mac_dispositivo
;;΅ ΄
.
;;΄ µ
ToString
;;µ ½
(
;;½ Ύ
)
;;Ύ Ώ
}
;;ΐ Α
)
;;Β Γ
;
;;Γ Δ
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
??€ 
;
?? ‚
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
gg€ 
=
gg‰ 
obj_beneficiario
gg‹ ›
.
gg› 
str_codigo_ifi
gg ª
.
ggª «
ToString
gg« ³
(
gg³ ΄
)
gg΄ µ
}
gg¶ ·
)
ggΈ Ή
;
ggΉ Ί
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
Integer	hhz 
,
hh ‚
ObjValue
hhƒ ‹
=
hh 
obj_beneficiario
hh 
.
hh 
int_tipo_producto
hh °
.
hh° ±
ToString
hh± Ή
(
hhΉ Ί
)
hhΊ »
}
hhΌ ½
)
hhΎ Ώ
;
hhΏ ΐ
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
ObjValue	ii} …
=
ii† ‡
obj_beneficiario
ii 
.
ii ™
str_num_cta
ii™ ¤
.
ii¤ ¥
ToString
ii¥ ­
(
ii­ ®
)
ii® ―
}
ii° ±
)
ii² ³
;
ii³ ΄
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
VarChar	jjz 
,
jj ‚
ObjValue
jjƒ ‹
=
jj 
obj_beneficiario
jj 
.
jj 
str_num_documento
jj °
.
jj° ±
ToString
jj± Ή
(
jjΉ Ί
)
jjΊ »
}
jjΌ ½
)
jjΎ Ώ
;
jjΏ ΐ
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
ObjValue	kk} …
=
kk† ‡
obj_beneficiario
kk 
.
kk ™
str_nombres
kk™ ¤
.
kk¤ ¥
ToString
kk¥ ­
(
kk­ ®
)
kk® ―
}
kk° ±
)
kk² ³
;
kk³ ΄
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
ObjValue	ll{ ƒ
=
ll„ …
obj_beneficiario
ll† –
.
ll– —
	str_email
ll—  
.
ll  ΅
ToString
ll΅ ©
(
ll© ª
)
llª «
}
ll¬ ­
)
ll® ―
;
ll― °
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
ObjValue	mm ‡
=
mm ‰
obj_beneficiario
mm 
.
mm ›
str_alias_cta
mm› ¨
.
mm¨ ©
ToString
mm© ±
(
mm± ²
)
mm² ³
}
mm΄ µ
)
mm¶ ·
;
mm· Έ
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
VarChar	nn~ …
,
nn… †
ObjValue
nn‡ 
=
nn ‘
obj_beneficiario
nn’ Ά
.
nnΆ £#
str_tipo_beneficiario
nn£ Έ
.
nnΈ Ή
ToString
nnΉ Α
(
nnΑ Β
)
nnΒ Γ
}
nnΔ Ε
)
nnΖ Η
;
nnΗ Θ
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
Integer	ooz 
,
oo ‚
ObjValue
ooƒ ‹
=
oo 
obj_beneficiario
oo 
.
oo 
int_ente_registra
oo °
.
oo° ±
ToString
oo± Ή
(
ooΉ Ί
)
ooΊ »
}
ooΌ ½
)
ooΎ Ώ
;
ooΏ ΐ
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
ObjValue	ppx €
=
pp ‚
obj_beneficiario
ppƒ “
.
pp“ ”
int_id
pp” 
.
pp ›
ToString
pp› £
(
pp£ ¤
)
pp¤ ¥
}
pp¦ §
)
pp¨ ©
;
pp© ª
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
VarChar	ss{ ‚
,
ss‚ ƒ
ObjValue
ss„ 
=
ss 
obj_beneficiario
ss 
.
ss   
str_id_transaccion
ss  ²
.
ss² ³
ToString
ss³ »
(
ss» Ό
)
ssΌ ½
}
ssΎ Ώ
)
ssΐ Α
;
ssΑ Β
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
tt€ 
=
tt‰ 
obj_beneficiario
tt‹ ›
.
tt› 
str_id_sistema
tt ª
}
tt« ¬
)
tt­ ®
;
tt® ―
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
ObjValue	uu{ ƒ
=
uu„ …
obj_beneficiario
uu† –
.
uu– —
	str_login
uu—  
.
uu  ΅
ToString
uu΅ ©
(
uu© ª
)
uuª «
}
uu¬ ­
)
uu® ―
;
uu― °
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
ObjValue	vv ‡
=
vv ‰
obj_beneficiario
vv 
.
vv ›
str_id_perfil
vv› ¨
.
vv¨ ©
ToString
vv© ±
(
vv± ²
)
vv² ³
}
vv΄ µ
)
vv¶ ·
;
vv· Έ
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
ww€ 
=
ww‰ 
obj_beneficiario
ww‹ ›
.
ww› 
str_id_oficina
ww ª
.
wwª «
ToString
ww« ³
(
ww³ ΄
)
ww΄ µ
}
ww¶ ·
)
wwΈ Ή
;
wwΉ Ί
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
VarChar	xx{ ‚
,
xx‚ ƒ
ObjValue
xx„ 
=
xx 
obj_beneficiario
xx 
.
xx   
str_nemonico_canal
xx  ²
.
xx² ³
ToString
xx³ »
(
xx» Ό
)
xxΌ ½
}
xxΎ Ώ
)
xxΐ Α
;
xxΑ Β
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
VarChar	yy{ ‚
,
yy‚ ƒ
ObjValue
yy„ 
=
yy 
obj_beneficiario
yy 
.
yy   
str_ip_dispositivo
yy  ²
.
yy² ³
ToString
yy³ »
(
yy» Ό
)
yyΌ ½
}
yyΎ Ώ
)
yyΐ Α
;
yyΑ Β
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
ObjValue	zz| „
=
zz… †
obj_beneficiario
zz‡ —
.
zz— 

str_sesion
zz Ά
.
zzΆ £
ToString
zz£ «
(
zz« ¬
)
zz¬ ­
}
zz® ―
)
zz° ±
;
zz± ²
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
VarChar	{{| ƒ
,
{{ƒ „
ObjValue
{{… 
=
{{ 
obj_beneficiario
{{  
.
{{  ΅!
str_mac_dispositivo
{{΅ ΄
.
{{΄ µ
ToString
{{µ ½
(
{{½ Ύ
)
{{Ύ Ώ
}
{{ΐ Α
)
{{Β Γ
;
{{Γ Δ
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
€ 
;
 ‚
ds
 
.
 
NombreSP
 
=
 
$str
 ?
;
? @
ds
‚‚ 
.
‚‚ 
NombreBD
‚‚ 
=
‚‚ 
	_settings
‚‚ '
.
‚‚' (
BD_megservicios
‚‚( 7
;
‚‚7 8
var
„„ 
	resultado
„„ 
=
„„ 
objClienteDal
„„  -
.
„„- .
ExecuteNonQuery
„„. =
(
„„= >
ds
„„? A
)
„„B C
;
„„C D
var
…… 
lst_valores
…… 
=
……  !
new
……" %
List
……& *
<
……* +$
ParametroSalidaValores
……+ A
>
……A B
(
……B C
)
……C D
;
……D E
foreach
‡‡ 
(
‡‡ 
var
‡‡ 
item
‡‡  
in
‡‡! #
	resultado
‡‡$ -
.
‡‡- .!
ListaPSalidaValores
‡‡. A
)
‡‡A B
lst_valores
‡‡C N
.
‡‡N O
Add
‡‡O R
(
‡‡R S
item
‡‡T X
)
‡‡Y Z
;
‡‡Z [
var
 

str_codigo
 
=
  
lst_valores
! ,
.
, -
Find
- 1
(
1 2
x
3 4
=>
5 7
x
8 9
.
9 :
StrNameParameter
: J
==
K M
$str
N `
)
a b
!
b c
.
c d
ObjValue
d l
;
l m
var
‰‰ 
	str_error
‰‰ 
=
‰‰ 
lst_valores
‰‰  +
.
‰‰+ ,
Find
‰‰, 0
(
‰‰0 1
x
‰‰2 3
=>
‰‰4 6
x
‰‰7 8
.
‰‰8 9
StrNameParameter
‰‰9 I
==
‰‰J L
$str
‰‰M [
)
‰‰\ ]
!
‰‰] ^
.
‰‰^ _
ObjValue
‰‰_ g
.
‰‰g h
Trim
‰‰h l
(
‰‰l m
)
‰‰m n
;
‰‰n o
	respuesta
‹‹ 
.
‹‹ 
codigo
‹‹  
=
‹‹! "

str_codigo
‹‹# -
.
‹‹- .
ToString
‹‹. 6
(
‹‹6 7
)
‹‹7 8
.
‹‹8 9
Trim
‹‹9 =
(
‹‹= >
)
‹‹> ?
.
‹‹? @
PadLeft
‹‹@ G
(
‹‹G H
$num
‹‹I J
,
‹‹J K
$char
‹‹L O
)
‹‹P Q
;
‹‹Q R
	respuesta
 
.
 
cuerpo
  
=
! "
	resultado
# ,
.
, -
NumAfectados
- 9
;
9 :
	respuesta
 
.
 
diccionario
 %
.
% &
Add
& )
(
) *
$str
+ 6
,
6 7
	str_error
8 A
.
A B
ToString
B J
(
J K
)
K L
)
M N
;
N O
}
 
catch
 
(
 
	Exception
 
	exception
 %
)
% &
{
‘‘ 
	respuesta
’’ 
.
’’ 
codigo
’’  
=
’’! "
$str
’’# (
;
’’( )
	respuesta
““ 
.
““ 
diccionario
““ %
.
““% &
Add
““& )
(
““) *
$str
““+ 6
,
““6 7
	exception
““8 A
.
““A B
ToString
““B J
(
““J K
)
““K L
)
““M N
;
““N O
infoLog
•• 
.
••  
str_id_transaccion
•• *
=
••+ ,
obj_beneficiario
••- =
.
••= > 
str_id_transaccion
••> P
;
••P Q
infoLog
–– 
.
–– 
str_tipo
––  
=
––! "
str_salida_error
––# 3
;
––3 4
infoLog
—— 
.
—— 

str_objeto
—— "
=
——# $
	exception
——% .
;
——. /
infoLog
 
.
 

str_metodo
 "
=
# $

MethodBase
% /
.
/ 0
GetCurrentMethod
0 @
(
@ A
)
A B
!
B C
.
C D
Name
D H
;
H I
infoLog
™™ 
.
™™ 
str_operacion
™™ %
=
™™& '
obj_beneficiario
™™( 8
.
™™8 9
str_id_servicio
™™9 H
;
™™H I
LogServicios
›› 
.
›› 
RegistrarTramas
›› ,
(
››, -
str_salida_error
››. >
,
››> ?
infoLog
››@ G
,
››G H
str_ruta
››I Q
)
››R S
;
››S T
}
 
return
 
	respuesta
 
;
 
}
 	
public
΅΅ "
RespuestaTransaccion
΅΅ #*
delete_cuentas_beneficiarios
΅΅$ @
(
΅΅A B#
ReqDeleteBeneficiario
΅΅C X
obj_beneficiario
΅΅Y i
)
΅΅j k
{
ΆΆ 	"
RespuestaTransaccion
££  
	respuesta
££! *
=
££+ ,
new
££- 0"
RespuestaTransaccion
££1 E
(
££E F
)
££F G
;
££G H
try
¥¥ 
{
¦¦ 
DatosSolicitud
§§ 
ds
§§ !
=
§§" #
new
§§$ '
DatosSolicitud
§§( 6
(
§§6 7
)
§§7 8
;
§§8 9
ds
©© 
.
©© 
ListaPEntrada
©©  
.
©©  !
Add
©©! $
(
©©$ %
new
©©& )
ParametroEntrada
©©* :
{
©©; <
StrNameParameter
©©= M
=
©©N O
$str
©©P Y
,
©©Y Z
TipoDato
©©[ c
=
©©d e
TipoDato
©©f n
.
©©n o
Integer
©©o v
,
©©v w
ObjValue©©x €
=©© ‚ 
obj_beneficiario©©ƒ “
.©©“ ”
int_id©©” 
.©© ›
ToString©©› £
(©©£ ¤
)©©¤ ¥
}©©¦ §
)©©¨ ©
;©©© ª
ds
ªª 
.
ªª 
ListaPEntrada
ªª  
.
ªª  !
Add
ªª! $
(
ªª$ %
new
ªª& )
ParametroEntrada
ªª* :
{
ªª; <
StrNameParameter
ªª= M
=
ªªN O
$str
ªªP d
,
ªªd e
TipoDato
ªªf n
=
ªªo p
TipoDato
ªªq y
.
ªªy z
Integerªªz 
,ªª ‚
ObjValueªªƒ ‹
=ªª  
obj_beneficiarioªª 
.ªª !
int_ente_registraªª °
.ªª° ±
ToStringªª± Ή
(ªªΉ Ί
)ªªΊ »
}ªªΌ ½
)ªªΎ Ώ
;ªªΏ ΐ
ds
«« 
.
«« 
ListaPEntrada
««  
.
««  !
Add
««! $
(
««$ %
new
««& )
ParametroEntrada
««* :
{
««; <
StrNameParameter
««= M
=
««N O
$str
««P e
,
««e f
TipoDato
««g o
=
««p q
TipoDato
««r z
.
««z {
VarChar««{ ‚
,««‚ ƒ
ObjValue««„ 
=««  
obj_beneficiario«« 
.««  "
str_motivo_elimina««  ²
.««² ³
ToString««³ »
(««» Ό
)««Ό ½
}««Ύ Ώ
)««ΐ Α
;««Α Β
ds
®® 
.
®® 
ListaPEntrada
®®  
.
®®  !
Add
®®! $
(
®®$ %
new
®®& )
ParametroEntrada
®®* :
{
®®; <
StrNameParameter
®®= M
=
®®N O
$str
®®P e
,
®®e f
TipoDato
®®g o
=
®®p q
TipoDato
®®r z
.
®®z {
VarChar®®{ ‚
,®®‚ ƒ
ObjValue®®„ 
=®®  
obj_beneficiario®® 
.®®  "
str_id_transaccion®®  ²
.®®² ³
ToString®®³ »
(®®» Ό
)®®Ό ½
}®®Ύ Ώ
)®®ΐ Α
;®®Α Β
ds
―― 
.
―― 
ListaPEntrada
――  
.
――  !
Add
――! $
(
――$ %
new
――& )
ParametroEntrada
――* :
{
――; <
StrNameParameter
――= M
=
――N O
$str
――P a
,
――a b
TipoDato
――c k
=
――l m
TipoDato
――n v
.
――v w
Integer
――w ~
,
――~ 
ObjValue――€ 
=――‰  
obj_beneficiario――‹ ›
.――› 
str_id_sistema―― ª
}――« ¬
)――­ ®
;――® ―
ds
°° 
.
°° 
ListaPEntrada
°°  
.
°°  !
Add
°°! $
(
°°$ %
new
°°& )
ParametroEntrada
°°* :
{
°°; <
StrNameParameter
°°= M
=
°°N O
$str
°°P \
,
°°\ ]
TipoDato
°°^ f
=
°°g h
TipoDato
°°i q
.
°°q r
VarChar
°°r y
,
°°y z
ObjValue°°{ ƒ
=°°„ … 
obj_beneficiario°°† –
.°°– —
	str_login°°—  
.°°  ΅
ToString°°΅ ©
(°°© ª
)°°ª «
}°°¬ ­
)°°® ―
;°°― °
ds
±± 
.
±± 
ListaPEntrada
±±  
.
±±  !
Add
±±! $
(
±±$ %
new
±±& )
ParametroEntrada
±±* :
{
±±; <
StrNameParameter
±±= M
=
±±N O
$str
±±P `
,
±±` a
TipoDato
±±b j
=
±±k l
TipoDato
±±m u
.
±±u v
Integer
±±v }
,
±±} ~
ObjValue±± ‡
=±± ‰ 
obj_beneficiario±± 
.±± ›
str_id_perfil±±› ¨
.±±¨ ©
ToString±±© ±
(±±± ²
)±±² ³
}±±΄ µ
)±±¶ ·
;±±· Έ
ds
²² 
.
²² 
ListaPEntrada
²²  
.
²²  !
Add
²²! $
(
²²$ %
new
²²& )
ParametroEntrada
²²* :
{
²²; <
StrNameParameter
²²= M
=
²²N O
$str
²²P a
,
²²a b
TipoDato
²²c k
=
²²l m
TipoDato
²²n v
.
²²v w
Integer
²²w ~
,
²²~ 
ObjValue²²€ 
=²²‰  
obj_beneficiario²²‹ ›
.²²› 
str_id_oficina²² ª
.²²ª «
ToString²²« ³
(²²³ ΄
)²²΄ µ
}²²¶ ·
)²²Έ Ή
;²²Ή Ί
ds
³³ 
.
³³ 
ListaPEntrada
³³  
.
³³  !
Add
³³! $
(
³³$ %
new
³³& )
ParametroEntrada
³³* :
{
³³; <
StrNameParameter
³³= M
=
³³N O
$str
³³P e
,
³³e f
TipoDato
³³g o
=
³³p q
TipoDato
³³r z
.
³³z {
VarChar³³{ ‚
,³³‚ ƒ
ObjValue³³„ 
=³³  
obj_beneficiario³³ 
.³³  "
str_nemonico_canal³³  ²
.³³² ³
ToString³³³ »
(³³» Ό
)³³Ό ½
}³³Ύ Ώ
)³³ΐ Α
;³³Α Β
ds
΄΄ 
.
΄΄ 
ListaPEntrada
΄΄  
.
΄΄  !
Add
΄΄! $
(
΄΄$ %
new
΄΄& )
ParametroEntrada
΄΄* :
{
΄΄; <
StrNameParameter
΄΄= M
=
΄΄N O
$str
΄΄P e
,
΄΄e f
TipoDato
΄΄g o
=
΄΄p q
TipoDato
΄΄r z
.
΄΄z {
VarChar΄΄{ ‚
,΄΄‚ ƒ
ObjValue΄΄„ 
=΄΄  
obj_beneficiario΄΄ 
.΄΄  "
str_ip_dispositivo΄΄  ²
.΄΄² ³
ToString΄΄³ »
(΄΄» Ό
)΄΄Ό ½
}΄΄Ύ Ώ
)΄΄ΐ Α
;΄΄Α Β
ds
µµ 
.
µµ 
ListaPEntrada
µµ  
.
µµ  !
Add
µµ! $
(
µµ$ %
new
µµ& )
ParametroEntrada
µµ* :
{
µµ; <
StrNameParameter
µµ= M
=
µµN O
$str
µµP ]
,
µµ] ^
TipoDato
µµ_ g
=
µµh i
TipoDato
µµj r
.
µµr s
VarChar
µµs z
,
µµz {
ObjValueµµ| „
=µµ… † 
obj_beneficiarioµµ‡ —
.µµ— 

str_sesionµµ Ά
.µµΆ £
ToStringµµ£ «
(µµ« ¬
)µµ¬ ­
}µµ® ―
)µµ° ±
;µµ± ²
ds
¶¶ 
.
¶¶ 
ListaPEntrada
¶¶  
.
¶¶  !
Add
¶¶! $
(
¶¶$ %
new
¶¶& )
ParametroEntrada
¶¶* :
{
¶¶; <
StrNameParameter
¶¶= M
=
¶¶N O
$str
¶¶P f
,
¶¶f g
TipoDato
¶¶h p
=
¶¶q r
TipoDato
¶¶s {
.
¶¶{ |
VarChar¶¶| ƒ
,¶¶ƒ „
ObjValue¶¶… 
=¶¶  
obj_beneficiario¶¶  
.¶¶  ΅#
str_mac_dispositivo¶¶΅ ΄
.¶¶΄ µ
ToString¶¶µ ½
(¶¶½ Ύ
)¶¶Ύ Ώ
}¶¶ΐ Α
)¶¶Β Γ
;¶¶Γ Δ
ds
ΉΉ 
.
ΉΉ 
ListaPSalida
ΉΉ 
.
ΉΉ  
Add
ΉΉ  #
(
ΉΉ# $
new
ΉΉ% (
ParametroSalida
ΉΉ) 8
{
ΉΉ9 :
StrNameParameter
ΉΉ; K
=
ΉΉL M
$str
ΉΉN \
,
ΉΉ\ ]
TipoDato
ΉΉ^ f
=
ΉΉg h
TipoDato
ΉΉi q
.
ΉΉq r
VarChar
ΉΉr y
}
ΉΉz {
)
ΉΉ| }
;
ΉΉ} ~
ds
ΊΊ 
.
ΊΊ 
ListaPSalida
ΊΊ 
.
ΊΊ  
Add
ΊΊ  #
(
ΊΊ# $
new
ΊΊ% (
ParametroSalida
ΊΊ) 8
{
ΊΊ9 :
StrNameParameter
ΊΊ; K
=
ΊΊL M
$str
ΊΊN `
,
ΊΊ` a
TipoDato
ΊΊb j
=
ΊΊk l
TipoDato
ΊΊm u
.
ΊΊu v
Integer
ΊΊv }
}
ΊΊ~ 
)ΊΊ€ 
;ΊΊ ‚
ds
ΌΌ 
.
ΌΌ 
NombreSP
ΌΌ 
=
ΌΌ 
$str
ΌΌ ?
;
ΌΌ? @
ds
½½ 
.
½½ 
NombreBD
½½ 
=
½½ 
	_settings
½½ '
.
½½' (
BD_megservicios
½½( 7
;
½½7 8
var
ΏΏ 
	resultado
ΏΏ 
=
ΏΏ 
objClienteDal
ΏΏ  -
.
ΏΏ- .
ExecuteNonQuery
ΏΏ. =
(
ΏΏ= >
ds
ΏΏ? A
)
ΏΏB C
;
ΏΏC D
var
ΐΐ 
lst_valores
ΐΐ 
=
ΐΐ  !
new
ΐΐ" %
List
ΐΐ& *
<
ΐΐ* +$
ParametroSalidaValores
ΐΐ+ A
>
ΐΐA B
(
ΐΐB C
)
ΐΐC D
;
ΐΐD E
foreach
ΒΒ 
(
ΒΒ 
var
ΒΒ 
item
ΒΒ  
in
ΒΒ! #
	resultado
ΒΒ$ -
.
ΒΒ- .!
ListaPSalidaValores
ΒΒ. A
)
ΒΒA B
lst_valores
ΒΒC N
.
ΒΒN O
Add
ΒΒO R
(
ΒΒR S
item
ΒΒT X
)
ΒΒY Z
;
ΒΒZ [
var
ΓΓ 

str_codigo
ΓΓ 
=
ΓΓ  
lst_valores
ΓΓ! ,
.
ΓΓ, -
Find
ΓΓ- 1
(
ΓΓ1 2
x
ΓΓ3 4
=>
ΓΓ5 7
x
ΓΓ8 9
.
ΓΓ9 :
StrNameParameter
ΓΓ: J
==
ΓΓK M
$str
ΓΓN `
)
ΓΓa b
!
ΓΓb c
.
ΓΓc d
ObjValue
ΓΓd l
;
ΓΓl m
var
ΔΔ 
	str_error
ΔΔ 
=
ΔΔ 
lst_valores
ΔΔ  +
.
ΔΔ+ ,
Find
ΔΔ, 0
(
ΔΔ0 1
x
ΔΔ2 3
=>
ΔΔ4 6
x
ΔΔ7 8
.
ΔΔ8 9
StrNameParameter
ΔΔ9 I
==
ΔΔJ L
$str
ΔΔM [
)
ΔΔ\ ]
!
ΔΔ] ^
.
ΔΔ^ _
ObjValue
ΔΔ_ g
.
ΔΔg h
Trim
ΔΔh l
(
ΔΔl m
)
ΔΔm n
;
ΔΔn o
	respuesta
ΖΖ 
.
ΖΖ 
codigo
ΖΖ  
=
ΖΖ! "

str_codigo
ΖΖ# -
.
ΖΖ- .
ToString
ΖΖ. 6
(
ΖΖ6 7
)
ΖΖ7 8
.
ΖΖ8 9
Trim
ΖΖ9 =
(
ΖΖ= >
)
ΖΖ> ?
.
ΖΖ? @
PadLeft
ΖΖ@ G
(
ΖΖG H
$num
ΖΖI J
,
ΖΖJ K
$char
ΖΖL O
)
ΖΖP Q
;
ΖΖQ R
	respuesta
ΗΗ 
.
ΗΗ 
cuerpo
ΗΗ  
=
ΗΗ! "
	resultado
ΗΗ# ,
.
ΗΗ, -
NumAfectados
ΗΗ- 9
;
ΗΗ9 :
	respuesta
ΘΘ 
.
ΘΘ 
diccionario
ΘΘ %
.
ΘΘ% &
Add
ΘΘ& )
(
ΘΘ) *
$str
ΘΘ+ 6
,
ΘΘ6 7
	str_error
ΘΘ8 A
.
ΘΘA B
ToString
ΘΘB J
(
ΘΘJ K
)
ΘΘK L
)
ΘΘM N
;
ΘΘN O
}
ΚΚ 
catch
ΛΛ 
(
ΛΛ 
	Exception
ΛΛ 
	exception
ΛΛ %
)
ΛΛ% &
{
ΜΜ 
	respuesta
ΝΝ 
.
ΝΝ 
codigo
ΝΝ  
=
ΝΝ! "
$str
ΝΝ# (
;
ΝΝ( )
	respuesta
ΞΞ 
.
ΞΞ 
diccionario
ΞΞ %
.
ΞΞ% &
Add
ΞΞ& )
(
ΞΞ) *
$str
ΞΞ+ 6
,
ΞΞ6 7
	exception
ΞΞ8 A
.
ΞΞA B
ToString
ΞΞB J
(
ΞΞJ K
)
ΞΞK L
)
ΞΞM N
;
ΞΞN O
infoLog
ΠΠ 
.
ΠΠ  
str_id_transaccion
ΠΠ *
=
ΠΠ+ ,
obj_beneficiario
ΠΠ- =
.
ΠΠ= > 
str_id_transaccion
ΠΠ> P
;
ΠΠP Q
infoLog
ΡΡ 
.
ΡΡ 
str_tipo
ΡΡ  
=
ΡΡ! "
str_salida_error
ΡΡ# 3
;
ΡΡ3 4
infoLog
ÒÒ 
.
ÒÒ 

str_objeto
ÒÒ "
=
ÒÒ# $
	exception
ÒÒ% .
;
ÒÒ. /
infoLog
ΣΣ 
.
ΣΣ 

str_metodo
ΣΣ "
=
ΣΣ# $

MethodBase
ΣΣ% /
.
ΣΣ/ 0
GetCurrentMethod
ΣΣ0 @
(
ΣΣ@ A
)
ΣΣA B
!
ΣΣB C
.
ΣΣC D
Name
ΣΣD H
;
ΣΣH I
infoLog
ΤΤ 
.
ΤΤ 
str_operacion
ΤΤ %
=
ΤΤ& '
obj_beneficiario
ΤΤ( 8
.
ΤΤ8 9
str_id_servicio
ΤΤ9 H
;
ΤΤH I
LogServicios
ΦΦ 
.
ΦΦ 
RegistrarTramas
ΦΦ ,
(
ΦΦ, -
str_salida_error
ΦΦ. >
,
ΦΦ> ?
infoLog
ΦΦ@ G
,
ΦΦG H
str_ruta
ΦΦI Q
)
ΦΦR S
;
ΦΦS T
}
ΧΧ 
return
ΨΨ 
	respuesta
ΨΨ 
;
ΨΨ 
}
ΩΩ 	
public
έέ "
RespuestaTransaccion
έέ #%
get_datos_beneficiarios
έέ$ ;
(
έέ< = 
ReqGetBeneficiario
έέ> P
obj_beneficiario
έέQ a
)
έέb c
{
ήή 	"
RespuestaTransaccion
ίί  
	respuesta
ίί! *
=
ίί+ ,
new
ίί- 0"
RespuestaTransaccion
ίί1 E
(
ίίE F
)
ίίF G
;
ίίG H
try
αα 
{
ββ 
DatosSolicitud
γγ 
ds
γγ !
=
γγ" #
new
γγ$ '
DatosSolicitud
γγ( 6
(
γγ6 7
)
γγ7 8
;
γγ8 9
ds
εε 
.
εε 
ListaPEntrada
εε  
.
εε  !
Add
εε! $
(
εε$ %
new
εε& )
ParametroEntrada
εε* :
{
εε; <
StrNameParameter
εε= M
=
εεN O
$str
εεP d
,
εεd e
TipoDato
εεf n
=
εεo p
TipoDato
εεq y
.
εεy z
Integerεεz 
,εε ‚
ObjValueεεƒ ‹
=εε  
obj_beneficiarioεε 
.εε !
int_ente_registraεε °
.εε° ±
ToStringεε± Ή
(εεΉ Ί
)εεΊ »
}εεΌ ½
)εεΎ Ώ
;εεΏ ΐ
ds
θθ 
.
θθ 
ListaPEntrada
θθ  
.
θθ  !
Add
θθ! $
(
θθ$ %
new
θθ& )
ParametroEntrada
θθ* :
{
θθ; <
StrNameParameter
θθ= M
=
θθN O
$str
θθP e
,
θθe f
TipoDato
θθg o
=
θθp q
TipoDato
θθr z
.
θθz {
VarCharθθ{ ‚
,θθ‚ ƒ
ObjValueθθ„ 
=θθ  
obj_beneficiarioθθ 
.θθ  "
str_id_transaccionθθ  ²
.θθ² ³
ToStringθθ³ »
(θθ» Ό
)θθΌ ½
}θθΎ Ώ
)θθΐ Α
;θθΑ Β
ds
ιι 
.
ιι 
ListaPEntrada
ιι  
.
ιι  !
Add
ιι! $
(
ιι$ %
new
ιι& )
ParametroEntrada
ιι* :
{
ιι; <
StrNameParameter
ιι= M
=
ιιN O
$str
ιιP a
,
ιιa b
TipoDato
ιιc k
=
ιιl m
TipoDato
ιιn v
.
ιιv w
Integer
ιιw ~
,
ιι~ 
ObjValueιι€ 
=ιι‰  
obj_beneficiarioιι‹ ›
.ιι› 
str_id_sistemaιι ª
}ιι« ¬
)ιι­ ®
;ιι® ―
ds
κκ 
.
κκ 
ListaPEntrada
κκ  
.
κκ  !
Add
κκ! $
(
κκ$ %
new
κκ& )
ParametroEntrada
κκ* :
{
κκ; <
StrNameParameter
κκ= M
=
κκN O
$str
κκP \
,
κκ\ ]
TipoDato
κκ^ f
=
κκg h
TipoDato
κκi q
.
κκq r
VarChar
κκr y
,
κκy z
ObjValueκκ{ ƒ
=κκ„ … 
obj_beneficiarioκκ† –
.κκ– —
	str_loginκκ—  
.κκ  ΅
ToStringκκ΅ ©
(κκ© ª
)κκª «
}κκ¬ ­
)κκ® ―
;κκ― °
ds
λλ 
.
λλ 
ListaPEntrada
λλ  
.
λλ  !
Add
λλ! $
(
λλ$ %
new
λλ& )
ParametroEntrada
λλ* :
{
λλ; <
StrNameParameter
λλ= M
=
λλN O
$str
λλP `
,
λλ` a
TipoDato
λλb j
=
λλk l
TipoDato
λλm u
.
λλu v
Integer
λλv }
,
λλ} ~
ObjValueλλ ‡
=λλ ‰ 
obj_beneficiarioλλ 
.λλ ›
str_id_perfilλλ› ¨
.λλ¨ ©
ToStringλλ© ±
(λλ± ²
)λλ² ³
}λλ΄ µ
)λλ¶ ·
;λλ· Έ
ds
μμ 
.
μμ 
ListaPEntrada
μμ  
.
μμ  !
Add
μμ! $
(
μμ$ %
new
μμ& )
ParametroEntrada
μμ* :
{
μμ; <
StrNameParameter
μμ= M
=
μμN O
$str
μμP a
,
μμa b
TipoDato
μμc k
=
μμl m
TipoDato
μμn v
.
μμv w
Integer
μμw ~
,
μμ~ 
ObjValueμμ€ 
=μμ‰  
obj_beneficiarioμμ‹ ›
.μμ› 
str_id_oficinaμμ ª
.μμª «
ToStringμμ« ³
(μμ³ ΄
)μμ΄ µ
}μμ¶ ·
)μμΈ Ή
;μμΉ Ί
ds
νν 
.
νν 
ListaPEntrada
νν  
.
νν  !
Add
νν! $
(
νν$ %
new
νν& )
ParametroEntrada
νν* :
{
νν; <
StrNameParameter
νν= M
=
ννN O
$str
ννP e
,
ννe f
TipoDato
ννg o
=
ννp q
TipoDato
ννr z
.
ννz {
VarCharνν{ ‚
,νν‚ ƒ
ObjValueνν„ 
=νν  
obj_beneficiarioνν 
.νν  "
str_nemonico_canalνν  ²
.νν² ³
ToStringνν³ »
(νν» Ό
)ννΌ ½
}ννΎ Ώ
)ννΐ Α
;ννΑ Β
ds
ξξ 
.
ξξ 
ListaPEntrada
ξξ  
.
ξξ  !
Add
ξξ! $
(
ξξ$ %
new
ξξ& )
ParametroEntrada
ξξ* :
{
ξξ; <
StrNameParameter
ξξ= M
=
ξξN O
$str
ξξP e
,
ξξe f
TipoDato
ξξg o
=
ξξp q
TipoDato
ξξr z
.
ξξz {
VarCharξξ{ ‚
,ξξ‚ ƒ
ObjValueξξ„ 
=ξξ  
obj_beneficiarioξξ 
.ξξ  "
str_ip_dispositivoξξ  ²
.ξξ² ³
ToStringξξ³ »
(ξξ» Ό
)ξξΌ ½
}ξξΎ Ώ
)ξξΐ Α
;ξξΑ Β
ds
οο 
.
οο 
ListaPEntrada
οο  
.
οο  !
Add
οο! $
(
οο$ %
new
οο& )
ParametroEntrada
οο* :
{
οο; <
StrNameParameter
οο= M
=
οοN O
$str
οοP ]
,
οο] ^
TipoDato
οο_ g
=
οοh i
TipoDato
οοj r
.
οοr s
VarChar
οοs z
,
οοz {
ObjValueοο| „
=οο… † 
obj_beneficiarioοο‡ —
.οο— 

str_sesionοο Ά
.οοΆ £
ToStringοο£ «
(οο« ¬
)οο¬ ­
}οο® ―
)οο° ±
;οο± ²
ds
ππ 
.
ππ 
ListaPEntrada
ππ  
.
ππ  !
Add
ππ! $
(
ππ$ %
new
ππ& )
ParametroEntrada
ππ* :
{
ππ; <
StrNameParameter
ππ= M
=
ππN O
$str
ππP f
,
ππf g
TipoDato
ππh p
=
ππq r
TipoDato
ππs {
.
ππ{ |
VarCharππ| ƒ
,ππƒ „
ObjValueππ… 
=ππ  
obj_beneficiarioππ  
.ππ  ΅#
str_mac_dispositivoππ΅ ΄
.ππ΄ µ
ToStringππµ ½
(ππ½ Ύ
)ππΎ Ώ
}ππΐ Α
)ππΒ Γ
;ππΓ Δ
ds
σσ 
.
σσ 
ListaPSalida
σσ 
.
σσ  
Add
σσ  #
(
σσ# $
new
σσ% (
ParametroSalida
σσ) 8
{
σσ9 :
StrNameParameter
σσ; K
=
σσL M
$str
σσN \
,
σσ\ ]
TipoDato
σσ^ f
=
σσg h
TipoDato
σσi q
.
σσq r
VarChar
σσr y
}
σσz {
)
σσ| }
;
σσ} ~
ds
ττ 
.
ττ 
ListaPSalida
ττ 
.
ττ  
Add
ττ  #
(
ττ# $
new
ττ% (
ParametroSalida
ττ) 8
{
ττ9 :
StrNameParameter
ττ; K
=
ττL M
$str
ττN `
,
ττ` a
TipoDato
ττb j
=
ττk l
TipoDato
ττm u
.
ττu v
Integer
ττv }
}
ττ~ 
)ττ€ 
;ττ ‚
ds
φφ 
.
φφ 
NombreSP
φφ 
=
φφ 
$str
φφ 8
;
φφ8 9
ds
χχ 
.
χχ 
NombreBD
χχ 
=
χχ 
	_settings
χχ '
.
χχ' (
BD_megservicios
χχ( 7
;
χχ7 8
var
ωω 
	resultado
ωω 
=
ωω 
objClienteDal
ωω  -
.
ωω- .
ExecuteDataSet
ωω. <
(
ωω< =
ds
ωω> @
)
ωωA B
;
ωωB C
var
ϊϊ 
lst_valores
ϊϊ 
=
ϊϊ  !
new
ϊϊ" %
List
ϊϊ& *
<
ϊϊ* +$
ParametroSalidaValores
ϊϊ+ A
>
ϊϊA B
(
ϊϊB C
)
ϊϊC D
;
ϊϊD E
foreach
όό 
(
όό 
var
όό 
item
όό  
in
όό! #
	resultado
όό$ -
.
όό- .!
ListaPSalidaValores
όό. A
)
όόA B
lst_valores
όόC N
.
όόN O
Add
όόO R
(
όόR S
item
όόT X
)
όόY Z
;
όόZ [
var
ύύ 

str_codigo
ύύ 
=
ύύ  
lst_valores
ύύ! ,
.
ύύ, -
Find
ύύ- 1
(
ύύ1 2
x
ύύ3 4
=>
ύύ5 7
x
ύύ8 9
.
ύύ9 :
StrNameParameter
ύύ: J
==
ύύK M
$str
ύύN `
)
ύύa b
!
ύύb c
.
ύύc d
ObjValue
ύύd l
;
ύύl m
var
ώώ 
	str_error
ώώ 
=
ώώ 
lst_valores
ώώ  +
.
ώώ+ ,
Find
ώώ, 0
(
ώώ0 1
x
ώώ2 3
=>
ώώ4 6
x
ώώ7 8
.
ώώ8 9
StrNameParameter
ώώ9 I
==
ώώJ L
$str
ώώM [
)
ώώ\ ]
!
ώώ] ^
.
ώώ^ _
ObjValue
ώώ_ g
.
ώώg h
Trim
ώώh l
(
ώώl m
)
ώώm n
;
ώώn o
	respuesta
€€ 
.
€€ 
codigo
€€  
=
€€! "

str_codigo
€€# -
.
€€- .
ToString
€€. 6
(
€€6 7
)
€€7 8
.
€€8 9
Trim
€€9 =
(
€€= >
)
€€> ?
.
€€? @
PadLeft
€€@ G
(
€€G H
$num
€€I J
,
€€J K
$char
€€L O
)
€€P Q
;
€€Q R
	respuesta
 
.
 
cuerpo
  
=
! "
	Funciones
# ,
.
, -
ObtenerDatos
- 9
(
9 :
	resultado
; D
)
E F
;
F G
	respuesta
‚‚ 
.
‚‚ 
diccionario
‚‚ %
.
‚‚% &
Add
‚‚& )
(
‚‚) *
$str
‚‚+ 6
,
‚‚6 7
	str_error
‚‚8 A
.
‚‚A B
ToString
‚‚B J
(
‚‚J K
)
‚‚K L
)
‚‚M N
;
‚‚N O
}
„„ 
catch
…… 
(
…… 
	Exception
…… 
	exception
…… %
)
……% &
{
†† 
	respuesta
‡‡ 
.
‡‡ 
codigo
‡‡  
=
‡‡! "
$str
‡‡# (
;
‡‡( )
	respuesta
 
.
 
diccionario
 %
.
% &
Add
& )
(
) *
$str
+ 6
,
6 7
	exception
8 A
.
A B
ToString
B J
(
J K
)
K L
)
M N
;
N O
infoLog
 
.
  
str_id_transaccion
 *
=
+ ,
obj_beneficiario
- =
.
= > 
str_id_transaccion
> P
;
P Q
infoLog
‹‹ 
.
‹‹ 
str_tipo
‹‹  
=
‹‹! "
str_salida_error
‹‹# 3
;
‹‹3 4
infoLog
 
.
 

str_objeto
 "
=
# $
	exception
% .
;
. /
infoLog
 
.
 

str_metodo
 "
=
# $

MethodBase
% /
.
/ 0
GetCurrentMethod
0 @
(
@ A
)
A B
!
B C
.
C D
Name
D H
;
H I
infoLog
 
.
 
str_operacion
 %
=
& '
obj_beneficiario
( 8
.
8 9
str_id_servicio
9 H
;
H I
LogServicios
 
.
 
RegistrarTramas
 ,
(
, -
str_salida_error
. >
,
> ?
infoLog
@ G
,
G H
str_ruta
I Q
)
R S
;
S T
}
‘‘ 
return
’’ 
	respuesta
’’ 
;
’’ 
}
““ 	
public
•• "
RespuestaTransaccion
•• #,
validar_registro_beneficiarios
••$ B
(
••C D#
ReqValidaBeneficiario
••E Z
obj_beneficiario
••[ k
)
••l m
{
–– 	"
RespuestaTransaccion
——  
	respuesta
——! *
=
——+ ,
new
——- 0"
RespuestaTransaccion
——1 E
(
——E F
)
——F G
;
——G H
try
™™ 
{
 
DatosSolicitud
›› 
ds
›› !
=
››" #
new
››$ '
DatosSolicitud
››( 6
(
››6 7
)
››7 8
;
››8 9
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
& )
ParametroEntrada
* :
{
; <
StrNameParameter
= M
=
N O
$str
P a
,
a b
TipoDato
c k
=
l m
TipoDato
n v
.
v w
VarChar
w ~
,
~ 
ObjValue€ 
=‰  
obj_beneficiario‹ ›
.› 
str_codigo_ifi ª
}« ¬
)­ ®
;® ―
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
& )
ParametroEntrada
* :
{
; <
StrNameParameter
= M
=
N O
$str
P d
,
d e
TipoDato
f n
=
o p
TipoDato
q y
.
y z
Integerz 
, ‚
ObjValueƒ ‹
=  
obj_beneficiario 
. !
int_tipo_producto °
.° ±
ToString± Ή
(Ή Ί
)Ί »
}Ό ½
)Ύ Ώ
;Ώ ΐ
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
& )
ParametroEntrada
* :
{
; <
StrNameParameter
= M
=
N O
$str
P ^
,
^ _
TipoDato
` h
=
i j
TipoDato
k s
.
s t
VarChar
t {
,
{ |
ObjValue} …
=† ‡ 
obj_beneficiario 
. ™!
str_numero_cuenta™ ª
.ª «
ToString« ³
(³ ΄
)΄ µ
}¶ ·
)Έ Ή
;Ή Ί
ds
   
.
   
ListaPEntrada
    
.
    !
Add
  ! $
(
  $ %
new
  & )
ParametroEntrada
  * :
{
  ; <
StrNameParameter
  = M
=
  N O
$str
  P d
,
  d e
TipoDato
  f n
=
  o p
TipoDato
  q y
.
  y z
VarChar  z 
,   ‚
ObjValue  ƒ ‹
=    
obj_beneficiario   
.   $
str_numero_documento   ³
.  ³ ΄
ToString  ΄ Ό
(  Ό ½
)  ½ Ύ
}  Ώ ΐ
)  Α Β
;  Β Γ
ds
΅΅ 
.
΅΅ 
ListaPEntrada
΅΅  
.
΅΅  !
Add
΅΅! $
(
΅΅$ %
new
΅΅& )
ParametroEntrada
΅΅* :
{
΅΅; <
StrNameParameter
΅΅= M
=
΅΅N O
$str
΅΅P d
,
΅΅d e
TipoDato
΅΅f n
=
΅΅o p
TipoDato
΅΅q y
.
΅΅y z
Integer΅΅z 
,΅΅ ‚
ObjValue΅΅ƒ ‹
=΅΅  
obj_beneficiario΅΅ 
.΅΅ !
int_ente_registra΅΅ °
.΅΅° ±
ToString΅΅± Ή
(΅΅Ή Ί
)΅΅Ί »
}΅΅Ό ½
)΅΅Ύ Ώ
;΅΅Ώ ΐ
ds
¤¤ 
.
¤¤ 
ListaPEntrada
¤¤  
.
¤¤  !
Add
¤¤! $
(
¤¤$ %
new
¤¤& )
ParametroEntrada
¤¤* :
{
¤¤; <
StrNameParameter
¤¤= M
=
¤¤N O
$str
¤¤P e
,
¤¤e f
TipoDato
¤¤g o
=
¤¤p q
TipoDato
¤¤r z
.
¤¤z {
VarChar¤¤{ ‚
,¤¤‚ ƒ
ObjValue¤¤„ 
=¤¤  
obj_beneficiario¤¤ 
.¤¤  "
str_id_transaccion¤¤  ²
.¤¤² ³
ToString¤¤³ »
(¤¤» Ό
)¤¤Ό ½
}¤¤Ύ Ώ
)¤¤ΐ Α
;¤¤Α Β
ds
¥¥ 
.
¥¥ 
ListaPEntrada
¥¥  
.
¥¥  !
Add
¥¥! $
(
¥¥$ %
new
¥¥& )
ParametroEntrada
¥¥* :
{
¥¥; <
StrNameParameter
¥¥= M
=
¥¥N O
$str
¥¥P a
,
¥¥a b
TipoDato
¥¥c k
=
¥¥l m
TipoDato
¥¥n v
.
¥¥v w
Integer
¥¥w ~
,
¥¥~ 
ObjValue¥¥€ 
=¥¥‰  
obj_beneficiario¥¥‹ ›
.¥¥› 
str_id_sistema¥¥ ª
}¥¥« ¬
)¥¥­ ®
;¥¥® ―
ds
¦¦ 
.
¦¦ 
ListaPEntrada
¦¦  
.
¦¦  !
Add
¦¦! $
(
¦¦$ %
new
¦¦& )
ParametroEntrada
¦¦* :
{
¦¦; <
StrNameParameter
¦¦= M
=
¦¦N O
$str
¦¦P \
,
¦¦\ ]
TipoDato
¦¦^ f
=
¦¦g h
TipoDato
¦¦i q
.
¦¦q r
VarChar
¦¦r y
,
¦¦y z
ObjValue¦¦{ ƒ
=¦¦„ … 
obj_beneficiario¦¦† –
.¦¦– —
	str_login¦¦—  
.¦¦  ΅
ToString¦¦΅ ©
(¦¦© ª
)¦¦ª «
}¦¦¬ ­
)¦¦® ―
;¦¦― °
ds
§§ 
.
§§ 
ListaPEntrada
§§  
.
§§  !
Add
§§! $
(
§§$ %
new
§§& )
ParametroEntrada
§§* :
{
§§; <
StrNameParameter
§§= M
=
§§N O
$str
§§P `
,
§§` a
TipoDato
§§b j
=
§§k l
TipoDato
§§m u
.
§§u v
Integer
§§v }
,
§§} ~
ObjValue§§ ‡
=§§ ‰ 
obj_beneficiario§§ 
.§§ ›
str_id_perfil§§› ¨
.§§¨ ©
ToString§§© ±
(§§± ²
)§§² ³
}§§΄ µ
)§§¶ ·
;§§· Έ
ds
¨¨ 
.
¨¨ 
ListaPEntrada
¨¨  
.
¨¨  !
Add
¨¨! $
(
¨¨$ %
new
¨¨& )
ParametroEntrada
¨¨* :
{
¨¨; <
StrNameParameter
¨¨= M
=
¨¨N O
$str
¨¨P a
,
¨¨a b
TipoDato
¨¨c k
=
¨¨l m
TipoDato
¨¨n v
.
¨¨v w
Integer
¨¨w ~
,
¨¨~ 
ObjValue¨¨€ 
=¨¨‰  
obj_beneficiario¨¨‹ ›
.¨¨› 
str_id_oficina¨¨ ª
.¨¨ª «
ToString¨¨« ³
(¨¨³ ΄
)¨¨΄ µ
}¨¨¶ ·
)¨¨Έ Ή
;¨¨Ή Ί
ds
©© 
.
©© 
ListaPEntrada
©©  
.
©©  !
Add
©©! $
(
©©$ %
new
©©& )
ParametroEntrada
©©* :
{
©©; <
StrNameParameter
©©= M
=
©©N O
$str
©©P e
,
©©e f
TipoDato
©©g o
=
©©p q
TipoDato
©©r z
.
©©z {
VarChar©©{ ‚
,©©‚ ƒ
ObjValue©©„ 
=©©  
obj_beneficiario©© 
.©©  "
str_nemonico_canal©©  ²
.©©² ³
ToString©©³ »
(©©» Ό
)©©Ό ½
}©©Ύ Ώ
)©©ΐ Α
;©©Α Β
ds
ªª 
.
ªª 
ListaPEntrada
ªª  
.
ªª  !
Add
ªª! $
(
ªª$ %
new
ªª& )
ParametroEntrada
ªª* :
{
ªª; <
StrNameParameter
ªª= M
=
ªªN O
$str
ªªP e
,
ªªe f
TipoDato
ªªg o
=
ªªp q
TipoDato
ªªr z
.
ªªz {
VarCharªª{ ‚
,ªª‚ ƒ
ObjValueªª„ 
=ªª  
obj_beneficiarioªª 
.ªª  "
str_ip_dispositivoªª  ²
.ªª² ³
ToStringªª³ »
(ªª» Ό
)ªªΌ ½
}ªªΎ Ώ
)ªªΐ Α
;ªªΑ Β
ds
«« 
.
«« 
ListaPEntrada
««  
.
««  !
Add
««! $
(
««$ %
new
««& )
ParametroEntrada
««* :
{
««; <
StrNameParameter
««= M
=
««N O
$str
««P ]
,
««] ^
TipoDato
««_ g
=
««h i
TipoDato
««j r
.
««r s
VarChar
««s z
,
««z {
ObjValue««| „
=««… † 
obj_beneficiario««‡ —
.««— 

str_sesion«« Ά
.««Ά £
ToString««£ «
(««« ¬
)««¬ ­
}««® ―
)««° ±
;««± ²
ds
¬¬ 
.
¬¬ 
ListaPEntrada
¬¬  
.
¬¬  !
Add
¬¬! $
(
¬¬$ %
new
¬¬& )
ParametroEntrada
¬¬* :
{
¬¬; <
StrNameParameter
¬¬= M
=
¬¬N O
$str
¬¬P f
,
¬¬f g
TipoDato
¬¬h p
=
¬¬q r
TipoDato
¬¬s {
.
¬¬{ |
VarChar¬¬| ƒ
,¬¬ƒ „
ObjValue¬¬… 
=¬¬  
obj_beneficiario¬¬  
.¬¬  ΅#
str_mac_dispositivo¬¬΅ ΄
.¬¬΄ µ
ToString¬¬µ ½
(¬¬½ Ύ
)¬¬Ύ Ώ
}¬¬ΐ Α
)¬¬Β Γ
;¬¬Γ Δ
ds
―― 
.
―― 
ListaPSalida
―― 
.
――  
Add
――  #
(
――# $
new
――% (
ParametroSalida
――) 8
{
――9 :
StrNameParameter
――; K
=
――L M
$str
――N \
,
――\ ]
TipoDato
――^ f
=
――g h
TipoDato
――i q
.
――q r
VarChar
――r y
}
――z {
)
――| }
;
――} ~
ds
°° 
.
°° 
ListaPSalida
°° 
.
°°  
Add
°°  #
(
°°# $
new
°°% (
ParametroSalida
°°) 8
{
°°9 :
StrNameParameter
°°; K
=
°°L M
$str
°°N `
,
°°` a
TipoDato
°°b j
=
°°k l
TipoDato
°°m u
.
°°u v
Integer
°°v }
}
°°~ 
)°°€ 
;°° ‚
ds
²² 
.
²² 
NombreSP
²² 
=
²² 
$str
²² >
;
²²> ?
ds
³³ 
.
³³ 
NombreBD
³³ 
=
³³ 
	_settings
³³ '
.
³³' (
BD_megservicios
³³( 7
;
³³7 8
var
µµ 
	resultado
µµ 
=
µµ 
objClienteDal
µµ  -
.
µµ- .
ExecuteNonQuery
µµ. =
(
µµ= >
ds
µµ? A
)
µµB C
;
µµC D
var
¶¶ 
lst_valores
¶¶ 
=
¶¶  !
new
¶¶" %
List
¶¶& *
<
¶¶* +$
ParametroSalidaValores
¶¶+ A
>
¶¶A B
(
¶¶B C
)
¶¶C D
;
¶¶D E
foreach
ΈΈ 
(
ΈΈ 
var
ΈΈ 
item
ΈΈ  
in
ΈΈ! #
	resultado
ΈΈ$ -
.
ΈΈ- .!
ListaPSalidaValores
ΈΈ. A
)
ΈΈA B
lst_valores
ΈΈC N
.
ΈΈN O
Add
ΈΈO R
(
ΈΈR S
item
ΈΈT X
)
ΈΈY Z
;
ΈΈZ [
var
ΉΉ 

str_codigo
ΉΉ 
=
ΉΉ  
lst_valores
ΉΉ! ,
.
ΉΉ, -
Find
ΉΉ- 1
(
ΉΉ1 2
x
ΉΉ3 4
=>
ΉΉ5 7
x
ΉΉ8 9
.
ΉΉ9 :
StrNameParameter
ΉΉ: J
==
ΉΉK M
$str
ΉΉN `
)
ΉΉa b
!
ΉΉb c
.
ΉΉc d
ObjValue
ΉΉd l
;
ΉΉl m
var
ΊΊ 
	str_error
ΊΊ 
=
ΊΊ 
lst_valores
ΊΊ  +
.
ΊΊ+ ,
Find
ΊΊ, 0
(
ΊΊ0 1
x
ΊΊ2 3
=>
ΊΊ4 6
x
ΊΊ7 8
.
ΊΊ8 9
StrNameParameter
ΊΊ9 I
==
ΊΊJ L
$str
ΊΊM [
)
ΊΊ\ ]
!
ΊΊ] ^
.
ΊΊ^ _
ObjValue
ΊΊ_ g
.
ΊΊg h
Trim
ΊΊh l
(
ΊΊl m
)
ΊΊm n
;
ΊΊn o
	respuesta
ΌΌ 
.
ΌΌ 
codigo
ΌΌ  
=
ΌΌ! "

str_codigo
ΌΌ# -
.
ΌΌ- .
ToString
ΌΌ. 6
(
ΌΌ6 7
)
ΌΌ7 8
.
ΌΌ8 9
Trim
ΌΌ9 =
(
ΌΌ= >
)
ΌΌ> ?
.
ΌΌ? @
PadLeft
ΌΌ@ G
(
ΌΌG H
$num
ΌΌI J
,
ΌΌJ K
$char
ΌΌL O
)
ΌΌP Q
;
ΌΌQ R
	respuesta
½½ 
.
½½ 
cuerpo
½½  
=
½½! "
	resultado
½½# ,
.
½½, -
NumAfectados
½½- 9
;
½½9 :
	respuesta
ΎΎ 
.
ΎΎ 
diccionario
ΎΎ %
.
ΎΎ% &
Add
ΎΎ& )
(
ΎΎ) *
$str
ΎΎ+ 6
,
ΎΎ6 7
	str_error
ΎΎ8 A
.
ΎΎA B
ToString
ΎΎB J
(
ΎΎJ K
)
ΎΎK L
)
ΎΎM N
;
ΎΎN O
}
ΐΐ 
catch
ΑΑ 
(
ΑΑ 
	Exception
ΑΑ 
	exception
ΑΑ %
)
ΑΑ% &
{
ΒΒ 
	respuesta
ΓΓ 
.
ΓΓ 
codigo
ΓΓ  
=
ΓΓ! "
$str
ΓΓ# (
;
ΓΓ( )
	respuesta
ΔΔ 
.
ΔΔ 
diccionario
ΔΔ %
.
ΔΔ% &
Add
ΔΔ& )
(
ΔΔ) *
$str
ΔΔ+ 6
,
ΔΔ6 7
	exception
ΔΔ8 A
.
ΔΔA B
ToString
ΔΔB J
(
ΔΔJ K
)
ΔΔK L
)
ΔΔM N
;
ΔΔN O
infoLog
ΖΖ 
.
ΖΖ  
str_id_transaccion
ΖΖ *
=
ΖΖ+ ,
obj_beneficiario
ΖΖ- =
.
ΖΖ= > 
str_id_transaccion
ΖΖ> P
;
ΖΖP Q
infoLog
ΗΗ 
.
ΗΗ 
str_tipo
ΗΗ  
=
ΗΗ! "
str_salida_error
ΗΗ# 3
;
ΗΗ3 4
infoLog
ΘΘ 
.
ΘΘ 

str_objeto
ΘΘ "
=
ΘΘ# $
	exception
ΘΘ% .
;
ΘΘ. /
infoLog
ΙΙ 
.
ΙΙ 

str_metodo
ΙΙ "
=
ΙΙ# $

MethodBase
ΙΙ% /
.
ΙΙ/ 0
GetCurrentMethod
ΙΙ0 @
(
ΙΙ@ A
)
ΙΙA B
!
ΙΙB C
.
ΙΙC D
Name
ΙΙD H
;
ΙΙH I
infoLog
ΚΚ 
.
ΚΚ 
str_operacion
ΚΚ %
=
ΚΚ& '
obj_beneficiario
ΚΚ( 8
.
ΚΚ8 9
str_id_servicio
ΚΚ9 H
;
ΚΚH I
LogServicios
ΜΜ 
.
ΜΜ 
RegistrarTramas
ΜΜ ,
(
ΜΜ, -
str_salida_error
ΜΜ. >
,
ΜΜ> ?
infoLog
ΜΜ@ G
,
ΜΜG H
str_ruta
ΜΜI Q
)
ΜΜR S
;
ΜΜS T
}
ΝΝ 
return
ΞΞ 
	respuesta
ΞΞ 
;
ΞΞ 
}
ΟΟ 	
public
ÒÒ "
RespuestaTransaccion
ÒÒ #+
validar_benef_otras_ctas_mego
ÒÒ$ A
(
ÒÒB C 
ReqAddBeneficiario
ÒÒD V
obj_beneficiario
ÒÒW g
)
ÒÒh i
{
ΣΣ 	"
RespuestaTransaccion
ΤΤ  
	respuesta
ΤΤ! *
=
ΤΤ+ ,
new
ΤΤ- 0"
RespuestaTransaccion
ΤΤ1 E
(
ΤΤE F
)
ΤΤF G
;
ΤΤG H
try
ΦΦ 
{
ΧΧ 
DatosSolicitud
ΨΨ 
ds
ΨΨ !
=
ΨΨ" #
new
ΨΨ$ '
DatosSolicitud
ΨΨ( 6
(
ΨΨ6 7
)
ΨΨ7 8
;
ΨΨ8 9
ds
ΪΪ 
.
ΪΪ 
ListaPEntrada
ΪΪ  
.
ΪΪ  !
Add
ΪΪ! $
(
ΪΪ$ %
new
ΪΪ& )
ParametroEntrada
ΪΪ* :
{
ΪΪ; <
StrNameParameter
ΪΪ= M
=
ΪΪN O
$str
ΪΪP ^
,
ΪΪ^ _
TipoDato
ΪΪ` h
=
ΪΪi j
TipoDato
ΪΪk s
.
ΪΪs t
VarChar
ΪΪt {
,
ΪΪ{ |
ObjValueΪΪ} …
=ΪΪ† ‡ 
obj_beneficiarioΪΪ 
.ΪΪ ™!
str_numero_cuentaΪΪ™ ª
}ΪΪ« ¬
)ΪΪ­ ®
;ΪΪ® ―
ds
ΫΫ 
.
ΫΫ 
ListaPEntrada
ΫΫ  
.
ΫΫ  !
Add
ΫΫ! $
(
ΫΫ$ %
new
ΫΫ& )
ParametroEntrada
ΫΫ* :
{
ΫΫ; <
StrNameParameter
ΫΫ= M
=
ΫΫN O
$str
ΫΫP d
,
ΫΫd e
TipoDato
ΫΫf n
=
ΫΫo p
TipoDato
ΫΫq y
.
ΫΫy z
VarCharΫΫz 
,ΫΫ ‚
ObjValueΫΫƒ ‹
=ΫΫ  
obj_beneficiarioΫΫ 
.ΫΫ !
int_ente_registraΫΫ °
.ΫΫ° ±
ToStringΫΫ± Ή
(ΫΫΉ Ί
)ΫΫΊ »
}ΫΫΌ ½
)ΫΫΎ Ώ
;ΫΫΏ ΐ
ds
ήή 
.
ήή 
ListaPEntrada
ήή  
.
ήή  !
Add
ήή! $
(
ήή$ %
new
ήή& )
ParametroEntrada
ήή* :
{
ήή; <
StrNameParameter
ήή= M
=
ήήN O
$str
ήήP ^
,
ήή^ _
TipoDato
ήή` h
=
ήήi j
TipoDato
ήήk s
.
ήήs t
VarChar
ήήt {
,
ήή{ |
ObjValueήή} …
=ήή† ‡ 
obj_beneficiarioήή 
.ήή ™
str_id_sistemaήή™ §
}ήή¨ ©
)ήήª «
;ήή« ¬
ds
ίί 
.
ίί 
ListaPEntrada
ίί  
.
ίί  !
Add
ίί! $
(
ίί$ %
new
ίί& )
ParametroEntrada
ίί* :
{
ίί; <
StrNameParameter
ίί= M
=
ίίN O
$str
ίίP a
,
ίίa b
TipoDato
ίίc k
=
ίίl m
TipoDato
ίίn v
.
ίίv w
VarChar
ίίw ~
,
ίί~ 
ObjValueίί€ 
=ίί‰  
obj_beneficiarioίί‹ ›
.ίί› 

str_sesionίί ¦
.ίί¦ §
ToStringίί§ ―
(ίί― °
)ίί° ±
}ίί² ³
)ίί΄ µ
;ίίµ ¶
ds
ΰΰ 
.
ΰΰ 
ListaPEntrada
ΰΰ  
.
ΰΰ  !
Add
ΰΰ! $
(
ΰΰ$ %
new
ΰΰ& )
ParametroEntrada
ΰΰ* :
{
ΰΰ; <
StrNameParameter
ΰΰ= M
=
ΰΰN O
$str
ΰΰP ^
,
ΰΰ^ _
TipoDato
ΰΰ` h
=
ΰΰi j
TipoDato
ΰΰk s
.
ΰΰs t
VarChar
ΰΰt {
,
ΰΰ{ |
ObjValueΰΰ} …
=ΰΰ† ‡ 
obj_beneficiarioΰΰ 
.ΰΰ ™
	str_loginΰΰ™ Ά
.ΰΰΆ £
ToStringΰΰ£ «
(ΰΰ« ¬
)ΰΰ¬ ­
}ΰΰ® ―
)ΰΰ° ±
;ΰΰ± ²
ds
αα 
.
αα 
ListaPEntrada
αα  
.
αα  !
Add
αα! $
(
αα$ %
new
αα& )
ParametroEntrada
αα* :
{
αα; <
StrNameParameter
αα= M
=
ααN O
$str
ααP ^
,
αα^ _
TipoDato
αα` h
=
ααi j
TipoDato
ααk s
.
ααs t
Integer
ααt {
,
αα{ |
ObjValueαα} …
=αα† ‡ 
obj_beneficiarioαα 
.αα ™
str_id_oficinaαα™ §
.αα§ ¨
ToStringαα¨ °
(αα° ±
)αα± ²
}αα³ ΄
)ααµ ¶
;αα¶ ·
ds
ββ 
.
ββ 
ListaPEntrada
ββ  
.
ββ  !
Add
ββ! $
(
ββ$ %
new
ββ& )
ParametroEntrada
ββ* :
{
ββ; <
StrNameParameter
ββ= M
=
ββN O
$str
ββP \
,
ββ\ ]
TipoDato
ββ^ f
=
ββg h
TipoDato
ββi q
.
ββq r
VarChar
ββr y
,
ββy z
ObjValueββ{ ƒ
=ββ„ … 
obj_beneficiarioββ† –
.ββ– —"
str_nemonico_canalββ— ©
.ββ© ª
ToStringββª ²
(ββ² ³
)ββ³ ΄
}ββµ ¶
)ββ· Έ
;ββΈ Ή
ds
γγ 
.
γγ 
ListaPEntrada
γγ  
.
γγ  !
Add
γγ! $
(
γγ$ %
new
γγ& )
ParametroEntrada
γγ* :
{
γγ; <
StrNameParameter
γγ= M
=
γγN O
$str
γγP Y
,
γγY Z
TipoDato
γγ[ c
=
γγd e
TipoDato
γγf n
.
γγn o
VarChar
γγo v
,
γγv w
ObjValueγγx €
=γγ ‚ 
obj_beneficiarioγγƒ “
.γγ“ ”"
str_ip_dispositivoγγ” ¦
.γγ¦ §
ToStringγγ§ ―
(γγ― °
)γγ° ±
}γγ² ³
)γγ΄ µ
;γγµ ¶
ds
δδ 
.
δδ 
ListaPEntrada
δδ  
.
δδ  !
Add
δδ! $
(
δδ$ %
new
δδ& )
ParametroEntrada
δδ* :
{
δδ; <
StrNameParameter
δδ= M
=
δδN O
$str
δδP Z
,
δδZ [
TipoDato
δδ\ d
=
δδe f
TipoDato
δδg o
.
δδo p
VarChar
δδp w
,
δδw x
ObjValueδδy 
=δδ‚ ƒ 
obj_beneficiarioδδ„ ”
.δδ” •#
str_mac_dispositivoδδ• ¨
.δδ¨ ©
ToStringδδ© ±
(δδ± ²
)δδ² ³
}δδ΄ µ
)δδ¶ ·
;δδ· Έ
ds
ζζ 
.
ζζ 
ListaPSalida
ζζ 
.
ζζ  
Add
ζζ  #
(
ζζ# $
new
ζζ% (
ParametroSalida
ζζ) 8
{
ζζ9 :
StrNameParameter
ζζ; K
=
ζζL M
$str
ζζN V
,
ζζV W
TipoDato
ζζX `
=
ζζa b
TipoDato
ζζc k
.
ζζk l
VarChar
ζζl s
}
ζζt u
)
ζζv w
;
ζζw x
ds
ηη 
.
ηη 
ListaPSalida
ηη 
.
ηη  
Add
ηη  #
(
ηη# $
new
ηη% (
ParametroSalida
ηη) 8
{
ηη9 :
StrNameParameter
ηη; K
=
ηηL M
$str
ηηN Z
,
ηηZ [
TipoDato
ηη\ d
=
ηηe f
TipoDato
ηηg o
.
ηηo p
Integer
ηηp w
}
ηηx y
)
ηηz {
;
ηη{ |
ds
ιι 
.
ιι 
NombreSP
ιι 
=
ιι 
$str
ιι =
;
ιι= >
ds
κκ 
.
κκ 
NombreBD
κκ 
=
κκ 
	_settings
κκ '
.
κκ' (
BD_megservicios
κκ( 7
;
κκ7 8
var
μμ 
	resultado
μμ 
=
μμ 
objClienteDal
μμ  -
.
μμ- .
ExecuteDataSet
μμ. <
(
μμ< =
ds
μμ> @
)
μμA B
;
μμB C
var
νν 
lst_valores
νν 
=
νν  !
new
νν" %
List
νν& *
<
νν* +$
ParametroSalidaValores
νν+ A
>
ννA B
(
ννB C
)
ννC D
;
ννD E
foreach
οο 
(
οο 
var
οο 
item
οο  
in
οο! #
	resultado
οο$ -
.
οο- .!
ListaPSalidaValores
οο. A
)
οοA B
lst_valores
οοC N
.
οοN O
Add
οοO R
(
οοR S
item
οοT X
)
οοY Z
;
οοZ [
var
ππ 

str_codigo
ππ 
=
ππ  
lst_valores
ππ! ,
.
ππ, -
Find
ππ- 1
(
ππ1 2
x
ππ3 4
=>
ππ5 7
x
ππ8 9
.
ππ9 :
StrNameParameter
ππ: J
==
ππK M
$str
ππN Z
)
ππ[ \
!
ππ\ ]
.
ππ] ^
ObjValue
ππ^ f
;
ππf g
var
ρρ 
	str_error
ρρ 
=
ρρ 
lst_valores
ρρ  +
.
ρρ+ ,
Find
ρρ, 0
(
ρρ0 1
x
ρρ2 3
=>
ρρ4 6
x
ρρ7 8
.
ρρ8 9
StrNameParameter
ρρ9 I
==
ρρJ L
$str
ρρM U
)
ρρV W
!
ρρW X
.
ρρX Y
ObjValue
ρρY a
.
ρρa b
Trim
ρρb f
(
ρρf g
)
ρρg h
;
ρρh i
	respuesta
σσ 
.
σσ 
codigo
σσ  
=
σσ! "

str_codigo
σσ# -
.
σσ- .
ToString
σσ. 6
(
σσ6 7
)
σσ7 8
.
σσ8 9
Trim
σσ9 =
(
σσ= >
)
σσ> ?
.
σσ? @
PadLeft
σσ@ G
(
σσG H
$num
σσI J
,
σσJ K
$char
σσL O
)
σσP Q
;
σσQ R
	respuesta
ττ 
.
ττ 
cuerpo
ττ  
=
ττ! "
	Funciones
ττ# ,
.
ττ, -
ObtenerDatos
ττ- 9
(
ττ9 :
	resultado
ττ; D
)
ττE F
;
ττF G
	respuesta
υυ 
.
υυ 
diccionario
υυ %
.
υυ% &
Add
υυ& )
(
υυ) *
$str
υυ+ 6
,
υυ6 7
	str_error
υυ8 A
.
υυA B
ToString
υυB J
(
υυJ K
)
υυK L
)
υυM N
;
υυN O
}
χχ 
catch
ψψ 
(
ψψ 
	Exception
ψψ 
	exception
ψψ %
)
ψψ% &
{
ωω 
	respuesta
ϊϊ 
.
ϊϊ 
codigo
ϊϊ  
=
ϊϊ! "
$str
ϊϊ# (
;
ϊϊ( )
	respuesta
ϋϋ 
.
ϋϋ 
diccionario
ϋϋ %
.
ϋϋ% &
Add
ϋϋ& )
(
ϋϋ) *
$str
ϋϋ+ 6
,
ϋϋ6 7
	exception
ϋϋ8 A
.
ϋϋA B
ToString
ϋϋB J
(
ϋϋJ K
)
ϋϋK L
)
ϋϋM N
;
ϋϋN O
infoLog
ύύ 
.
ύύ  
str_id_transaccion
ύύ *
=
ύύ+ ,
obj_beneficiario
ύύ- =
.
ύύ= > 
str_id_transaccion
ύύ> P
;
ύύP Q
infoLog
ώώ 
.
ώώ 
str_tipo
ώώ  
=
ώώ! "
str_salida_error
ώώ# 3
;
ώώ3 4
infoLog
ÿÿ 
.
ÿÿ 

str_objeto
ÿÿ "
=
ÿÿ# $
	exception
ÿÿ% .
;
ÿÿ. /
infoLog
€€ 
.
€€ 

str_metodo
€€ "
=
€€# $

MethodBase
€€% /
.
€€/ 0
GetCurrentMethod
€€0 @
(
€€@ A
)
€€A B
!
€€B C
.
€€C D
Name
€€D H
;
€€H I
infoLog
 
.
 
str_operacion
 %
=
& '
obj_beneficiario
( 8
.
8 9
str_id_servicio
9 H
;
H I
LogServicios
ƒƒ 
.
ƒƒ 
RegistrarTramas
ƒƒ ,
(
ƒƒ, -
str_salida_error
ƒƒ. >
,
ƒƒ> ?
infoLog
ƒƒ@ G
,
ƒƒG H
str_ruta
ƒƒI Q
)
ƒƒR S
;
ƒƒS T
}
„„ 
return
…… 
	respuesta
…… 
;
…… 
}
†† 	
public
 "
RespuestaTransaccion
 ##
get_ctas_beneficiario
$ 9
(
: ;$
ReqCuentasBeneficiario
< R
obj_beneficiario
S c
)
d e
{
‰‰ 	"
RespuestaTransaccion
  
	respuesta
! *
=
+ ,
new
- 0"
RespuestaTransaccion
1 E
(
E F
)
F G
;
G H
try
 
{
 
DatosSolicitud
 
ds
 !
=
" #
new
$ '
DatosSolicitud
( 6
(
6 7
)
7 8
;
8 9
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
& )
ParametroEntrada
* :
{
; <
StrNameParameter
= M
=
N O
$str
P [
,
[ \
TipoDato
] e
=
f g
TipoDato
h p
.
p q
Integer
q x
,
x y
ObjValuez ‚
=ƒ „ 
obj_beneficiario… •
.• –
int_ente– 
. 
ToString §
(§ ¨
)¨ ©
}ª «
)¬ ­
;­ ®
ds
‘‘ 
.
‘‘ 
ListaPEntrada
‘‘  
.
‘‘  !
Add
‘‘! $
(
‘‘$ %
new
‘‘& )
ParametroEntrada
‘‘* :
{
‘‘; <
StrNameParameter
‘‘= M
=
‘‘N O
$str
‘‘P n
,
‘‘n o
TipoDato
‘‘p x
=
‘‘y z
TipoDato‘‘{ ƒ
.‘‘ƒ „
VarChar‘‘„ ‹
,‘‘‹ 
ObjValue‘‘ •
=‘‘– — 
obj_beneficiario‘‘ ¨
.‘‘¨ ©/
str_nemonico_tipo_transferencia‘‘© Θ
.‘‘Θ Ι
ToString‘‘Ι Ρ
(‘‘Ρ Ò
)‘‘Ò Σ
}‘‘Τ Υ
)‘‘Φ Χ
;‘‘Χ Ψ
ds
”” 
.
”” 
ListaPEntrada
””  
.
””  !
Add
””! $
(
””$ %
new
””& )
ParametroEntrada
””* :
{
””; <
StrNameParameter
””= M
=
””N O
$str
””P e
,
””e f
TipoDato
””g o
=
””p q
TipoDato
””r z
.
””z {
VarChar””{ ‚
,””‚ ƒ
ObjValue””„ 
=””  
obj_beneficiario”” 
.””  "
str_id_transaccion””  ²
.””² ³
ToString””³ »
(””» Ό
)””Ό ½
}””Ύ Ώ
)””ΐ Α
;””Α Β
ds
•• 
.
•• 
ListaPEntrada
••  
.
••  !
Add
••! $
(
••$ %
new
••& )
ParametroEntrada
••* :
{
••; <
StrNameParameter
••= M
=
••N O
$str
••P a
,
••a b
TipoDato
••c k
=
••l m
TipoDato
••n v
.
••v w
Integer
••w ~
,
••~ 
ObjValue••€ 
=••‰  
obj_beneficiario••‹ ›
.••› 
str_id_sistema•• ª
}••« ¬
)••­ ®
;••® ―
ds
–– 
.
–– 
ListaPEntrada
––  
.
––  !
Add
––! $
(
––$ %
new
––& )
ParametroEntrada
––* :
{
––; <
StrNameParameter
––= M
=
––N O
$str
––P \
,
––\ ]
TipoDato
––^ f
=
––g h
TipoDato
––i q
.
––q r
VarChar
––r y
,
––y z
ObjValue––{ ƒ
=––„ … 
obj_beneficiario––† –
.––– —
	str_login––—  
.––  ΅
ToString––΅ ©
(––© ª
)––ª «
}––¬ ­
)––® ―
;––― °
ds
—— 
.
—— 
ListaPEntrada
——  
.
——  !
Add
——! $
(
——$ %
new
——& )
ParametroEntrada
——* :
{
——; <
StrNameParameter
——= M
=
——N O
$str
——P `
,
——` a
TipoDato
——b j
=
——k l
TipoDato
——m u
.
——u v
Integer
——v }
,
——} ~
ObjValue—— ‡
=—— ‰ 
obj_beneficiario—— 
.—— ›
str_id_perfil——› ¨
.——¨ ©
ToString——© ±
(——± ²
)——² ³
}——΄ µ
)——¶ ·
;——· Έ
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
& )
ParametroEntrada
* :
{
; <
StrNameParameter
= M
=
N O
$str
P a
,
a b
TipoDato
c k
=
l m
TipoDato
n v
.
v w
Integer
w ~
,
~ 
ObjValue€ 
=‰  
obj_beneficiario‹ ›
.› 
str_id_oficina ª
.ª «
ToString« ³
(³ ΄
)΄ µ
}¶ ·
)Έ Ή
;Ή Ί
ds
™™ 
.
™™ 
ListaPEntrada
™™  
.
™™  !
Add
™™! $
(
™™$ %
new
™™& )
ParametroEntrada
™™* :
{
™™; <
StrNameParameter
™™= M
=
™™N O
$str
™™P e
,
™™e f
TipoDato
™™g o
=
™™p q
TipoDato
™™r z
.
™™z {
VarChar™™{ ‚
,™™‚ ƒ
ObjValue™™„ 
=™™  
obj_beneficiario™™ 
.™™  "
str_nemonico_canal™™  ²
.™™² ³
ToString™™³ »
(™™» Ό
)™™Ό ½
}™™Ύ Ώ
)™™ΐ Α
;™™Α Β
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
& )
ParametroEntrada
* :
{
; <
StrNameParameter
= M
=
N O
$str
P e
,
e f
TipoDato
g o
=
p q
TipoDato
r z
.
z {
VarChar{ ‚
,‚ ƒ
ObjValue„ 
=  
obj_beneficiario 
.  "
str_ip_dispositivo  ²
.² ³
ToString³ »
(» Ό
)Ό ½
}Ύ Ώ
)ΐ Α
;Α Β
ds
›› 
.
›› 
ListaPEntrada
››  
.
››  !
Add
››! $
(
››$ %
new
››& )
ParametroEntrada
››* :
{
››; <
StrNameParameter
››= M
=
››N O
$str
››P ]
,
››] ^
TipoDato
››_ g
=
››h i
TipoDato
››j r
.
››r s
VarChar
››s z
,
››z {
ObjValue››| „
=››… † 
obj_beneficiario››‡ —
.››— 

str_sesion›› Ά
.››Ά £
ToString››£ «
(››« ¬
)››¬ ­
}››® ―
)››° ±
;››± ²
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
& )
ParametroEntrada
* :
{
; <
StrNameParameter
= M
=
N O
$str
P f
,
f g
TipoDato
h p
=
q r
TipoDato
s {
.
{ |
VarChar| ƒ
,ƒ „
ObjValue… 
=  
obj_beneficiario  
.  ΅#
str_mac_dispositivo΅ ΄
.΄ µ
ToStringµ ½
(½ Ύ
)Ύ Ώ
}ΐ Α
)Β Γ
;Γ Δ
ds
 
.
 
ListaPSalida
 
.
  
Add
  #
(
# $
new
% (
ParametroSalida
) 8
{
9 :
StrNameParameter
; K
=
L M
$str
N \
,
\ ]
TipoDato
^ f
=
g h
TipoDato
i q
.
q r
VarChar
r y
}
z {
)
| }
;
} ~
ds
   
.
   
ListaPSalida
   
.
    
Add
    #
(
  # $
new
  % (
ParametroSalida
  ) 8
{
  9 :
StrNameParameter
  ; K
=
  L M
$str
  N `
,
  ` a
TipoDato
  b j
=
  k l
TipoDato
  m u
.
  u v
Integer
  v }
}
  ~ 
)  € 
;   ‚
ds
ΆΆ 
.
ΆΆ 
NombreSP
ΆΆ 
=
ΆΆ 
$str
ΆΆ 5
;
ΆΆ5 6
ds
££ 
.
££ 
NombreBD
££ 
=
££ 
	_settings
££ '
.
££' (
BD_megservicios
££( 7
;
££7 8
var
¥¥ 
	resultado
¥¥ 
=
¥¥ 
objClienteDal
¥¥  -
.
¥¥- .
ExecuteDataSet
¥¥. <
(
¥¥< =
ds
¥¥> @
)
¥¥A B
;
¥¥B C
var
¦¦ 
lst_valores
¦¦ 
=
¦¦  !
new
¦¦" %
List
¦¦& *
<
¦¦* +$
ParametroSalidaValores
¦¦+ A
>
¦¦A B
(
¦¦B C
)
¦¦C D
;
¦¦D E
foreach
¨¨ 
(
¨¨ 
var
¨¨ 
item
¨¨  
in
¨¨! #
	resultado
¨¨$ -
.
¨¨- .!
ListaPSalidaValores
¨¨. A
)
¨¨A B
lst_valores
¨¨C N
.
¨¨N O
Add
¨¨O R
(
¨¨R S
item
¨¨T X
)
¨¨Y Z
;
¨¨Z [
var
©© 

str_codigo
©© 
=
©©  
lst_valores
©©! ,
.
©©, -
Find
©©- 1
(
©©1 2
x
©©3 4
=>
©©5 7
x
©©8 9
.
©©9 :
StrNameParameter
©©: J
==
©©K M
$str
©©N `
)
©©a b
!
©©b c
.
©©c d
ObjValue
©©d l
;
©©l m
var
ªª 
	str_error
ªª 
=
ªª 
lst_valores
ªª  +
.
ªª+ ,
Find
ªª, 0
(
ªª0 1
x
ªª2 3
=>
ªª4 6
x
ªª7 8
.
ªª8 9
StrNameParameter
ªª9 I
==
ªªJ L
$str
ªªM [
)
ªª\ ]
!
ªª] ^
.
ªª^ _
ObjValue
ªª_ g
.
ªªg h
Trim
ªªh l
(
ªªl m
)
ªªm n
;
ªªn o
	respuesta
¬¬ 
.
¬¬ 
codigo
¬¬  
=
¬¬! "

str_codigo
¬¬# -
.
¬¬- .
ToString
¬¬. 6
(
¬¬6 7
)
¬¬7 8
.
¬¬8 9
Trim
¬¬9 =
(
¬¬= >
)
¬¬> ?
.
¬¬? @
PadLeft
¬¬@ G
(
¬¬G H
$num
¬¬I J
,
¬¬J K
$char
¬¬L O
)
¬¬P Q
;
¬¬Q R
	respuesta
­­ 
.
­­ 
cuerpo
­­  
=
­­! "
	Funciones
­­# ,
.
­­, -
ObtenerDatos
­­- 9
(
­­9 :
	resultado
­­; D
)
­­E F
;
­­F G
	respuesta
®® 
.
®® 
diccionario
®® %
.
®®% &
Add
®®& )
(
®®) *
$str
®®+ 6
,
®®6 7
	str_error
®®8 A
.
®®A B
ToString
®®B J
(
®®J K
)
®®K L
)
®®M N
;
®®N O
}
°° 
catch
±± 
(
±± 
	Exception
±± 
	exception
±± %
)
±±% &
{
²² 
	respuesta
³³ 
.
³³ 
codigo
³³  
=
³³! "
$str
³³# (
;
³³( )
	respuesta
΄΄ 
.
΄΄ 
diccionario
΄΄ %
.
΄΄% &
Add
΄΄& )
(
΄΄) *
$str
΄΄+ 6
,
΄΄6 7
	exception
΄΄8 A
.
΄΄A B
ToString
΄΄B J
(
΄΄J K
)
΄΄K L
)
΄΄M N
;
΄΄N O
infoLog
¶¶ 
.
¶¶  
str_id_transaccion
¶¶ *
=
¶¶+ ,
obj_beneficiario
¶¶- =
.
¶¶= > 
str_id_transaccion
¶¶> P
;
¶¶P Q
infoLog
·· 
.
·· 
str_tipo
··  
=
··! "
str_salida_error
··# 3
;
··3 4
infoLog
ΈΈ 
.
ΈΈ 

str_objeto
ΈΈ "
=
ΈΈ# $
	exception
ΈΈ% .
;
ΈΈ. /
infoLog
ΉΉ 
.
ΉΉ 

str_metodo
ΉΉ "
=
ΉΉ# $

MethodBase
ΉΉ% /
.
ΉΉ/ 0
GetCurrentMethod
ΉΉ0 @
(
ΉΉ@ A
)
ΉΉA B
!
ΉΉB C
.
ΉΉC D
Name
ΉΉD H
;
ΉΉH I
infoLog
ΊΊ 
.
ΊΊ 
str_operacion
ΊΊ %
=
ΊΊ& '
obj_beneficiario
ΊΊ( 8
.
ΊΊ8 9
str_id_servicio
ΊΊ9 H
;
ΊΊH I
LogServicios
ΌΌ 
.
ΌΌ 
RegistrarTramas
ΌΌ ,
(
ΌΌ, -
str_salida_error
ΌΌ. >
,
ΌΌ> ?
infoLog
ΌΌ@ G
,
ΌΌG H
str_ruta
ΌΌI Q
)
ΌΌR S
;
ΌΌS T
}
½½ 
return
ΎΎ 
	respuesta
ΎΎ 
;
ΎΎ 
}
ΏΏ 	
}
ΐΐ 
}ΑΑ ¨
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
ListaTablas	} 
[
 ‰
k
‰ 
]
 ‹
.
‹ 

ListaFilas
 –
[
– —
i
— 
]
 ™
.
™ 
ListaColumnas
 §
[
§ ¨
j
¨ ©
]
© ª
.
ª «
Valor
« °
)
° ±
;
± ²
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
}(( νύ
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
€€ 	
public
‚‚ "
RespuestaTransaccion
‚‚ #"
GuardarAmenazasMongo
‚‚$ 8
(
‚‚9 :!
ValidacionInyeccion
‚‚; N
obj_respuesta
‚‚O \
)
‚‚] ^
{
ƒƒ 	
var
„„ 
	respuesta
„„ 
=
„„ 
new
„„ "
RespuestaTransaccion
„„  4
(
„„4 5
)
„„5 6
;
„„6 7
var
…… 
ds
…… 
=
…… 
new
…… 
DatosSolicitud
…… '
(
……' (
)
……( )
;
……) *
try
†† 
{
‡‡ 
String
‰‰ 
ser_cabecera
‰‰ #
=
‰‰$ %
JsonSerializer
‰‰& 4
.
‰‰4 5
	Serialize
‰‰5 >
(
‰‰> ?
obj_respuesta
‰‰@ M
)
‰‰N O
;
‰‰O P
ds
 
.
 
	StrNameBD
 
=
 
str_servicio
 +
;
+ ,
ds
‹‹ 
.
‹‹ 
NombreColeccion
‹‹ "
=
‹‹# $
$str
‹‹% /
;
‹‹/ 0
ds
 
.
 
Filter
 
=
 
String
 "
.
" #
Empty
# (
;
( )
ds
 
.
 
SolTran
 
=
 
ser_cabecera
 )
;
) *
DatosRespuesta
 
res
 "
=
# $
objClienteMongo
% 4
.
4 5 
insertar_documento
5 G
(
G H
ds
I K
)
L M
;
M N
	respuesta
 
.
 
codigo
  
=
! "
$str
# (
;
( )
	respuesta
‘‘ 
.
‘‘ 
cuerpo
‘‘  
=
‘‘! "
res
‘‘# &
.
‘‘& '
Mensaje
‘‘' .
;
‘‘. /
}
’’ 
catch
““ 
(
““ 
	Exception
““ 
ex
““ 
)
““ 
{
”” 
	respuesta
•• 
.
•• 
codigo
••  
=
••! "
$str
••# (
;
••( )
	respuesta
–– 
.
–– 
diccionario
–– %
.
––% &
Add
––& )
(
––) *
$str
––+ 6
,
––6 7
ex
––8 :
.
––: ;
ToString
––; C
(
––C D
)
––D E
)
––F G
;
––G H
}
—— 
return
™™ 
	respuesta
™™ 
;
™™ 
}
 	
public
 "
RespuestaTransaccion
 #'
buscar_peticiones_diarias
$ =
(
> ?
string
@ F
filtro
G M
)
N O
{
 	
var
 
	respuesta
 
=
 
new
 "
RespuestaTransaccion
  4
(
4 5
)
5 6
;
6 7
var
   
ds
   
=
   
new
   
DatosSolicitud
   '
(
  ' (
)
  ( )
;
  ) *
try
΅΅ 
{
ΆΆ 
ds
££ 
.
££ 
	StrNameBD
££ 
=
££ 
str_servicio
££ +
;
££+ ,
ds
¤¤ 
.
¤¤ 
NombreColeccion
¤¤ "
=
¤¤# $
$str
¤¤% 9
;
¤¤9 :
ds
¥¥ 
.
¥¥ 
Filter
¥¥ 
=
¥¥ 
filtro
¥¥ "
;
¥¥" #
ds
¦¦ 
.
¦¦ 
SolTran
¦¦ 
=
¦¦ 
String
¦¦ #
.
¦¦# $
Empty
¦¦$ )
;
¦¦) *
DatosRespuesta
¨¨ 
res
¨¨ "
=
¨¨# $
objClienteMongo
¨¨% 4
.
¨¨4 5
buscar_documentos
¨¨5 F
(
¨¨F G
ds
¨¨H J
)
¨¨K L
;
¨¨L M
	respuesta
ªª 
.
ªª 
codigo
ªª  
=
ªª! "
$str
ªª# (
;
ªª( )
	respuesta
«« 
.
«« 
cuerpo
««  
=
««! "
res
««# &
.
««& '
Mensaje
««' .
;
««. /
}
¬¬ 
catch
­­ 
(
­­ 
	Exception
­­ 
ex
­­ 
)
­­ 
{
―― 
	respuesta
°° 
.
°° 
codigo
°°  
=
°°! "
$str
°°# (
;
°°( )
	respuesta
±± 
.
±± 
diccionario
±± %
.
±±% &
Add
±±& )
(
±±) *
$str
±±+ 6
,
±±6 7
ex
±±8 :
.
±±: ;
ToString
±±; C
(
±±C D
)
±±D E
)
±±F G
;
±±G H
}
²² 
return
³³ 
	respuesta
³³ 
;
³³ 
}
΄΄ 	
public
¶¶ "
RespuestaTransaccion
¶¶ #%
guardar_peticion_diaria
¶¶$ ;
(
¶¶< =
string
¶¶> D
filtro
¶¶E K
,
¶¶K L
object
¶¶M S
peticion
¶¶T \
)
¶¶] ^
{
·· 	
var
ΈΈ 
	respuesta
ΈΈ 
=
ΈΈ 
new
ΈΈ "
RespuestaTransaccion
ΈΈ  4
(
ΈΈ4 5
)
ΈΈ5 6
;
ΈΈ6 7
var
ΉΉ 
ds
ΉΉ 
=
ΉΉ 
new
ΉΉ 
DatosSolicitud
ΉΉ '
(
ΉΉ' (
)
ΉΉ( )
;
ΉΉ) *
try
ΊΊ 
{
»» 
String
½½ 
ser_cabecera
½½ #
=
½½$ %
JsonSerializer
½½& 4
.
½½4 5
	Serialize
½½5 >
(
½½> ?
peticion
½½@ H
)
½½I J
;
½½J K
ds
ΎΎ 
.
ΎΎ 
	StrNameBD
ΎΎ 
=
ΎΎ 
str_servicio
ΎΎ +
;
ΎΎ+ ,
ds
ΏΏ 
.
ΏΏ 
NombreColeccion
ΏΏ "
=
ΏΏ# $
$str
ΏΏ% 9
;
ΏΏ9 :
ds
ΐΐ 
.
ΐΐ 
Filter
ΐΐ 
=
ΐΐ 
filtro
ΐΐ "
;
ΐΐ" #
ds
ΑΑ 
.
ΑΑ 
SolTran
ΑΑ 
=
ΑΑ 
ser_cabecera
ΑΑ )
;
ΑΑ) *
DatosRespuesta
ΓΓ 
res
ΓΓ "
=
ΓΓ# $
objClienteMongo
ΓΓ% 4
.
ΓΓ4 5 
insertar_documento
ΓΓ5 G
(
ΓΓG H
ds
ΓΓI K
)
ΓΓL M
;
ΓΓM N
	respuesta
ΕΕ 
.
ΕΕ 
codigo
ΕΕ  
=
ΕΕ! "
$str
ΕΕ# (
;
ΕΕ( )
	respuesta
ΖΖ 
.
ΖΖ 
cuerpo
ΖΖ  
=
ΖΖ! "
res
ΖΖ# &
.
ΖΖ& '
Mensaje
ΖΖ' .
;
ΖΖ. /
}
ΗΗ 
catch
ΘΘ 
(
ΘΘ 
	Exception
ΘΘ 
ex
ΘΘ 
)
ΘΘ 
{
ΚΚ 
	respuesta
ΛΛ 
.
ΛΛ 
codigo
ΛΛ  
=
ΛΛ! "
$str
ΛΛ# (
;
ΛΛ( )
	respuesta
ΜΜ 
.
ΜΜ 
diccionario
ΜΜ %
.
ΜΜ% &
Add
ΜΜ& )
(
ΜΜ) *
$str
ΜΜ+ 6
,
ΜΜ6 7
ex
ΜΜ8 :
.
ΜΜ: ;
ToString
ΜΜ; C
(
ΜΜC D
)
ΜΜD E
)
ΜΜF G
;
ΜΜG H
}
ΝΝ 
return
ΞΞ 
	respuesta
ΞΞ 
;
ΞΞ 
}
ΟΟ 	
public
ΠΠ "
RespuestaTransaccion
ΠΠ #(
actualizar_peticion_diaria
ΠΠ$ >
(
ΠΠ? @
string
ΠΠA G
filtro
ΠΠH N
,
ΠΠN O
string
ΠΠP V
peticion
ΠΠW _
)
ΠΠ` a
{
ΡΡ 	
var
ÒÒ 
	respuesta
ÒÒ 
=
ÒÒ 
new
ÒÒ "
RespuestaTransaccion
ÒÒ  4
(
ÒÒ4 5
)
ÒÒ5 6
;
ÒÒ6 7
var
ΣΣ 
ds
ΣΣ 
=
ΣΣ 
new
ΣΣ 
DatosSolicitud
ΣΣ '
(
ΣΣ' (
)
ΣΣ( )
;
ΣΣ) *
try
ΤΤ 
{
ΥΥ 
ds
ΧΧ 
.
ΧΧ 
	StrNameBD
ΧΧ 
=
ΧΧ 
str_servicio
ΧΧ +
;
ΧΧ+ ,
ds
ΨΨ 
.
ΨΨ 
NombreColeccion
ΨΨ "
=
ΨΨ# $
$str
ΨΨ% 9
;
ΨΨ9 :
ds
ΩΩ 
.
ΩΩ 
Filter
ΩΩ 
=
ΩΩ 
filtro
ΩΩ "
;
ΩΩ" #
ds
ΪΪ 
.
ΪΪ 
SolTran
ΪΪ 
=
ΪΪ 
peticion
ΪΪ %
;
ΪΪ% &
DatosRespuesta
άά 
res
άά "
=
άά# $
objClienteMongo
άά% 4
.
άά4 5"
actualizar_documento
άά5 I
(
άάI J
ds
άάK M
)
άάN O
;
άάO P
	respuesta
ήή 
.
ήή 
codigo
ήή  
=
ήή! "
$str
ήή# (
;
ήή( )
	respuesta
ίί 
.
ίί 
cuerpo
ίί  
=
ίί! "
res
ίί# &
.
ίί& '
Mensaje
ίί' .
;
ίί. /
}
ΰΰ 
catch
αα 
(
αα 
	Exception
αα 
ex
αα 
)
αα 
{
γγ 
	respuesta
δδ 
.
δδ 
codigo
δδ  
=
δδ! "
$str
δδ# (
;
δδ( )
	respuesta
εε 
.
εε 
diccionario
εε %
.
εε% &
Add
εε& )
(
εε) *
$str
εε+ 6
,
εε6 7
ex
εε8 :
.
εε: ;
ToString
εε; C
(
εεC D
)
εεD E
)
εεF G
;
εεG H
}
ζζ 
return
ηη 
	respuesta
ηη 
;
ηη 
}
θθ 	
public
κκ "
RespuestaTransaccion
κκ #.
 guardar_promedio_peticion_diaria
κκ$ D
(
κκE F
string
κκG M
str_operacion
κκN [
,
κκ[ \
string
κκ] c
	str_fecha
κκd m
)
κκn o
{
λλ 	
var
μμ 
	respuesta
μμ 
=
μμ 
new
μμ "
RespuestaTransaccion
μμ  4
(
μμ4 5
)
μμ5 6
;
μμ6 7
var
νν 
ds
νν 
=
νν 
new
νν 
DatosSolicitud
νν '
(
νν' (
)
νν( )
;
νν) *
try
ξξ 
{
οο 
string
ππ 

str_filtro
ππ !
=
ππ" #
$str
ππ$ 8
+
ππ9 :
str_operacion
ππ; H
+
ππI J
$str
ππK O
;
ππO P
ds
ρρ 
.
ρρ 
	StrNameBD
ρρ 
=
ρρ 
str_servicio
ρρ +
;
ρρ+ ,
ds
ςς 
.
ςς 
NombreColeccion
ςς "
=
ςς# $
$str
ςς% B
;
ςςB C
ds
σσ 
.
σσ 
Filter
σσ 
=
σσ 

str_filtro
σσ &
;
σσ& '
ds
ττ 
.
ττ 
SolTran
ττ 
=
ττ 
String
ττ #
.
ττ# $
Empty
ττ$ )
;
ττ) *
DatosRespuesta
υυ 
res
υυ "
=
υυ# $
objClienteMongo
υυ% 4
.
υυ4 5
buscar_documentos
υυ5 F
(
υυF G
ds
υυH J
)
υυK L
;
υυL M
var
φφ 

resp_mongo
φφ 
=
φφ  
res
φφ! $
.
φφ$ %
Mensaje
φφ% ,
;
φφ, -
int
χχ 
promedio
χχ 
=
χχ 
calcular_promedio
χχ 0
(
χχ0 1
str_operacion
χχ2 ?
)
χχ@ A
;
χχA B
if
ψψ 
(
ψψ 

resp_mongo
ψψ 
!=
ψψ  
null
ψψ! %
&&
ψψ& (

resp_mongo
ψψ) 3
.
ψψ3 4
ToString
ψψ4 <
(
ψψ< =
)
ψψ= >
!=
ψψ? A
$str
ψψB F
)
ψψF G
{
ωω 
var
ϊϊ 
res_datos_mongo
ϊϊ '
=
ϊϊ( )

resp_mongo
ϊϊ* 4
.
ϊϊ4 5
ToString
ϊϊ5 =
(
ϊϊ= >
)
ϊϊ> ?
!
ϊϊ? @
.
ϊϊ@ A
Replace
ϊϊA H
(
ϊϊH I
$str
ϊϊJ U
,
ϊϊU V
$str
ϊϊW Z
)
ϊϊ[ \
.
ϊϊ\ ]
Replace
ϊϊ] d
(
ϊϊd e
$str
ϊϊf i
,
ϊϊi j
$str
ϊϊk n
)
ϊϊo p
;
ϊϊp q
res_datos_mongo
ϋϋ #
=
ϋϋ$ %
res_datos_mongo
ϋϋ& 5
.
ϋϋ5 6
Replace
ϋϋ6 =
(
ϋϋ= >
$str
ϋϋ? B
,
ϋϋB C
$str
ϋϋD F
)
ϋϋG H
.
ϋϋH I
Replace
ϋϋI P
(
ϋϋP Q
$str
ϋϋR U
,
ϋϋU V
$str
ϋϋW Y
)
ϋϋZ [
;
ϋϋ[ \
var
όό "
prom_peticion_diaria
όό ,
=
όό- .
JsonSerializer
όό/ =
.
όό= >
Deserialize
όό> I
<
όόI J$
PromedioPeticionDiaria
όόJ `
>
όό` a
(
όόa b
res_datos_mongo
όόc r
)
όόs t
;
όόt u
if
ώώ 
(
ώώ "
prom_peticion_diaria
ώώ +
!
ώώ+ ,
.
ώώ, -
_id
ώώ- 0
!=
ώώ1 3
null
ώώ4 8
)
ώώ8 9
{
ÿÿ 
string
€€ 
str_datos_update
€€ /
=
€€0 1
$str
€€2 S
+
€€T U
promedio
€€V ^
+
€€_ `
$str
€€a 
+€€€ 
	str_fecha€€‚ ‹
+€€ 
$str€€ “
;€€“ ”
ds
‚‚ 
.
‚‚ 
Filter
‚‚ !
=
‚‚" #

str_filtro
‚‚$ .
;
‚‚. /
ds
ƒƒ 
.
ƒƒ 
SolTran
ƒƒ "
=
ƒƒ# $
str_datos_update
ƒƒ% 5
;
ƒƒ5 6
objClienteMongo
…… '
.
……' ("
actualizar_documento
……( <
(
……< =
ds
……> @
)
……A B
;
……B C
}
†† 
}
‡‡ 
else
 
{
‰‰ 
object
 
obj_sol
 "
=
# $
new
% (
{
) *#
dbl_promedio_peticion
+ @
=
A B
promedio
C K
,
K L
str_operacion
M Z
,
Z [%
str_fecha_actualizacion
\ s
=
t u
	str_fecha
v 
}€ 
; ‚
ds
‹‹ 
.
‹‹ 
Filter
‹‹ 
=
‹‹ 
String
‹‹  &
.
‹‹& '
Empty
‹‹' ,
;
‹‹, -
ds
 
.
 
SolTran
 
=
  
JsonSerializer
! /
.
/ 0
	Serialize
0 9
(
9 :
obj_sol
; B
)
C D
;
D E
objClienteMongo
 #
.
# $ 
insertar_documento
$ 6
(
6 7
ds
8 :
)
; <
;
< =
}
 
	respuesta
‘‘ 
.
‘‘ 
codigo
‘‘  
=
‘‘! "
$str
‘‘# (
;
‘‘( )
	respuesta
’’ 
.
’’ 
cuerpo
’’  
=
’’! "
res
’’# &
.
’’& '
Mensaje
’’' .
;
’’. /
}
““ 
catch
”” 
(
”” 
	Exception
”” 
ex
”” 
)
”” 
{
–– 
	respuesta
—— 
.
—— 
codigo
——  
=
——! "
$str
——# (
;
——( )
	respuesta
 
.
 
diccionario
 %
.
% &
Add
& )
(
) *
$str
+ 6
,
6 7
ex
8 :
.
: ;
ToString
; C
(
C D
)
D E
)
F G
;
G H
}
™™ 
return
 
	respuesta
 
;
 
}
›› 	
public
 
int
 
calcular_promedio
 $
(
% &
string
' -
str_operacion
. ;
)
< =
{
 	
string
   

str_filtro
   
=
   
$str
    >
+
  ? @
str_operacion
  A N
+
  O P
$str
  Q X
+
  Y Z
$str
΅΅ g
;
΅΅g h
int
ΆΆ 
int_respuesta
ΆΆ 
=
ΆΆ 
$num
ΆΆ  !
;
ΆΆ! "
var
££ 
ds
££ 
=
££ 
new
££ 
DatosSolicitud
££ '
(
££' (
)
££( )
;
££) *
try
¤¤ 
{
¥¥ 
ds
¦¦ 
.
¦¦ 
	StrNameBD
¦¦ 
=
¦¦ 
str_servicio
¦¦ +
;
¦¦+ ,
ds
§§ 
.
§§ 
NombreColeccion
§§ "
=
§§# $
$str
§§% 9
;
§§9 :
ds
¨¨ 
.
¨¨ 
Filter
¨¨ 
=
¨¨ 

str_filtro
¨¨ &
;
¨¨& '
ds
©© 
.
©© 
SolTran
©© 
=
©© 
String
©© #
.
©©# $
Empty
©©$ )
;
©©) *
DatosRespuesta
«« 
res
«« "
=
««# $
objClienteMongo
««% 4
.
««4 5(
buscar_documentos_avanzado
««5 O
(
««O P
ds
««Q S
)
««T U
;
««U V
string
­­ 
res_datos_mongo
­­ &
=
­­' (
res
­­) ,
.
­­, -
Mensaje
­­- 4
;
­­4 5
if
®® 
(
®® 
res_datos_mongo
®® "
!=
®®# %
null
®®& *
&&
®®+ -
res_datos_mongo
®®. =
.
®®= >
ToString
®®> F
(
®®F G
)
®®G H
!=
®®I K
$str
®®L P
)
®®P Q
{
―― 
res_datos_mongo
°° #
=
°°$ %
res_datos_mongo
°°& 5
.
°°5 6
Replace
°°6 =
(
°°= >
$str
°°? B
,
°°B C
$str
°°D F
)
°°G H
.
°°H I
Replace
°°I P
(
°°P Q
$str
°°R U
,
°°U V
$str
°°W Y
)
°°Z [
;
°°[ \
var
±± 
peticion_diaria
±± '
=
±±( )
JsonSerializer
±±* 8
.
±±8 9
Deserialize
±±9 D
<
±±D E$
PromedioPeticionDiaria
±±E [
>
±±[ \
(
±±\ ]
res_datos_mongo
±±^ m
)
±±n o
;
±±o p
int_respuesta
²² !
=
²²" #
Convert
²²$ +
.
²²+ ,
ToInt32
²², 3
(
²²3 4
peticion_diaria
²²5 D
!
²²D E
.
²²E F#
dbl_promedio_peticion
²²F [
)
²²\ ]
;
²²] ^
}
³³ 
}
µµ 
catch
¶¶ 
(
¶¶ 
	Exception
¶¶ 
)
¶¶ 
{
ΈΈ 
int_respuesta
ΉΉ 
=
ΉΉ 
$num
ΉΉ  !
;
ΉΉ! "
}
»» 
return
ΌΌ 
int_respuesta
ΌΌ  
;
ΌΌ  !
}
½½ 	
public
ΎΎ 
int
ΎΎ 
obtener_promedio
ΎΎ #
(
ΎΎ$ %
string
ΎΎ& ,
str_operacion
ΎΎ- :
)
ΎΎ; <
{
ΏΏ 	
string
ΒΒ 

str_filtro
ΒΒ 
=
ΒΒ 
$str
ΒΒ  4
+
ΒΒ5 6
str_operacion
ΒΒ7 D
+
ΒΒE F
$str
ΒΒG K
;
ΒΒK L
int
ΓΓ 
int_respuesta
ΓΓ 
=
ΓΓ 
$num
ΓΓ  !
;
ΓΓ! "
var
ΔΔ 
ds
ΔΔ 
=
ΔΔ 
new
ΔΔ 
DatosSolicitud
ΔΔ '
(
ΔΔ' (
)
ΔΔ( )
;
ΔΔ) *
try
ΕΕ 
{
ΖΖ 
ds
ΗΗ 
.
ΗΗ 
	StrNameBD
ΗΗ 
=
ΗΗ 
str_servicio
ΗΗ +
;
ΗΗ+ ,
ds
ΘΘ 
.
ΘΘ 
NombreColeccion
ΘΘ "
=
ΘΘ# $
$str
ΘΘ% B
;
ΘΘB C
ds
ΙΙ 
.
ΙΙ 
Filter
ΙΙ 
=
ΙΙ 

str_filtro
ΙΙ &
;
ΙΙ& '
ds
ΚΚ 
.
ΚΚ 
SolTran
ΚΚ 
=
ΚΚ 
String
ΚΚ #
.
ΚΚ# $
Empty
ΚΚ$ )
;
ΚΚ) *
DatosRespuesta
ΜΜ 
res
ΜΜ "
=
ΜΜ# $
objClienteMongo
ΜΜ% 4
.
ΜΜ4 5
buscar_documentos
ΜΜ5 F
(
ΜΜF G
ds
ΜΜH J
)
ΜΜK L
;
ΜΜL M
string
ΞΞ 
res_datos_mongo
ΞΞ &
=
ΞΞ' (
res
ΞΞ) ,
.
ΞΞ, -
Mensaje
ΞΞ- 4
;
ΞΞ4 5
if
ΟΟ 
(
ΟΟ 
res_datos_mongo
ΟΟ "
!=
ΟΟ# %
null
ΟΟ& *
&&
ΟΟ+ -
res_datos_mongo
ΟΟ. =
.
ΟΟ= >
ToString
ΟΟ> F
(
ΟΟF G
)
ΟΟG H
!=
ΟΟI K
$str
ΟΟL P
)
ΟΟP Q
{
ΠΠ 
res_datos_mongo
ΡΡ #
=
ΡΡ$ %
res_datos_mongo
ΡΡ& 5
.
ΡΡ5 6
ToString
ΡΡ6 >
(
ΡΡ> ?
)
ΡΡ? @
!
ΡΡ@ A
.
ΡΡA B
Replace
ΡΡB I
(
ΡΡI J
$str
ΡΡK V
,
ΡΡV W
$str
ΡΡX [
)
ΡΡ\ ]
.
ΡΡ] ^
Replace
ΡΡ^ e
(
ΡΡe f
$str
ΡΡg j
,
ΡΡj k
$str
ΡΡl o
)
ΡΡp q
;
ΡΡq r
res_datos_mongo
ÒÒ #
=
ÒÒ$ %
res_datos_mongo
ÒÒ& 5
.
ÒÒ5 6
Replace
ÒÒ6 =
(
ÒÒ= >
$str
ÒÒ? B
,
ÒÒB C
$str
ÒÒD F
)
ÒÒG H
.
ÒÒH I
Replace
ÒÒI P
(
ÒÒP Q
$str
ÒÒR U
,
ÒÒU V
$str
ÒÒW Y
)
ÒÒZ [
;
ÒÒ[ \
var
ΣΣ 
peticion_diaria
ΣΣ '
=
ΣΣ( )
JsonSerializer
ΣΣ* 8
.
ΣΣ8 9
Deserialize
ΣΣ9 D
<
ΣΣD E$
PromedioPeticionDiaria
ΣΣE [
>
ΣΣ[ \
(
ΣΣ\ ]
res_datos_mongo
ΣΣ^ m
)
ΣΣn o
;
ΣΣo p
int_respuesta
ΤΤ !
=
ΤΤ" #
Convert
ΤΤ$ +
.
ΤΤ+ ,
ToInt32
ΤΤ, 3
(
ΤΤ3 4
peticion_diaria
ΤΤ5 D
!
ΤΤD E
.
ΤΤE F#
dbl_promedio_peticion
ΤΤF [
)
ΤΤ\ ]
;
ΤΤ] ^
}
ΦΦ 
}
ΧΧ 
catch
ΨΨ 
(
ΨΨ 
	Exception
ΨΨ 
)
ΨΨ 
{
ΪΪ 
int_respuesta
ΫΫ 
=
ΫΫ 
$num
ΫΫ  !
;
ΫΫ! "
}
άά 
return
έέ 
int_respuesta
έέ  
;
έέ  !
}
ήή 	
}
ΰΰ 
}ββ –l
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
httpHandler	v 
}
‚ ƒ
)
„ …
;
… †
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
ObjValue	((| „
=
((… †"
req_get_config_token
((‡ ›
.
((› 

str_nombre
(( ¦
.
((¦ §
ToString
((§ ―
(
((― °
)
((° ±
}
((² ³
)
((΄ µ
;
((µ ¶
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
VarChar	**{ ‚
,
**‚ ƒ
ObjValue
**„ 
=
** "
req_get_config_token
** £
.
**£ ¤ 
str_id_transaccion
**¤ ¶
.
**¶ ·
ToString
**· Ώ
(
**Ώ ΐ
)
**ΐ Α
}
**Β Γ
)
**Δ Ε
;
**Ε Ζ
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
++€ 
=
++‰ 
Convert
++‹ ’
.
++’ “
ToInt32
++“ 
(
++ ›"
req_get_config_token
++ °
.
++° ±
str_id_sistema
++± Ώ
)
++ΐ Α
.
++Α Β
ToString
++Β Κ
(
++Κ Λ
)
++Λ Μ
}
++Ν Ξ
)
++Ο Π
;
++Π Ρ
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
ObjValue	,,{ ƒ
=
,,„ …"
req_get_config_token
,,† 
.
,, ›
	str_login
,,› ¤
.
,,¤ ¥
ToString
,,¥ ­
(
,,­ ®
)
,,® ―
}
,,° ±
)
,,² ³
;
,,³ ΄
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
ObjValue	-- ‡
=
-- ‰
Convert
-- ‘
.
--‘ ’
ToInt32
--’ ™
(
--™ "
req_get_config_token
--› ―
.
--― °
str_id_perfil
--° ½
)
--Ύ Ώ
.
--Ώ ΐ
ToString
--ΐ Θ
(
--Θ Ι
)
--Ι Κ
}
--Λ Μ
)
--Ν Ξ
;
--Ξ Ο
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
..€ 
=
..‰ 
Convert
..‹ ’
.
..’ “
ToInt32
..“ 
(
.. ›"
req_get_config_token
.. °
.
..° ±
str_id_oficina
..± Ώ
)
..ΐ Α
.
..Α Β
ToString
..Β Κ
(
..Κ Λ
)
..Λ Μ
}
..Ν Ξ
)
..Ο Π
;
..Π Ρ
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
VarChar	//{ ‚
,
//‚ ƒ
ObjValue
//„ 
=
// "
req_get_config_token
// £
.
//£ ¤ 
str_nemonico_canal
//¤ ¶
.
//¶ ·
ToString
//· Ώ
(
//Ώ ΐ
)
//ΐ Α
}
//Β Γ
)
//Δ Ε
;
//Ε Ζ
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
VarChar	00{ ‚
,
00‚ ƒ
ObjValue
00„ 
=
00 "
req_get_config_token
00 £
.
00£ ¤ 
str_ip_dispositivo
00¤ ¶
.
00¶ ·
ToString
00· Ώ
(
00Ώ ΐ
)
00ΐ Α
}
00Β Γ
)
00Δ Ε
;
00Ε Ζ
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
ObjValue	11~ †
=
11‡ "
req_get_config_token
11‰ 
.
11 

str_sesion
11 ¨
.
11¨ ©
ToString
11© ±
(
11± ²
)
11² ³
}
11΄ µ
)
11¶ ·
;
11· Έ
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
VarChar	22| ƒ
,
22ƒ „
ObjValue
22… 
=
22 "
req_get_config_token
22 ¤
.
22¤ ¥!
str_mac_dispositivo
22¥ Έ
.
22Έ Ή
ToString
22Ή Α
(
22Α Β
)
22Β Γ
}
22Δ Ε
)
22Ζ Η
;
22Η Θ
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
66€ 
;
66 ‚
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
}WW ¦
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
httpHandler	""| ‡
}
"" ‰
)
""‰ 
;
"" ‹
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
VarChar	//} „
,
//„ …
ObjValue
//† 
=
// $
req_get_transferencias
//‘ §
.
//§ ¨#
str_num_cta_ordenante
//¨ ½
.
//½ Ύ
ToString
//Ύ Ζ
(
//Ζ Η
)
//Η Θ
}
//Ι Κ
)
//Κ Λ
;
//Λ Μ
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
,	00 €
ObjValue
00 ‰
=
00 ‹$
req_get_transferencias
00 Ά
.
00Ά £
str_fecha_inicio
00£ ³
.
00³ ΄
ToString
00΄ Ό
(
00Ό ½
)
00½ Ύ
}
00Ώ ΐ
)
00ΐ Α
;
00Α Β
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
ObjValue	11~ †
=
11‡ $
req_get_transferencias
11‰ 
.
11  
str_fecha_fin
11  ­
.
11­ ®
ToString
11® ¶
(
11¶ ·
)
11· Έ
}
11Ή Ί
)
11Ί »
;
11» Ό
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
ObjValue	22{ ƒ
=
22„ …$
req_get_transferencias
22† 
.
22 

str_filtro
22 §
.
22§ ¨
ToString
22¨ °
(
22° ±
)
22± ²
}
22³ ΄
)
22΄ µ
;
22µ ¶
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
VarChar	55z 
,
55 ‚
ObjValue
55ƒ ‹
=
55 $
req_get_transferencias
55 ¤
.
55¤ ¥ 
str_id_transaccion
55¥ ·
.
55· Έ
ToString
55Έ ΐ
(
55ΐ Α
)
55Α Β
}
55Γ Δ
)
55Δ Ε
;
55Ε Ζ
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
ObjValue	66 ‡
=
66 ‰$
req_get_transferencias
66  
.
66  ΅
str_id_sistema
66΅ ―
}
66° ±
)
66± ²
;
66² ³
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
ObjValue	77z ‚
=
77ƒ „$
req_get_transferencias
77… ›
.
77› 
	str_login
77 ¥
.
77¥ ¦
ToString
77¦ ®
(
77® ―
)
77― °
}
77± ²
)
77² ³
;
77³ ΄
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
ObjValue	88~ †
=
88‡ $
req_get_transferencias
88‰ 
.
88  
str_id_perfil
88  ­
.
88­ ®
ToString
88® ¶
(
88¶ ·
)
88· Έ
}
88Ή Ί
)
88Ί »
;
88» Ό
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
ObjValue	99 ‡
=
99 ‰$
req_get_transferencias
99  
.
99  ΅
str_id_oficina
99΅ ―
.
99― °
ToString
99° Έ
(
99Έ Ή
)
99Ή Ί
}
99» Ό
)
99Ό ½
;
99½ Ύ
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
VarChar	::z 
,
:: ‚
ObjValue
::ƒ ‹
=
:: $
req_get_transferencias
:: ¤
.
::¤ ¥ 
str_nemonico_canal
::¥ ·
.
::· Έ
ToString
::Έ ΐ
(
::ΐ Α
)
::Α Β
}
::Γ Δ
)
::Δ Ε
;
::Ε Ζ
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
VarChar	;;z 
,
;; ‚
ObjValue
;;ƒ ‹
=
;; $
req_get_transferencias
;; ¤
.
;;¤ ¥ 
str_ip_dispositivo
;;¥ ·
.
;;· Έ
ToString
;;Έ ΐ
(
;;ΐ Α
)
;;Α Β
}
;;Γ Δ
)
;;Δ Ε
;
;;Ε Ζ
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
ObjValue	<<{ ƒ
=
<<„ …$
req_get_transferencias
<<† 
.
<< 

str_sesion
<< §
.
<<§ ¨
ToString
<<¨ °
(
<<° ±
)
<<± ²
}
<<³ ΄
)
<<΄ µ
;
<<µ ¶
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
VarChar	=={ ‚
,
==‚ ƒ
ObjValue
==„ 
=
== $
req_get_transferencias
== ¥
.
==¥ ¦!
str_mac_dispositivo
==¦ Ή
.
==Ή Ί
ToString
==Ί Β
(
==Β Γ
)
==Γ Δ
}
==Ε Ζ
)
==Ζ Η
;
==Η Θ
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
;	AA €
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
Integer	jjz 
,
jj ‚
ObjValue
jjƒ ‹
=
jj 
req_transferencia
jj 
.
jj   
int_num_referencia
jj  ²
.
jj² ³
ToString
jj³ »
(
jj» Ό
)
jjΌ ½
}
jjΎ Ώ
)
jjΏ ΐ
;
jjΐ Α
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
ObjValue	kky 
=
kk‚ ƒ
req_transferencia
kk„ •
.
kk• –
int_ente
kk– 
.
kk 
ToString
kk §
(
kk§ ¨
)
kk¨ ©
}
kkª «
)
kk« ¬
;
kk¬ ­
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
VarChar	nnz 
,
nn ‚
ObjValue
nnƒ ‹
=
nn 
req_transferencia
nn 
.
nn   
str_id_transaccion
nn  ²
.
nn² ³
ToString
nn³ »
(
nn» Ό
)
nnΌ ½
}
nnΎ Ώ
)
nnΏ ΐ
;
nnΐ Α
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
ObjValue	oo ‡
=
oo ‰
req_transferencia
oo ›
.
oo› 
str_id_sistema
oo ª
}
oo« ¬
)
oo¬ ­
;
oo­ ®
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
ObjValue	ppz ‚
=
ppƒ „
req_transferencia
pp… –
.
pp– —
	str_login
pp—  
.
pp  ΅
ToString
pp΅ ©
(
pp© ª
)
ppª «
}
pp¬ ­
)
pp­ ®
;
pp® ―
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
ObjValue	qq~ †
=
qq‡ 
req_transferencia
qq‰ 
.
qq ›
str_id_perfil
qq› ¨
.
qq¨ ©
ToString
qq© ±
(
qq± ²
)
qq² ³
}
qq΄ µ
)
qqµ ¶
;
qq¶ ·
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
ObjValue	rr ‡
=
rr ‰
req_transferencia
rr ›
.
rr› 
str_id_oficina
rr ª
.
rrª «
ToString
rr« ³
(
rr³ ΄
)
rr΄ µ
}
rr¶ ·
)
rr· Έ
;
rrΈ Ή
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
VarChar	ssz 
,
ss ‚
ObjValue
ssƒ ‹
=
ss 
req_transferencia
ss 
.
ss   
str_nemonico_canal
ss  ²
.
ss² ³
ToString
ss³ »
(
ss» Ό
)
ssΌ ½
}
ssΎ Ώ
)
ssΏ ΐ
;
ssΐ Α
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
VarChar	ttz 
,
tt ‚
ObjValue
ttƒ ‹
=
tt 
req_transferencia
tt 
.
tt   
str_ip_dispositivo
tt  ²
.
tt² ³
ToString
tt³ »
(
tt» Ό
)
ttΌ ½
}
ttΎ Ώ
)
ttΏ ΐ
;
ttΐ Α
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
ObjValue	uu{ ƒ
=
uu„ …
req_transferencia
uu† —
.
uu— 

str_sesion
uu Ά
.
uuΆ £
ToString
uu£ «
(
uu« ¬
)
uu¬ ­
}
uu® ―
)
uu― °
;
uu° ±
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
VarChar	vv{ ‚
,
vv‚ ƒ
ObjValue
vv„ 
=
vv 
req_transferencia
vv  
.
vv  ΅!
str_mac_dispositivo
vv΅ ΄
.
vv΄ µ
ToString
vvµ ½
(
vv½ Ύ
)
vvΎ Ώ
}
vvΐ Α
)
vvΑ Β
;
vvΒ Γ
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
€€ 
lst_valores
€€ 
=
€€  !
new
€€" %
List
€€& *
<
€€* +$
ParametroSalidaValores
€€+ A
>
€€A B
(
€€B C
)
€€C D
;
€€D E
foreach
‚‚ 
(
‚‚ 
var
‚‚ 
item
‚‚ !
in
‚‚" $
	resultado
‚‚% .
.
‚‚. /!
ListaPSalidaValores
‚‚/ B
)
‚‚B C
lst_valores
‚‚D O
.
‚‚O P
Add
‚‚P S
(
‚‚S T
item
‚‚T X
)
‚‚X Y
;
‚‚Y Z
var
ƒƒ 

str_codigo
ƒƒ 
=
ƒƒ  
lst_valores
ƒƒ! ,
.
ƒƒ, -
Find
ƒƒ- 1
(
ƒƒ1 2
x
ƒƒ2 3
=>
ƒƒ4 6
x
ƒƒ7 8
.
ƒƒ8 9
StrNameParameter
ƒƒ9 I
==
ƒƒJ L
$str
ƒƒM [
)
ƒƒ[ \
!
ƒƒ\ ]
.
ƒƒ] ^
ObjValue
ƒƒ^ f
;
ƒƒf g
var
„„ 
	str_error
„„ 
=
„„ 
lst_valores
„„  +
.
„„+ ,
Find
„„, 0
(
„„0 1
x
„„1 2
=>
„„3 5
x
„„6 7
.
„„7 8
StrNameParameter
„„8 H
==
„„I K
$str
„„L V
)
„„V W
!
„„W X
.
„„X Y
ObjValue
„„Y a
.
„„a b
Trim
„„b f
(
„„f g
)
„„g h
;
„„h i
	respuesta
†† 
.
†† 
codigo
††  
=
††! "

str_codigo
††# -
.
††- .
ToString
††. 6
(
††6 7
)
††7 8
.
††8 9
Trim
††9 =
(
††= >
)
††> ?
.
††? @
PadLeft
††@ G
(
††G H
$num
††H I
,
††I J
$char
††K N
)
††N O
;
††O P
	respuesta
‡‡ 
.
‡‡ 
cuerpo
‡‡  
=
‡‡! "
	resultado
‡‡# ,
.
‡‡, -
NumAfectados
‡‡- 9
;
‡‡9 :
	respuesta
 
.
 
diccionario
 %
.
% &
Add
& )
(
) *
$str
* 5
,
5 6
	str_error
7 @
.
@ A
ToString
A I
(
I J
)
J K
)
K L
;
L M
}
 
catch
 
(
 
	Exception
 
	exception
 &
)
& '
{
 
	respuesta
 
.
 
codigo
  
=
! "
$str
# (
;
( )
	respuesta
 
.
 
diccionario
 %
.
% &
Add
& )
(
) *
$str
* 5
,
5 6
	exception
7 @
.
@ A
ToString
A I
(
I J
)
J K
)
K L
;
L M
infoLog
’’ 
.
’’  
str_id_transaccion
’’ *
=
’’+ ,
req_transferencia
’’- >
.
’’> ? 
str_id_transaccion
’’? Q
;
’’Q R
infoLog
““ 
.
““ 
str_tipo
““  
=
““! "
str_salida_error
““# 3
;
““3 4
infoLog
”” 
.
”” 

str_objeto
”” "
=
””# $
	exception
””% .
;
””. /
infoLog
•• 
.
•• 

str_metodo
•• "
=
••# $

MethodBase
••% /
.
••/ 0
GetCurrentMethod
••0 @
(
••@ A
)
••A B
!
••B C
.
••C D
Name
••D H
;
••H I
infoLog
–– 
.
–– 
str_operacion
–– %
=
––& '
req_transferencia
––( 9
.
––9 :
str_id_servicio
––: I
;
––I J
LogServicios
 
.
 
RegistrarTramas
 ,
(
, -
str_salida_error
- =
,
= >
infoLog
? F
,
F G
str_ruta
H P
)
P Q
;
Q R
throw
™™ 
;
™™ 
}
 
return
›› 
	respuesta
›› 
;
›› 
}
 	
public
§§ "
RespuestaTransaccion
§§ #&
validar_transfer_interna
§§$ <
(
§§< =(
ReqValidacionTransferencia
§§= W'
req_validar_transferencia
§§X q
)
§§q r
{
¨¨ 	"
RespuestaTransaccion
©©  
	respuesta
©©! *
=
©©+ ,
new
©©- 0"
RespuestaTransaccion
©©1 E
(
©©E F
)
©©F G
;
©©G H
try
ªª 
{
«« 
DatosSolicitud
¬¬ 
ds
¬¬ !
=
¬¬" #
new
¬¬$ '
DatosSolicitud
¬¬( 6
(
¬¬6 7
)
¬¬7 8
;
¬¬8 9
ds
®® 
.
®® 
ListaPEntrada
®®  
.
®®  !
Add
®®! $
(
®®$ %
new
®®% (
ParametroEntrada
®®) 9
{
®®: ;
StrNameParameter
®®< L
=
®®M N
$str
®®O e
,
®®e f
TipoDato
®®g o
=
®®p q
TipoDato
®®r z
.
®®z {
VarChar®®{ ‚
,®®‚ ƒ
ObjValue®®„ 
=®® )
req_validar_transferencia®® ¨
.®®¨ ©/
str_nemonico_tipo_transferencia®®© Θ
.®®Θ Ι
ToString®®Ι Ρ
(®®Ρ Ò
)®®Ò Σ
}®®Τ Υ
)®®Υ Φ
;®®Φ Χ
ds
―― 
.
―― 
ListaPEntrada
――  
.
――  !
Add
――! $
(
――$ %
new
――% (
ParametroEntrada
――) 9
{
――: ;
StrNameParameter
――< L
=
――M N
$str
――O f
,
――f g
TipoDato
――h p
=
――q r
TipoDato
――s {
.
――{ |
Integer――| ƒ
,――ƒ „
ObjValue――… 
=―― )
req_validar_transferencia―― ©
.――© ª$
int_id_cta_ordenante――ª Ύ
.――Ύ Ώ
ToString――Ώ Η
(――Η Θ
)――Θ Ι
}――Κ Λ
)――Λ Μ
;――Μ Ν
ds
°° 
.
°° 
ListaPEntrada
°°  
.
°°  !
Add
°°! $
(
°°$ %
new
°°% (
ParametroEntrada
°°) 9
{
°°: ;
StrNameParameter
°°< L
=
°°M N
$str
°°O i
,
°°i j
TipoDato
°°k s
=
°°t u
TipoDato
°°v ~
.
°°~ 
Integer°° †
,°°† ‡
ObjValue°° 
=°°‘ ’)
req_validar_transferencia°°“ ¬
.°°¬ ­'
int_id_cta_beneficiario°°­ Δ
.°°Δ Ε
ToString°°Ε Ν
(°°Ν Ξ
)°°Ξ Ο
}°°Π Ρ
)°°Ρ Ò
;°°Ò Σ
ds
±± 
.
±± 
ListaPEntrada
±±  
.
±±  !
Add
±±! $
(
±±$ %
new
±±% (
ParametroEntrada
±±) 9
{
±±: ;
StrNameParameter
±±< L
=
±±M N
$str
±±O [
,
±±[ \
TipoDato
±±] e
=
±±f g
TipoDato
±±h p
.
±±p q
Decimal
±±q x
,
±±x y
ObjValue±±z ‚
=±±ƒ „)
req_validar_transferencia±±… 
.±± 
dec_monto_tran±± ­
.±±­ ®
ToString±±® ¶
(±±¶ ·
)±±· Έ
}±±Ή Ί
)±±Ί »
;±±» Ό
ds
΄΄ 
.
΄΄ 
ListaPEntrada
΄΄  
.
΄΄  !
Add
΄΄! $
(
΄΄$ %
new
΄΄% (
ParametroEntrada
΄΄) 9
{
΄΄: ;
StrNameParameter
΄΄< L
=
΄΄M N
$str
΄΄O d
,
΄΄d e
TipoDato
΄΄f n
=
΄΄o p
TipoDato
΄΄q y
.
΄΄y z
VarChar΄΄z 
,΄΄ ‚
ObjValue΄΄ƒ ‹
=΄΄ )
req_validar_transferencia΄΄ §
.΄΄§ ¨"
str_id_transaccion΄΄¨ Ί
.΄΄Ί »
ToString΄΄» Γ
(΄΄Γ Δ
)΄΄Δ Ε
}΄΄Ζ Η
)΄΄Η Θ
;΄΄Θ Ι
ds
µµ 
.
µµ 
ListaPEntrada
µµ  
.
µµ  !
Add
µµ! $
(
µµ$ %
new
µµ% (
ParametroEntrada
µµ) 9
{
µµ: ;
StrNameParameter
µµ< L
=
µµM N
$str
µµO `
,
µµ` a
TipoDato
µµb j
=
µµk l
TipoDato
µµm u
.
µµu v
Integer
µµv }
,
µµ} ~
ObjValueµµ ‡
=µµ ‰)
req_validar_transferenciaµµ £
.µµ£ ¤
str_id_sistemaµµ¤ ²
}µµ³ ΄
)µµ΄ µ
;µµµ ¶
ds
¶¶ 
.
¶¶ 
ListaPEntrada
¶¶  
.
¶¶  !
Add
¶¶! $
(
¶¶$ %
new
¶¶% (
ParametroEntrada
¶¶) 9
{
¶¶: ;
StrNameParameter
¶¶< L
=
¶¶M N
$str
¶¶O [
,
¶¶[ \
TipoDato
¶¶] e
=
¶¶f g
TipoDato
¶¶h p
.
¶¶p q
VarChar
¶¶q x
,
¶¶x y
ObjValue¶¶z ‚
=¶¶ƒ „)
req_validar_transferencia¶¶… 
.¶¶ 
	str_login¶¶ ¨
.¶¶¨ ©
ToString¶¶© ±
(¶¶± ²
)¶¶² ³
}¶¶΄ µ
)¶¶µ ¶
;¶¶¶ ·
ds
·· 
.
·· 
ListaPEntrada
··  
.
··  !
Add
··! $
(
··$ %
new
··% (
ParametroEntrada
··) 9
{
··: ;
StrNameParameter
··< L
=
··M N
$str
··O _
,
··_ `
TipoDato
··a i
=
··j k
TipoDato
··l t
.
··t u
Integer
··u |
,
··| }
ObjValue··~ †
=··‡ )
req_validar_transferencia··‰ Ά
.··Ά £
str_id_perfil··£ °
.··° ±
ToString··± Ή
(··Ή Ί
)··Ί »
}··Ό ½
)··½ Ύ
;··Ύ Ώ
ds
ΈΈ 
.
ΈΈ 
ListaPEntrada
ΈΈ  
.
ΈΈ  !
Add
ΈΈ! $
(
ΈΈ$ %
new
ΈΈ% (
ParametroEntrada
ΈΈ) 9
{
ΈΈ: ;
StrNameParameter
ΈΈ< L
=
ΈΈM N
$str
ΈΈO `
,
ΈΈ` a
TipoDato
ΈΈb j
=
ΈΈk l
TipoDato
ΈΈm u
.
ΈΈu v
Integer
ΈΈv }
,
ΈΈ} ~
ObjValueΈΈ ‡
=ΈΈ ‰)
req_validar_transferenciaΈΈ £
.ΈΈ£ ¤
str_id_oficinaΈΈ¤ ²
.ΈΈ² ³
ToStringΈΈ³ »
(ΈΈ» Ό
)ΈΈΌ ½
}ΈΈΎ Ώ
)ΈΈΏ ΐ
;ΈΈΐ Α
ds
ΉΉ 
.
ΉΉ 
ListaPEntrada
ΉΉ  
.
ΉΉ  !
Add
ΉΉ! $
(
ΉΉ$ %
new
ΉΉ% (
ParametroEntrada
ΉΉ) 9
{
ΉΉ: ;
StrNameParameter
ΉΉ< L
=
ΉΉM N
$str
ΉΉO d
,
ΉΉd e
TipoDato
ΉΉf n
=
ΉΉo p
TipoDato
ΉΉq y
.
ΉΉy z
VarCharΉΉz 
,ΉΉ ‚
ObjValueΉΉƒ ‹
=ΉΉ )
req_validar_transferenciaΉΉ §
.ΉΉ§ ¨"
str_nemonico_canalΉΉ¨ Ί
.ΉΉΊ »
ToStringΉΉ» Γ
(ΉΉΓ Δ
)ΉΉΔ Ε
}ΉΉΖ Η
)ΉΉΗ Θ
;ΉΉΘ Ι
ds
ΊΊ 
.
ΊΊ 
ListaPEntrada
ΊΊ  
.
ΊΊ  !
Add
ΊΊ! $
(
ΊΊ$ %
new
ΊΊ% (
ParametroEntrada
ΊΊ) 9
{
ΊΊ: ;
StrNameParameter
ΊΊ< L
=
ΊΊM N
$str
ΊΊO d
,
ΊΊd e
TipoDato
ΊΊf n
=
ΊΊo p
TipoDato
ΊΊq y
.
ΊΊy z
VarCharΊΊz 
,ΊΊ ‚
ObjValueΊΊƒ ‹
=ΊΊ )
req_validar_transferenciaΊΊ §
.ΊΊ§ ¨"
str_ip_dispositivoΊΊ¨ Ί
.ΊΊΊ »
ToStringΊΊ» Γ
(ΊΊΓ Δ
)ΊΊΔ Ε
}ΊΊΖ Η
)ΊΊΗ Θ
;ΊΊΘ Ι
ds
»» 
.
»» 
ListaPEntrada
»»  
.
»»  !
Add
»»! $
(
»»$ %
new
»»% (
ParametroEntrada
»») 9
{
»»: ;
StrNameParameter
»»< L
=
»»M N
$str
»»O \
,
»»\ ]
TipoDato
»»^ f
=
»»g h
TipoDato
»»i q
.
»»q r
VarChar
»»r y
,
»»y z
ObjValue»»{ ƒ
=»»„ …)
req_validar_transferencia»»† 
.»»  

str_sesion»»  ª
.»»ª «
ToString»»« ³
(»»³ ΄
)»»΄ µ
}»»¶ ·
)»»· Έ
;»»Έ Ή
ds
ΌΌ 
.
ΌΌ 
ListaPEntrada
ΌΌ  
.
ΌΌ  !
Add
ΌΌ! $
(
ΌΌ$ %
new
ΌΌ% (
ParametroEntrada
ΌΌ) 9
{
ΌΌ: ;
StrNameParameter
ΌΌ< L
=
ΌΌM N
$str
ΌΌO e
,
ΌΌe f
TipoDato
ΌΌg o
=
ΌΌp q
TipoDato
ΌΌr z
.
ΌΌz {
VarCharΌΌ{ ‚
,ΌΌ‚ ƒ
ObjValueΌΌ„ 
=ΌΌ )
req_validar_transferenciaΌΌ ¨
.ΌΌ¨ ©#
str_mac_dispositivoΌΌ© Ό
.ΌΌΌ ½
ToStringΌΌ½ Ε
(ΌΌΕ Ζ
)ΌΌΖ Η
}ΌΌΘ Ι
)ΌΌΙ Κ
;ΌΌΚ Λ
ds
ΏΏ 
.
ΏΏ 
ListaPSalida
ΏΏ 
.
ΏΏ  
Add
ΏΏ  #
(
ΏΏ# $
new
ΏΏ$ '
ParametroSalida
ΏΏ( 7
{
ΏΏ8 9
StrNameParameter
ΏΏ: J
=
ΏΏK L
$str
ΏΏM [
,
ΏΏ[ \
TipoDato
ΏΏ] e
=
ΏΏf g
TipoDato
ΏΏh p
.
ΏΏp q
VarChar
ΏΏq x
}
ΏΏy z
)
ΏΏz {
;
ΏΏ{ |
ds
ΐΐ 
.
ΐΐ 
ListaPSalida
ΐΐ 
.
ΐΐ  
Add
ΐΐ  #
(
ΐΐ# $
new
ΐΐ$ '
ParametroSalida
ΐΐ( 7
{
ΐΐ8 9
StrNameParameter
ΐΐ: J
=
ΐΐK L
$str
ΐΐM _
,
ΐΐ_ `
TipoDato
ΐΐa i
=
ΐΐj k
TipoDato
ΐΐl t
.
ΐΐt u
Integer
ΐΐu |
}
ΐΐ} ~
)
ΐΐ~ 
;ΐΐ €
ds
ΓΓ 
.
ΓΓ 
NombreSP
ΓΓ 
=
ΓΓ 
$str
ΓΓ ;
;
ΓΓ; <
ds
ΔΔ 
.
ΔΔ 
NombreBD
ΔΔ 
=
ΔΔ 
	_settings
ΔΔ '
.
ΔΔ' (
BD_megservicios
ΔΔ( 7
;
ΔΔ7 8
var
ΖΖ 
	resultado
ΖΖ 
=
ΖΖ 
objClienteDal
ΖΖ  -
.
ΖΖ- .
ExecuteDataSet
ΖΖ. <
(
ΖΖ< =
ds
ΖΖ= ?
)
ΖΖ? @
;
ΖΖ@ A
var
ΗΗ 
lst_valores
ΗΗ 
=
ΗΗ  !
new
ΗΗ" %
List
ΗΗ& *
<
ΗΗ* +$
ParametroSalidaValores
ΗΗ+ A
>
ΗΗA B
(
ΗΗB C
)
ΗΗC D
;
ΗΗD E
foreach
ΙΙ 
(
ΙΙ 
var
ΙΙ 
item
ΙΙ !
in
ΙΙ" $
	resultado
ΙΙ% .
.
ΙΙ. /!
ListaPSalidaValores
ΙΙ/ B
)
ΙΙB C
lst_valores
ΙΙD O
.
ΙΙO P
Add
ΙΙP S
(
ΙΙS T
item
ΙΙT X
)
ΙΙX Y
;
ΙΙY Z
var
ΚΚ 

str_codigo
ΚΚ 
=
ΚΚ  
lst_valores
ΚΚ! ,
.
ΚΚ, -
Find
ΚΚ- 1
(
ΚΚ1 2
x
ΚΚ2 3
=>
ΚΚ4 6
x
ΚΚ7 8
.
ΚΚ8 9
StrNameParameter
ΚΚ9 I
==
ΚΚJ L
$str
ΚΚM _
)
ΚΚ_ `
!
ΚΚ` a
.
ΚΚa b
ObjValue
ΚΚb j
;
ΚΚj k
var
ΛΛ 
	str_error
ΛΛ 
=
ΛΛ 
lst_valores
ΛΛ  +
.
ΛΛ+ ,
Find
ΛΛ, 0
(
ΛΛ0 1
x
ΛΛ1 2
=>
ΛΛ3 5
x
ΛΛ6 7
.
ΛΛ7 8
StrNameParameter
ΛΛ8 H
==
ΛΛI K
$str
ΛΛL Z
)
ΛΛZ [
!
ΛΛ[ \
.
ΛΛ\ ]
ObjValue
ΛΛ] e
.
ΛΛe f
Trim
ΛΛf j
(
ΛΛj k
)
ΛΛk l
;
ΛΛl m
	respuesta
ΝΝ 
.
ΝΝ 
codigo
ΝΝ  
=
ΝΝ! "

str_codigo
ΝΝ# -
.
ΝΝ- .
ToString
ΝΝ. 6
(
ΝΝ6 7
)
ΝΝ7 8
.
ΝΝ8 9
Trim
ΝΝ9 =
(
ΝΝ= >
)
ΝΝ> ?
.
ΝΝ? @
PadLeft
ΝΝ@ G
(
ΝΝG H
$num
ΝΝH I
,
ΝΝI J
$char
ΝΝK N
)
ΝΝN O
;
ΝΝO P
	respuesta
ΞΞ 
.
ΞΞ 
cuerpo
ΞΞ  
=
ΞΞ! "
	Funciones
ΞΞ# ,
.
ΞΞ, -
ObtenerDatos
ΞΞ- 9
(
ΞΞ9 :
	resultado
ΞΞ: C
)
ΞΞC D
;
ΞΞD E
	respuesta
ΟΟ 
.
ΟΟ 
diccionario
ΟΟ %
.
ΟΟ% &
Add
ΟΟ& )
(
ΟΟ) *
$str
ΟΟ* 5
,
ΟΟ5 6
	str_error
ΟΟ7 @
.
ΟΟ@ A
ToString
ΟΟA I
(
ΟΟI J
)
ΟΟJ K
)
ΟΟK L
;
ΟΟL M
}
ΡΡ 
catch
ÒÒ 
(
ÒÒ 
	Exception
ÒÒ 
	exception
ÒÒ &
)
ÒÒ& '
{
ΣΣ 
	respuesta
ΤΤ 
.
ΤΤ 
codigo
ΤΤ  
=
ΤΤ! "
$str
ΤΤ# (
;
ΤΤ( )
	respuesta
ΥΥ 
.
ΥΥ 
diccionario
ΥΥ %
.
ΥΥ% &
Add
ΥΥ& )
(
ΥΥ) *
$str
ΥΥ* 5
,
ΥΥ5 6
	exception
ΥΥ7 @
.
ΥΥ@ A
ToString
ΥΥA I
(
ΥΥI J
)
ΥΥJ K
)
ΥΥK L
;
ΥΥL M
infoLog
ΧΧ 
.
ΧΧ  
str_id_transaccion
ΧΧ *
=
ΧΧ+ ,'
req_validar_transferencia
ΧΧ- F
.
ΧΧF G 
str_id_transaccion
ΧΧG Y
;
ΧΧY Z
infoLog
ΨΨ 
.
ΨΨ 
str_tipo
ΨΨ  
=
ΨΨ! "
str_salida_error
ΨΨ# 3
;
ΨΨ3 4
infoLog
ΩΩ 
.
ΩΩ 

str_objeto
ΩΩ "
=
ΩΩ# $
	exception
ΩΩ% .
;
ΩΩ. /
infoLog
ΪΪ 
.
ΪΪ 

str_metodo
ΪΪ "
=
ΪΪ# $

MethodBase
ΪΪ% /
.
ΪΪ/ 0
GetCurrentMethod
ΪΪ0 @
(
ΪΪ@ A
)
ΪΪA B
!
ΪΪB C
.
ΪΪC D
Name
ΪΪD H
;
ΪΪH I
infoLog
ΫΫ 
.
ΫΫ 
str_operacion
ΫΫ %
=
ΫΫ& ''
req_validar_transferencia
ΫΫ( A
.
ΫΫA B
str_id_servicio
ΫΫB Q
;
ΫΫQ R
LogServicios
έέ 
.
έέ 
RegistrarTramas
έέ ,
(
έέ, -
str_salida_error
έέ- =
,
έέ= >
infoLog
έέ? F
,
έέF G
str_ruta
έέH P
)
έέP Q
;
έέQ R
throw
ήή 
;
ήή 
}
ίί 
return
ΰΰ 
	respuesta
ΰΰ 
;
ΰΰ 
}
αα 	
public
θθ "
RespuestaTransaccion
θθ #'
add_transferencia_interna
θθ$ =
(
θθ= >
ReqTransferencia
θθ> N+
req_add_transferencia_interna
θθO l
)
θθl m
{
ιι 	"
RespuestaTransaccion
κκ  
	respuesta
κκ! *
=
κκ+ ,
new
κκ- 0"
RespuestaTransaccion
κκ1 E
(
κκE F
)
κκF G
;
κκG H
try
λλ 
{
μμ 
DatosSolicitud
νν 
ds
νν !
=
νν" #
new
νν$ '
DatosSolicitud
νν( 6
(
νν6 7
)
νν7 8
;
νν8 9
ds
οο 
.
οο 
ListaPEntrada
οο  
.
οο  !
Add
οο! $
(
οο$ %
new
οο% (
ParametroEntrada
οο) 9
{
οο: ;
StrNameParameter
οο< L
=
οοM N
$str
οοO e
,
οοe f
TipoDato
οοg o
=
οοp q
TipoDato
οοr z
.
οοz {
VarCharοο{ ‚
,οο‚ ƒ
ObjValueοο„ 
=οο -
req_add_transferencia_internaοο ¬
.οο¬ ­/
str_nemonico_tipo_transferenciaοο­ Μ
.οοΜ Ν
ToStringοοΝ Υ
(οοΥ Φ
)οοΦ Χ
}οοΨ Ω
)οοΩ Ϊ
;οοΪ Ϋ
ds
ππ 
.
ππ 
ListaPEntrada
ππ  
.
ππ  !
Add
ππ! $
(
ππ$ %
new
ππ% (
ParametroEntrada
ππ) 9
{
ππ: ;
StrNameParameter
ππ< L
=
ππM N
$str
ππO f
,
ππf g
TipoDato
ππh p
=
ππq r
TipoDato
ππs {
.
ππ{ |
Integerππ| ƒ
,ππƒ „
ObjValueππ… 
=ππ -
req_add_transferencia_internaππ ­
.ππ­ ®$
int_id_cta_ordenanteππ® Β
.ππΒ Γ
ToStringππΓ Λ
(ππΛ Μ
)ππΜ Ν
}ππΞ Ο
)ππΟ Π
;ππΠ Ρ
ds
ρρ 
.
ρρ 
ListaPEntrada
ρρ  
.
ρρ  !
Add
ρρ! $
(
ρρ$ %
new
ρρ% (
ParametroEntrada
ρρ) 9
{
ρρ: ;
StrNameParameter
ρρ< L
=
ρρM N
$str
ρρO i
,
ρρi j
TipoDato
ρρk s
=
ρρt u
TipoDato
ρρv ~
.
ρρ~ 
Integerρρ †
,ρρ† ‡
ObjValueρρ 
=ρρ‘ ’-
req_add_transferencia_internaρρ“ °
.ρρ° ±'
int_id_cta_beneficiarioρρ± Θ
.ρρΘ Ι
ToStringρρΙ Ρ
(ρρΡ Ò
)ρρÒ Σ
}ρρΤ Υ
)ρρΥ Φ
;ρρΦ Χ
ds
ςς 
.
ςς 
ListaPEntrada
ςς  
.
ςς  !
Add
ςς! $
(
ςς$ %
new
ςς% (
ParametroEntrada
ςς) 9
{
ςς: ;
StrNameParameter
ςς< L
=
ςςM N
$str
ςςO [
,
ςς[ \
TipoDato
ςς] e
=
ςςf g
TipoDato
ςςh p
.
ςςp q
Money
ςςq v
,
ςςv w
ObjValueςςx €
=ςς ‚-
req_add_transferencia_internaςςƒ  
.ςς  ΅
dec_monto_tranςς΅ ―
.ςς― °
ToStringςς° Έ
(ςςΈ Ή
)ςςΉ Ί
}ςς» Ό
)ςςΌ ½
;ςς½ Ύ
ds
σσ 
.
σσ 
ListaPEntrada
σσ  
.
σσ  !
Add
σσ! $
(
σσ$ %
new
σσ% (
ParametroEntrada
σσ) 9
{
σσ: ;
StrNameParameter
σσ< L
=
σσM N
$str
σσO c
,
σσc d
TipoDato
σσe m
=
σσn o
TipoDato
σσp x
.
σσx y
VarCharσσy €
,σσ€ 
ObjValueσσ‚ 
=σσ‹ -
req_add_transferencia_internaσσ ª
.σσª «!
str_observacionesσσ« Ό
.σσΌ ½
ToStringσσ½ Ε
(σσΕ Ζ
)σσΖ Η
}σσΘ Ι
)σσΙ Κ
;σσΚ Λ
ds
χχ 
.
χχ 
ListaPEntrada
χχ  
.
χχ  !
Add
χχ! $
(
χχ$ %
new
χχ% (
ParametroEntrada
χχ) 9
{
χχ: ;
StrNameParameter
χχ< L
=
χχM N
$str
χχO d
,
χχd e
TipoDato
χχf n
=
χχo p
TipoDato
χχq y
.
χχy z
VarCharχχz 
,χχ ‚
ObjValueχχƒ ‹
=χχ -
req_add_transferencia_internaχχ «
.χχ« ¬"
str_id_transaccionχχ¬ Ύ
.χχΎ Ώ
ToStringχχΏ Η
(χχΗ Θ
)χχΘ Ι
}χχΚ Λ
)χχΛ Μ
;χχΜ Ν
ds
ψψ 
.
ψψ 
ListaPEntrada
ψψ  
.
ψψ  !
Add
ψψ! $
(
ψψ$ %
new
ψψ% (
ParametroEntrada
ψψ) 9
{
ψψ: ;
StrNameParameter
ψψ< L
=
ψψM N
$str
ψψO `
,
ψψ` a
TipoDato
ψψb j
=
ψψk l
TipoDato
ψψm u
.
ψψu v
Integer
ψψv }
,
ψψ} ~
ObjValueψψ ‡
=ψψ ‰-
req_add_transferencia_internaψψ §
.ψψ§ ¨
str_id_sistemaψψ¨ ¶
}ψψ· Έ
)ψψΈ Ή
;ψψΉ Ί
ds
ωω 
.
ωω 
ListaPEntrada
ωω  
.
ωω  !
Add
ωω! $
(
ωω$ %
new
ωω% (
ParametroEntrada
ωω) 9
{
ωω: ;
StrNameParameter
ωω< L
=
ωωM N
$str
ωωO [
,
ωω[ \
TipoDato
ωω] e
=
ωωf g
TipoDato
ωωh p
.
ωωp q
VarChar
ωωq x
,
ωωx y
ObjValueωωz ‚
=ωωƒ „-
req_add_transferencia_internaωω… Ά
.ωωΆ £
	str_loginωω£ ¬
.ωω¬ ­
ToStringωω­ µ
(ωωµ ¶
)ωω¶ ·
}ωωΈ Ή
)ωωΉ Ί
;ωωΊ »
ds
ϊϊ 
.
ϊϊ 
ListaPEntrada
ϊϊ  
.
ϊϊ  !
Add
ϊϊ! $
(
ϊϊ$ %
new
ϊϊ% (
ParametroEntrada
ϊϊ) 9
{
ϊϊ: ;
StrNameParameter
ϊϊ< L
=
ϊϊM N
$str
ϊϊO _
,
ϊϊ_ `
TipoDato
ϊϊa i
=
ϊϊj k
TipoDato
ϊϊl t
.
ϊϊt u
Integer
ϊϊu |
,
ϊϊ| }
ObjValueϊϊ~ †
=ϊϊ‡ -
req_add_transferencia_internaϊϊ‰ ¦
.ϊϊ¦ §
str_id_perfilϊϊ§ ΄
.ϊϊ΄ µ
ToStringϊϊµ ½
(ϊϊ½ Ύ
)ϊϊΎ Ώ
}ϊϊΐ Α
)ϊϊΑ Β
;ϊϊΒ Γ
ds
ϋϋ 
.
ϋϋ 
ListaPEntrada
ϋϋ  
.
ϋϋ  !
Add
ϋϋ! $
(
ϋϋ$ %
new
ϋϋ% (
ParametroEntrada
ϋϋ) 9
{
ϋϋ: ;
StrNameParameter
ϋϋ< L
=
ϋϋM N
$str
ϋϋO `
,
ϋϋ` a
TipoDato
ϋϋb j
=
ϋϋk l
TipoDato
ϋϋm u
.
ϋϋu v
Integer
ϋϋv }
,
ϋϋ} ~
ObjValueϋϋ ‡
=ϋϋ ‰-
req_add_transferencia_internaϋϋ §
.ϋϋ§ ¨
str_id_oficinaϋϋ¨ ¶
.ϋϋ¶ ·
ToStringϋϋ· Ώ
(ϋϋΏ ΐ
)ϋϋΐ Α
}ϋϋΒ Γ
)ϋϋΓ Δ
;ϋϋΔ Ε
ds
όό 
.
όό 
ListaPEntrada
όό  
.
όό  !
Add
όό! $
(
όό$ %
new
όό% (
ParametroEntrada
όό) 9
{
όό: ;
StrNameParameter
όό< L
=
όόM N
$str
όόO d
,
όόd e
TipoDato
όόf n
=
όόo p
TipoDato
όόq y
.
όόy z
VarCharόόz 
,όό ‚
ObjValueόόƒ ‹
=όό -
req_add_transferencia_internaόό «
.όό« ¬"
str_nemonico_canalόό¬ Ύ
.όόΎ Ώ
ToStringόόΏ Η
(όόΗ Θ
)όόΘ Ι
}όόΚ Λ
)όόΛ Μ
;όόΜ Ν
ds
ύύ 
.
ύύ 
ListaPEntrada
ύύ  
.
ύύ  !
Add
ύύ! $
(
ύύ$ %
new
ύύ% (
ParametroEntrada
ύύ) 9
{
ύύ: ;
StrNameParameter
ύύ< L
=
ύύM N
$str
ύύO d
,
ύύd e
TipoDato
ύύf n
=
ύύo p
TipoDato
ύύq y
.
ύύy z
VarCharύύz 
,ύύ ‚
ObjValueύύƒ ‹
=ύύ -
req_add_transferencia_internaύύ «
.ύύ« ¬"
str_ip_dispositivoύύ¬ Ύ
.ύύΎ Ώ
ToStringύύΏ Η
(ύύΗ Θ
)ύύΘ Ι
}ύύΚ Λ
)ύύΛ Μ
;ύύΜ Ν
ds
ώώ 
.
ώώ 
ListaPEntrada
ώώ  
.
ώώ  !
Add
ώώ! $
(
ώώ$ %
new
ώώ% (
ParametroEntrada
ώώ) 9
{
ώώ: ;
StrNameParameter
ώώ< L
=
ώώM N
$str
ώώO \
,
ώώ\ ]
TipoDato
ώώ^ f
=
ώώg h
TipoDato
ώώi q
.
ώώq r
VarChar
ώώr y
,
ώώy z
ObjValueώώ{ ƒ
=ώώ„ …-
req_add_transferencia_internaώώ† £
.ώώ£ ¤

str_sesionώώ¤ ®
.ώώ® ―
ToStringώώ― ·
(ώώ· Έ
)ώώΈ Ή
}ώώΊ »
)ώώ» Ό
;ώώΌ ½
ds
ÿÿ 
.
ÿÿ 
ListaPEntrada
ÿÿ  
.
ÿÿ  !
Add
ÿÿ! $
(
ÿÿ$ %
new
ÿÿ% (
ParametroEntrada
ÿÿ) 9
{
ÿÿ: ;
StrNameParameter
ÿÿ< L
=
ÿÿM N
$str
ÿÿO e
,
ÿÿe f
TipoDato
ÿÿg o
=
ÿÿp q
TipoDato
ÿÿr z
.
ÿÿz {
VarCharÿÿ{ ‚
,ÿÿ‚ ƒ
ObjValueÿÿ„ 
=ÿÿ -
req_add_transferencia_internaÿÿ ¬
.ÿÿ¬ ­#
str_mac_dispositivoÿÿ­ ΐ
.ÿÿΐ Α
ToStringÿÿΑ Ι
(ÿÿΙ Κ
)ÿÿΚ Λ
}ÿÿΜ Ν
)ÿÿΝ Ξ
;ÿÿΞ Ο
ds
 
.
 
ListaPSalida
 
.
  
Add
  #
(
# $
new
$ '
ParametroSalida
( 7
{
8 9
StrNameParameter
: J
=
K L
$str
M V
,
V W
TipoDato
X `
=
a b
TipoDato
c k
.
k l
Integer
l s
}
t u
)
u v
;
v w
ds
‚‚ 
.
‚‚ 
ListaPSalida
‚‚ 
.
‚‚  
Add
‚‚  #
(
‚‚# $
new
‚‚$ '
ParametroSalida
‚‚( 7
{
‚‚8 9
StrNameParameter
‚‚: J
=
‚‚K L
$str
‚‚M [
,
‚‚[ \
TipoDato
‚‚] e
=
‚‚f g
TipoDato
‚‚h p
.
‚‚p q
VarChar
‚‚q x
}
‚‚y z
)
‚‚z {
;
‚‚{ |
ds
ƒƒ 
.
ƒƒ 
ListaPSalida
ƒƒ 
.
ƒƒ  
Add
ƒƒ  #
(
ƒƒ# $
new
ƒƒ$ '
ParametroSalida
ƒƒ( 7
{
ƒƒ8 9
StrNameParameter
ƒƒ: J
=
ƒƒK L
$str
ƒƒM _
,
ƒƒ_ `
TipoDato
ƒƒa i
=
ƒƒj k
TipoDato
ƒƒl t
.
ƒƒt u
Integer
ƒƒu |
}
ƒƒ} ~
)
ƒƒ~ 
;ƒƒ €
ds
†† 
.
†† 
NombreSP
†† 
=
†† 
$str
†† <
;
††< =
ds
‡‡ 
.
‡‡ 
NombreBD
‡‡ 
=
‡‡ 
	_settings
‡‡ '
.
‡‡' (
BD_megservicios
‡‡( 7
;
‡‡7 8
var
‰‰ 
	resultado
‰‰ 
=
‰‰ 
objClienteDal
‰‰  -
.
‰‰- .
ExecuteDataSet
‰‰. <
(
‰‰< =
ds
‰‰= ?
)
‰‰? @
;
‰‰@ A
var
 
lst_valores
 
=
  !
new
" %
List
& *
<
* +$
ParametroSalidaValores
+ A
>
A B
(
B C
)
C D
;
D E
foreach
 
(
 
var
 
item
 !
in
" $
	resultado
% .
.
. /!
ListaPSalidaValores
/ B
)
B C
lst_valores
D O
.
O P
Add
P S
(
S T
item
T X
)
X Y
;
Y Z
var
 

str_codigo
 
=
  
lst_valores
! ,
.
, -
Find
- 1
(
1 2
x
2 3
=>
4 6
x
7 8
.
8 9
StrNameParameter
9 I
==
J L
$str
M _
)
_ `
!
` a
.
a b
ObjValue
b j
;
j k
var
 
	str_error
 
=
 
lst_valores
  +
.
+ ,
Find
, 0
(
0 1
x
1 2
=>
3 5
x
6 7
.
7 8
StrNameParameter
8 H
==
I K
$str
L Z
)
Z [
!
[ \
.
\ ]
ObjValue
] e
.
e f
Trim
f j
(
j k
)
k l
;
l m
	respuesta
 
.
 
codigo
  
=
! "

str_codigo
# -
.
- .
ToString
. 6
(
6 7
)
7 8
.
8 9
Trim
9 =
(
= >
)
> ?
.
? @
PadLeft
@ G
(
G H
$num
H I
,
I J
$char
K N
)
N O
;
O P
	respuesta
‘‘ 
.
‘‘ 
cuerpo
‘‘  
=
‘‘! "
	Funciones
‘‘# ,
.
‘‘, -
ObtenerDatos
‘‘- 9
(
‘‘9 :
	resultado
‘‘: C
)
‘‘C D
;
‘‘D E
	respuesta
’’ 
.
’’ 
diccionario
’’ %
.
’’% &
Add
’’& )
(
’’) *
$str
’’* 5
,
’’5 6
	str_error
’’7 @
.
’’@ A
ToString
’’A I
(
’’I J
)
’’J K
)
’’K L
;
’’L M
}
““ 
catch
”” 
(
”” 
	Exception
”” 
	exception
”” &
)
””& '
{
•• 
	respuesta
–– 
.
–– 
codigo
––  
=
––! "
$str
––# (
;
––( )
	respuesta
—— 
.
—— 
diccionario
—— %
.
——% &
Add
——& )
(
——) *
$str
——* 5
,
——5 6
	exception
——7 @
.
——@ A
ToString
——A I
(
——I J
)
——J K
)
——K L
;
——L M
infoLog
™™ 
.
™™  
str_id_transaccion
™™ *
=
™™+ ,+
req_add_transferencia_interna
™™- J
.
™™J K 
str_id_transaccion
™™K ]
;
™™] ^
infoLog
 
.
 
str_tipo
  
=
! "
str_salida_error
# 3
;
3 4
infoLog
›› 
.
›› 

str_objeto
›› "
=
››# $
	exception
››% .
;
››. /
infoLog
 
.
 

str_metodo
 "
=
# $

MethodBase
% /
.
/ 0
GetCurrentMethod
0 @
(
@ A
)
A B
!
B C
.
C D
Name
D H
;
H I
infoLog
 
.
 
str_operacion
 %
=
& '+
req_add_transferencia_interna
( E
.
E F
str_id_servicio
F U
;
U V
LogServicios
 
.
 
RegistrarTramas
 ,
(
, -
str_salida_error
- =
,
= >
infoLog
? F
,
F G
str_ruta
H P
)
P Q
;
Q R
throw
   
;
   
}
΅΅ 
return
ΆΆ 
	respuesta
ΆΆ 
;
ΆΆ 
}
££ 	
public
«« "
RespuestaTransaccion
«« #+
get_val_transf_interbancarias
««$ A
(
««A B(
ReqValidacionTransferencia
««B \'
req_validar_transferencia
««] v
)
««v w
{
¬¬ 	"
RespuestaTransaccion
­­  
	respuesta
­­! *
=
­­+ ,
new
­­- 0"
RespuestaTransaccion
­­1 E
(
­­E F
)
­­F G
;
­­G H
try
®® 
{
―― 
DatosSolicitud
±± 
ds
±± !
=
±±" #
new
±±$ '
DatosSolicitud
±±( 6
(
±±6 7
)
±±7 8
;
±±8 9
ds
³³ 
.
³³ 
ListaPEntrada
³³  
.
³³  !
Add
³³! $
(
³³$ %
new
³³% (
ParametroEntrada
³³) 9
{
³³: ;
StrNameParameter
³³< L
=
³³M N
$str
³³O Z
,
³³Z [
TipoDato
³³\ d
=
³³e f
TipoDato
³³g o
.
³³o p
Integer
³³p w
,
³³w x
ObjValue³³y 
=³³‚ ƒ)
req_validar_transferencia³³„ 
.³³ 
int_ente³³ ¦
.³³¦ §
ToString³³§ ―
(³³― °
)³³° ±
}³³² ³
)³³³ ΄
;³³΄ µ
ds
΄΄ 
.
΄΄ 
ListaPEntrada
΄΄  
.
΄΄  !
Add
΄΄! $
(
΄΄$ %
new
΄΄% (
ParametroEntrada
΄΄) 9
{
΄΄: ;
StrNameParameter
΄΄< L
=
΄΄M N
$str
΄΄O f
,
΄΄f g
TipoDato
΄΄h p
=
΄΄q r
TipoDato
΄΄s {
.
΄΄{ |
Integer΄΄| ƒ
,΄΄ƒ „
ObjValue΄΄… 
=΄΄ )
req_validar_transferencia΄΄ ©
.΄΄© ª$
int_id_cta_ordenante΄΄ª Ύ
.΄΄Ύ Ώ
ToString΄΄Ώ Η
(΄΄Η Θ
)΄΄Θ Ι
}΄΄Κ Λ
)΄΄Λ Μ
;΄΄Μ Ν
ds
µµ 
.
µµ 
ListaPEntrada
µµ  
.
µµ  !
Add
µµ! $
(
µµ$ %
new
µµ% (
ParametroEntrada
µµ) 9
{
µµ: ;
StrNameParameter
µµ< L
=
µµM N
$str
µµO i
,
µµi j
TipoDato
µµk s
=
µµt u
TipoDato
µµv ~
.
µµ~ 
Integerµµ †
,µµ† ‡
ObjValueµµ 
=µµ‘ ’)
req_validar_transferenciaµµ“ ¬
.µµ¬ ­'
int_id_cta_beneficiarioµµ­ Δ
.µµΔ Ε
ToStringµµΕ Ν
(µµΝ Ξ
)µµΞ Ο
}µµΠ Ρ
)µµΡ Ò
;µµÒ Σ
ds
¶¶ 
.
¶¶ 
ListaPEntrada
¶¶  
.
¶¶  !
Add
¶¶! $
(
¶¶$ %
new
¶¶% (
ParametroEntrada
¶¶) 9
{
¶¶: ;
StrNameParameter
¶¶< L
=
¶¶M N
$str
¶¶O d
,
¶¶d e
TipoDato
¶¶f n
=
¶¶o p
TipoDato
¶¶q y
.
¶¶y z
Decimal¶¶z 
,¶¶ ‚
ObjValue¶¶ƒ ‹
=¶¶ )
req_validar_transferencia¶¶ §
.¶¶§ ¨
dec_monto_tran¶¶¨ ¶
.¶¶¶ ·
ToString¶¶· Ώ
(¶¶Ώ ΐ
)¶¶ΐ Α
}¶¶Β Γ
)¶¶Γ Δ
;¶¶Δ Ε
ds
ΉΉ 
.
ΉΉ 
ListaPEntrada
ΉΉ  
.
ΉΉ  !
Add
ΉΉ! $
(
ΉΉ$ %
new
ΉΉ% (
ParametroEntrada
ΉΉ) 9
{
ΉΉ: ;
StrNameParameter
ΉΉ< L
=
ΉΉM N
$str
ΉΉO d
,
ΉΉd e
TipoDato
ΉΉf n
=
ΉΉo p
TipoDato
ΉΉq y
.
ΉΉy z
VarCharΉΉz 
,ΉΉ ‚
ObjValueΉΉƒ ‹
=ΉΉ )
req_validar_transferenciaΉΉ §
.ΉΉ§ ¨"
str_id_transaccionΉΉ¨ Ί
.ΉΉΊ »
ToStringΉΉ» Γ
(ΉΉΓ Δ
)ΉΉΔ Ε
}ΉΉΖ Η
)ΉΉΗ Θ
;ΉΉΘ Ι
ds
ΊΊ 
.
ΊΊ 
ListaPEntrada
ΊΊ  
.
ΊΊ  !
Add
ΊΊ! $
(
ΊΊ$ %
new
ΊΊ% (
ParametroEntrada
ΊΊ) 9
{
ΊΊ: ;
StrNameParameter
ΊΊ< L
=
ΊΊM N
$str
ΊΊO `
,
ΊΊ` a
TipoDato
ΊΊb j
=
ΊΊk l
TipoDato
ΊΊm u
.
ΊΊu v
Integer
ΊΊv }
,
ΊΊ} ~
ObjValueΊΊ ‡
=ΊΊ ‰)
req_validar_transferenciaΊΊ £
.ΊΊ£ ¤
str_id_sistemaΊΊ¤ ²
}ΊΊ³ ΄
)ΊΊ΄ µ
;ΊΊµ ¶
ds
»» 
.
»» 
ListaPEntrada
»»  
.
»»  !
Add
»»! $
(
»»$ %
new
»»% (
ParametroEntrada
»») 9
{
»»: ;
StrNameParameter
»»< L
=
»»M N
$str
»»O [
,
»»[ \
TipoDato
»»] e
=
»»f g
TipoDato
»»h p
.
»»p q
VarChar
»»q x
,
»»x y
ObjValue»»z ‚
=»»ƒ „)
req_validar_transferencia»»… 
.»» 
	str_login»» ¨
.»»¨ ©
ToString»»© ±
(»»± ²
)»»² ³
}»»΄ µ
)»»µ ¶
;»»¶ ·
ds
ΌΌ 
.
ΌΌ 
ListaPEntrada
ΌΌ  
.
ΌΌ  !
Add
ΌΌ! $
(
ΌΌ$ %
new
ΌΌ% (
ParametroEntrada
ΌΌ) 9
{
ΌΌ: ;
StrNameParameter
ΌΌ< L
=
ΌΌM N
$str
ΌΌO _
,
ΌΌ_ `
TipoDato
ΌΌa i
=
ΌΌj k
TipoDato
ΌΌl t
.
ΌΌt u
Integer
ΌΌu |
,
ΌΌ| }
ObjValueΌΌ~ †
=ΌΌ‡ )
req_validar_transferenciaΌΌ‰ Ά
.ΌΌΆ £
str_id_perfilΌΌ£ °
.ΌΌ° ±
ToStringΌΌ± Ή
(ΌΌΉ Ί
)ΌΌΊ »
}ΌΌΌ ½
)ΌΌ½ Ύ
;ΌΌΎ Ώ
ds
½½ 
.
½½ 
ListaPEntrada
½½  
.
½½  !
Add
½½! $
(
½½$ %
new
½½% (
ParametroEntrada
½½) 9
{
½½: ;
StrNameParameter
½½< L
=
½½M N
$str
½½O `
,
½½` a
TipoDato
½½b j
=
½½k l
TipoDato
½½m u
.
½½u v
Integer
½½v }
,
½½} ~
ObjValue½½ ‡
=½½ ‰)
req_validar_transferencia½½ £
.½½£ ¤
str_id_oficina½½¤ ²
.½½² ³
ToString½½³ »
(½½» Ό
)½½Ό ½
}½½Ύ Ώ
)½½Ώ ΐ
;½½ΐ Α
ds
ΎΎ 
.
ΎΎ 
ListaPEntrada
ΎΎ  
.
ΎΎ  !
Add
ΎΎ! $
(
ΎΎ$ %
new
ΎΎ% (
ParametroEntrada
ΎΎ) 9
{
ΎΎ: ;
StrNameParameter
ΎΎ< L
=
ΎΎM N
$str
ΎΎO d
,
ΎΎd e
TipoDato
ΎΎf n
=
ΎΎo p
TipoDato
ΎΎq y
.
ΎΎy z
VarCharΎΎz 
,ΎΎ ‚
ObjValueΎΎƒ ‹
=ΎΎ )
req_validar_transferenciaΎΎ §
.ΎΎ§ ¨"
str_nemonico_canalΎΎ¨ Ί
.ΎΎΊ »
ToStringΎΎ» Γ
(ΎΎΓ Δ
)ΎΎΔ Ε
}ΎΎΖ Η
)ΎΎΗ Θ
;ΎΎΘ Ι
ds
ΏΏ 
.
ΏΏ 
ListaPEntrada
ΏΏ  
.
ΏΏ  !
Add
ΏΏ! $
(
ΏΏ$ %
new
ΏΏ% (
ParametroEntrada
ΏΏ) 9
{
ΏΏ: ;
StrNameParameter
ΏΏ< L
=
ΏΏM N
$str
ΏΏO d
,
ΏΏd e
TipoDato
ΏΏf n
=
ΏΏo p
TipoDato
ΏΏq y
.
ΏΏy z
VarCharΏΏz 
,ΏΏ ‚
ObjValueΏΏƒ ‹
=ΏΏ )
req_validar_transferenciaΏΏ §
.ΏΏ§ ¨"
str_ip_dispositivoΏΏ¨ Ί
.ΏΏΊ »
ToStringΏΏ» Γ
(ΏΏΓ Δ
)ΏΏΔ Ε
}ΏΏΖ Η
)ΏΏΗ Θ
;ΏΏΘ Ι
ds
ΐΐ 
.
ΐΐ 
ListaPEntrada
ΐΐ  
.
ΐΐ  !
Add
ΐΐ! $
(
ΐΐ$ %
new
ΐΐ% (
ParametroEntrada
ΐΐ) 9
{
ΐΐ: ;
StrNameParameter
ΐΐ< L
=
ΐΐM N
$str
ΐΐO \
,
ΐΐ\ ]
TipoDato
ΐΐ^ f
=
ΐΐg h
TipoDato
ΐΐi q
.
ΐΐq r
VarChar
ΐΐr y
,
ΐΐy z
ObjValueΐΐ{ ƒ
=ΐΐ„ …)
req_validar_transferenciaΐΐ† 
.ΐΐ  

str_sesionΐΐ  ª
.ΐΐª «
ToStringΐΐ« ³
(ΐΐ³ ΄
)ΐΐ΄ µ
}ΐΐ¶ ·
)ΐΐ· Έ
;ΐΐΈ Ή
ds
ΑΑ 
.
ΑΑ 
ListaPEntrada
ΑΑ  
.
ΑΑ  !
Add
ΑΑ! $
(
ΑΑ$ %
new
ΑΑ% (
ParametroEntrada
ΑΑ) 9
{
ΑΑ: ;
StrNameParameter
ΑΑ< L
=
ΑΑM N
$str
ΑΑO e
,
ΑΑe f
TipoDato
ΑΑg o
=
ΑΑp q
TipoDato
ΑΑr z
.
ΑΑz {
VarCharΑΑ{ ‚
,ΑΑ‚ ƒ
ObjValueΑΑ„ 
=ΑΑ )
req_validar_transferenciaΑΑ ¨
.ΑΑ¨ ©#
str_mac_dispositivoΑΑ© Ό
.ΑΑΌ ½
ToStringΑΑ½ Ε
(ΑΑΕ Ζ
)ΑΑΖ Η
}ΑΑΘ Ι
)ΑΑΙ Κ
;ΑΑΚ Λ
ds
ΓΓ 
.
ΓΓ 
ListaPSalida
ΓΓ 
.
ΓΓ  
Add
ΓΓ  #
(
ΓΓ# $
new
ΓΓ$ '
ParametroSalida
ΓΓ( 7
{
ΓΓ8 9
StrNameParameter
ΓΓ: J
=
ΓΓK L
$str
ΓΓM W
,
ΓΓW X
TipoDato
ΓΓY a
=
ΓΓb c
TipoDato
ΓΓd l
.
ΓΓl m
VarChar
ΓΓm t
}
ΓΓu v
)
ΓΓv w
;
ΓΓw x
ds
ΔΔ 
.
ΔΔ 
ListaPSalida
ΔΔ 
.
ΔΔ  
Add
ΔΔ  #
(
ΔΔ# $
new
ΔΔ$ '
ParametroSalida
ΔΔ( 7
{
ΔΔ8 9
StrNameParameter
ΔΔ: J
=
ΔΔK L
$str
ΔΔM [
,
ΔΔ[ \
TipoDato
ΔΔ] e
=
ΔΔf g
TipoDato
ΔΔh p
.
ΔΔp q
Integer
ΔΔq x
}
ΔΔy z
)
ΔΔz {
;
ΔΔ{ |
ds
ΕΕ 
.
ΕΕ 
ListaPSalida
ΕΕ 
.
ΕΕ  
Add
ΕΕ  #
(
ΕΕ# $
new
ΕΕ$ '
ParametroSalida
ΕΕ( 7
{
ΕΕ8 9
StrNameParameter
ΕΕ: J
=
ΕΕK L
$str
ΕΕM _
,
ΕΕ_ `
TipoDato
ΕΕa i
=
ΕΕj k
TipoDato
ΕΕl t
.
ΕΕt u
Integer
ΕΕu |
}
ΕΕ} ~
)
ΕΕ~ 
;ΕΕ €
ds
ΗΗ 
.
ΗΗ 
NombreSP
ΗΗ 
=
ΗΗ 
$str
ΗΗ >
;
ΗΗ> ?
ds
ΘΘ 
.
ΘΘ 
NombreBD
ΘΘ 
=
ΘΘ 
	_settings
ΘΘ '
.
ΘΘ' (
BD_megservicios
ΘΘ( 7
;
ΘΘ7 8
var
ΚΚ 
	resultado
ΚΚ 
=
ΚΚ 
objClienteDal
ΚΚ  -
.
ΚΚ- .
ExecuteDataSet
ΚΚ. <
(
ΚΚ< =
ds
ΚΚ= ?
)
ΚΚ? @
;
ΚΚ@ A
var
ΛΛ 
lst_valores
ΛΛ 
=
ΛΛ  !
new
ΛΛ" %
List
ΛΛ& *
<
ΛΛ* +$
ParametroSalidaValores
ΛΛ+ A
>
ΛΛA B
(
ΛΛB C
)
ΛΛC D
;
ΛΛD E
foreach
ΝΝ 
(
ΝΝ 
var
ΝΝ 
item
ΝΝ !
in
ΝΝ" $
	resultado
ΝΝ% .
.
ΝΝ. /!
ListaPSalidaValores
ΝΝ/ B
)
ΝΝB C
lst_valores
ΝΝD O
.
ΝΝO P
Add
ΝΝP S
(
ΝΝS T
item
ΝΝT X
)
ΝΝX Y
;
ΝΝY Z
var
ΞΞ 

str_codigo
ΞΞ 
=
ΞΞ  
lst_valores
ΞΞ! ,
.
ΞΞ, -
Find
ΞΞ- 1
(
ΞΞ1 2
x
ΞΞ2 3
=>
ΞΞ4 6
x
ΞΞ7 8
.
ΞΞ8 9
StrNameParameter
ΞΞ9 I
==
ΞΞJ L
$str
ΞΞM [
)
ΞΞ[ \
!
ΞΞ\ ]
.
ΞΞ] ^
ObjValue
ΞΞ^ f
;
ΞΞf g
var
ΟΟ 
	str_error
ΟΟ 
=
ΟΟ 
lst_valores
ΟΟ  +
.
ΟΟ+ ,
Find
ΟΟ, 0
(
ΟΟ0 1
x
ΟΟ1 2
=>
ΟΟ3 5
x
ΟΟ6 7
.
ΟΟ7 8
StrNameParameter
ΟΟ8 H
==
ΟΟI K
$str
ΟΟL V
)
ΟΟV W
!
ΟΟW X
.
ΟΟX Y
ObjValue
ΟΟY a
.
ΟΟa b
Trim
ΟΟb f
(
ΟΟf g
)
ΟΟg h
;
ΟΟh i
var
ΠΠ 
str_enviar_banred
ΠΠ %
=
ΠΠ& '
lst_valores
ΠΠ( 3
.
ΠΠ3 4
Find
ΠΠ4 8
(
ΠΠ8 9
x
ΠΠ9 :
=>
ΠΠ; =
x
ΠΠ> ?
.
ΠΠ? @
StrNameParameter
ΠΠ@ P
==
ΠΠQ S
$str
ΠΠT f
)
ΠΠf g
!
ΠΠg h
.
ΠΠh i
ObjValue
ΠΠi q
.
ΠΠq r
Trim
ΠΠr v
(
ΠΠv w
)
ΠΠw x
;
ΠΠx y
	respuesta
ÒÒ 
.
ÒÒ 
codigo
ÒÒ  
=
ÒÒ! "

str_codigo
ÒÒ# -
.
ÒÒ- .
ToString
ÒÒ. 6
(
ÒÒ6 7
)
ÒÒ7 8
.
ÒÒ8 9
Trim
ÒÒ9 =
(
ÒÒ= >
)
ÒÒ> ?
.
ÒÒ? @
PadLeft
ÒÒ@ G
(
ÒÒG H
$num
ÒÒH I
,
ÒÒI J
$char
ÒÒK N
)
ÒÒN O
;
ÒÒO P
	respuesta
ΣΣ 
.
ΣΣ 
cuerpo
ΣΣ  
=
ΣΣ! "
	Funciones
ΣΣ# ,
.
ΣΣ, -
ObtenerDatos
ΣΣ- 9
(
ΣΣ9 :
	resultado
ΣΣ: C
)
ΣΣC D
;
ΣΣD E
	respuesta
ΤΤ 
.
ΤΤ 
diccionario
ΤΤ %
.
ΤΤ% &
Add
ΤΤ& )
(
ΤΤ) *
$str
ΤΤ* 5
,
ΤΤ5 6
	str_error
ΤΤ7 @
.
ΤΤ@ A
ToString
ΤΤA I
(
ΤΤI J
)
ΤΤJ K
)
ΤΤK L
;
ΤΤL M
	respuesta
ΥΥ 
.
ΥΥ 
diccionario
ΥΥ %
.
ΥΥ% &
Add
ΥΥ& )
(
ΥΥ) *
$str
ΥΥ* =
,
ΥΥ= >
str_enviar_banred
ΥΥ? P
.
ΥΥP Q
ToString
ΥΥQ Y
(
ΥΥY Z
)
ΥΥZ [
)
ΥΥ[ \
;
ΥΥ\ ]
}
ΧΧ 
catch
ΨΨ 
(
ΨΨ 
	Exception
ΨΨ 
	exception
ΨΨ &
)
ΨΨ& '
{
ΩΩ 
	respuesta
ΪΪ 
.
ΪΪ 
codigo
ΪΪ  
=
ΪΪ! "
$str
ΪΪ# (
;
ΪΪ( )
	respuesta
ΫΫ 
.
ΫΫ 
diccionario
ΫΫ %
.
ΫΫ% &
Add
ΫΫ& )
(
ΫΫ) *
$str
ΫΫ* 5
,
ΫΫ5 6
	exception
ΫΫ7 @
.
ΫΫ@ A
ToString
ΫΫA I
(
ΫΫI J
)
ΫΫJ K
)
ΫΫK L
;
ΫΫL M
infoLog
έέ 
.
έέ  
str_id_transaccion
έέ *
=
έέ+ ,'
req_validar_transferencia
έέ- F
.
έέF G 
str_id_transaccion
έέG Y
;
έέY Z
infoLog
ήή 
.
ήή 
str_tipo
ήή  
=
ήή! "
str_salida_error
ήή# 3
;
ήή3 4
infoLog
ίί 
.
ίί 

str_objeto
ίί "
=
ίί# $
	exception
ίί% .
;
ίί. /
infoLog
ΰΰ 
.
ΰΰ 

str_metodo
ΰΰ "
=
ΰΰ# $

MethodBase
ΰΰ% /
.
ΰΰ/ 0
GetCurrentMethod
ΰΰ0 @
(
ΰΰ@ A
)
ΰΰA B
!
ΰΰB C
.
ΰΰC D
Name
ΰΰD H
;
ΰΰH I
infoLog
αα 
.
αα 
str_operacion
αα %
=
αα& ''
req_validar_transferencia
αα( A
.
ααA B
str_id_servicio
ααB Q
;
ααQ R
LogServicios
γγ 
.
γγ 
RegistrarTramas
γγ ,
(
γγ, -
str_salida_error
γγ- =
,
γγ= >
infoLog
γγ? F
,
γγF G
str_ruta
γγH P
)
γγP Q
;
γγQ R
throw
δδ 
;
δδ 
}
εε 
return
ζζ 
	respuesta
ζζ 
;
ζζ 
}
ηη 	
public
οο "
RespuestaTransaccion
οο #'
add_transf_interbancarias
οο$ =
(
οο= >
ReqTransferencia
οο> N
req_transferencia
οοO `
)
οο` a
{
ππ 	"
RespuestaTransaccion
ρρ  
	respuesta
ρρ! *
=
ρρ+ ,
new
ρρ- 0"
RespuestaTransaccion
ρρ1 E
(
ρρE F
)
ρρF G
;
ρρG H
try
ςς 
{
σσ 
DatosSolicitud
υυ 
ds
υυ !
=
υυ" #
new
υυ$ '
DatosSolicitud
υυ( 6
(
υυ6 7
)
υυ7 8
;
υυ8 9
ds
χχ 
.
χχ 
ListaPEntrada
χχ  
.
χχ  !
Add
χχ! $
(
χχ$ %
new
χχ% (
ParametroEntrada
χχ) 9
{
χχ: ;
StrNameParameter
χχ< L
=
χχM N
$str
χχO Z
,
χχZ [
TipoDato
χχ\ d
=
χχe f
TipoDato
χχg o
.
χχo p
Integer
χχp w
,
χχw x
ObjValueχχy 
=χχ‚ ƒ!
req_transferenciaχχ„ •
.χχ• –
int_enteχχ– 
.χχ 
ToStringχχ §
(χχ§ ¨
)χχ¨ ©
}χχª «
)χχ« ¬
;χχ¬ ­
ds
ψψ 
.
ψψ 
ListaPEntrada
ψψ  
.
ψψ  !
Add
ψψ! $
(
ψψ$ %
new
ψψ% (
ParametroEntrada
ψψ) 9
{
ψψ: ;
StrNameParameter
ψψ< L
=
ψψM N
$str
ψψO f
,
ψψf g
TipoDato
ψψh p
=
ψψq r
TipoDato
ψψs {
.
ψψ{ |
Integerψψ| ƒ
,ψψƒ „
ObjValueψψ… 
=ψψ !
req_transferenciaψψ ΅
.ψψ΅ Ά$
int_id_cta_ordenanteψψΆ ¶
.ψψ¶ ·
ToStringψψ· Ώ
(ψψΏ ΐ
)ψψΐ Α
}ψψΒ Γ
)ψψΓ Δ
;ψψΔ Ε
ds
ωω 
.
ωω 
ListaPEntrada
ωω  
.
ωω  !
Add
ωω! $
(
ωω$ %
new
ωω% (
ParametroEntrada
ωω) 9
{
ωω: ;
StrNameParameter
ωω< L
=
ωωM N
$str
ωωO i
,
ωωi j
TipoDato
ωωk s
=
ωωt u
TipoDato
ωωv ~
.
ωω~ 
Integerωω †
,ωω† ‡
ObjValueωω 
=ωω‘ ’!
req_transferenciaωω“ ¤
.ωω¤ ¥'
int_id_cta_beneficiarioωω¥ Ό
.ωωΌ ½
ToStringωω½ Ε
(ωωΕ Ζ
)ωωΖ Η
}ωωΘ Ι
)ωωΙ Κ
;ωωΚ Λ
ds
ϊϊ 
.
ϊϊ 
ListaPEntrada
ϊϊ  
.
ϊϊ  !
Add
ϊϊ! $
(
ϊϊ$ %
new
ϊϊ% (
ParametroEntrada
ϊϊ) 9
{
ϊϊ: ;
StrNameParameter
ϊϊ< L
=
ϊϊM N
$str
ϊϊO d
,
ϊϊd e
TipoDato
ϊϊf n
=
ϊϊo p
TipoDato
ϊϊq y
.
ϊϊy z
Decimalϊϊz 
,ϊϊ ‚
ObjValueϊϊƒ ‹
=ϊϊ !
req_transferenciaϊϊ 
.ϊϊ  
dec_monto_tranϊϊ  ®
.ϊϊ® ―
ToStringϊϊ― ·
(ϊϊ· Έ
)ϊϊΈ Ή
}ϊϊΊ »
)ϊϊ» Ό
;ϊϊΌ ½
ds
ϋϋ 
.
ϋϋ 
ListaPEntrada
ϋϋ  
.
ϋϋ  !
Add
ϋϋ! $
(
ϋϋ$ %
new
ϋϋ% (
ParametroEntrada
ϋϋ) 9
{
ϋϋ: ;
StrNameParameter
ϋϋ< L
=
ϋϋM N
$str
ϋϋO c
,
ϋϋc d
TipoDato
ϋϋe m
=
ϋϋn o
TipoDato
ϋϋp x
.
ϋϋx y
VarCharϋϋy €
,ϋϋ€ 
ObjValueϋϋ‚ 
=ϋϋ‹ !
req_transferenciaϋϋ 
.ϋϋ !
str_observacionesϋϋ °
.ϋϋ° ±
ToStringϋϋ± Ή
(ϋϋΉ Ί
)ϋϋΊ »
}ϋϋΌ ½
)ϋϋ½ Ύ
;ϋϋΎ Ώ
ds
όό 
.
όό 
ListaPEntrada
όό  
.
όό  !
Add
όό! $
(
όό$ %
new
όό% (
ParametroEntrada
όό) 9
{
όό: ;
StrNameParameter
όό< L
=
όόM N
$str
όόO k
,
όόk l
TipoDato
όόm u
=
όόv w
TipoDatoόόx €
.όό€ 
Integerόό 
,όό ‰
ObjValueόό ’
=όό“ ”!
req_transferenciaόό• ¦
.όό¦ §)
int_id_comprobar_transferόό§ ΐ
.όόΐ Α
ToStringόόΑ Ι
(όόΙ Κ
)όόΚ Λ
}όόΜ Ν
)όόΝ Ξ
;όόΞ Ο
ds
ύύ 
.
ύύ 
ListaPEntrada
ύύ  
.
ύύ  !
Add
ύύ! $
(
ύύ$ %
new
ύύ% (
ParametroEntrada
ύύ) 9
{
ύύ: ;
StrNameParameter
ύύ< L
=
ύύM N
$str
ύύO i
,
ύύi j
TipoDato
ύύk s
=
ύύt u
TipoDato
ύύv ~
.
ύύ~ 
VarCharύύ †
,ύύ† ‡
ObjValueύύ 
=ύύ‘ ’!
req_transferenciaύύ“ ¤
.ύύ¤ ¥'
str_correo_beneficiarioύύ¥ Ό
.ύύΌ ½
ToStringύύ½ Ε
(ύύΕ Ζ
)ύύΖ Η
}ύύΘ Ι
)ύύΙ Κ
;ύύΚ Λ
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
% (
ParametroEntrada
) 9
{
: ;
StrNameParameter
< L
=
M N
$str
O d
,
d e
TipoDato
f n
=
o p
TipoDato
q y
.
y z
VarCharz 
, ‚
ObjValueƒ ‹
= !
req_transferencia 
.  "
str_id_transaccion  ²
.² ³
ToString³ »
(» Ό
)Ό ½
}Ύ Ώ
)Ώ ΐ
;ΐ Α
ds
‚‚ 
.
‚‚ 
ListaPEntrada
‚‚  
.
‚‚  !
Add
‚‚! $
(
‚‚$ %
new
‚‚% (
ParametroEntrada
‚‚) 9
{
‚‚: ;
StrNameParameter
‚‚< L
=
‚‚M N
$str
‚‚O `
,
‚‚` a
TipoDato
‚‚b j
=
‚‚k l
TipoDato
‚‚m u
.
‚‚u v
Integer
‚‚v }
,
‚‚} ~
ObjValue‚‚ ‡
=‚‚ ‰!
req_transferencia‚‚ ›
.‚‚› 
str_id_sistema‚‚ ª
}‚‚« ¬
)‚‚¬ ­
;‚‚­ ®
ds
ƒƒ 
.
ƒƒ 
ListaPEntrada
ƒƒ  
.
ƒƒ  !
Add
ƒƒ! $
(
ƒƒ$ %
new
ƒƒ% (
ParametroEntrada
ƒƒ) 9
{
ƒƒ: ;
StrNameParameter
ƒƒ< L
=
ƒƒM N
$str
ƒƒO [
,
ƒƒ[ \
TipoDato
ƒƒ] e
=
ƒƒf g
TipoDato
ƒƒh p
.
ƒƒp q
VarChar
ƒƒq x
,
ƒƒx y
ObjValueƒƒz ‚
=ƒƒƒ „!
req_transferenciaƒƒ… –
.ƒƒ– —
	str_loginƒƒ—  
.ƒƒ  ΅
ToStringƒƒ΅ ©
(ƒƒ© ª
)ƒƒª «
}ƒƒ¬ ­
)ƒƒ­ ®
;ƒƒ® ―
ds
„„ 
.
„„ 
ListaPEntrada
„„  
.
„„  !
Add
„„! $
(
„„$ %
new
„„% (
ParametroEntrada
„„) 9
{
„„: ;
StrNameParameter
„„< L
=
„„M N
$str
„„O _
,
„„_ `
TipoDato
„„a i
=
„„j k
TipoDato
„„l t
.
„„t u
Integer
„„u |
,
„„| }
ObjValue„„~ †
=„„‡ !
req_transferencia„„‰ 
.„„ ›
str_id_perfil„„› ¨
.„„¨ ©
ToString„„© ±
(„„± ²
)„„² ³
}„„΄ µ
)„„µ ¶
;„„¶ ·
ds
…… 
.
…… 
ListaPEntrada
……  
.
……  !
Add
……! $
(
……$ %
new
……% (
ParametroEntrada
……) 9
{
……: ;
StrNameParameter
……< L
=
……M N
$str
……O `
,
……` a
TipoDato
……b j
=
……k l
TipoDato
……m u
.
……u v
Integer
……v }
,
……} ~
ObjValue…… ‡
=…… ‰!
req_transferencia…… ›
.……› 
str_id_oficina…… ª
.……ª «
ToString……« ³
(……³ ΄
)……΄ µ
}……¶ ·
)……· Έ
;……Έ Ή
ds
†† 
.
†† 
ListaPEntrada
††  
.
††  !
Add
††! $
(
††$ %
new
††% (
ParametroEntrada
††) 9
{
††: ;
StrNameParameter
††< L
=
††M N
$str
††O d
,
††d e
TipoDato
††f n
=
††o p
TipoDato
††q y
.
††y z
VarChar††z 
,†† ‚
ObjValue††ƒ ‹
=†† !
req_transferencia†† 
.††  "
str_nemonico_canal††  ²
.††² ³
ToString††³ »
(††» Ό
)††Ό ½
}††Ύ Ώ
)††Ώ ΐ
;††ΐ Α
ds
‡‡ 
.
‡‡ 
ListaPEntrada
‡‡  
.
‡‡  !
Add
‡‡! $
(
‡‡$ %
new
‡‡% (
ParametroEntrada
‡‡) 9
{
‡‡: ;
StrNameParameter
‡‡< L
=
‡‡M N
$str
‡‡O d
,
‡‡d e
TipoDato
‡‡f n
=
‡‡o p
TipoDato
‡‡q y
.
‡‡y z
VarChar‡‡z 
,‡‡ ‚
ObjValue‡‡ƒ ‹
=‡‡ !
req_transferencia‡‡ 
.‡‡  "
str_ip_dispositivo‡‡  ²
.‡‡² ³
ToString‡‡³ »
(‡‡» Ό
)‡‡Ό ½
}‡‡Ύ Ώ
)‡‡Ώ ΐ
;‡‡ΐ Α
ds
 
.
 
ListaPEntrada
  
.
  !
Add
! $
(
$ %
new
% (
ParametroEntrada
) 9
{
: ;
StrNameParameter
< L
=
M N
$str
O \
,
\ ]
TipoDato
^ f
=
g h
TipoDato
i q
.
q r
VarChar
r y
,
y z
ObjValue{ ƒ
=„ …!
req_transferencia† —
.— 

str_sesion Ά
.Ά £
ToString£ «
(« ¬
)¬ ­
}® ―
)― °
;° ±
ds
‰‰ 
.
‰‰ 
ListaPEntrada
‰‰  
.
‰‰  !
Add
‰‰! $
(
‰‰$ %
new
‰‰% (
ParametroEntrada
‰‰) 9
{
‰‰: ;
StrNameParameter
‰‰< L
=
‰‰M N
$str
‰‰O e
,
‰‰e f
TipoDato
‰‰g o
=
‰‰p q
TipoDato
‰‰r z
.
‰‰z {
VarChar‰‰{ ‚
,‰‰‚ ƒ
ObjValue‰‰„ 
=‰‰ !
req_transferencia‰‰  
.‰‰  ΅#
str_mac_dispositivo‰‰΅ ΄
.‰‰΄ µ
ToString‰‰µ ½
(‰‰½ Ύ
)‰‰Ύ Ώ
}‰‰ΐ Α
)‰‰Α Β
;‰‰Β Γ
ds
 
.
 
ListaPSalida
 
.
  
Add
  #
(
# $
new
$ '
ParametroSalida
( 7
{
8 9
StrNameParameter
: J
=
K L
$str
M _
,
_ `
TipoDato
a i
=
j k
TipoDato
l t
.
t u
Integer
u |
}
} ~
)
~ 
; €
ds
 
.
 
ListaPSalida
 
.
  
Add
  #
(
# $
new
$ '
ParametroSalida
( 7
{
8 9
StrNameParameter
: J
=
K L
$str
M [
,
[ \
TipoDato
] e
=
f g
TipoDato
h p
.
p q
VarChar
q x
}
y z
)
z {
;
{ |
ds
 
.
 
NombreSP
 
=
 
$str
 :
;
: ;
ds
 
.
 
NombreBD
 
=
 
	_settings
 '
.
' (
BD_megservicios
( 7
;
7 8
var
’’ 
	resultado
’’ 
=
’’ 
objClienteDal
’’  -
.
’’- .
ExecuteDataSet
’’. <
(
’’< =
ds
’’= ?
)
’’? @
;
’’@ A
var
““ 
lst_valores
““ 
=
““  !
new
““" %
List
““& *
<
““* +$
ParametroSalidaValores
““+ A
>
““A B
(
““B C
)
““C D
;
““D E
foreach
•• 
(
•• 
var
•• 
item
•• !
in
••" $
	resultado
••% .
.
••. /!
ListaPSalidaValores
••/ B
)
••B C
lst_valores
••D O
.
••O P
Add
••P S
(
••S T
item
••T X
)
••X Y
;
••Y Z
var
–– 

str_codigo
–– 
=
––  
lst_valores
––! ,
.
––, -
Find
––- 1
(
––1 2
x
––2 3
=>
––4 6
x
––7 8
.
––8 9
StrNameParameter
––9 I
==
––J L
$str
––M _
)
––_ `
!
––` a
.
––a b
ObjValue
––b j
;
––j k
var
—— 
	str_error
—— 
=
—— 
lst_valores
——  +
.
——+ ,
Find
——, 0
(
——0 1
x
——1 2
=>
——3 5
x
——6 7
.
——7 8
StrNameParameter
——8 H
==
——I K
$str
——L Z
)
——Z [
!
——[ \
.
——\ ]
ObjValue
——] e
.
——e f
Trim
——f j
(
——j k
)
——k l
;
——l m
	respuesta
™™ 
.
™™ 
codigo
™™  
=
™™! "

str_codigo
™™# -
.
™™- .
ToString
™™. 6
(
™™6 7
)
™™7 8
.
™™8 9
Trim
™™9 =
(
™™= >
)
™™> ?
.
™™? @
PadLeft
™™@ G
(
™™G H
$num
™™H I
,
™™I J
$char
™™K N
)
™™N O
;
™™O P
	respuesta
 
.
 
cuerpo
  
=
! "
	Funciones
# ,
.
, -
ObtenerDatos
- 9
(
9 :
	resultado
: C
)
C D
;
D E
	respuesta
›› 
.
›› 
diccionario
›› %
.
››% &
Add
››& )
(
››) *
$str
››* 5
,
››5 6
	str_error
››7 @
.
››@ A
ToString
››A I
(
››I J
)
››J K
)
››K L
;
››L M
}
 
catch
 
(
 
	Exception
 
	exception
 &
)
& '
{
 
	respuesta
   
.
   
codigo
    
=
  ! "
$str
  # (
;
  ( )
	respuesta
΅΅ 
.
΅΅ 
diccionario
΅΅ %
.
΅΅% &
Add
΅΅& )
(
΅΅) *
$str
΅΅* 5
,
΅΅5 6
	exception
΅΅7 @
.
΅΅@ A
ToString
΅΅A I
(
΅΅I J
)
΅΅J K
)
΅΅K L
;
΅΅L M
infoLog
££ 
.
££  
str_id_transaccion
££ *
=
££+ ,
req_transferencia
££- >
.
££> ? 
str_id_transaccion
££? Q
;
££Q R
infoLog
¤¤ 
.
¤¤ 
str_tipo
¤¤  
=
¤¤! "
str_salida_error
¤¤# 3
;
¤¤3 4
infoLog
¥¥ 
.
¥¥ 

str_objeto
¥¥ "
=
¥¥# $
	exception
¥¥% .
;
¥¥. /
infoLog
¦¦ 
.
¦¦ 

str_metodo
¦¦ "
=
¦¦# $

MethodBase
¦¦% /
.
¦¦/ 0
GetCurrentMethod
¦¦0 @
(
¦¦@ A
)
¦¦A B
!
¦¦B C
.
¦¦C D
Name
¦¦D H
;
¦¦H I
infoLog
§§ 
.
§§ 
str_operacion
§§ %
=
§§& '
req_transferencia
§§( 9
.
§§9 :
str_id_servicio
§§: I
;
§§I J
LogServicios
©© 
.
©© 
RegistrarTramas
©© ,
(
©©, -
str_salida_error
©©- =
,
©©= >
infoLog
©©? F
,
©©F G
str_ruta
©©H P
)
©©P Q
;
©©Q R
throw
ªª 
;
ªª 
}
«« 
return
¬¬ 
	respuesta
¬¬ 
;
¬¬ 
}
­­ 	
public
°° "
RespuestaTransaccion
°° #&
set_envio_transf_por_spi
°°$ <
(
°°< =
ReqTransferencia
°°= M
req_transferencia
°°N _
)
°°_ `
{
±± 	"
RespuestaTransaccion
²²  
	respuesta
²²! *
=
²²+ ,
new
²²- 0"
RespuestaTransaccion
²²1 E
(
²²E F
)
²²F G
;
²²G H
try
³³ 
{
΄΄ 
DatosSolicitud
µµ 
ds
µµ !
=
µµ" #
new
µµ$ '
DatosSolicitud
µµ( 6
(
µµ6 7
)
µµ7 8
;
µµ8 9
ds
·· 
.
·· 
ListaPEntrada
··  
.
··  !
Add
··! $
(
··$ %
new
··% (
ParametroEntrada
··) 9
{
··: ;
StrNameParameter
··< L
=
··M N
$str
··O k
,
··k l
TipoDato
··m u
=
··v w
TipoDato··x €
.··€ 
Integer·· 
,·· ‰
ObjValue·· ’
=··“ ”!
req_transferencia··• ¦
.··¦ §)
int_id_comprobar_transfer··§ ΐ
.··ΐ Α
ToString··Α Ι
(··Ι Κ
)··Κ Λ
}··Μ Ν
)··Ν Ξ
;··Ξ Ο
ds
ΊΊ 
.
ΊΊ 
ListaPEntrada
ΊΊ  
.
ΊΊ  !
Add
ΊΊ! $
(
ΊΊ$ %
new
ΊΊ% (
ParametroEntrada
ΊΊ) 9
{
ΊΊ: ;
StrNameParameter
ΊΊ< L
=
ΊΊM N
$str
ΊΊO d
,
ΊΊd e
TipoDato
ΊΊf n
=
ΊΊo p
TipoDato
ΊΊq y
.
ΊΊy z
VarCharΊΊz 
,ΊΊ ‚
ObjValueΊΊƒ ‹
=ΊΊ !
req_transferenciaΊΊ 
.ΊΊ  "
str_id_transaccionΊΊ  ²
.ΊΊ² ³
ToStringΊΊ³ »
(ΊΊ» Ό
)ΊΊΌ ½
}ΊΊΎ Ώ
)ΊΊΏ ΐ
;ΊΊΐ Α
ds
»» 
.
»» 
ListaPEntrada
»»  
.
»»  !
Add
»»! $
(
»»$ %
new
»»% (
ParametroEntrada
»») 9
{
»»: ;
StrNameParameter
»»< L
=
»»M N
$str
»»O `
,
»»` a
TipoDato
»»b j
=
»»k l
TipoDato
»»m u
.
»»u v
Integer
»»v }
,
»»} ~
ObjValue»» ‡
=»» ‰!
req_transferencia»» ›
.»»› 
str_id_sistema»» ª
}»»« ¬
)»»¬ ­
;»»­ ®
ds
ΌΌ 
.
ΌΌ 
ListaPEntrada
ΌΌ  
.
ΌΌ  !
Add
ΌΌ! $
(
ΌΌ$ %
new
ΌΌ% (
ParametroEntrada
ΌΌ) 9
{
ΌΌ: ;
StrNameParameter
ΌΌ< L
=
ΌΌM N
$str
ΌΌO [
,
ΌΌ[ \
TipoDato
ΌΌ] e
=
ΌΌf g
TipoDato
ΌΌh p
.
ΌΌp q
VarChar
ΌΌq x
,
ΌΌx y
ObjValueΌΌz ‚
=ΌΌƒ „!
req_transferenciaΌΌ… –
.ΌΌ– —
	str_loginΌΌ—  
.ΌΌ  ΅
ToStringΌΌ΅ ©
(ΌΌ© ª
)ΌΌª «
}ΌΌ¬ ­
)ΌΌ­ ®
;ΌΌ® ―
ds
½½ 
.
½½ 
ListaPEntrada
½½  
.
½½  !
Add
½½! $
(
½½$ %
new
½½% (
ParametroEntrada
½½) 9
{
½½: ;
StrNameParameter
½½< L
=
½½M N
$str
½½O _
,
½½_ `
TipoDato
½½a i
=
½½j k
TipoDato
½½l t
.
½½t u
Integer
½½u |
,
½½| }
ObjValue½½~ †
=½½‡ !
req_transferencia½½‰ 
.½½ ›
str_id_perfil½½› ¨
.½½¨ ©
ToString½½© ±
(½½± ²
)½½² ³
}½½΄ µ
)½½µ ¶
;½½¶ ·
ds
ΎΎ 
.
ΎΎ 
ListaPEntrada
ΎΎ  
.
ΎΎ  !
Add
ΎΎ! $
(
ΎΎ$ %
new
ΎΎ% (
ParametroEntrada
ΎΎ) 9
{
ΎΎ: ;
StrNameParameter
ΎΎ< L
=
ΎΎM N
$str
ΎΎO `
,
ΎΎ` a
TipoDato
ΎΎb j
=
ΎΎk l
TipoDato
ΎΎm u
.
ΎΎu v
Integer
ΎΎv }
,
ΎΎ} ~
ObjValueΎΎ ‡
=ΎΎ ‰!
req_transferenciaΎΎ ›
.ΎΎ› 
str_id_oficinaΎΎ ª
.ΎΎª «
ToStringΎΎ« ³
(ΎΎ³ ΄
)ΎΎ΄ µ
}ΎΎ¶ ·
)ΎΎ· Έ
;ΎΎΈ Ή
ds
ΏΏ 
.
ΏΏ 
ListaPEntrada
ΏΏ  
.
ΏΏ  !
Add
ΏΏ! $
(
ΏΏ$ %
new
ΏΏ% (
ParametroEntrada
ΏΏ) 9
{
ΏΏ: ;
StrNameParameter
ΏΏ< L
=
ΏΏM N
$str
ΏΏO d
,
ΏΏd e
TipoDato
ΏΏf n
=
ΏΏo p
TipoDato
ΏΏq y
.
ΏΏy z
VarCharΏΏz 
,ΏΏ ‚
ObjValueΏΏƒ ‹
=ΏΏ !
req_transferenciaΏΏ 
.ΏΏ  "
str_nemonico_canalΏΏ  ²
.ΏΏ² ³
ToStringΏΏ³ »
(ΏΏ» Ό
)ΏΏΌ ½
}ΏΏΎ Ώ
)ΏΏΏ ΐ
;ΏΏΐ Α
ds
ΐΐ 
.
ΐΐ 
ListaPEntrada
ΐΐ  
.
ΐΐ  !
Add
ΐΐ! $
(
ΐΐ$ %
new
ΐΐ% (
ParametroEntrada
ΐΐ) 9
{
ΐΐ: ;
StrNameParameter
ΐΐ< L
=
ΐΐM N
$str
ΐΐO d
,
ΐΐd e
TipoDato
ΐΐf n
=
ΐΐo p
TipoDato
ΐΐq y
.
ΐΐy z
VarCharΐΐz 
,ΐΐ ‚
ObjValueΐΐƒ ‹
=ΐΐ !
req_transferenciaΐΐ 
.ΐΐ  "
str_ip_dispositivoΐΐ  ²
.ΐΐ² ³
ToStringΐΐ³ »
(ΐΐ» Ό
)ΐΐΌ ½
}ΐΐΎ Ώ
)ΐΐΏ ΐ
;ΐΐΐ Α
ds
ΑΑ 
.
ΑΑ 
ListaPEntrada
ΑΑ  
.
ΑΑ  !
Add
ΑΑ! $
(
ΑΑ$ %
new
ΑΑ% (
ParametroEntrada
ΑΑ) 9
{
ΑΑ: ;
StrNameParameter
ΑΑ< L
=
ΑΑM N
$str
ΑΑO \
,
ΑΑ\ ]
TipoDato
ΑΑ^ f
=
ΑΑg h
TipoDato
ΑΑi q
.
ΑΑq r
VarChar
ΑΑr y
,
ΑΑy z
ObjValueΑΑ{ ƒ
=ΑΑ„ …!
req_transferenciaΑΑ† —
.ΑΑ— 

str_sesionΑΑ Ά
.ΑΑΆ £
ToStringΑΑ£ «
(ΑΑ« ¬
)ΑΑ¬ ­
}ΑΑ® ―
)ΑΑ― °
;ΑΑ° ±
ds
ΒΒ 
.
ΒΒ 
ListaPEntrada
ΒΒ  
.
ΒΒ  !
Add
ΒΒ! $
(
ΒΒ$ %
new
ΒΒ% (
ParametroEntrada
ΒΒ) 9
{
ΒΒ: ;
StrNameParameter
ΒΒ< L
=
ΒΒM N
$str
ΒΒO e
,
ΒΒe f
TipoDato
ΒΒg o
=
ΒΒp q
TipoDato
ΒΒr z
.
ΒΒz {
VarCharΒΒ{ ‚
,ΒΒ‚ ƒ
ObjValueΒΒ„ 
=ΒΒ !
req_transferenciaΒΒ  
.ΒΒ  ΅#
str_mac_dispositivoΒΒ΅ ΄
.ΒΒ΄ µ
ToStringΒΒµ ½
(ΒΒ½ Ύ
)ΒΒΎ Ώ
}ΒΒΐ Α
)ΒΒΑ Β
;ΒΒΒ Γ
ds
ΕΕ 
.
ΕΕ 
ListaPSalida
ΕΕ 
.
ΕΕ  
Add
ΕΕ  #
(
ΕΕ# $
new
ΕΕ$ '
ParametroSalida
ΕΕ( 7
{
ΕΕ8 9
StrNameParameter
ΕΕ: J
=
ΕΕK L
$str
ΕΕM W
,
ΕΕW X
TipoDato
ΕΕY a
=
ΕΕb c
TipoDato
ΕΕd l
.
ΕΕl m
VarChar
ΕΕm t
}
ΕΕu v
)
ΕΕv w
;
ΕΕw x
ds
ΖΖ 
.
ΖΖ 
ListaPSalida
ΖΖ 
.
ΖΖ  
Add
ΖΖ  #
(
ΖΖ# $
new
ΖΖ$ '
ParametroSalida
ΖΖ( 7
{
ΖΖ8 9
StrNameParameter
ΖΖ: J
=
ΖΖK L
$str
ΖΖM [
,
ΖΖ[ \
TipoDato
ΖΖ] e
=
ΖΖf g
TipoDato
ΖΖh p
.
ΖΖp q
Integer
ΖΖq x
}
ΖΖy z
)
ΖΖz {
;
ΖΖ{ |
ds
ΘΘ 
.
ΘΘ 
NombreSP
ΘΘ 
=
ΘΘ 
$str
ΘΘ 9
;
ΘΘ9 :
ds
ΙΙ 
.
ΙΙ 
NombreBD
ΙΙ 
=
ΙΙ 
	_settings
ΙΙ '
.
ΙΙ' (
BD_megservicios
ΙΙ( 7
;
ΙΙ7 8
var
ΛΛ 
	resultado
ΛΛ 
=
ΛΛ 
objClienteDal
ΛΛ  -
.
ΛΛ- .
ExecuteNonQuery
ΛΛ. =
(
ΛΛ= >
ds
ΛΛ> @
)
ΛΛ@ A
;
ΛΛA B
var
ΜΜ 
lst_valores
ΜΜ 
=
ΜΜ  !
new
ΜΜ" %
List
ΜΜ& *
<
ΜΜ* +$
ParametroSalidaValores
ΜΜ+ A
>
ΜΜA B
(
ΜΜB C
)
ΜΜC D
;
ΜΜD E
foreach
ΞΞ 
(
ΞΞ 
var
ΞΞ 
item
ΞΞ !
in
ΞΞ" $
	resultado
ΞΞ% .
.
ΞΞ. /!
ListaPSalidaValores
ΞΞ/ B
)
ΞΞB C
lst_valores
ΞΞD O
.
ΞΞO P
Add
ΞΞP S
(
ΞΞS T
item
ΞΞT X
)
ΞΞX Y
;
ΞΞY Z
var
ΟΟ 

str_codigo
ΟΟ 
=
ΟΟ  
lst_valores
ΟΟ! ,
.
ΟΟ, -
Find
ΟΟ- 1
(
ΟΟ1 2
x
ΟΟ2 3
=>
ΟΟ4 6
x
ΟΟ7 8
.
ΟΟ8 9
StrNameParameter
ΟΟ9 I
==
ΟΟJ L
$str
ΟΟM [
)
ΟΟ[ \
!
ΟΟ\ ]
.
ΟΟ] ^
ObjValue
ΟΟ^ f
;
ΟΟf g
var
ΠΠ 
	str_error
ΠΠ 
=
ΠΠ 
lst_valores
ΠΠ  +
.
ΠΠ+ ,
Find
ΠΠ, 0
(
ΠΠ0 1
x
ΠΠ1 2
=>
ΠΠ3 5
x
ΠΠ6 7
.
ΠΠ7 8
StrNameParameter
ΠΠ8 H
==
ΠΠI K
$str
ΠΠL V
)
ΠΠV W
!
ΠΠW X
.
ΠΠX Y
ObjValue
ΠΠY a
.
ΠΠa b
Trim
ΠΠb f
(
ΠΠf g
)
ΠΠg h
;
ΠΠh i
	respuesta
ÒÒ 
.
ÒÒ 
codigo
ÒÒ  
=
ÒÒ! "

str_codigo
ÒÒ# -
.
ÒÒ- .
ToString
ÒÒ. 6
(
ÒÒ6 7
)
ÒÒ7 8
.
ÒÒ8 9
Trim
ÒÒ9 =
(
ÒÒ= >
)
ÒÒ> ?
.
ÒÒ? @
PadLeft
ÒÒ@ G
(
ÒÒG H
$num
ÒÒH I
,
ÒÒI J
$char
ÒÒK N
)
ÒÒN O
;
ÒÒO P
	respuesta
ΣΣ 
.
ΣΣ 
cuerpo
ΣΣ  
=
ΣΣ! "
	resultado
ΣΣ# ,
.
ΣΣ, -
NumAfectados
ΣΣ- 9
;
ΣΣ9 :
	respuesta
ΤΤ 
.
ΤΤ 
diccionario
ΤΤ %
.
ΤΤ% &
Add
ΤΤ& )
(
ΤΤ) *
$str
ΤΤ* 5
,
ΤΤ5 6
	str_error
ΤΤ7 @
.
ΤΤ@ A
ToString
ΤΤA I
(
ΤΤI J
)
ΤΤJ K
)
ΤΤK L
;
ΤΤL M
}
ΧΧ 
catch
ΨΨ 
(
ΨΨ 
	Exception
ΨΨ 
	exception
ΨΨ &
)
ΨΨ& '
{
ΩΩ 
	respuesta
ΪΪ 
.
ΪΪ 
codigo
ΪΪ  
=
ΪΪ! "
$str
ΪΪ# (
;
ΪΪ( )
	respuesta
ΫΫ 
.
ΫΫ 
diccionario
ΫΫ %
.
ΫΫ% &
Add
ΫΫ& )
(
ΫΫ) *
$str
ΫΫ* 5
,
ΫΫ5 6
	exception
ΫΫ7 @
.
ΫΫ@ A
ToString
ΫΫA I
(
ΫΫI J
)
ΫΫJ K
)
ΫΫK L
;
ΫΫL M
infoLog
έέ 
.
έέ  
str_id_transaccion
έέ *
=
έέ+ ,
req_transferencia
έέ- >
.
έέ> ? 
str_id_transaccion
έέ? Q
;
έέQ R
infoLog
ήή 
.
ήή 
str_tipo
ήή  
=
ήή! "
str_salida_error
ήή# 3
;
ήή3 4
infoLog
ίί 
.
ίί 

str_objeto
ίί "
=
ίί# $
	exception
ίί% .
;
ίί. /
infoLog
ΰΰ 
.
ΰΰ 

str_metodo
ΰΰ "
=
ΰΰ# $

MethodBase
ΰΰ% /
.
ΰΰ/ 0
GetCurrentMethod
ΰΰ0 @
(
ΰΰ@ A
)
ΰΰA B
!
ΰΰB C
.
ΰΰC D
Name
ΰΰD H
;
ΰΰH I
infoLog
αα 
.
αα 
str_operacion
αα %
=
αα& '
req_transferencia
αα( 9
.
αα9 :
str_id_servicio
αα: I
;
ααI J
LogServicios
γγ 
.
γγ 
RegistrarTramas
γγ ,
(
γγ, -
str_salida_error
γγ- =
,
γγ= >
infoLog
γγ? F
,
γγF G
str_ruta
γγH P
)
γγP Q
;
γγQ R
throw
δδ 
;
δδ 
}
εε 
return
ζζ 
	respuesta
ζζ 
;
ζζ 
}
ηη 	
public
κκ "
RespuestaTransaccion
κκ #,
obtener_datos_req_pago_directo
κκ$ B
(
κκB C
ReqTransferencia
κκC S
req_transferencia
κκT e
)
κκe f
{
λλ 	"
RespuestaTransaccion
μμ  
	respuesta
μμ! *
=
μμ+ ,
new
μμ- 0"
RespuestaTransaccion
μμ1 E
(
μμE F
)
μμF G
;
μμG H
try
νν 
{
ξξ 
DatosSolicitud
οο 
ds
οο !
=
οο" #
new
οο$ '
DatosSolicitud
οο( 6
(
οο6 7
)
οο7 8
;
οο8 9
ds
ςς 
.
ςς 
ListaPEntrada
ςς  
.
ςς  !
Add
ςς! $
(
ςς$ %
new
ςς% (
ParametroEntrada
ςς) 9
{
ςς: ;
StrNameParameter
ςς< L
=
ςςM N
$str
ςςO d
,
ςςd e
TipoDato
ςςf n
=
ςςo p
TipoDato
ςςq y
.
ςςy z
VarCharςςz 
,ςς ‚
ObjValueςςƒ ‹
=ςς !
req_transferenciaςς 
.ςς  "
str_id_transaccionςς  ²
.ςς² ³
ToStringςς³ »
(ςς» Ό
)ςςΌ ½
}ςςΎ Ώ
)ςςΏ ΐ
;ςςΐ Α
ds
σσ 
.
σσ 
ListaPEntrada
σσ  
.
σσ  !
Add
σσ! $
(
σσ$ %
new
σσ% (
ParametroEntrada
σσ) 9
{
σσ: ;
StrNameParameter
σσ< L
=
σσM N
$str
σσO `
,
σσ` a
TipoDato
σσb j
=
σσk l
TipoDato
σσm u
.
σσu v
Integer
σσv }
,
σσ} ~
ObjValueσσ ‡
=σσ ‰!
req_transferenciaσσ ›
.σσ› 
str_id_sistemaσσ ª
}σσ« ¬
)σσ¬ ­
;σσ­ ®
ds
ττ 
.
ττ 
ListaPEntrada
ττ  
.
ττ  !
Add
ττ! $
(
ττ$ %
new
ττ% (
ParametroEntrada
ττ) 9
{
ττ: ;
StrNameParameter
ττ< L
=
ττM N
$str
ττO [
,
ττ[ \
TipoDato
ττ] e
=
ττf g
TipoDato
ττh p
.
ττp q
VarChar
ττq x
,
ττx y
ObjValueττz ‚
=ττƒ „!
req_transferenciaττ… –
.ττ– —
	str_loginττ—  
.ττ  ΅
ToStringττ΅ ©
(ττ© ª
)ττª «
}ττ¬ ­
)ττ­ ®
;ττ® ―
ds
υυ 
.
υυ 
ListaPEntrada
υυ  
.
υυ  !
Add
υυ! $
(
υυ$ %
new
υυ% (
ParametroEntrada
υυ) 9
{
υυ: ;
StrNameParameter
υυ< L
=
υυM N
$str
υυO _
,
υυ_ `
TipoDato
υυa i
=
υυj k
TipoDato
υυl t
.
υυt u
Integer
υυu |
,
υυ| }
ObjValueυυ~ †
=υυ‡ !
req_transferenciaυυ‰ 
.υυ ›
str_id_perfilυυ› ¨
.υυ¨ ©
ToStringυυ© ±
(υυ± ²
)υυ² ³
}υυ΄ µ
)υυµ ¶
;υυ¶ ·
ds
φφ 
.
φφ 
ListaPEntrada
φφ  
.
φφ  !
Add
φφ! $
(
φφ$ %
new
φφ% (
ParametroEntrada
φφ) 9
{
φφ: ;
StrNameParameter
φφ< L
=
φφM N
$str
φφO `
,
φφ` a
TipoDato
φφb j
=
φφk l
TipoDato
φφm u
.
φφu v
Integer
φφv }
,
φφ} ~
ObjValueφφ ‡
=φφ ‰!
req_transferenciaφφ ›
.φφ› 
str_id_oficinaφφ ª
.φφª «
ToStringφφ« ³
(φφ³ ΄
)φφ΄ µ
}φφ¶ ·
)φφ· Έ
;φφΈ Ή
ds
χχ 
.
χχ 
ListaPEntrada
χχ  
.
χχ  !
Add
χχ! $
(
χχ$ %
new
χχ% (
ParametroEntrada
χχ) 9
{
χχ: ;
StrNameParameter
χχ< L
=
χχM N
$str
χχO d
,
χχd e
TipoDato
χχf n
=
χχo p
TipoDato
χχq y
.
χχy z
VarCharχχz 
,χχ ‚
ObjValueχχƒ ‹
=χχ !
req_transferenciaχχ 
.χχ  "
str_nemonico_canalχχ  ²
.χχ² ³
ToStringχχ³ »
(χχ» Ό
)χχΌ ½
}χχΎ Ώ
)χχΏ ΐ
;χχΐ Α
ds
ψψ 
.
ψψ 
ListaPEntrada
ψψ  
.
ψψ  !
Add
ψψ! $
(
ψψ$ %
new
ψψ% (
ParametroEntrada
ψψ) 9
{
ψψ: ;
StrNameParameter
ψψ< L
=
ψψM N
$str
ψψO d
,
ψψd e
TipoDato
ψψf n
=
ψψo p
TipoDato
ψψq y
.
ψψy z
VarCharψψz 
,ψψ ‚
ObjValueψψƒ ‹
=ψψ !
req_transferenciaψψ 
.ψψ  "
str_ip_dispositivoψψ  ²
.ψψ² ³
ToStringψψ³ »
(ψψ» Ό
)ψψΌ ½
}ψψΎ Ώ
)ψψΏ ΐ
;ψψΐ Α
ds
ωω 
.
ωω 
ListaPEntrada
ωω  
.
ωω  !
Add
ωω! $
(
ωω$ %
new
ωω% (
ParametroEntrada
ωω) 9
{
ωω: ;
StrNameParameter
ωω< L
=
ωωM N
$str
ωωO \
,
ωω\ ]
TipoDato
ωω^ f
=
ωωg h
TipoDato
ωωi q
.
ωωq r
VarChar
ωωr y
,
ωωy z
ObjValueωω{ ƒ
=ωω„ …!
req_transferenciaωω† —
.ωω— 

str_sesionωω Ά
.ωωΆ £
ToStringωω£ «
(ωω« ¬
)ωω¬ ­
}ωω® ―
)ωω― °
;ωω° ±
ds
όό 
.
όό 
ListaPEntrada
όό  
.
όό  !
Add
όό! $
(
όό$ %
new
όό% (
ParametroEntrada
όό) 9
{
όό: ;
StrNameParameter
όό< L
=
όόM N
$str
όόO `
,
όό` a
TipoDato
όόb j
=
όόk l
TipoDato
όόm u
.
όόu v
VarChar
όόv }
,
όό} ~
ObjValueόό ‡
=όό ‰!
req_transferenciaόό ›
.όό› 

str_sesionόό ¦
.όό¦ §
ToStringόό§ ―
(όό― °
)όό° ±
}όό² ³
)όό³ ΄
;όό΄ µ
ds
ώώ 
.
ώώ 
ListaPSalida
ώώ 
.
ώώ  
Add
ώώ  #
(
ώώ# $
new
ώώ$ '
ParametroSalida
ώώ( 7
{
ώώ8 9
StrNameParameter
ώώ: J
=
ώώK L
$str
ώώM W
,
ώώW X
TipoDato
ώώY a
=
ώώb c
TipoDato
ώώd l
.
ώώl m
VarChar
ώώm t
}
ώώu v
)
ώώv w
;
ώώw x
ds
ÿÿ 
.
ÿÿ 
ListaPSalida
ÿÿ 
.
ÿÿ  
Add
ÿÿ  #
(
ÿÿ# $
new
ÿÿ$ '
ParametroSalida
ÿÿ( 7
{
ÿÿ8 9
StrNameParameter
ÿÿ: J
=
ÿÿK L
$str
ÿÿM [
,
ÿÿ[ \
TipoDato
ÿÿ] e
=
ÿÿf g
TipoDato
ÿÿh p
.
ÿÿp q
Integer
ÿÿq x
}
ÿÿy z
)
ÿÿz {
;
ÿÿ{ |
ds
 
.
 
NombreSP
 
=
 
$str
 9
;
9 :
ds
‚‚ 
.
‚‚ 
NombreBD
‚‚ 
=
‚‚ 
	_settings
‚‚ '
.
‚‚' (
BD_megservicios
‚‚( 7
;
‚‚7 8
var
„„ 
	resultado
„„ 
=
„„ 
objClienteDal
„„  -
.
„„- .
ExecuteNonQuery
„„. =
(
„„= >
ds
„„> @
)
„„@ A
;
„„A B
var
…… 
lst_valores
…… 
=
……  !
new
……" %
List
……& *
<
……* +$
ParametroSalidaValores
……+ A
>
……A B
(
……B C
)
……C D
;
……D E
foreach
‡‡ 
(
‡‡ 
var
‡‡ 
item
‡‡ !
in
‡‡" $
	resultado
‡‡% .
.
‡‡. /!
ListaPSalidaValores
‡‡/ B
)
‡‡B C
lst_valores
‡‡D O
.
‡‡O P
Add
‡‡P S
(
‡‡S T
item
‡‡T X
)
‡‡X Y
;
‡‡Y Z
var
 

str_codigo
 
=
  
lst_valores
! ,
.
, -
Find
- 1
(
1 2
x
2 3
=>
4 6
x
7 8
.
8 9
StrNameParameter
9 I
==
J L
$str
M [
)
[ \
!
\ ]
.
] ^
ObjValue
^ f
;
f g
var
‰‰ 
	str_error
‰‰ 
=
‰‰ 
lst_valores
‰‰  +
.
‰‰+ ,
Find
‰‰, 0
(
‰‰0 1
x
‰‰1 2
=>
‰‰3 5
x
‰‰6 7
.
‰‰7 8
StrNameParameter
‰‰8 H
==
‰‰I K
$str
‰‰L V
)
‰‰V W
!
‰‰W X
.
‰‰X Y
ObjValue
‰‰Y a
.
‰‰a b
Trim
‰‰b f
(
‰‰f g
)
‰‰g h
;
‰‰h i
	respuesta
‹‹ 
.
‹‹ 
codigo
‹‹  
=
‹‹! "

str_codigo
‹‹# -
.
‹‹- .
ToString
‹‹. 6
(
‹‹6 7
)
‹‹7 8
.
‹‹8 9
Trim
‹‹9 =
(
‹‹= >
)
‹‹> ?
.
‹‹? @
PadLeft
‹‹@ G
(
‹‹G H
$num
‹‹H I
,
‹‹I J
$char
‹‹K N
)
‹‹N O
;
‹‹O P
	respuesta
 
.
 
cuerpo
  
=
! "
	resultado
# ,
.
, -
NumAfectados
- 9
;
9 :
	respuesta
 
.
 
diccionario
 %
.
% &
Add
& )
(
) *
$str
* 5
,
5 6
	str_error
7 @
.
@ A
ToString
A I
(
I J
)
J K
)
K L
;
L M
}
 
catch
 
(
 
	Exception
 
	exception
 &
)
& '
{
‘‘ 
	respuesta
’’ 
.
’’ 
codigo
’’  
=
’’! "
$str
’’# (
;
’’( )
	respuesta
““ 
.
““ 
diccionario
““ %
.
““% &
Add
““& )
(
““) *
$str
““* 5
,
““5 6
	exception
““7 @
.
““@ A
ToString
““A I
(
““I J
)
““J K
)
““K L
;
““L M
infoLog
•• 
.
••  
str_id_transaccion
•• *
=
••+ ,
req_transferencia
••- >
.
••> ? 
str_id_transaccion
••? Q
;
••Q R
infoLog
–– 
.
–– 
str_tipo
––  
=
––! "
str_salida_error
––# 3
;
––3 4
infoLog
—— 
.
—— 

str_objeto
—— "
=
——# $
	exception
——% .
;
——. /
infoLog
 
.
 

str_metodo
 "
=
# $

MethodBase
% /
.
/ 0
GetCurrentMethod
0 @
(
@ A
)
A B
!
B C
.
C D
Name
D H
;
H I
infoLog
™™ 
.
™™ 
str_operacion
™™ %
=
™™& '
req_transferencia
™™( 9
.
™™9 :
str_id_servicio
™™: I
;
™™I J
LogServicios
›› 
.
›› 
RegistrarTramas
›› ,
(
››, -
str_salida_error
››- =
,
››= >
infoLog
››? F
,
››F G
str_ruta
››H P
)
››P Q
;
››Q R
throw
 
;
 
}
 
return
 
	respuesta
 
;
 
}
 	
}
¥¥ 
}¦¦ 