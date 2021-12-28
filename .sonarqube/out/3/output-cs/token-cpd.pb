��
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
,DangerousAcceptAnyServerCertificateValidator	""V �
;
""� �
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
httpHandler	##| �
}
##� �
)
##� �
;
##� �
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
ObjValue	00 �
=
00� �
obj_beneficiario
00� �
.
00� �
str_codigo_ifi
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
$str11O c
,11c d
TipoDato11e m
=11n o
TipoDato11p x
.11x y
Integer	11y �
,
11� �
ObjValue
11� �
=
11� �
obj_beneficiario
11� �
.
11� �
int_tipo_producto
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
$str22O ]
,22] ^
TipoDato22_ g
=22h i
TipoDato22j r
.22r s
VarChar22s z
,22z {
ObjValue	22| �
=
22� �
obj_beneficiario
22� �
.
22� �
str_num_cta
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
VarChar	33y �
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
str_num_documento
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
ObjValue	44| �
=
44� �
obj_beneficiario
44� �
.
44� �
str_nombres
44� �
.
44� �
ToString
44� �
(
44� �
)
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
ObjValue	55z �
=
55� �
obj_beneficiario
55� �
.
55� �
	str_email
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
$str66O _
,66_ `
TipoDato66a i
=66j k
TipoDato66l t
.66t u
VarChar66u |
,66| }
ObjValue	66~ �
=
66� �
obj_beneficiario
66� �
.
66� �
str_alias_cta
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
Integer	77} �
,
77� �
ObjValue
77� �
=
77� �
obj_beneficiario
77� �
.
77� �#
int_tipo_tarjeta_cred
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
$str88O g
,88g h
TipoDato88i q
=88r s
TipoDato88t |
.88| }
VarChar	88} �
,
88� �
ObjValue
88� �
=
88� �
obj_beneficiario
88� �
.
88� �#
str_tipo_beneficiario
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
$str99O c
,99c d
TipoDato99e m
=99n o
TipoDato99p x
.99x y
Integer	99y �
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
int_ente_registra
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
ObjValue	<< �
=
<<� �
obj_beneficiario
<<� �
.
<<� �
str_sistema
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
$str==O ]
,==] ^
TipoDato==_ g
===h i
TipoDato==j r
.==r s
VarChar==s z
,==z {
ObjValue	==| �
=
==� �
obj_beneficiario
==� �
.
==� �

str_sesion
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
ObjValue	>>| �
=
>>� �
obj_beneficiario
>>� �
.
>>� �
	str_login
>>� �
.
>>� �
ToString
>>� �
(
>>� �
)
>>� �
}
>>� �
)
>>� �
;
>>� �
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
ObjValue	?? �
=
??� �
obj_beneficiario
??� �
.
??� �
int_id_oficina
??� �
.
??� �
ToString
??� �
(
??� �
)
??� �
}
??� �
)
??� �
;
??� �
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
VarChar	@@z �
,
@@� �
ObjValue
@@� �
=
@@� �
obj_beneficiario
@@� �
.
@@� �
	str_canal
@@� �
.
@@� �
ToString
@@� �
(
@@� �
)
@@� �
}
@@� �
)
@@� �
;
@@� �
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
AA� �
obj_beneficiario
AA� �
.
AA� � 
str_ip_dispositivo
AA� �
.
AA� �
ToString
AA� �
(
AA� �
)
AA� �
}
AA� �
)
AA� �
;
AA� �
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
ObjValue	BBx �
=
BB� �
obj_beneficiario
BB� �
.
BB� �!
str_mac_dispositivo
BB� �
.
BB� �
ToString
BB� �
(
BB� �
)
BB� �
}
BB� �
)
BB� �
;
BB� �
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
;	FF �
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
ObjValue	hh �
=
hh� �
obj_beneficiario
hh� �
.
hh� �
str_codigo_ifi
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
Integer	iiy �
,
ii� �
ObjValue
ii� �
=
ii� �
obj_beneficiario
ii� �
.
ii� �
int_tipo_producto
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
ObjValue	jj| �
=
jj� �
obj_beneficiario
jj� �
.
jj� �
str_num_cta
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
$strkkO c
,kkc d
TipoDatokke m
=kkn o
TipoDatokkp x
.kkx y
VarChar	kky �
,
kk� �
ObjValue
kk� �
=
kk� �
obj_beneficiario
kk� �
.
kk� �
str_num_documento
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
ObjValue	ll| �
=
ll� �
obj_beneficiario
ll� �
.
ll� �
str_nombres
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
ObjValue	mmz �
=
mm� �
obj_beneficiario
mm� �
.
mm� �
	str_email
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
ObjValue	nn~ �
=
nn� �
obj_beneficiario
nn� �
.
nn� �
str_alias_cta
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
$strooO g
,oog h
TipoDatoooi q
=oor s
TipoDatooot |
.oo| }
Integer	oo} �
,
oo� �
ObjValue
oo� �
=
oo� �
obj_beneficiario
oo� �
.
oo� �#
int_tipo_tarjeta_cred
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
VarChar	pp} �
,
pp� �
ObjValue
pp� �
=
pp� �
obj_beneficiario
pp� �
.
pp� �#
str_tipo_beneficiario
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
$strqqO c
,qqc d
TipoDatoqqe m
=qqn o
TipoDatoqqp x
.qqx y
Integer	qqy �
,
qq� �
ObjValue
qq� �
=
qq� �
obj_beneficiario
qq� �
.
qq� �
int_ente_registra
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
rr� �
obj_beneficiario
rr� �
.
rr� �
int_id
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
ObjValue	uu �
=
uu� �
obj_beneficiario
uu� �
.
uu� �
str_sistema
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
$strvvO ]
,vv] ^
TipoDatovv_ g
=vvh i
TipoDatovvj r
.vvr s
VarCharvvs z
,vvz {
ObjValue	vv| �
=
vv� �
obj_beneficiario
vv� �
.
vv� �

str_sesion
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
ObjValue	ww| �
=
ww� �
obj_beneficiario
ww� �
.
ww� �
	str_login
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
ObjValue	xx �
=
xx� �
obj_beneficiario
xx� �
.
xx� �
int_id_oficina
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
VarChar	yyz �
,
yy� �
ObjValue
yy� �
=
yy� �
obj_beneficiario
yy� �
.
yy� �
	str_canal
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
zz� �
obj_beneficiario
zz� �
.
zz� � 
str_ip_dispositivo
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
ObjValue	{{x �
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
;	 �
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
��> @
)
��@ A
;
��A B
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
.
��` a
ObjValue
��a i
;
��i j
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
.
��[ \
ObjValue
��\ d
.
��d e
Trim
��e i
(
��i j
)
��j k
;
��k l
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
��L M
obj_infoLog
�� 
.
�� 

str_metodo
�� &
=
��' (
$str
��) J
;
��J K
obj_infoLog
��L W
.
��W X

str_objeto
��X b
=
��c d
	exception
��e n
;
��n o
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
��= >
obj_infoLog
��? J
,
��J K
str_ruta
��L T
)
��T U
;
��U V
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
��@ A
ReqBeneficiarios
��A Q
obj_beneficiario
��R b
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
Integer��y �
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
��O X
,
��X Y
TipoDato
��Z b
=
��c d
TipoDato
��e m
.
��m n
Integer
��n u
,
��u v
ObjValue
��w 
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
=��� � 
obj_beneficiario��� �
.��� �
str_sistema��� �
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
��O ]
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
��O ]
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
=��� � 
obj_beneficiario��� �
.��� �
int_id_oficina��� �
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
=��� � 
obj_beneficiario��� �
.��� �
	str_canal��� �
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
��O X
,
��X Y
TipoDato
��Z b
=
��c d
TipoDato
��e m
.
��m n
VarChar
��n u
,
��u v
ObjValue
��w 
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
��O Y
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
VarChar
��o v
,
��v w
ObjValue��x �
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
��> @
)
��@ A
;
��A B
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
.
��` a
ObjValue
��a i
;
��i j
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
.
��[ \
ObjValue
��\ d
.
��d e
Trim
��e i
(
��i j
)
��j k
;
��k l
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
��L M
obj_infoLog
�� 
.
�� 

str_metodo
�� &
=
��' (
$str
��) J
;
��J K
obj_infoLog
��L W
.
��W X

str_objeto
��X b
=
��c d
	exception
��e n
;
��n o
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
��= >
obj_infoLog
��? J
,
��J K
str_ruta
��L T
)
��T U
;
��U V
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
��; <
ReqBeneficiarios
��< L
obj_beneficiario
��M ]
)
��] ^
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
Integer��y �
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
��O ]
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
Integer
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �
str_sistema��� �
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
��O ]
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
Integer
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �
int_id_oficina��� �
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
VarChar
��q x
,
��x y
ObjValue��z �
=��� � 
obj_beneficiario��� �
.��� �
	str_canal��� �
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
��O Y
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
VarChar
��o v
,
��v w
ObjValue��x �
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
��M W
,
��W X
TipoDato
��Y a
=
��b c
TipoDato
��d l
.
��l m
VarChar
��m t
}
��u v
)
��v w
;
��w x
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
Integer
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
�� 
NombreSP
�� 
=
�� 
$str
�� 7
;
��7 8
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
��M [
)
��[ \
.
��\ ]
ObjValue
��] e
;
��e f
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
.
��W X
ObjValue
��X `
.
��` a
Trim
��a e
(
��e f
)
��f g
;
��g h
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
��L M
obj_infoLog
�� 
.
�� 

str_metodo
�� &
=
��' (
$str
��) B
;
��B C
obj_infoLog
��D O
.
��O P

str_objeto
��P Z
=
��[ \
	exception
��] f
;
��f g
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
��= >
obj_infoLog
��? J
,
��J K
str_ruta
��L T
)
��T U
;
��U V
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
�� #,
validar_registro_beneficiarios
��$ B
(
��B C
ReqBeneficiarios
��C S
obj_beneficiario
��T d
)
��d e
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
VarChar
��v }
,
��} ~
ObjValue�� �
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
Integer��y �
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
��O ]
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
.��� �
str_num_cta��� �
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
=��� � 
obj_beneficiario��� �
.��� �!
str_num_documento��� �
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
Integer��y �
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
��O ]
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
Integer
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �
str_sistema��� �
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
��O ]
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
Integer
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �
int_id_oficina��� �
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
=��� � 
obj_beneficiario��� �
.��� �
	str_canal��� �
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
��O Y
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
�� 
NombreSP
�� 
=
�� 
$str
�� A
;
��A B
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
��> @
)
��@ A
;
��A B
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
.
��\ ]
ObjValue
��] e
;
��e f
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
.
��W X
ObjValue
��X `
.
��` a
Trim
��a e
(
��e f
)
��f g
;
��g h
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
��L M
obj_infoLog
�� 
.
�� 

str_metodo
�� &
=
��' (
$str
��) L
;
��L M
obj_infoLog
��N Y
.
��Y Z

str_objeto
��Z d
=
��e f
	exception
��g p
;
��p q
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
��= >
obj_infoLog
��? J
,
��J K
str_ruta
��L T
)
��T U
;
��U V
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
��A B
ReqBeneficiarios
��B R
obj_beneficiario
��S c
)
��c d
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
��O ]
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
.��� �
str_num_cta��� �
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
��O ]
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
Integer
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �
str_sistema��� �
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
VarChar
��v }
,
��} ~
ObjValue�� �
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
��O ]
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
��O ]
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
Integer
��s z
,
��z {
ObjValue��| �
=��� � 
obj_beneficiario��� �
.��� �
int_id_oficina��� �
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
=��� � 
obj_beneficiario��� �
.��� �
	str_canal��� �
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
��O X
,
��X Y
TipoDato
��Z b
=
��c d
TipoDato
��e m
.
��m n
VarChar
��n u
,
��u v
ObjValue
��w 
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
��O Y
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
��M U
,
��U V
TipoDato
��W _
=
��` a
TipoDato
��b j
.
��j k
VarChar
��k r
}
��s t
)
��t u
;
��u v
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
��M Y
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
Integer
��o v
}
��w x
)
��x y
;
��y z
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
��M Y
)
��Y Z
.
��Z [
ObjValue
��[ c
;
��c d
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
��L T
)
��T U
.
��U V
ObjValue
��V ^
.
��^ _
Trim
��_ c
(
��c d
)
��d e
;
��e f
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
��L M
obj_infoLog
�� 
.
�� 

str_metodo
�� &
=
��' (
$str
��) H
;
��H I
obj_infoLog
��J U
.
��U V

str_objeto
��V `
=
��a b
	exception
��c l
;
��l m
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
��= >
obj_infoLog
��? J
,
��J K
str_ruta
��L T
)
��T U
;
��U V
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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