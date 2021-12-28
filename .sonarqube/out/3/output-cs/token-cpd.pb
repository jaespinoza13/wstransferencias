î
OC:\SistemasMego\wsTransferencias_net_6\wsTransferencias.Dat\BeneficiariosDat.cs
	namespace 	
wsTransferencias
 
. 
Dat 
{ 
public 

class 
BeneficiariosDat !
{ 
private 
readonly 
ServiceSettings (
	_settings) 2
;2 3
private 
readonly 
	DALClient "
objClienteDal# 0
;0 1
InfoLog 
obj_infoLog 
; 
readonly 
string 
str_ruta  
;  !
private 
const 
string 
str_salida_error -
=. /
$str0 6
;6 7
public 
BeneficiariosDat 
(  
ServiceSettings  /
serviceSettings0 ?
,? @
InfoLogA H
infoLogI P
)P Q
{ 	
	_settings 
= 
serviceSettings '
;' (
obj_infoLog 
= 
infoLog !
;! "
obj_infoLog 
. 
	str_clase !
=" #
$str$ 2
;2 3
obj_infoLog 
. 
str_tipo  
=! "
str_salida_error# 3
;3 4
this 
. 
str_ruta 
= 
serviceSettings +
.+ ,
path_logs_consultas, ?
;? @
var!! 
httpHandler!! 
=!! 
new!! !
HttpClientHandler!!" 3
(!!3 4
)!!4 5
;!!5 6
httpHandler"" 
."" 5
)ServerCertificateCustomValidationCallback"" A
=""B C
HttpClientHandler""D U
.""U V9
,DangerousAcceptAnyServerCertificateValidator	""V Ç
;
""Ç É
var## 
canal## 
=## 
GrpcChannel## #
.### $

ForAddress##$ .
(##. /
serviceSettings##/ >
.##> ? 
servicio_grpc_sybase##? S
,##S T
new##U X
GrpcChannelOptions##Y k
{##l m
HttpHandler##n y
=##z {
httpHandler	##| á
}
##à â
)
##â ä
;
##ä ã
objClienteDal$$ 
=$$ 
new$$ 
	DALClient$$  )
($$) *
canal$$* /
)$$/ 0
;$$0 1
}%% 	
public((  
RespuestaTransaccion(( #%
add_cuentas_beneficiarios(($ =
(((= >
ReqBeneficiarios((> N
obj_beneficiario((O _
)((_ `
{)) 	
var** 
	respuesta** 
=** 
new**  
RespuestaTransaccion**  4
(**4 5
)**5 6
;**6 7
try,, 
{-- 
DatosSolicitud.. 
ds.. !
=.." #
new..$ '
DatosSolicitud..( 6
(..6 7
)..7 8
;..8 9
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
$str00O `
,00` a
TipoDato00b j
=00k l
TipoDato00m u
.00u v
VarChar00v }
,00} ~
ObjValue	00 á
=
00à â
obj_beneficiario
00ä ö
.
00ö õ
str_codigo_ifi
00õ ©
.
00© ™
ToString
00™ ≤
(
00≤ ≥
)
00≥ ¥
}
00µ ∂
)
00∂ ∑
;
00∑ ∏
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
$str11O c
,11c d
TipoDato11e m
=11n o
TipoDato11p x
.11x y
Integer	11y Ä
,
11Ä Å
ObjValue
11Ç ä
=
11ã å
obj_beneficiario
11ç ù
.
11ù û
int_tipo_producto
11û Ø
.
11Ø ∞
ToString
11∞ ∏
(
11∏ π
)
11π ∫
}
11ª º
)
11º Ω
;
11Ω æ
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
$str22O ]
,22] ^
TipoDato22_ g
=22h i
TipoDato22j r
.22r s
VarChar22s z
,22z {
ObjValue	22| Ñ
=
22Ö Ü
obj_beneficiario
22á ó
.
22ó ò
str_num_cta
22ò £
.
22£ §
ToString
22§ ¨
(
22¨ ≠
)
22≠ Æ
}
22Ø ∞
)
22∞ ±
;
22± ≤
ds33 
.33 
ListaPEntrada33  
.33  !
Add33! $
(33$ %
new33% (
ParametroEntrada33) 9
{33: ;
StrNameParameter33< L
=33M N
$str33O c
,33c d
TipoDato33e m
=33n o
TipoDato33p x
.33x y
VarChar	33y Ä
,
33Ä Å
ObjValue
33Ç ä
=
33ã å
obj_beneficiario
33ç ù
.
33ù û
str_num_documento
33û Ø
.
33Ø ∞
ToString
33∞ ∏
(
33∏ π
)
33π ∫
}
33ª º
)
33º Ω
;
33Ω æ
ds44 
.44 
ListaPEntrada44  
.44  !
Add44! $
(44$ %
new44% (
ParametroEntrada44) 9
{44: ;
StrNameParameter44< L
=44M N
$str44O ]
,44] ^
TipoDato44_ g
=44h i
TipoDato44j r
.44r s
VarChar44s z
,44z {
ObjValue	44| Ñ
=
44Ö Ü
obj_beneficiario
44á ó
.
44ó ò
str_nombres
44ò £
.
44£ §
ToString
44§ ¨
(
44¨ ≠
)
44≠ Æ
}
44Ø ∞
)
44∞ ±
;
44± ≤
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
$str55O [
,55[ \
TipoDato55] e
=55f g
TipoDato55h p
.55p q
VarChar55q x
,55x y
ObjValue	55z Ç
=
55É Ñ
obj_beneficiario
55Ö ï
.
55ï ñ
	str_email
55ñ ü
.
55ü †
ToString
55† ®
(
55® ©
)
55© ™
}
55´ ¨
)
55¨ ≠
;
55≠ Æ
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
$str66O _
,66_ `
TipoDato66a i
=66j k
TipoDato66l t
.66t u
VarChar66u |
,66| }
ObjValue	66~ Ü
=
66á à
obj_beneficiario
66â ô
.
66ô ö
str_alias_cta
66ö ß
.
66ß ®
ToString
66® ∞
(
66∞ ±
)
66± ≤
}
66≥ ¥
)
66¥ µ
;
66µ ∂
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
$str77O g
,77g h
TipoDato77i q
=77r s
TipoDato77t |
.77| }
Integer	77} Ñ
,
77Ñ Ö
ObjValue
77Ü é
=
77è ê
obj_beneficiario
77ë °
.
77° ¢#
int_tipo_tarjeta_cred
77¢ ∑
.
77∑ ∏
ToString
77∏ ¿
(
77¿ ¡
)
77¡ ¬
}
77√ ƒ
)
77ƒ ≈
;
77≈ ∆
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
$str88O g
,88g h
TipoDato88i q
=88r s
TipoDato88t |
.88| }
VarChar	88} Ñ
,
88Ñ Ö
ObjValue
88Ü é
=
88è ê
obj_beneficiario
88ë °
.
88° ¢#
str_tipo_beneficiario
88¢ ∑
.
88∑ ∏
ToString
88∏ ¿
(
88¿ ¡
)
88¡ ¬
}
88√ ƒ
)
88ƒ ≈
;
88≈ ∆
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
$str99O c
,99c d
TipoDato99e m
=99n o
TipoDato99p x
.99x y
Integer	99y Ä
,
99Ä Å
ObjValue
99Ç ä
=
99ã å
obj_beneficiario
99ç ù
.
99ù û
int_ente_registra
99û Ø
.
99Ø ∞
ToString
99∞ ∏
(
99∏ π
)
99π ∫
}
99ª º
)
99º Ω
;
99Ω æ
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
$str<<O `
,<<` a
TipoDato<<b j
=<<k l
TipoDato<<m u
.<<u v
Integer<<v }
,<<} ~
ObjValue	<< á
=
<<à â
obj_beneficiario
<<ä ö
.
<<ö õ
str_sistema
<<õ ¶
}
<<ß ®
)
<<® ©
;
<<© ™
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
$str==O ]
,==] ^
TipoDato==_ g
===h i
TipoDato==j r
.==r s
VarChar==s z
,==z {
ObjValue	==| Ñ
=
==Ö Ü
obj_beneficiario
==á ó
.
==ó ò

str_sesion
==ò ¢
.
==¢ £
ToString
==£ ´
(
==´ ¨
)
==¨ ≠
}
==Æ Ø
)
==Ø ∞
;
==∞ ±
ds>> 
.>> 
ListaPEntrada>>  
.>>  !
Add>>! $
(>>$ %
new>>% (
ParametroEntrada>>) 9
{>>: ;
StrNameParameter>>< L
=>>M N
$str>>O ]
,>>] ^
TipoDato>>_ g
=>>h i
TipoDato>>j r
.>>r s
VarChar>>s z
,>>z {
ObjValue	>>| Ñ
=
>>Ö Ü
obj_beneficiario
>>á ó
.
>>ó ò
	str_login
>>ò °
.
>>° ¢
ToString
>>¢ ™
(
>>™ ´
)
>>´ ¨
}
>>≠ Æ
)
>>Æ Ø
;
>>Ø ∞
ds?? 
.?? 
ListaPEntrada??  
.??  !
Add??! $
(??$ %
new??% (
ParametroEntrada??) 9
{??: ;
StrNameParameter??< L
=??M N
$str??O `
,??` a
TipoDato??b j
=??k l
TipoDato??m u
.??u v
Integer??v }
,??} ~
ObjValue	?? á
=
??à â
obj_beneficiario
??ä ö
.
??ö õ
int_id_oficina
??õ ©
.
??© ™
ToString
??™ ≤
(
??≤ ≥
)
??≥ ¥
}
??µ ∂
)
??∂ ∑
;
??∑ ∏
ds@@ 
.@@ 
ListaPEntrada@@  
.@@  !
Add@@! $
(@@$ %
new@@% (
ParametroEntrada@@) 9
{@@: ;
StrNameParameter@@< L
=@@M N
$str@@O d
,@@d e
TipoDato@@f n
=@@o p
TipoDato@@q y
.@@y z
VarChar	@@z Å
,
@@Å Ç
ObjValue
@@É ã
=
@@å ç
obj_beneficiario
@@é û
.
@@û ü
	str_canal
@@ü ®
.
@@® ©
ToString
@@© ±
(
@@± ≤
)
@@≤ ≥
}
@@¥ µ
)
@@µ ∂
;
@@∂ ∑
dsAA 
.AA 
ListaPEntradaAA  
.AA  !
AddAA! $
(AA$ %
newAA% (
ParametroEntradaAA) 9
{AA: ;
StrNameParameterAA< L
=AAM N
$strAAO X
,AAX Y
TipoDatoAAZ b
=AAc d
TipoDatoAAe m
.AAm n
VarCharAAn u
,AAu v
ObjValueAAw 
=
AAÄ Å
obj_beneficiario
AAÇ í
.
AAí ì 
str_ip_dispositivo
AAì •
.
AA• ¶
ToString
AA¶ Æ
(
AAÆ Ø
)
AAØ ∞
}
AA± ≤
)
AA≤ ≥
;
AA≥ ¥
dsBB 
.BB 
ListaPEntradaBB  
.BB  !
AddBB! $
(BB$ %
newBB% (
ParametroEntradaBB) 9
{BB: ;
StrNameParameterBB< L
=BBM N
$strBBO Y
,BBY Z
TipoDatoBB[ c
=BBd e
TipoDatoBBf n
.BBn o
VarCharBBo v
,BBv w
ObjValue	BBx Ä
=
BBÅ Ç
obj_beneficiario
BBÉ ì
.
BBì î!
str_mac_dispositivo
BBî ß
.
BBß ®
ToString
BB® ∞
(
BB∞ ±
)
BB± ≤
}
BB≥ ¥
)
BB¥ µ
;
BBµ ∂
dsEE 
.EE 
ListaPSalidaEE 
.EE  
AddEE  #
(EE# $
newEE$ '
ParametroSalidaEE( 7
{EE8 9
StrNameParameterEE: J
=EEK L
$strEEM [
,EE[ \
TipoDatoEE] e
=EEf g
TipoDatoEEh p
.EEp q
VarCharEEq x
}EEy z
)EEz {
;EE{ |
dsFF 
.FF 
ListaPSalidaFF 
.FF  
AddFF  #
(FF# $
newFF$ '
ParametroSalidaFF( 7
{FF8 9
StrNameParameterFF: J
=FFK L
$strFFM _
,FF_ `
TipoDatoFFa i
=FFj k
TipoDatoFFl t
.FFt u
IntegerFFu |
}FF} ~
)FF~ 
;	FF Ä
dsHH 
.HH 
NombreSPHH 
=HH 
$strHH <
;HH< =
dsII 
.II 
NombreBDII 
=II 
	_settingsII '
.II' (
BD_megserviciosII( 7
;II7 8
varKK 
	resultadoKK 
=KK 
objClienteDalKK  -
.KK- .
ExecuteDataSetKK. <
(KK< =
dsKK= ?
)KK? @
;KK@ A
varLL 
lst_valoresLL 
=LL  !
newLL" %
ListLL& *
<LL* +"
ParametroSalidaValoresLL+ A
>LLA B
(LLB C
)LLC D
;LLD E
foreachNN 
(NN 
varNN 
itemNN !
inNN" $
	resultadoNN% .
.NN. /
ListaPSalidaValoresNN/ B
)NNB C
lst_valoresNND O
.NNO P
AddNNP S
(NNS T
itemNNT X
)NNX Y
;NNY Z
varOO 

str_codigoOO 
=OO  
lst_valoresOO! ,
.OO, -
FindOO- 1
(OO1 2
xOO2 3
=>OO4 6
xOO7 8
.OO8 9
StrNameParameterOO9 I
==OOJ L
$strOOM _
)OO_ `
.OO` a
ObjValueOOa i
;OOi j
varPP 
	str_errorPP 
=PP 
lst_valoresPP  +
.PP+ ,
FindPP, 0
(PP0 1
xPP1 2
=>PP3 5
xPP6 7
.PP7 8
StrNameParameterPP8 H
==PPI K
$strPPL Z
)PPZ [
.PP[ \
ObjValuePP\ d
.PPd e
TrimPPe i
(PPi j
)PPj k
;PPk l
	respuestaRR 
.RR 
codigoRR  
=RR! "

str_codigoRR# -
.RR- .
ToStringRR. 6
(RR6 7
)RR7 8
.RR8 9
TrimRR9 =
(RR= >
)RR> ?
.RR? @
PadLeftRR@ G
(RRG H
$numRRH I
,RRI J
$charRRK N
)RRN O
;RRO P
	respuestaSS 
.SS 
cuerpoSS  
=SS! "
	FuncionesSS# ,
.SS, -
ObtenerDatosSS- 9
(SS9 :
	resultadoSS: C
)SSC D
;SSD E
	respuestaTT 
.TT 
diccionarioTT %
.TT% &
AddTT& )
(TT) *
$strTT* 5
,TT5 6
	str_errorTT7 @
.TT@ A
ToStringTTA I
(TTI J
)TTJ K
)TTK L
;TTL M
}UU 
catchVV 
(VV 
	ExceptionVV 
	exceptionVV &
)VV& '
{WW 
	respuestaXX 
.XX 
codigoXX  
=XX! "
$strXX# (
;XX( )
	respuestaYY 
.YY 
diccionarioYY %
.YY% &
AddYY& )
(YY) *
$strYY* 5
,YY5 6
	exceptionYY7 @
.YY@ A
ToStringYYA I
(YYI J
)YYJ K
)YYK L
;YYL M
obj_infoLogZZ 
.ZZ 

str_metodoZZ &
=ZZ' (
$strZZ) D
;ZZD E
obj_infoLogZZF Q
.ZZQ R

str_objetoZZR \
=ZZ] ^
	exceptionZZ_ h
;ZZh i
LogServicios[[ 
.[[ 
RegistrarTramas[[ ,
([[, -
str_salida_error[[- =
,[[= >
obj_infoLog[[? J
,[[J K
str_ruta[[L T
)[[T U
;[[U V
}\\ 
return]] 
	respuesta]] 
;]] 
}^^ 	
public``  
RespuestaTransaccion`` #(
update_cuentas_beneficiarios``$ @
(``@ A
ReqBeneficiarios``A Q
obj_beneficiario``R b
)``b c
{aa 	 
RespuestaTransaccionbb  
	respuestabb! *
=bb+ ,
newbb- 0 
RespuestaTransaccionbb1 E
(bbE F
)bbF G
;bbG H
trydd 
{ee 
DatosSolicitudff 
dsff !
=ff" #
newff$ '
DatosSolicitudff( 6
(ff6 7
)ff7 8
;ff8 9
dshh 
.hh 
ListaPEntradahh  
.hh  !
Addhh! $
(hh$ %
newhh% (
ParametroEntradahh) 9
{hh: ;
StrNameParameterhh< L
=hhM N
$strhhO `
,hh` a
TipoDatohhb j
=hhk l
TipoDatohhm u
.hhu v
VarCharhhv }
,hh} ~
ObjValue	hh á
=
hhà â
obj_beneficiario
hhä ö
.
hhö õ
str_codigo_ifi
hhõ ©
.
hh© ™
ToString
hh™ ≤
(
hh≤ ≥
)
hh≥ ¥
}
hhµ ∂
)
hh∂ ∑
;
hh∑ ∏
dsii 
.ii 
ListaPEntradaii  
.ii  !
Addii! $
(ii$ %
newii% (
ParametroEntradaii) 9
{ii: ;
StrNameParameterii< L
=iiM N
$striiO c
,iic d
TipoDatoiie m
=iin o
TipoDatoiip x
.iix y
Integer	iiy Ä
,
iiÄ Å
ObjValue
iiÇ ä
=
iiã å
obj_beneficiario
iiç ù
.
iiù û
int_tipo_producto
iiû Ø
.
iiØ ∞
ToString
ii∞ ∏
(
ii∏ π
)
iiπ ∫
}
iiª º
)
iiº Ω
;
iiΩ æ
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
$strjjO ]
,jj] ^
TipoDatojj_ g
=jjh i
TipoDatojjj r
.jjr s
VarCharjjs z
,jjz {
ObjValue	jj| Ñ
=
jjÖ Ü
obj_beneficiario
jjá ó
.
jjó ò
str_num_cta
jjò £
.
jj£ §
ToString
jj§ ¨
(
jj¨ ≠
)
jj≠ Æ
}
jjØ ∞
)
jj∞ ±
;
jj± ≤
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
$strkkO c
,kkc d
TipoDatokke m
=kkn o
TipoDatokkp x
.kkx y
VarChar	kky Ä
,
kkÄ Å
ObjValue
kkÇ ä
=
kkã å
obj_beneficiario
kkç ù
.
kkù û
str_num_documento
kkû Ø
.
kkØ ∞
ToString
kk∞ ∏
(
kk∏ π
)
kkπ ∫
}
kkª º
)
kkº Ω
;
kkΩ æ
dsll 
.ll 
ListaPEntradall  
.ll  !
Addll! $
(ll$ %
newll% (
ParametroEntradall) 9
{ll: ;
StrNameParameterll< L
=llM N
$strllO ]
,ll] ^
TipoDatoll_ g
=llh i
TipoDatollj r
.llr s
VarCharlls z
,llz {
ObjValue	ll| Ñ
=
llÖ Ü
obj_beneficiario
llá ó
.
lló ò
str_nombres
llò £
.
ll£ §
ToString
ll§ ¨
(
ll¨ ≠
)
ll≠ Æ
}
llØ ∞
)
ll∞ ±
;
ll± ≤
dsmm 
.mm 
ListaPEntradamm  
.mm  !
Addmm! $
(mm$ %
newmm% (
ParametroEntradamm) 9
{mm: ;
StrNameParametermm< L
=mmM N
$strmmO [
,mm[ \
TipoDatomm] e
=mmf g
TipoDatommh p
.mmp q
VarCharmmq x
,mmx y
ObjValue	mmz Ç
=
mmÉ Ñ
obj_beneficiario
mmÖ ï
.
mmï ñ
	str_email
mmñ ü
.
mmü †
ToString
mm† ®
(
mm® ©
)
mm© ™
}
mm´ ¨
)
mm¨ ≠
;
mm≠ Æ
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
$strnnO _
,nn_ `
TipoDatonna i
=nnj k
TipoDatonnl t
.nnt u
VarCharnnu |
,nn| }
ObjValue	nn~ Ü
=
nná à
obj_beneficiario
nnâ ô
.
nnô ö
str_alias_cta
nnö ß
.
nnß ®
ToString
nn® ∞
(
nn∞ ±
)
nn± ≤
}
nn≥ ¥
)
nn¥ µ
;
nnµ ∂
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
$strooO g
,oog h
TipoDatoooi q
=oor s
TipoDatooot |
.oo| }
Integer	oo} Ñ
,
ooÑ Ö
ObjValue
ooÜ é
=
ooè ê
obj_beneficiario
ooë °
.
oo° ¢#
int_tipo_tarjeta_cred
oo¢ ∑
.
oo∑ ∏
ToString
oo∏ ¿
(
oo¿ ¡
)
oo¡ ¬
}
oo√ ƒ
)
ooƒ ≈
;
oo≈ ∆
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
$strppO g
,ppg h
TipoDatoppi q
=ppr s
TipoDatoppt |
.pp| }
VarChar	pp} Ñ
,
ppÑ Ö
ObjValue
ppÜ é
=
ppè ê
obj_beneficiario
ppë °
.
pp° ¢#
str_tipo_beneficiario
pp¢ ∑
.
pp∑ ∏
ToString
pp∏ ¿
(
pp¿ ¡
)
pp¡ ¬
}
pp√ ƒ
)
ppƒ ≈
;
pp≈ ∆
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
$strqqO c
,qqc d
TipoDatoqqe m
=qqn o
TipoDatoqqp x
.qqx y
Integer	qqy Ä
,
qqÄ Å
ObjValue
qqÇ ä
=
qqã å
obj_beneficiario
qqç ù
.
qqù û
int_ente_registra
qqû Ø
.
qqØ ∞
ToString
qq∞ ∏
(
qq∏ π
)
qqπ ∫
}
qqª º
)
qqº Ω
;
qqΩ æ
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
$strrrO X
,rrX Y
TipoDatorrZ b
=rrc d
TipoDatorre m
.rrm n
Integerrrn u
,rru v
ObjValuerrw 
=
rrÄ Å
obj_beneficiario
rrÇ í
.
rrí ì
int_id
rrì ô
.
rrô ö
ToString
rrö ¢
(
rr¢ £
)
rr£ §
}
rr• ¶
)
rr¶ ß
;
rrß ®
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
$struuO `
,uu` a
TipoDatouub j
=uuk l
TipoDatouum u
.uuu v
Integeruuv }
,uu} ~
ObjValue	uu á
=
uuà â
obj_beneficiario
uuä ö
.
uuö õ
str_sistema
uuõ ¶
}
uuß ®
)
uu® ©
;
uu© ™
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
$strvvO ]
,vv] ^
TipoDatovv_ g
=vvh i
TipoDatovvj r
.vvr s
VarCharvvs z
,vvz {
ObjValue	vv| Ñ
=
vvÖ Ü
obj_beneficiario
vvá ó
.
vvó ò

str_sesion
vvò ¢
.
vv¢ £
ToString
vv£ ´
(
vv´ ¨
)
vv¨ ≠
}
vvÆ Ø
)
vvØ ∞
;
vv∞ ±
dsww 
.ww 
ListaPEntradaww  
.ww  !
Addww! $
(ww$ %
newww% (
ParametroEntradaww) 9
{ww: ;
StrNameParameterww< L
=wwM N
$strwwO ]
,ww] ^
TipoDatoww_ g
=wwh i
TipoDatowwj r
.wwr s
VarCharwws z
,wwz {
ObjValue	ww| Ñ
=
wwÖ Ü
obj_beneficiario
wwá ó
.
wwó ò
	str_login
wwò °
.
ww° ¢
ToString
ww¢ ™
(
ww™ ´
)
ww´ ¨
}
ww≠ Æ
)
wwÆ Ø
;
wwØ ∞
dsxx 
.xx 
ListaPEntradaxx  
.xx  !
Addxx! $
(xx$ %
newxx% (
ParametroEntradaxx) 9
{xx: ;
StrNameParameterxx< L
=xxM N
$strxxO `
,xx` a
TipoDatoxxb j
=xxk l
TipoDatoxxm u
.xxu v
Integerxxv }
,xx} ~
ObjValue	xx á
=
xxà â
obj_beneficiario
xxä ö
.
xxö õ
int_id_oficina
xxõ ©
.
xx© ™
ToString
xx™ ≤
(
xx≤ ≥
)
xx≥ ¥
}
xxµ ∂
)
xx∂ ∑
;
xx∑ ∏
dsyy 
.yy 
ListaPEntradayy  
.yy  !
Addyy! $
(yy$ %
newyy% (
ParametroEntradayy) 9
{yy: ;
StrNameParameteryy< L
=yyM N
$stryyO d
,yyd e
TipoDatoyyf n
=yyo p
TipoDatoyyq y
.yyy z
VarChar	yyz Å
,
yyÅ Ç
ObjValue
yyÉ ã
=
yyå ç
obj_beneficiario
yyé û
.
yyû ü
	str_canal
yyü ®
.
yy® ©
ToString
yy© ±
(
yy± ≤
)
yy≤ ≥
}
yy¥ µ
)
yyµ ∂
;
yy∂ ∑
dszz 
.zz 
ListaPEntradazz  
.zz  !
Addzz! $
(zz$ %
newzz% (
ParametroEntradazz) 9
{zz: ;
StrNameParameterzz< L
=zzM N
$strzzO X
,zzX Y
TipoDatozzZ b
=zzc d
TipoDatozze m
.zzm n
VarCharzzn u
,zzu v
ObjValuezzw 
=
zzÄ Å
obj_beneficiario
zzÇ í
.
zzí ì 
str_ip_dispositivo
zzì •
.
zz• ¶
ToString
zz¶ Æ
(
zzÆ Ø
)
zzØ ∞
}
zz± ≤
)
zz≤ ≥
;
zz≥ ¥
ds{{ 
.{{ 
ListaPEntrada{{  
.{{  !
Add{{! $
({{$ %
new{{% (
ParametroEntrada{{) 9
{{{: ;
StrNameParameter{{< L
={{M N
$str{{O Y
,{{Y Z
TipoDato{{[ c
={{d e
TipoDato{{f n
.{{n o
VarChar{{o v
,{{v w
ObjValue	{{x Ä
=
{{Å Ç
obj_beneficiario
{{É ì
.
{{ì î!
str_mac_dispositivo
{{î ß
.
{{ß ®
ToString
{{® ∞
(
{{∞ ±
)
{{± ≤
}
{{≥ ¥
)
{{¥ µ
;
{{µ ∂
ds~~ 
.~~ 
ListaPSalida~~ 
.~~  
Add~~  #
(~~# $
new~~$ '
ParametroSalida~~( 7
{~~8 9
StrNameParameter~~: J
=~~K L
$str~~M [
,~~[ \
TipoDato~~] e
=~~f g
TipoDato~~h p
.~~p q
VarChar~~q x
}~~y z
)~~z {
;~~{ |
ds 
. 
ListaPSalida 
.  
Add  #
(# $
new$ '
ParametroSalida( 7
{8 9
StrNameParameter: J
=K L
$strM _
,_ `
TipoDatoa i
=j k
TipoDatol t
.t u
Integeru |
}} ~
)~ 
;	 Ä
ds
ÅÅ 
.
ÅÅ 
NombreSP
ÅÅ 
=
ÅÅ 
$str
ÅÅ ?
;
ÅÅ? @
ds
ÇÇ 
.
ÇÇ 
NombreBD
ÇÇ 
=
ÇÇ 
	_settings
ÇÇ '
.
ÇÇ' (
BD_megservicios
ÇÇ( 7
;
ÇÇ7 8
var
ÑÑ 
	resultado
ÑÑ 
=
ÑÑ 
objClienteDal
ÑÑ  -
.
ÑÑ- .
ExecuteNonQuery
ÑÑ. =
(
ÑÑ= >
ds
ÑÑ> @
)
ÑÑ@ A
;
ÑÑA B
var
ÖÖ 
lst_valores
ÖÖ 
=
ÖÖ  !
new
ÖÖ" %
List
ÖÖ& *
<
ÖÖ* +$
ParametroSalidaValores
ÖÖ+ A
>
ÖÖA B
(
ÖÖB C
)
ÖÖC D
;
ÖÖD E
foreach
áá 
(
áá 
var
áá 
item
áá !
in
áá" $
	resultado
áá% .
.
áá. /!
ListaPSalidaValores
áá/ B
)
ááB C
lst_valores
ááD O
.
ááO P
Add
ááP S
(
ááS T
item
ááT X
)
ááX Y
;
ááY Z
var
àà 

str_codigo
àà 
=
àà  
lst_valores
àà! ,
.
àà, -
Find
àà- 1
(
àà1 2
x
àà2 3
=>
àà4 6
x
àà7 8
.
àà8 9
StrNameParameter
àà9 I
==
ààJ L
$str
ààM _
)
àà_ `
.
àà` a
ObjValue
ààa i
;
àài j
var
ââ 
	str_error
ââ 
=
ââ 
lst_valores
ââ  +
.
ââ+ ,
Find
ââ, 0
(
ââ0 1
x
ââ1 2
=>
ââ3 5
x
ââ6 7
.
ââ7 8
StrNameParameter
ââ8 H
==
ââI K
$str
ââL Z
)
ââZ [
.
ââ[ \
ObjValue
ââ\ d
.
ââd e
Trim
ââe i
(
ââi j
)
ââj k
;
ââk l
	respuesta
ãã 
.
ãã 
codigo
ãã  
=
ãã! "

str_codigo
ãã# -
.
ãã- .
ToString
ãã. 6
(
ãã6 7
)
ãã7 8
.
ãã8 9
Trim
ãã9 =
(
ãã= >
)
ãã> ?
.
ãã? @
PadLeft
ãã@ G
(
ããG H
$num
ããH I
,
ããI J
$char
ããK N
)
ããN O
;
ããO P
	respuesta
åå 
.
åå 
cuerpo
åå  
=
åå! "
	resultado
åå# ,
.
åå, -
NumAfectados
åå- 9
;
åå9 :
	respuesta
çç 
.
çç 
diccionario
çç %
.
çç% &
Add
çç& )
(
çç) *
$str
çç* 5
,
çç5 6
	str_error
çç7 @
.
çç@ A
ToString
ççA I
(
ççI J
)
ççJ K
)
ççK L
;
ççL M
}
èè 
catch
êê 
(
êê 
	Exception
êê 
	exception
êê &
)
êê& '
{
ëë 
	respuesta
íí 
.
íí 
codigo
íí  
=
íí! "
$str
íí# (
;
íí( )
	respuesta
ìì 
.
ìì 
diccionario
ìì %
.
ìì% &
Add
ìì& )
(
ìì) *
$str
ìì* 5
,
ìì5 6
	exception
ìì7 @
.
ìì@ A
ToString
ììA I
(
ììI J
)
ììJ K
)
ììK L
;
ììL M
obj_infoLog
îî 
.
îî 

str_metodo
îî &
=
îî' (
$str
îî) J
;
îîJ K
obj_infoLog
îîL W
.
îîW X

str_objeto
îîX b
=
îîc d
	exception
îîe n
;
îîn o
LogServicios
ïï 
.
ïï 
RegistrarTramas
ïï ,
(
ïï, -
str_salida_error
ïï- =
,
ïï= >
obj_infoLog
ïï? J
,
ïïJ K
str_ruta
ïïL T
)
ïïT U
;
ïïU V
}
ññ 
return
óó 
	respuesta
óó 
;
óó 
}
òò 	
public
õõ "
RespuestaTransaccion
õõ #*
delete_cuentas_beneficiarios
õõ$ @
(
õõ@ A
ReqBeneficiarios
õõA Q
obj_beneficiario
õõR b
)
õõb c
{
úú 	"
RespuestaTransaccion
ùù  
	respuesta
ùù! *
=
ùù+ ,
new
ùù- 0"
RespuestaTransaccion
ùù1 E
(
ùùE F
)
ùùF G
;
ùùG H
try
üü 
{
†† 
DatosSolicitud
°° 
ds
°° !
=
°°" #
new
°°$ '
DatosSolicitud
°°( 6
(
°°6 7
)
°°7 8
;
°°8 9
ds
££ 
.
££ 
ListaPEntrada
££  
.
££  !
Add
££! $
(
££$ %
new
££% (
ParametroEntrada
££) 9
{
££: ;
StrNameParameter
££< L
=
££M N
$str
££O c
,
££c d
TipoDato
££e m
=
££n o
TipoDato
££p x
.
££x y
Integer££y Ä
,££Ä Å
ObjValue££Ç ä
=££ã å 
obj_beneficiario££ç ù
.££ù û!
int_ente_registra££û Ø
.££Ø ∞
ToString££∞ ∏
(££∏ π
)££π ∫
}££ª º
)££º Ω
;££Ω æ
ds
§§ 
.
§§ 
ListaPEntrada
§§  
.
§§  !
Add
§§! $
(
§§$ %
new
§§% (
ParametroEntrada
§§) 9
{
§§: ;
StrNameParameter
§§< L
=
§§M N
$str
§§O X
,
§§X Y
TipoDato
§§Z b
=
§§c d
TipoDato
§§e m
.
§§m n
Integer
§§n u
,
§§u v
ObjValue
§§w 
=§§Ä Å 
obj_beneficiario§§Ç í
.§§í ì
int_id§§ì ô
.§§ô ö
ToString§§ö ¢
(§§¢ £
)§§£ §
}§§• ¶
)§§¶ ß
;§§ß ®
ds
•• 
.
•• 
ListaPEntrada
••  
.
••  !
Add
••! $
(
••$ %
new
••% (
ParametroEntrada
••) 9
{
••: ;
StrNameParameter
••< L
=
••M N
$str
••O d
,
••d e
TipoDato
••f n
=
••o p
TipoDato
••q y
.
••y z
VarChar••z Å
,••Å Ç
ObjValue••É ã
=••å ç 
obj_beneficiario••é û
.••û ü"
str_motivo_elimina••ü ±
.••± ≤
ToString••≤ ∫
(••∫ ª
)••ª º
}••Ω æ
)••æ ø
;••ø ¿
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
®®O `
,
®®` a
TipoDato
®®b j
=
®®k l
TipoDato
®®m u
.
®®u v
Integer
®®v }
,
®®} ~
ObjValue®® á
=®®à â 
obj_beneficiario®®ä ö
.®®ö õ
str_sistema®®õ ¶
}®®ß ®
)®®® ©
;®®© ™
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
©©% (
ParametroEntrada
©©) 9
{
©©: ;
StrNameParameter
©©< L
=
©©M N
$str
©©O ]
,
©©] ^
TipoDato
©©_ g
=
©©h i
TipoDato
©©j r
.
©©r s
VarChar
©©s z
,
©©z {
ObjValue©©| Ñ
=©©Ö Ü 
obj_beneficiario©©á ó
.©©ó ò

str_sesion©©ò ¢
.©©¢ £
ToString©©£ ´
(©©´ ¨
)©©¨ ≠
}©©Æ Ø
)©©Ø ∞
;©©∞ ±
ds
™™ 
.
™™ 
ListaPEntrada
™™  
.
™™  !
Add
™™! $
(
™™$ %
new
™™% (
ParametroEntrada
™™) 9
{
™™: ;
StrNameParameter
™™< L
=
™™M N
$str
™™O ]
,
™™] ^
TipoDato
™™_ g
=
™™h i
TipoDato
™™j r
.
™™r s
VarChar
™™s z
,
™™z {
ObjValue™™| Ñ
=™™Ö Ü 
obj_beneficiario™™á ó
.™™ó ò
	str_login™™ò °
.™™° ¢
ToString™™¢ ™
(™™™ ´
)™™´ ¨
}™™≠ Æ
)™™Æ Ø
;™™Ø ∞
ds
´´ 
.
´´ 
ListaPEntrada
´´  
.
´´  !
Add
´´! $
(
´´$ %
new
´´% (
ParametroEntrada
´´) 9
{
´´: ;
StrNameParameter
´´< L
=
´´M N
$str
´´O `
,
´´` a
TipoDato
´´b j
=
´´k l
TipoDato
´´m u
.
´´u v
Integer
´´v }
,
´´} ~
ObjValue´´ á
=´´à â 
obj_beneficiario´´ä ö
.´´ö õ
int_id_oficina´´õ ©
.´´© ™
ToString´´™ ≤
(´´≤ ≥
)´´≥ ¥
}´´µ ∂
)´´∂ ∑
;´´∑ ∏
ds
¨¨ 
.
¨¨ 
ListaPEntrada
¨¨  
.
¨¨  !
Add
¨¨! $
(
¨¨$ %
new
¨¨% (
ParametroEntrada
¨¨) 9
{
¨¨: ;
StrNameParameter
¨¨< L
=
¨¨M N
$str
¨¨O d
,
¨¨d e
TipoDato
¨¨f n
=
¨¨o p
TipoDato
¨¨q y
.
¨¨y z
VarChar¨¨z Å
,¨¨Å Ç
ObjValue¨¨É ã
=¨¨å ç 
obj_beneficiario¨¨é û
.¨¨û ü
	str_canal¨¨ü ®
.¨¨® ©
ToString¨¨© ±
(¨¨± ≤
)¨¨≤ ≥
}¨¨¥ µ
)¨¨µ ∂
;¨¨∂ ∑
ds
≠≠ 
.
≠≠ 
ListaPEntrada
≠≠  
.
≠≠  !
Add
≠≠! $
(
≠≠$ %
new
≠≠% (
ParametroEntrada
≠≠) 9
{
≠≠: ;
StrNameParameter
≠≠< L
=
≠≠M N
$str
≠≠O X
,
≠≠X Y
TipoDato
≠≠Z b
=
≠≠c d
TipoDato
≠≠e m
.
≠≠m n
VarChar
≠≠n u
,
≠≠u v
ObjValue
≠≠w 
=≠≠Ä Å 
obj_beneficiario≠≠Ç í
.≠≠í ì"
str_ip_dispositivo≠≠ì •
.≠≠• ¶
ToString≠≠¶ Æ
(≠≠Æ Ø
)≠≠Ø ∞
}≠≠± ≤
)≠≠≤ ≥
;≠≠≥ ¥
ds
ÆÆ 
.
ÆÆ 
ListaPEntrada
ÆÆ  
.
ÆÆ  !
Add
ÆÆ! $
(
ÆÆ$ %
new
ÆÆ% (
ParametroEntrada
ÆÆ) 9
{
ÆÆ: ;
StrNameParameter
ÆÆ< L
=
ÆÆM N
$str
ÆÆO Y
,
ÆÆY Z
TipoDato
ÆÆ[ c
=
ÆÆd e
TipoDato
ÆÆf n
.
ÆÆn o
VarChar
ÆÆo v
,
ÆÆv w
ObjValueÆÆx Ä
=ÆÆÅ Ç 
obj_beneficiarioÆÆÉ ì
.ÆÆì î#
str_mac_dispositivoÆÆî ß
.ÆÆß ®
ToStringÆÆ® ∞
(ÆÆ∞ ±
)ÆÆ± ≤
}ÆÆ≥ ¥
)ÆÆ¥ µ
;ÆÆµ ∂
ds
±± 
.
±± 
ListaPSalida
±± 
.
±±  
Add
±±  #
(
±±# $
new
±±$ '
ParametroSalida
±±( 7
{
±±8 9
StrNameParameter
±±: J
=
±±K L
$str
±±M [
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
VarChar
±±q x
}
±±y z
)
±±z {
;
±±{ |
ds
≤≤ 
.
≤≤ 
ListaPSalida
≤≤ 
.
≤≤  
Add
≤≤  #
(
≤≤# $
new
≤≤$ '
ParametroSalida
≤≤( 7
{
≤≤8 9
StrNameParameter
≤≤: J
=
≤≤K L
$str
≤≤M _
,
≤≤_ `
TipoDato
≤≤a i
=
≤≤j k
TipoDato
≤≤l t
.
≤≤t u
Integer
≤≤u |
}
≤≤} ~
)
≤≤~ 
;≤≤ Ä
ds
¥¥ 
.
¥¥ 
NombreSP
¥¥ 
=
¥¥ 
$str
¥¥ ?
;
¥¥? @
ds
µµ 
.
µµ 
NombreBD
µµ 
=
µµ 
	_settings
µµ '
.
µµ' (
BD_megservicios
µµ( 7
;
µµ7 8
var
∑∑ 
	resultado
∑∑ 
=
∑∑ 
objClienteDal
∑∑  -
.
∑∑- .
ExecuteNonQuery
∑∑. =
(
∑∑= >
ds
∑∑> @
)
∑∑@ A
;
∑∑A B
var
∏∏ 
lst_valores
∏∏ 
=
∏∏  !
new
∏∏" %
List
∏∏& *
<
∏∏* +$
ParametroSalidaValores
∏∏+ A
>
∏∏A B
(
∏∏B C
)
∏∏C D
;
∏∏D E
foreach
∫∫ 
(
∫∫ 
var
∫∫ 
item
∫∫ !
in
∫∫" $
	resultado
∫∫% .
.
∫∫. /!
ListaPSalidaValores
∫∫/ B
)
∫∫B C
lst_valores
∫∫D O
.
∫∫O P
Add
∫∫P S
(
∫∫S T
item
∫∫T X
)
∫∫X Y
;
∫∫Y Z
var
ªª 

str_codigo
ªª 
=
ªª  
lst_valores
ªª! ,
.
ªª, -
Find
ªª- 1
(
ªª1 2
x
ªª2 3
=>
ªª4 6
x
ªª7 8
.
ªª8 9
StrNameParameter
ªª9 I
==
ªªJ L
$str
ªªM _
)
ªª_ `
.
ªª` a
ObjValue
ªªa i
;
ªªi j
var
ºº 
	str_error
ºº 
=
ºº 
lst_valores
ºº  +
.
ºº+ ,
Find
ºº, 0
(
ºº0 1
x
ºº1 2
=>
ºº3 5
x
ºº6 7
.
ºº7 8
StrNameParameter
ºº8 H
==
ººI K
$str
ººL Z
)
ººZ [
.
ºº[ \
ObjValue
ºº\ d
.
ººd e
Trim
ººe i
(
ººi j
)
ººj k
;
ººk l
	respuesta
ææ 
.
ææ 
codigo
ææ  
=
ææ! "

str_codigo
ææ# -
.
ææ- .
ToString
ææ. 6
(
ææ6 7
)
ææ7 8
.
ææ8 9
Trim
ææ9 =
(
ææ= >
)
ææ> ?
.
ææ? @
PadLeft
ææ@ G
(
ææG H
$num
ææH I
,
ææI J
$char
ææK N
)
ææN O
;
ææO P
	respuesta
øø 
.
øø 
cuerpo
øø  
=
øø! "
	resultado
øø# ,
.
øø, -
NumAfectados
øø- 9
;
øø9 :
	respuesta
¿¿ 
.
¿¿ 
diccionario
¿¿ %
.
¿¿% &
Add
¿¿& )
(
¿¿) *
$str
¿¿* 5
,
¿¿5 6
	str_error
¿¿7 @
.
¿¿@ A
ToString
¿¿A I
(
¿¿I J
)
¿¿J K
)
¿¿K L
;
¿¿L M
}
¬¬ 
catch
√√ 
(
√√ 
	Exception
√√ 
	exception
√√ &
)
√√& '
{
ƒƒ 
	respuesta
≈≈ 
.
≈≈ 
codigo
≈≈  
=
≈≈! "
$str
≈≈# (
;
≈≈( )
	respuesta
∆∆ 
.
∆∆ 
diccionario
∆∆ %
.
∆∆% &
Add
∆∆& )
(
∆∆) *
$str
∆∆* 5
,
∆∆5 6
	exception
∆∆7 @
.
∆∆@ A
ToString
∆∆A I
(
∆∆I J
)
∆∆J K
)
∆∆K L
;
∆∆L M
obj_infoLog
«« 
.
«« 

str_metodo
«« &
=
««' (
$str
««) J
;
««J K
obj_infoLog
««L W
.
««W X

str_objeto
««X b
=
««c d
	exception
««e n
;
««n o
LogServicios
»» 
.
»» 
RegistrarTramas
»» ,
(
»», -
str_salida_error
»»- =
,
»»= >
obj_infoLog
»»? J
,
»»J K
str_ruta
»»L T
)
»»T U
;
»»U V
}
…… 
return
   
	respuesta
   
;
   
}
ÀÀ 	
public
œœ "
RespuestaTransaccion
œœ #%
get_datos_beneficiarios
œœ$ ;
(
œœ; <
ReqBeneficiarios
œœ< L
obj_beneficiario
œœM ]
)
œœ] ^
{
–– 	"
RespuestaTransaccion
——  
	respuesta
——! *
=
——+ ,
new
——- 0"
RespuestaTransaccion
——1 E
(
——E F
)
——F G
;
——G H
try
”” 
{
‘‘ 
DatosSolicitud
’’ 
ds
’’ !
=
’’" #
new
’’$ '
DatosSolicitud
’’( 6
(
’’6 7
)
’’7 8
;
’’8 9
ds
◊◊ 
.
◊◊ 
ListaPEntrada
◊◊  
.
◊◊  !
Add
◊◊! $
(
◊◊$ %
new
◊◊% (
ParametroEntrada
◊◊) 9
{
◊◊: ;
StrNameParameter
◊◊< L
=
◊◊M N
$str
◊◊O c
,
◊◊c d
TipoDato
◊◊e m
=
◊◊n o
TipoDato
◊◊p x
.
◊◊x y
Integer◊◊y Ä
,◊◊Ä Å
ObjValue◊◊Ç ä
=◊◊ã å 
obj_beneficiario◊◊ç ù
.◊◊ù û!
int_ente_registra◊◊û Ø
.◊◊Ø ∞
ToString◊◊∞ ∏
(◊◊∏ π
)◊◊π ∫
}◊◊ª º
)◊◊º Ω
;◊◊Ω æ
ds
⁄⁄ 
.
⁄⁄ 
ListaPEntrada
⁄⁄  
.
⁄⁄  !
Add
⁄⁄! $
(
⁄⁄$ %
new
⁄⁄% (
ParametroEntrada
⁄⁄) 9
{
⁄⁄: ;
StrNameParameter
⁄⁄< L
=
⁄⁄M N
$str
⁄⁄O ]
,
⁄⁄] ^
TipoDato
⁄⁄_ g
=
⁄⁄h i
TipoDato
⁄⁄j r
.
⁄⁄r s
Integer
⁄⁄s z
,
⁄⁄z {
ObjValue⁄⁄| Ñ
=⁄⁄Ö Ü 
obj_beneficiario⁄⁄á ó
.⁄⁄ó ò
str_sistema⁄⁄ò £
}⁄⁄§ •
)⁄⁄• ¶
;⁄⁄¶ ß
ds
€€ 
.
€€ 
ListaPEntrada
€€  
.
€€  !
Add
€€! $
(
€€$ %
new
€€% (
ParametroEntrada
€€) 9
{
€€: ;
StrNameParameter
€€< L
=
€€M N
$str
€€O \
,
€€\ ]
TipoDato
€€^ f
=
€€g h
TipoDato
€€i q
.
€€q r
VarChar
€€r y
,
€€y z
ObjValue€€{ É
=€€Ñ Ö 
obj_beneficiario€€Ü ñ
.€€ñ ó

str_sesion€€ó °
.€€° ¢
ToString€€¢ ™
(€€™ ´
)€€´ ¨
}€€≠ Æ
)€€Æ Ø
;€€Ø ∞
ds
‹‹ 
.
‹‹ 
ListaPEntrada
‹‹  
.
‹‹  !
Add
‹‹! $
(
‹‹$ %
new
‹‹% (
ParametroEntrada
‹‹) 9
{
‹‹: ;
StrNameParameter
‹‹< L
=
‹‹M N
$str
‹‹O [
,
‹‹[ \
TipoDato
‹‹] e
=
‹‹f g
TipoDato
‹‹h p
.
‹‹p q
VarChar
‹‹q x
,
‹‹x y
ObjValue‹‹z Ç
=‹‹É Ñ 
obj_beneficiario‹‹Ö ï
.‹‹ï ñ
	str_login‹‹ñ ü
.‹‹ü †
ToString‹‹† ®
(‹‹® ©
)‹‹© ™
}‹‹´ ¨
)‹‹¨ ≠
;‹‹≠ Æ
ds
›› 
.
›› 
ListaPEntrada
››  
.
››  !
Add
››! $
(
››$ %
new
››% (
ParametroEntrada
››) 9
{
››: ;
StrNameParameter
››< L
=
››M N
$str
››O ]
,
››] ^
TipoDato
››_ g
=
››h i
TipoDato
››j r
.
››r s
Integer
››s z
,
››z {
ObjValue››| Ñ
=››Ö Ü 
obj_beneficiario››á ó
.››ó ò
int_id_oficina››ò ¶
.››¶ ß
ToString››ß Ø
(››Ø ∞
)››∞ ±
}››≤ ≥
)››≥ ¥
;››¥ µ
ds
ﬁﬁ 
.
ﬁﬁ 
ListaPEntrada
ﬁﬁ  
.
ﬁﬁ  !
Add
ﬁﬁ! $
(
ﬁﬁ$ %
new
ﬁﬁ% (
ParametroEntrada
ﬁﬁ) 9
{
ﬁﬁ: ;
StrNameParameter
ﬁﬁ< L
=
ﬁﬁM N
$str
ﬁﬁO [
,
ﬁﬁ[ \
TipoDato
ﬁﬁ] e
=
ﬁﬁf g
TipoDato
ﬁﬁh p
.
ﬁﬁp q
VarChar
ﬁﬁq x
,
ﬁﬁx y
ObjValueﬁﬁz Ç
=ﬁﬁÉ Ñ 
obj_beneficiarioﬁﬁÖ ï
.ﬁﬁï ñ
	str_canalﬁﬁñ ü
.ﬁﬁü †
ToStringﬁﬁ† ®
(ﬁﬁ® ©
)ﬁﬁ© ™
}ﬁﬁ´ ¨
)ﬁﬁ¨ ≠
;ﬁﬁ≠ Æ
ds
ﬂﬂ 
.
ﬂﬂ 
ListaPEntrada
ﬂﬂ  
.
ﬂﬂ  !
Add
ﬂﬂ! $
(
ﬂﬂ$ %
new
ﬂﬂ% (
ParametroEntrada
ﬂﬂ) 9
{
ﬂﬂ: ;
StrNameParameter
ﬂﬂ< L
=
ﬂﬂM N
$str
ﬂﬂO \
,
ﬂﬂ\ ]
TipoDato
ﬂﬂ^ f
=
ﬂﬂg h
TipoDato
ﬂﬂi q
.
ﬂﬂq r
VarChar
ﬂﬂr y
,
ﬂﬂy z
ObjValueﬂﬂ{ É
=ﬂﬂÑ Ö 
obj_beneficiarioﬂﬂÜ ñ
.ﬂﬂñ ó"
str_ip_dispositivoﬂﬂó ©
.ﬂﬂ© ™
ToStringﬂﬂ™ ≤
(ﬂﬂ≤ ≥
)ﬂﬂ≥ ¥
}ﬂﬂµ ∂
)ﬂﬂ∂ ∑
;ﬂﬂ∑ ∏
ds
‡‡ 
.
‡‡ 
ListaPEntrada
‡‡  
.
‡‡  !
Add
‡‡! $
(
‡‡$ %
new
‡‡% (
ParametroEntrada
‡‡) 9
{
‡‡: ;
StrNameParameter
‡‡< L
=
‡‡M N
$str
‡‡O Y
,
‡‡Y Z
TipoDato
‡‡[ c
=
‡‡d e
TipoDato
‡‡f n
.
‡‡n o
VarChar
‡‡o v
,
‡‡v w
ObjValue‡‡x Ä
=‡‡Å Ç 
obj_beneficiario‡‡É ì
.‡‡ì î#
str_mac_dispositivo‡‡î ß
.‡‡ß ®
ToString‡‡® ∞
(‡‡∞ ±
)‡‡± ≤
}‡‡≥ ¥
)‡‡¥ µ
;‡‡µ ∂
ds
„„ 
.
„„ 
ListaPSalida
„„ 
.
„„  
Add
„„  #
(
„„# $
new
„„$ '
ParametroSalida
„„( 7
{
„„8 9
StrNameParameter
„„: J
=
„„K L
$str
„„M W
,
„„W X
TipoDato
„„Y a
=
„„b c
TipoDato
„„d l
.
„„l m
VarChar
„„m t
}
„„u v
)
„„v w
;
„„w x
ds
‰‰ 
.
‰‰ 
ListaPSalida
‰‰ 
.
‰‰  
Add
‰‰  #
(
‰‰# $
new
‰‰$ '
ParametroSalida
‰‰( 7
{
‰‰8 9
StrNameParameter
‰‰: J
=
‰‰K L
$str
‰‰M [
,
‰‰[ \
TipoDato
‰‰] e
=
‰‰f g
TipoDato
‰‰h p
.
‰‰p q
Integer
‰‰q x
}
‰‰y z
)
‰‰z {
;
‰‰{ |
ds
ÊÊ 
.
ÊÊ 
NombreSP
ÊÊ 
=
ÊÊ 
$str
ÊÊ 7
;
ÊÊ7 8
ds
ÁÁ 
.
ÁÁ 
NombreBD
ÁÁ 
=
ÁÁ 
	_settings
ÁÁ '
.
ÁÁ' (
BD_megservicios
ÁÁ( 7
;
ÁÁ7 8
var
ÈÈ 
	resultado
ÈÈ 
=
ÈÈ 
objClienteDal
ÈÈ  -
.
ÈÈ- .
ExecuteDataSet
ÈÈ. <
(
ÈÈ< =
ds
ÈÈ= ?
)
ÈÈ? @
;
ÈÈ@ A
var
ÍÍ 
lst_valores
ÍÍ 
=
ÍÍ  !
new
ÍÍ" %
List
ÍÍ& *
<
ÍÍ* +$
ParametroSalidaValores
ÍÍ+ A
>
ÍÍA B
(
ÍÍB C
)
ÍÍC D
;
ÍÍD E
foreach
ÏÏ 
(
ÏÏ 
var
ÏÏ 
item
ÏÏ !
in
ÏÏ" $
	resultado
ÏÏ% .
.
ÏÏ. /!
ListaPSalidaValores
ÏÏ/ B
)
ÏÏB C
lst_valores
ÏÏD O
.
ÏÏO P
Add
ÏÏP S
(
ÏÏS T
item
ÏÏT X
)
ÏÏX Y
;
ÏÏY Z
var
ÌÌ 

str_codigo
ÌÌ 
=
ÌÌ  
lst_valores
ÌÌ! ,
.
ÌÌ, -
Find
ÌÌ- 1
(
ÌÌ1 2
x
ÌÌ2 3
=>
ÌÌ4 6
x
ÌÌ7 8
.
ÌÌ8 9
StrNameParameter
ÌÌ9 I
==
ÌÌJ L
$str
ÌÌM [
)
ÌÌ[ \
.
ÌÌ\ ]
ObjValue
ÌÌ] e
;
ÌÌe f
var
ÓÓ 
	str_error
ÓÓ 
=
ÓÓ 
lst_valores
ÓÓ  +
.
ÓÓ+ ,
Find
ÓÓ, 0
(
ÓÓ0 1
x
ÓÓ1 2
=>
ÓÓ3 5
x
ÓÓ6 7
.
ÓÓ7 8
StrNameParameter
ÓÓ8 H
==
ÓÓI K
$str
ÓÓL V
)
ÓÓV W
.
ÓÓW X
ObjValue
ÓÓX `
.
ÓÓ` a
Trim
ÓÓa e
(
ÓÓe f
)
ÓÓf g
;
ÓÓg h
	respuesta
 
.
 
codigo
  
=
! "

str_codigo
# -
.
- .
ToString
. 6
(
6 7
)
7 8
.
8 9
Trim
9 =
(
= >
)
> ?
.
? @
PadLeft
@ G
(
G H
$num
H I
,
I J
$char
K N
)
N O
;
O P
	respuesta
ÒÒ 
.
ÒÒ 
cuerpo
ÒÒ  
=
ÒÒ! "
	Funciones
ÒÒ# ,
.
ÒÒ, -
ObtenerDatos
ÒÒ- 9
(
ÒÒ9 :
	resultado
ÒÒ: C
)
ÒÒC D
;
ÒÒD E
	respuesta
ÚÚ 
.
ÚÚ 
diccionario
ÚÚ %
.
ÚÚ% &
Add
ÚÚ& )
(
ÚÚ) *
$str
ÚÚ* 5
,
ÚÚ5 6
	str_error
ÚÚ7 @
.
ÚÚ@ A
ToString
ÚÚA I
(
ÚÚI J
)
ÚÚJ K
)
ÚÚK L
;
ÚÚL M
}
ÙÙ 
catch
ıı 
(
ıı 
	Exception
ıı 
	exception
ıı &
)
ıı& '
{
ˆˆ 
	respuesta
˜˜ 
.
˜˜ 
codigo
˜˜  
=
˜˜! "
$str
˜˜# (
;
˜˜( )
	respuesta
¯¯ 
.
¯¯ 
diccionario
¯¯ %
.
¯¯% &
Add
¯¯& )
(
¯¯) *
$str
¯¯* 5
,
¯¯5 6
	exception
¯¯7 @
.
¯¯@ A
ToString
¯¯A I
(
¯¯I J
)
¯¯J K
)
¯¯K L
;
¯¯L M
obj_infoLog
˘˘ 
.
˘˘ 

str_metodo
˘˘ &
=
˘˘' (
$str
˘˘) B
;
˘˘B C
obj_infoLog
˘˘D O
.
˘˘O P

str_objeto
˘˘P Z
=
˘˘[ \
	exception
˘˘] f
;
˘˘f g
LogServicios
˙˙ 
.
˙˙ 
RegistrarTramas
˙˙ ,
(
˙˙, -
str_salida_error
˙˙- =
,
˙˙= >
obj_infoLog
˙˙? J
,
˙˙J K
str_ruta
˙˙L T
)
˙˙T U
;
˙˙U V
}
˚˚ 
return
¸¸ 
	respuesta
¸¸ 
;
¸¸ 
}
˝˝ 	
public
ˇˇ "
RespuestaTransaccion
ˇˇ #,
validar_registro_beneficiarios
ˇˇ$ B
(
ˇˇB C
ReqBeneficiarios
ˇˇC S
obj_beneficiario
ˇˇT d
)
ˇˇd e
{
ÄÄ 	"
RespuestaTransaccion
ÅÅ  
	respuesta
ÅÅ! *
=
ÅÅ+ ,
new
ÅÅ- 0"
RespuestaTransaccion
ÅÅ1 E
(
ÅÅE F
)
ÅÅF G
;
ÅÅG H
try
ÉÉ 
{
ÑÑ 
DatosSolicitud
ÖÖ 
ds
ÖÖ !
=
ÖÖ" #
new
ÖÖ$ '
DatosSolicitud
ÖÖ( 6
(
ÖÖ6 7
)
ÖÖ7 8
;
ÖÖ8 9
ds
áá 
.
áá 
ListaPEntrada
áá  
.
áá  !
Add
áá! $
(
áá$ %
new
áá% (
ParametroEntrada
áá) 9
{
áá: ;
StrNameParameter
áá< L
=
ááM N
$str
ááO `
,
áá` a
TipoDato
ááb j
=
áák l
TipoDato
áám u
.
ááu v
VarChar
ááv }
,
áá} ~
ObjValueáá á
=ááà â 
obj_beneficiarioááä ö
.ááö õ
str_codigo_ifiááõ ©
}áá™ ´
)áá´ ¨
;áá¨ ≠
ds
àà 
.
àà 
ListaPEntrada
àà  
.
àà  !
Add
àà! $
(
àà$ %
new
àà% (
ParametroEntrada
àà) 9
{
àà: ;
StrNameParameter
àà< L
=
ààM N
$str
ààO c
,
ààc d
TipoDato
ààe m
=
ààn o
TipoDato
ààp x
.
ààx y
Integeràày Ä
,ààÄ Å
ObjValueààÇ ä
=ààã å 
obj_beneficiarioààç ù
.ààù û!
int_tipo_productoààû Ø
.ààØ ∞
ToStringàà∞ ∏
(àà∏ π
)ààπ ∫
}ààª º
)ààº Ω
;ààΩ æ
ds
ââ 
.
ââ 
ListaPEntrada
ââ  
.
ââ  !
Add
ââ! $
(
ââ$ %
new
ââ% (
ParametroEntrada
ââ) 9
{
ââ: ;
StrNameParameter
ââ< L
=
ââM N
$str
ââO ]
,
ââ] ^
TipoDato
ââ_ g
=
ââh i
TipoDato
ââj r
.
ââr s
VarChar
ââs z
,
ââz {
ObjValueââ| Ñ
=ââÖ Ü 
obj_beneficiarioââá ó
.ââó ò
str_num_ctaââò £
.ââ£ §
ToStringââ§ ¨
(ââ¨ ≠
)ââ≠ Æ
}ââØ ∞
)ââ∞ ±
;ââ± ≤
ds
ää 
.
ää 
ListaPEntrada
ää  
.
ää  !
Add
ää! $
(
ää$ %
new
ää% (
ParametroEntrada
ää) 9
{
ää: ;
StrNameParameter
ää< L
=
ääM N
$str
ääO c
,
ääc d
TipoDato
ääe m
=
ään o
TipoDato
ääp x
.
ääx y
VarCharääy Ä
,ääÄ Å
ObjValueääÇ ä
=ääã å 
obj_beneficiarioääç ù
.ääù û!
str_num_documentoääû Ø
.ääØ ∞
ToStringää∞ ∏
(ää∏ π
)ääπ ∫
}ääª º
)ääº Ω
;ääΩ æ
ds
ãã 
.
ãã 
ListaPEntrada
ãã  
.
ãã  !
Add
ãã! $
(
ãã$ %
new
ãã% (
ParametroEntrada
ãã) 9
{
ãã: ;
StrNameParameter
ãã< L
=
ããM N
$str
ããO c
,
ããc d
TipoDato
ããe m
=
ããn o
TipoDato
ããp x
.
ããx y
Integerããy Ä
,ããÄ Å
ObjValueããÇ ä
=ããã å 
obj_beneficiarioããç ù
.ããù û!
int_ente_registraããû Ø
.ããØ ∞
ToStringãã∞ ∏
(ãã∏ π
)ããπ ∫
}ããª º
)ããº Ω
;ããΩ æ
ds
éé 
.
éé 
ListaPEntrada
éé  
.
éé  !
Add
éé! $
(
éé$ %
new
éé% (
ParametroEntrada
éé) 9
{
éé: ;
StrNameParameter
éé< L
=
ééM N
$str
ééO ]
,
éé] ^
TipoDato
éé_ g
=
ééh i
TipoDato
ééj r
.
éér s
Integer
éés z
,
ééz {
ObjValueéé| Ñ
=ééÖ Ü 
obj_beneficiarioééá ó
.ééó ò
str_sistemaééò £
}éé§ •
)éé• ¶
;éé¶ ß
ds
èè 
.
èè 
ListaPEntrada
èè  
.
èè  !
Add
èè! $
(
èè$ %
new
èè% (
ParametroEntrada
èè) 9
{
èè: ;
StrNameParameter
èè< L
=
èèM N
$str
èèO \
,
èè\ ]
TipoDato
èè^ f
=
èèg h
TipoDato
èèi q
.
èèq r
VarChar
èèr y
,
èèy z
ObjValueèè{ É
=èèÑ Ö 
obj_beneficiarioèèÜ ñ
.èèñ ó

str_sesionèèó °
.èè° ¢
ToStringèè¢ ™
(èè™ ´
)èè´ ¨
}èè≠ Æ
)èèÆ Ø
;èèØ ∞
ds
êê 
.
êê 
ListaPEntrada
êê  
.
êê  !
Add
êê! $
(
êê$ %
new
êê% (
ParametroEntrada
êê) 9
{
êê: ;
StrNameParameter
êê< L
=
êêM N
$str
êêO [
,
êê[ \
TipoDato
êê] e
=
êêf g
TipoDato
êêh p
.
êêp q
VarChar
êêq x
,
êêx y
ObjValueêêz Ç
=êêÉ Ñ 
obj_beneficiarioêêÖ ï
.êêï ñ
	str_loginêêñ ü
.êêü †
ToStringêê† ®
(êê® ©
)êê© ™
}êê´ ¨
)êê¨ ≠
;êê≠ Æ
ds
ëë 
.
ëë 
ListaPEntrada
ëë  
.
ëë  !
Add
ëë! $
(
ëë$ %
new
ëë% (
ParametroEntrada
ëë) 9
{
ëë: ;
StrNameParameter
ëë< L
=
ëëM N
$str
ëëO ]
,
ëë] ^
TipoDato
ëë_ g
=
ëëh i
TipoDato
ëëj r
.
ëër s
Integer
ëës z
,
ëëz {
ObjValueëë| Ñ
=ëëÖ Ü 
obj_beneficiarioëëá ó
.ëëó ò
int_id_oficinaëëò ¶
.ëë¶ ß
ToStringëëß Ø
(ëëØ ∞
)ëë∞ ±
}ëë≤ ≥
)ëë≥ ¥
;ëë¥ µ
ds
íí 
.
íí 
ListaPEntrada
íí  
.
íí  !
Add
íí! $
(
íí$ %
new
íí% (
ParametroEntrada
íí) 9
{
íí: ;
StrNameParameter
íí< L
=
ííM N
$str
ííO [
,
íí[ \
TipoDato
íí] e
=
ííf g
TipoDato
ííh p
.
ííp q
VarChar
ííq x
,
ííx y
ObjValueííz Ç
=ííÉ Ñ 
obj_beneficiarioííÖ ï
.ííï ñ
	str_canalííñ ü
.ííü †
ToStringíí† ®
(íí® ©
)íí© ™
}íí´ ¨
)íí¨ ≠
;íí≠ Æ
ds
ìì 
.
ìì 
ListaPEntrada
ìì  
.
ìì  !
Add
ìì! $
(
ìì$ %
new
ìì% (
ParametroEntrada
ìì) 9
{
ìì: ;
StrNameParameter
ìì< L
=
ììM N
$str
ììO \
,
ìì\ ]
TipoDato
ìì^ f
=
ììg h
TipoDato
ììi q
.
ììq r
VarChar
ììr y
,
ììy z
ObjValueìì{ É
=ììÑ Ö 
obj_beneficiarioììÜ ñ
.ììñ ó"
str_ip_dispositivoììó ©
.ìì© ™
ToStringìì™ ≤
(ìì≤ ≥
)ìì≥ ¥
}ììµ ∂
)ìì∂ ∑
;ìì∑ ∏
ds
îî 
.
îî 
ListaPEntrada
îî  
.
îî  !
Add
îî! $
(
îî$ %
new
îî% (
ParametroEntrada
îî) 9
{
îî: ;
StrNameParameter
îî< L
=
îîM N
$str
îîO Y
,
îîY Z
TipoDato
îî[ c
=
îîd e
TipoDato
îîf n
.
îîn o
VarChar
îîo v
,
îîv w
ObjValueîîx Ä
=îîÅ Ç 
obj_beneficiarioîîÉ ì
.îîì î#
str_mac_dispositivoîîî ß
.îîß ®
ToStringîî® ∞
(îî∞ ±
)îî± ≤
}îî≥ ¥
)îî¥ µ
;îîµ ∂
ds
óó 
.
óó 
ListaPSalida
óó 
.
óó  
Add
óó  #
(
óó# $
new
óó$ '
ParametroSalida
óó( 7
{
óó8 9
StrNameParameter
óó: J
=
óóK L
$str
óóM W
,
óóW X
TipoDato
óóY a
=
óób c
TipoDato
óód l
.
óól m
VarChar
óóm t
}
óóu v
)
óóv w
;
óów x
ds
òò 
.
òò 
ListaPSalida
òò 
.
òò  
Add
òò  #
(
òò# $
new
òò$ '
ParametroSalida
òò( 7
{
òò8 9
StrNameParameter
òò: J
=
òòK L
$str
òòM [
,
òò[ \
TipoDato
òò] e
=
òòf g
TipoDato
òòh p
.
òòp q
Integer
òòq x
}
òòy z
)
òòz {
;
òò{ |
ds
öö 
.
öö 
NombreSP
öö 
=
öö 
$str
öö A
;
ööA B
ds
õõ 
.
õõ 
NombreBD
õõ 
=
õõ 
	_settings
õõ '
.
õõ' (
BD_megservicios
õõ( 7
;
õõ7 8
var
ùù 
	resultado
ùù 
=
ùù 
objClienteDal
ùù  -
.
ùù- .
ExecuteNonQuery
ùù. =
(
ùù= >
ds
ùù> @
)
ùù@ A
;
ùùA B
var
ûû 
lst_valores
ûû 
=
ûû  !
new
ûû" %
List
ûû& *
<
ûû* +$
ParametroSalidaValores
ûû+ A
>
ûûA B
(
ûûB C
)
ûûC D
;
ûûD E
foreach
†† 
(
†† 
var
†† 
item
†† !
in
††" $
	resultado
††% .
.
††. /!
ListaPSalidaValores
††/ B
)
††B C
lst_valores
††D O
.
††O P
Add
††P S
(
††S T
item
††T X
)
††X Y
;
††Y Z
var
°° 

str_codigo
°° 
=
°°  
lst_valores
°°! ,
.
°°, -
Find
°°- 1
(
°°1 2
x
°°2 3
=>
°°4 6
x
°°7 8
.
°°8 9
StrNameParameter
°°9 I
==
°°J L
$str
°°M [
)
°°[ \
.
°°\ ]
ObjValue
°°] e
;
°°e f
var
¢¢ 
	str_error
¢¢ 
=
¢¢ 
lst_valores
¢¢  +
.
¢¢+ ,
Find
¢¢, 0
(
¢¢0 1
x
¢¢1 2
=>
¢¢3 5
x
¢¢6 7
.
¢¢7 8
StrNameParameter
¢¢8 H
==
¢¢I K
$str
¢¢L V
)
¢¢V W
.
¢¢W X
ObjValue
¢¢X `
.
¢¢` a
Trim
¢¢a e
(
¢¢e f
)
¢¢f g
;
¢¢g h
	respuesta
§§ 
.
§§ 
codigo
§§  
=
§§! "

str_codigo
§§# -
.
§§- .
ToString
§§. 6
(
§§6 7
)
§§7 8
.
§§8 9
Trim
§§9 =
(
§§= >
)
§§> ?
.
§§? @
PadLeft
§§@ G
(
§§G H
$num
§§H I
,
§§I J
$char
§§K N
)
§§N O
;
§§O P
	respuesta
•• 
.
•• 
cuerpo
••  
=
••! "
	resultado
••# ,
.
••, -
NumAfectados
••- 9
;
••9 :
	respuesta
¶¶ 
.
¶¶ 
diccionario
¶¶ %
.
¶¶% &
Add
¶¶& )
(
¶¶) *
$str
¶¶* 5
,
¶¶5 6
	str_error
¶¶7 @
.
¶¶@ A
ToString
¶¶A I
(
¶¶I J
)
¶¶J K
)
¶¶K L
;
¶¶L M
}
®® 
catch
©© 
(
©© 
	Exception
©© 
	exception
©© &
)
©©& '
{
™™ 
	respuesta
´´ 
.
´´ 
codigo
´´  
=
´´! "
$str
´´# (
;
´´( )
	respuesta
¨¨ 
.
¨¨ 
diccionario
¨¨ %
.
¨¨% &
Add
¨¨& )
(
¨¨) *
$str
¨¨* 5
,
¨¨5 6
	exception
¨¨7 @
.
¨¨@ A
ToString
¨¨A I
(
¨¨I J
)
¨¨J K
)
¨¨K L
;
¨¨L M
obj_infoLog
≠≠ 
.
≠≠ 

str_metodo
≠≠ &
=
≠≠' (
$str
≠≠) L
;
≠≠L M
obj_infoLog
≠≠N Y
.
≠≠Y Z

str_objeto
≠≠Z d
=
≠≠e f
	exception
≠≠g p
;
≠≠p q
LogServicios
ÆÆ 
.
ÆÆ 
RegistrarTramas
ÆÆ ,
(
ÆÆ, -
str_salida_error
ÆÆ- =
,
ÆÆ= >
obj_infoLog
ÆÆ? J
,
ÆÆJ K
str_ruta
ÆÆL T
)
ÆÆT U
;
ÆÆU V
}
ØØ 
return
∞∞ 
	respuesta
∞∞ 
;
∞∞ 
}
±± 	
public
¥¥ "
RespuestaTransaccion
¥¥ #+
validar_benef_otras_ctas_mego
¥¥$ A
(
¥¥A B
ReqBeneficiarios
¥¥B R
obj_beneficiario
¥¥S c
)
¥¥c d
{
µµ 	"
RespuestaTransaccion
∂∂  
	respuesta
∂∂! *
=
∂∂+ ,
new
∂∂- 0"
RespuestaTransaccion
∂∂1 E
(
∂∂E F
)
∂∂F G
;
∂∂G H
try
∏∏ 
{
ππ 
DatosSolicitud
∫∫ 
ds
∫∫ !
=
∫∫" #
new
∫∫$ '
DatosSolicitud
∫∫( 6
(
∫∫6 7
)
∫∫7 8
;
∫∫8 9
ds
ºº 
.
ºº 
ListaPEntrada
ºº  
.
ºº  !
Add
ºº! $
(
ºº$ %
new
ºº% (
ParametroEntrada
ºº) 9
{
ºº: ;
StrNameParameter
ºº< L
=
ººM N
$str
ººO ]
,
ºº] ^
TipoDato
ºº_ g
=
ººh i
TipoDato
ººj r
.
ººr s
VarChar
ººs z
,
ººz {
ObjValueºº| Ñ
=ººÖ Ü 
obj_beneficiarioººá ó
.ººó ò
str_num_ctaººò £
}ºº§ •
)ºº• ¶
;ºº¶ ß
ds
ΩΩ 
.
ΩΩ 
ListaPEntrada
ΩΩ  
.
ΩΩ  !
Add
ΩΩ! $
(
ΩΩ$ %
new
ΩΩ% (
ParametroEntrada
ΩΩ) 9
{
ΩΩ: ;
StrNameParameter
ΩΩ< L
=
ΩΩM N
$str
ΩΩO c
,
ΩΩc d
TipoDato
ΩΩe m
=
ΩΩn o
TipoDato
ΩΩp x
.
ΩΩx y
VarCharΩΩy Ä
,ΩΩÄ Å
ObjValueΩΩÇ ä
=ΩΩã å 
obj_beneficiarioΩΩç ù
.ΩΩù û!
int_ente_registraΩΩû Ø
.ΩΩØ ∞
ToStringΩΩ∞ ∏
(ΩΩ∏ π
)ΩΩπ ∫
}ΩΩª º
)ΩΩº Ω
;ΩΩΩ æ
ds
¿¿ 
.
¿¿ 
ListaPEntrada
¿¿  
.
¿¿  !
Add
¿¿! $
(
¿¿$ %
new
¿¿% (
ParametroEntrada
¿¿) 9
{
¿¿: ;
StrNameParameter
¿¿< L
=
¿¿M N
$str
¿¿O ]
,
¿¿] ^
TipoDato
¿¿_ g
=
¿¿h i
TipoDato
¿¿j r
.
¿¿r s
Integer
¿¿s z
,
¿¿z {
ObjValue¿¿| Ñ
=¿¿Ö Ü 
obj_beneficiario¿¿á ó
.¿¿ó ò
str_sistema¿¿ò £
}¿¿§ •
)¿¿• ¶
;¿¿¶ ß
ds
¡¡ 
.
¡¡ 
ListaPEntrada
¡¡  
.
¡¡  !
Add
¡¡! $
(
¡¡$ %
new
¡¡% (
ParametroEntrada
¡¡) 9
{
¡¡: ;
StrNameParameter
¡¡< L
=
¡¡M N
$str
¡¡O `
,
¡¡` a
TipoDato
¡¡b j
=
¡¡k l
TipoDato
¡¡m u
.
¡¡u v
VarChar
¡¡v }
,
¡¡} ~
ObjValue¡¡ á
=¡¡à â 
obj_beneficiario¡¡ä ö
.¡¡ö õ

str_sesion¡¡õ •
.¡¡• ¶
ToString¡¡¶ Æ
(¡¡Æ Ø
)¡¡Ø ∞
}¡¡± ≤
)¡¡≤ ≥
;¡¡≥ ¥
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
¬¬% (
ParametroEntrada
¬¬) 9
{
¬¬: ;
StrNameParameter
¬¬< L
=
¬¬M N
$str
¬¬O ]
,
¬¬] ^
TipoDato
¬¬_ g
=
¬¬h i
TipoDato
¬¬j r
.
¬¬r s
VarChar
¬¬s z
,
¬¬z {
ObjValue¬¬| Ñ
=¬¬Ö Ü 
obj_beneficiario¬¬á ó
.¬¬ó ò
	str_login¬¬ò °
.¬¬° ¢
ToString¬¬¢ ™
(¬¬™ ´
)¬¬´ ¨
}¬¬≠ Æ
)¬¬Æ Ø
;¬¬Ø ∞
ds
√√ 
.
√√ 
ListaPEntrada
√√  
.
√√  !
Add
√√! $
(
√√$ %
new
√√% (
ParametroEntrada
√√) 9
{
√√: ;
StrNameParameter
√√< L
=
√√M N
$str
√√O ]
,
√√] ^
TipoDato
√√_ g
=
√√h i
TipoDato
√√j r
.
√√r s
Integer
√√s z
,
√√z {
ObjValue√√| Ñ
=√√Ö Ü 
obj_beneficiario√√á ó
.√√ó ò
int_id_oficina√√ò ¶
.√√¶ ß
ToString√√ß Ø
(√√Ø ∞
)√√∞ ±
}√√≤ ≥
)√√≥ ¥
;√√¥ µ
ds
ƒƒ 
.
ƒƒ 
ListaPEntrada
ƒƒ  
.
ƒƒ  !
Add
ƒƒ! $
(
ƒƒ$ %
new
ƒƒ% (
ParametroEntrada
ƒƒ) 9
{
ƒƒ: ;
StrNameParameter
ƒƒ< L
=
ƒƒM N
$str
ƒƒO [
,
ƒƒ[ \
TipoDato
ƒƒ] e
=
ƒƒf g
TipoDato
ƒƒh p
.
ƒƒp q
VarChar
ƒƒq x
,
ƒƒx y
ObjValueƒƒz Ç
=ƒƒÉ Ñ 
obj_beneficiarioƒƒÖ ï
.ƒƒï ñ
	str_canalƒƒñ ü
.ƒƒü †
ToStringƒƒ† ®
(ƒƒ® ©
)ƒƒ© ™
}ƒƒ´ ¨
)ƒƒ¨ ≠
;ƒƒ≠ Æ
ds
≈≈ 
.
≈≈ 
ListaPEntrada
≈≈  
.
≈≈  !
Add
≈≈! $
(
≈≈$ %
new
≈≈% (
ParametroEntrada
≈≈) 9
{
≈≈: ;
StrNameParameter
≈≈< L
=
≈≈M N
$str
≈≈O X
,
≈≈X Y
TipoDato
≈≈Z b
=
≈≈c d
TipoDato
≈≈e m
.
≈≈m n
VarChar
≈≈n u
,
≈≈u v
ObjValue
≈≈w 
=≈≈Ä Å 
obj_beneficiario≈≈Ç í
.≈≈í ì"
str_ip_dispositivo≈≈ì •
.≈≈• ¶
ToString≈≈¶ Æ
(≈≈Æ Ø
)≈≈Ø ∞
}≈≈± ≤
)≈≈≤ ≥
;≈≈≥ ¥
ds
∆∆ 
.
∆∆ 
ListaPEntrada
∆∆  
.
∆∆  !
Add
∆∆! $
(
∆∆$ %
new
∆∆% (
ParametroEntrada
∆∆) 9
{
∆∆: ;
StrNameParameter
∆∆< L
=
∆∆M N
$str
∆∆O Y
,
∆∆Y Z
TipoDato
∆∆[ c
=
∆∆d e
TipoDato
∆∆f n
.
∆∆n o
VarChar
∆∆o v
,
∆∆v w
ObjValue∆∆x Ä
=∆∆Å Ç 
obj_beneficiario∆∆É ì
.∆∆ì î#
str_mac_dispositivo∆∆î ß
.∆∆ß ®
ToString∆∆® ∞
(∆∆∞ ±
)∆∆± ≤
}∆∆≥ ¥
)∆∆¥ µ
;∆∆µ ∂
ds
»» 
.
»» 
ListaPSalida
»» 
.
»»  
Add
»»  #
(
»»# $
new
»»$ '
ParametroSalida
»»( 7
{
»»8 9
StrNameParameter
»»: J
=
»»K L
$str
»»M U
,
»»U V
TipoDato
»»W _
=
»»` a
TipoDato
»»b j
.
»»j k
VarChar
»»k r
}
»»s t
)
»»t u
;
»»u v
ds
…… 
.
…… 
ListaPSalida
…… 
.
……  
Add
……  #
(
……# $
new
……$ '
ParametroSalida
……( 7
{
……8 9
StrNameParameter
……: J
=
……K L
$str
……M Y
,
……Y Z
TipoDato
……[ c
=
……d e
TipoDato
……f n
.
……n o
Integer
……o v
}
……w x
)
……x y
;
……y z
ds
ÀÀ 
.
ÀÀ 
NombreSP
ÀÀ 
=
ÀÀ 
$str
ÀÀ =
;
ÀÀ= >
ds
ÃÃ 
.
ÃÃ 
NombreBD
ÃÃ 
=
ÃÃ 
	_settings
ÃÃ '
.
ÃÃ' (
BD_megservicios
ÃÃ( 7
;
ÃÃ7 8
var
ŒŒ 
	resultado
ŒŒ 
=
ŒŒ 
objClienteDal
ŒŒ  -
.
ŒŒ- .
ExecuteDataSet
ŒŒ. <
(
ŒŒ< =
ds
ŒŒ= ?
)
ŒŒ? @
;
ŒŒ@ A
var
œœ 
lst_valores
œœ 
=
œœ  !
new
œœ" %
List
œœ& *
<
œœ* +$
ParametroSalidaValores
œœ+ A
>
œœA B
(
œœB C
)
œœC D
;
œœD E
foreach
—— 
(
—— 
var
—— 
item
—— !
in
——" $
	resultado
——% .
.
——. /!
ListaPSalidaValores
——/ B
)
——B C
lst_valores
——D O
.
——O P
Add
——P S
(
——S T
item
——T X
)
——X Y
;
——Y Z
var
““ 

str_codigo
““ 
=
““  
lst_valores
““! ,
.
““, -
Find
““- 1
(
““1 2
x
““2 3
=>
““4 6
x
““7 8
.
““8 9
StrNameParameter
““9 I
==
““J L
$str
““M Y
)
““Y Z
.
““Z [
ObjValue
““[ c
;
““c d
var
”” 
	str_error
”” 
=
”” 
lst_valores
””  +
.
””+ ,
Find
””, 0
(
””0 1
x
””1 2
=>
””3 5
x
””6 7
.
””7 8
StrNameParameter
””8 H
==
””I K
$str
””L T
)
””T U
.
””U V
ObjValue
””V ^
.
””^ _
Trim
””_ c
(
””c d
)
””d e
;
””e f
	respuesta
’’ 
.
’’ 
codigo
’’  
=
’’! "

str_codigo
’’# -
.
’’- .
ToString
’’. 6
(
’’6 7
)
’’7 8
.
’’8 9
Trim
’’9 =
(
’’= >
)
’’> ?
.
’’? @
PadLeft
’’@ G
(
’’G H
$num
’’H I
,
’’I J
$char
’’K N
)
’’N O
;
’’O P
	respuesta
÷÷ 
.
÷÷ 
cuerpo
÷÷  
=
÷÷! "
	Funciones
÷÷# ,
.
÷÷, -
ObtenerDatos
÷÷- 9
(
÷÷9 :
	resultado
÷÷: C
)
÷÷C D
;
÷÷D E
	respuesta
◊◊ 
.
◊◊ 
diccionario
◊◊ %
.
◊◊% &
Add
◊◊& )
(
◊◊) *
$str
◊◊* 5
,
◊◊5 6
	str_error
◊◊7 @
.
◊◊@ A
ToString
◊◊A I
(
◊◊I J
)
◊◊J K
)
◊◊K L
;
◊◊L M
}
ŸŸ 
catch
⁄⁄ 
(
⁄⁄ 
	Exception
⁄⁄ 
	exception
⁄⁄ &
)
⁄⁄& '
{
€€ 
	respuesta
‹‹ 
.
‹‹ 
codigo
‹‹  
=
‹‹! "
$str
‹‹# (
;
‹‹( )
	respuesta
›› 
.
›› 
diccionario
›› %
.
››% &
Add
››& )
(
››) *
$str
››* 5
,
››5 6
	exception
››7 @
.
››@ A
ToString
››A I
(
››I J
)
››J K
)
››K L
;
››L M
obj_infoLog
ﬁﬁ 
.
ﬁﬁ 

str_metodo
ﬁﬁ &
=
ﬁﬁ' (
$str
ﬁﬁ) H
;
ﬁﬁH I
obj_infoLog
ﬁﬁJ U
.
ﬁﬁU V

str_objeto
ﬁﬁV `
=
ﬁﬁa b
	exception
ﬁﬁc l
;
ﬁﬁl m
LogServicios
ﬂﬂ 
.
ﬂﬂ 
RegistrarTramas
ﬂﬂ ,
(
ﬂﬂ, -
str_salida_error
ﬂﬂ- =
,
ﬂﬂ= >
obj_infoLog
ﬂﬂ? J
,
ﬂﬂJ K
str_ruta
ﬂﬂL T
)
ﬂﬂT U
;
ﬂﬂU V
}
‡‡ 
return
·· 
	respuesta
·· 
;
·· 
}
‚‚ 	
}
‰‰ 
}ÂÂ Å
HC:\SistemasMego\wsTransferencias_net_6\wsTransferencias.Dat\Funciones.cs
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
class 
	Funciones 
{ 
public 
static 
ConjuntoDatos #
ObtenerDatos$ 0
(0 1
DatosRespuesta1 ?
	resultado@ I
)I J
{ 	
ConjuntoDatos 
cd 
= 
new "
ConjuntoDatos# 0
(0 1
)1 2
;2 3
var 

lst_tablas 
= 
new  
List! %
<% &
Tabla& +
>+ ,
(, -
)- .
;. /
for 
( 
int 
k 
= 
$num 
; 
k 
< 
	resultado  )
.) *
ListaTablas* 5
.5 6
Count6 ;
;; <
k= >
++> @
)@ A
{ 
var 
	lst_filas 
= 
new  #
List$ (
<( )
Dto) ,
., -
Fila- 1
>1 2
(2 3
)3 4
;4 5
for 
( 
int 
i 
= 
$num 
; 
i  !
<" #
	resultado$ -
.- .
ListaTablas. 9
[9 :
k: ;
]; <
.< =

ListaFilas= G
.G H
CountH M
;M N
iO P
++P R
)R S
{ 
Dto 
. 
Fila 
fila !
=" #
new$ '
Dto( +
.+ ,
Fila, 0
(0 1
)1 2
;2 3
for 
( 
int 
j 
=  
$num! "
;" #
j$ %
<& '
	resultado( 1
.1 2
ListaTablas2 =
[= >
k> ?
]? @
.@ A

ListaFilasA K
[K L
iL M
]M N
.N O
ListaColumnasO \
.\ ]
Count] b
;b c
jd e
++e g
)g h
{ 
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
ListaTablas	} à
[
à â
k
â ä
]
ä ã
.
ã å

ListaFilas
å ñ
[
ñ ó
i
ó ò
]
ò ô
.
ô ö
ListaColumnas
ö ß
[
ß ®
j
® ©
]
© ™
.
™ ´
Valor
´ ∞
)
∞ ±
;
± ≤
} 
	lst_filas 
. 
Add !
(! "
new" %
Dto& )
.) *
Fila* .
{/ 0
nombre_valor1 =
=> ?
fila@ D
.D E
nombre_valorE Q
}R S
)S T
;T U
} 

lst_tablas   
.   
Add   
(   
new   "
Tabla  # (
{  ) *
	lst_filas  + 4
=  5 6
	lst_filas  7 @
}  A B
)  B C
;  C D
}!! 
cd"" 
."" 

lst_tablas"" 
="" 

lst_tablas"" &
;""& '
return## 
cd## 
;## 
}$$ 	
}%% 
}&& 