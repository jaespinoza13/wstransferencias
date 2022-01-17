¡¡
bC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\BeneficiariosNeg.cs
	namespace 	
wsTransferencias
 
. 
Neg 
{		 
public

 

class

 
BeneficiariosNeg

 !
{ 
private 
readonly 
SettingsApi $
_settingsApi% 1
;1 2
private 
readonly 
string 
	str_clase  )
;) *
public 
BeneficiariosNeg 
(  !
SettingsApi" -
serviceSettings. =
)> ?
{ 	
this 
. 
_settingsApi 
= 
serviceSettings  /
;/ 0
this 
. 
	str_clase 
= 
GetType $
($ %
)% &
.& '
FullName' /
!/ 0
;0 1
ServiceLogs 
. 
Init 
( 
_settingsApi *
)+ ,
;, -
} 	
public 
ResBeneficiarios 
add_beneficiario  0
(1 2
ReqAddBeneficiario3 E 
req_add_beneficiarioF Z
,Z [
string\ b
str_operacionc p
)q r
{ 	
var 
	respuesta 
= 
new 
ResBeneficiarios  0
(0 1
)1 2
;2 3
	respuesta 
. 
LlenarResHeader %
(% & 
req_add_beneficiario' ;
)< =
;= > 
req_add_beneficiario  
.  !
str_id_transaccion! 3
=4 5
Utils6 ;
.; <
ServiceLogs< G
.G H
SaveHeaderLogsH V
<V W
ReqAddBeneficiarioW i
>i j
(j k!
req_add_beneficiario	l Ä
,
Ä Å
str_operacion
Ç è
,
è ê

MethodBase
ë õ
.
õ ú
GetCurrentMethod
ú ¨
(
¨ ≠
)
≠ Æ
!
Æ Ø
.
Ø ∞
Name
∞ ¥
,
¥ µ
	str_clase
∂ ø
)
¿ ¡
;
¡ ¬
	respuesta 
. 
str_id_transaccion (
=) * 
req_add_beneficiario+ ?
.? @
str_id_transaccion@ R
;R S
try 
{  
RespuestaTransaccion $
res_tran% -
=. /
new0 3
BeneficiariosDat4 D
(D E
_settingsApiF R
)S T
.T U%
add_cuentas_beneficiariosU n
(n o!
req_add_beneficiario	p Ñ
)
Ö Ü
;
Ü á
	respuesta   
.   &
str_res_estado_transaccion   4
=  5 6
res_tran  7 ?
.  ? @
codigo  @ F
.  F G
Equals  G M
(  M N
$str  O T
)  U V
?  W X
$str  Y ]
:  ^ _
$str  ` e
;  e f
	respuesta!! 
.!! 
str_res_codigo!! (
=!!) *
res_tran!!+ 3
.!!3 4
codigo!!4 :
;!!: ;
	respuesta"" 
."" "
str_res_info_adicional"" 0
=""1 2
res_tran""3 ;
.""; <
diccionario""< G
[""G H
$str""H S
]""S T
.""T U
ToString""U ]
(""] ^
)""^ _
;""_ `
}## 
catch$$ 
($$ 
	Exception$$ 
	exception$$ %
)$$% &
{%% 
Utils&& 
.&& 
ServiceLogs&& !
.&&! "
SaveExceptionLogs&&" 3
(&&3 4
	respuesta&&5 >
,&&> ?
str_operacion&&@ M
,&&M N

MethodBase&&O Y
.&&Y Z
GetCurrentMethod&&Z j
(&&j k
)&&k l
!&&l m
.&&m n
Name&&n r
,&&r s
	str_clase&&t }
,&&} ~
	exception	&& à
)
&&â ä
;
&&ä ã
throw'' 
;'' 
}(( 
Utils** 
.** 
ServiceLogs** 
.** 
SaveResponseLogs** .
(**. /
	respuesta**0 9
,**9 :
str_operacion**; H
,**H I

MethodBase**J T
.**T U
GetCurrentMethod**U e
(**e f
)**f g
!**g h
.**h i
Name**i m
,**m n
	str_clase**o x
)**y z
;**z {
return++ 
	respuesta++ 
;++ 
},, 	
public// 
ResBeneficiarios// 
update_beneficiario//  3
(//4 5!
ReqUpdateBeneficiario//6 K#
req_update_beneficiario//L c
,//c d
string//e k
str_operacion//l y
)//z {
{00 	
var11 
	respuesta11 
=11 
new11 
ResBeneficiarios11  0
(110 1
)111 2
;112 3
	respuesta22 
.22 
LlenarResHeader22 %
(22% &#
req_update_beneficiario22' >
)22? @
;22@ A#
req_update_beneficiario33 #
.33# $
str_id_transaccion33$ 6
=337 8
Utils339 >
.33> ?
ServiceLogs33? J
.33J K
SaveHeaderLogs33K Y
<33Y Z!
ReqUpdateBeneficiario33Z o
>33o p
(33p q$
req_update_beneficiario	33r â
,
33â ä
str_operacion
33ã ò
,
33ò ô

MethodBase
33ö §
.
33§ •
GetCurrentMethod
33• µ
(
33µ ∂
)
33∂ ∑
!
33∑ ∏
.
33∏ π
Name
33π Ω
,
33Ω æ
	str_clase
33ø »
)
33…  
;
33  À
	respuesta44 
.44 
str_id_transaccion44 (
=44) *#
req_update_beneficiario44+ B
.44B C
str_id_transaccion44C U
;44U V
try66 
{77 
var88 
res_tran88 
=88 
new88 "
BeneficiariosDat88# 3
(883 4
_settingsApi885 A
)88B C
.88C D(
update_cuentas_beneficiarios88D `
(88` a#
req_update_beneficiario88b y
)88z {
;88{ |
	respuesta99 
.99 &
str_res_estado_transaccion99 4
=995 6
res_tran997 ?
.99? @
codigo99@ F
.99F G
Equals99G M
(99M N
$str99O T
)99U V
?99W X
$str99Y ]
:99^ _
$str99` e
;99e f
	respuesta:: 
.:: 
str_res_codigo:: (
=::) *
res_tran::+ 3
.::3 4
codigo::4 :
;::: ;
	respuesta;; 
.;; "
str_res_info_adicional;; 0
=;;1 2
res_tran;;3 ;
.;;; <
diccionario;;< G
[;;G H
$str;;H S
];;S T
.;;T U
ToString;;U ]
(;;] ^
);;^ _
;;;_ `
}<< 
catch== 
(== 
	Exception== 
	exception== %
)==% &
{>> 
Utils?? 
.?? 
ServiceLogs?? !
.??! "
SaveExceptionLogs??" 3
(??3 4
	respuesta??5 >
,??> ?
str_operacion??@ M
,??M N

MethodBase??O Y
.??Y Z
GetCurrentMethod??Z j
(??j k
)??k l
!??l m
.??m n
Name??n r
,??r s
	str_clase??t }
,??} ~
	exception	?? à
)
??â ä
;
??ä ã
throw@@ 
;@@ 
}AA 
UtilsCC 
.CC 
ServiceLogsCC 
.CC 
SaveResponseLogsCC .
(CC. /
	respuestaCC0 9
,CC9 :
str_operacionCC; H
,CCH I

MethodBaseCCJ T
.CCT U
GetCurrentMethodCCU e
(CCe f
)CCf g
!CCg h
.CCh i
NameCCi m
,CCm n
	str_claseCCo x
)CCy z
;CCz {
returnDD 
	respuestaDD 
;DD 
}EE 	
publicHH 
ResBeneficiariosHH 
delete_beneficiarioHH  3
(HH4 5!
ReqDeleteBeneficiarioHH6 K#
req_delete_beneficiarioHHL c
,HHc d
stringHHe k
str_operacionHHl y
)HHz {
{II 	
varJJ 
	respuestaJJ 
=JJ 
newJJ 
ResBeneficiariosJJ  0
(JJ0 1
)JJ1 2
;JJ2 3
	respuestaKK 
.KK 
LlenarResHeaderKK %
(KK% &#
req_delete_beneficiarioKK' >
)KK? @
;KK@ A#
req_delete_beneficiarioLL #
.LL# $
str_id_transaccionLL$ 6
=LL7 8
UtilsLL9 >
.LL> ?
ServiceLogsLL? J
.LLJ K
SaveHeaderLogsLLK Y
<LLY Z!
ReqDeleteBeneficiarioLLZ o
>LLo p
(LLp q$
req_delete_beneficiario	LLr â
,
LLâ ä
str_operacion
LLã ò
,
LLò ô

MethodBase
LLö §
.
LL§ •
GetCurrentMethod
LL• µ
(
LLµ ∂
)
LL∂ ∑
!
LL∑ ∏
.
LL∏ π
Name
LLπ Ω
,
LLΩ æ
	str_clase
LLø »
)
LL…  
;
LL  À
	respuestaMM 
.MM 
str_id_transaccionMM (
=MM) *#
req_delete_beneficiarioMM+ B
.MMB C
str_id_transaccionMMC U
;MMU V
tryOO 
{PP 
varQQ 
res_tranQQ 
=QQ 
newQQ "
BeneficiariosDatQQ# 3
(QQ3 4
_settingsApiQQ5 A
)QQB C
.QQC D(
delete_cuentas_beneficiariosQQD `
(QQ` a#
req_delete_beneficiarioQQb y
)QQz {
;QQ{ |
	respuestaRR 
.RR &
str_res_estado_transaccionRR 4
=RR5 6
res_tranRR7 ?
.RR? @
codigoRR@ F
.RRF G
EqualsRRG M
(RRM N
$strRRO T
)RRU V
?RRW X
$strRRY ]
:RR^ _
$strRR` e
;RRe f
	respuestaSS 
.SS 
str_res_codigoSS (
=SS) *
res_tranSS+ 3
.SS3 4
codigoSS4 :
;SS: ;
	respuestaTT 
.TT "
str_res_info_adicionalTT 0
=TT1 2
res_tranTT3 ;
.TT; <
diccionarioTT< G
[TTG H
$strTTH S
]TTS T
.TTT U
ToStringTTU ]
(TT] ^
)TT^ _
;TT_ `
}UU 
catchVV 
(VV 
	ExceptionVV 
	exceptionVV %
)VV% &
{WW 
UtilsXX 
.XX 
ServiceLogsXX !
.XX! "
SaveExceptionLogsXX" 3
(XX3 4
	respuestaXX5 >
,XX> ?
str_operacionXX@ M
,XXM N

MethodBaseXXO Y
.XXY Z
GetCurrentMethodXXZ j
(XXj k
)XXk l
!XXl m
.XXm n
NameXXn r
,XXr s
	str_claseXXt }
,XX} ~
	exception	XX à
)
XXâ ä
;
XXä ã
throwYY 
;YY 
}ZZ 
Utils\\ 
.\\ 
ServiceLogs\\ 
.\\ 
SaveResponseLogs\\ .
(\\. /
	respuesta\\0 9
,\\9 :
str_operacion\\; H
,\\H I

MethodBase\\J T
.\\T U
GetCurrentMethod\\U e
(\\e f
)\\f g
!\\g h
.\\h i
Name\\i m
,\\m n
	str_clase\\o x
)\\y z
;\\z {
return]] 
	respuesta]] 
;]] 
}^^ 	
publicaa 
ResGetBeneficiarioaa !
get_beneficiarioaa" 2
(aa3 4
ReqGetBeneficiarioaa5 G 
req_get_beneficiarioaaH \
,aa\ ]
stringaa^ d
str_operacionaae r
)aas t
{bb 	
varcc 
	respuestacc 
=cc 
newcc 
ResGetBeneficiariocc  2
(cc2 3
)cc3 4
;cc4 5
	respuestadd 
.dd 
LlenarResHeaderdd %
(dd% & 
req_get_beneficiariodd' ;
)dd< =
;dd= > 
req_get_beneficiarioee  
.ee  !
str_id_transaccionee! 3
=ee4 5
Utilsee6 ;
.ee; <
ServiceLogsee< G
.eeG H
SaveHeaderLogseeH V
<eeV W
ReqGetBeneficiarioeeW i
>eei j
(eej k!
req_get_beneficiario	eel Ä
,
eeÄ Å
str_operacion
eeÇ è
,
eeè ê

MethodBase
eeë õ
.
eeõ ú
GetCurrentMethod
eeú ¨
(
ee¨ ≠
)
ee≠ Æ
!
eeÆ Ø
.
eeØ ∞
Name
ee∞ ¥
,
ee¥ µ
	str_clase
ee∂ ø
)
ee¿ ¡
;
ee¡ ¬
	respuestaff 
.ff 
str_id_transaccionff (
=ff) * 
req_get_beneficiarioff+ ?
.ff? @
str_id_transaccionff@ R
;ffR S
tryhh 
{ii 
varll 
res_tranll 
=ll 
newll "
BeneficiariosDatll# 3
(ll3 4
_settingsApill5 A
)llB C
.llC D#
get_datos_beneficiariosllD [
(ll[ \ 
req_get_beneficiarioll] q
)llr s
;lls t
	respuestamm 
.mm &
str_res_estado_transaccionmm 4
=mm5 6
res_tranmm7 ?
.mm? @
codigomm@ F
.mmF G
EqualsmmG M
(mmM N
$strmmO T
)mmU V
?mmW X
$strmmY ]
:mm^ _
$strmm` e
;mme f
	respuestann 
.nn 
str_res_codigonn (
=nn) *
res_trannn+ 3
.nn3 4
codigonn4 :
;nn: ;
	respuestaoo 
.oo "
str_res_info_adicionaloo 0
=oo1 2
res_tranoo3 ;
.oo; <
diccionariooo< G
[ooG H
$strooH S
]ooS T
.ooT U
ToStringooU ]
(oo] ^
)oo^ _
;oo_ `
	respuestapp 
.pp 
lst_beneficiariospp +
=pp, -
Utilspp. 3
.pp3 4
Utilspp4 9
.pp9 :+
ConvertConjuntoDatosToListClasspp: Y
<ppY Z
ResGetBeneficiarioppZ l
.ppl m
Beneficiarioppm y
>ppy z
(ppz {
(pp| }
ConjuntoDatos	pp} ä
)
ppä ã
res_tran
ppå î
.
ppî ï
cuerpo
ppï õ
)
ppú ù
;
ppù û
}qq 
catchrr 
(rr 
	Exceptionrr 
	exceptionrr %
)rr% &
{ss 
Utilstt 
.tt 
ServiceLogstt !
.tt! "
SaveExceptionLogstt" 3
(tt3 4
	respuestatt5 >
,tt> ?
str_operaciontt@ M
,ttM N

MethodBasettO Y
.ttY Z
GetCurrentMethodttZ j
(ttj k
)ttk l
!ttl m
.ttm n
Namettn r
,ttr s
	str_clasettt }
,tt} ~
	exception	tt à
)
ttâ ä
;
ttä ã
throwuu 
;uu 
}vv 
Utilsxx 
.xx 
ServiceLogsxx 
.xx 
SaveResponseLogsxx .
(xx. /
	respuestaxx0 9
,xx9 :
str_operacionxx; H
,xxH I

MethodBasexxJ T
.xxT U
GetCurrentMethodxxU e
(xxe f
)xxf g
!xxg h
.xxh i
Namexxi m
,xxm n
	str_clasexxo x
)xxy z
;xxz {
returnyy 
	respuestayy 
;yy 
}zz 	
public}} !
ResValidaBeneficiario}} $*
validar_registro_beneficiarios}}% C
(}}D E!
ReqValidaBeneficiario}}F [!
validar_beneficiarios}}\ q
,}}q r
string}}s y
str_operacion	}}z á
)
}}à â
{~~ 	
var
ÄÄ 
	respuesta
ÄÄ 
=
ÄÄ 
new
ÄÄ #
ResValidaBeneficiario
ÄÄ  5
(
ÄÄ5 6
)
ÄÄ6 7
;
ÄÄ7 8
	respuesta
ÅÅ 
.
ÅÅ 
LlenarResHeader
ÅÅ %
(
ÅÅ% &#
validar_beneficiarios
ÅÅ' <
)
ÅÅ= >
;
ÅÅ> ?#
validar_beneficiarios
ÇÇ !
.
ÇÇ! " 
str_id_transaccion
ÇÇ" 4
=
ÇÇ5 6
Utils
ÇÇ7 <
.
ÇÇ< =
ServiceLogs
ÇÇ= H
.
ÇÇH I
SaveHeaderLogs
ÇÇI W
<
ÇÇW X#
ReqValidaBeneficiario
ÇÇX m
>
ÇÇm n
(
ÇÇn o$
validar_beneficiariosÇÇp Ö
,ÇÇÖ Ü
str_operacionÇÇá î
,ÇÇî ï

MethodBaseÇÇñ †
.ÇÇ† ° 
GetCurrentMethodÇÇ° ±
(ÇÇ± ≤
)ÇÇ≤ ≥
!ÇÇ≥ ¥
.ÇÇ¥ µ
NameÇÇµ π
,ÇÇπ ∫
	str_claseÇÇª ƒ
)ÇÇ≈ ∆
;ÇÇ∆ «
	respuesta
ÉÉ 
.
ÉÉ  
str_id_transaccion
ÉÉ (
=
ÉÉ) *#
validar_beneficiarios
ÉÉ+ @
.
ÉÉ@ A 
str_id_transaccion
ÉÉA S
;
ÉÉS T
try
ÖÖ 
{
ÜÜ 
var
áá 
res_tran
áá 
=
áá 
new
áá "
BeneficiariosDat
áá# 3
(
áá3 4
_settingsApi
áá5 A
)
ááB C
.
ááC D,
validar_registro_beneficiarios
ááD b
(
ááb c#
validar_beneficiarios
áád y
)
ááz {
;
áá{ |
	respuesta
àà 
.
àà (
str_res_estado_transaccion
àà 4
=
àà5 6
res_tran
àà7 ?
.
àà? @
codigo
àà@ F
.
ààF G
Equals
ààG M
(
ààM N
$str
ààO T
)
ààU V
?
ààW X
$str
ààY ]
:
àà^ _
$str
àà` e
;
ààe f
	respuesta
ãã 
.
ãã 
bl_requiere_otp
ãã )
=
ãã* +
Utils
ãã, 1
.
ãã1 2
Utils
ãã2 7
.
ãã7 8
ValidaRequiereOtp
ãã8 I
(
ããI J
_settingsApi
ããK W
,
ããW X#
validar_beneficiarios
ããY n
,
ããn o
str_operacion
ããp }
)
ãã~ 
.ãã Ä
ResultããÄ Ü
.ããÜ á
codigoããá ç
.ããç é
Equalsããé î
(ããî ï
$strããñ ú
)ããù û
;ããû ü
	respuesta
åå 
.
åå 
str_res_codigo
åå (
=
åå) *
res_tran
åå+ 3
.
åå3 4
codigo
åå4 :
;
åå: ;
	respuesta
çç 
.
çç $
str_res_info_adicional
çç 0
=
çç1 2
res_tran
çç3 ;
.
çç; <
diccionario
çç< G
[
ççG H
$str
ççH S
]
ççS T
.
ççT U
ToString
ççU ]
(
çç] ^
)
çç^ _
;
çç_ `
}
èè 
catch
êê 
(
êê 
	Exception
êê 
	exception
êê %
)
êê% &
{
ëë 
Utils
íí 
.
íí 
ServiceLogs
íí !
.
íí! "
SaveExceptionLogs
íí" 3
(
íí3 4
	respuesta
íí5 >
,
íí> ?
str_operacion
íí@ M
,
ííM N

MethodBase
ííO Y
.
ííY Z
GetCurrentMethod
ííZ j
(
ííj k
)
íík l
!
ííl m
.
íím n
Name
íín r
,
íír s
	str_clase
íít }
,
íí} ~
	exceptioníí à
)ííâ ä
;ííä ã
throw
ìì 
;
ìì 
}
îî 
Utils
ññ 
.
ññ 
ServiceLogs
ññ 
.
ññ 
SaveResponseLogs
ññ .
(
ññ. /
	respuesta
ññ0 9
,
ññ9 :
str_operacion
ññ; H
,
ññH I

MethodBase
ññJ T
.
ññT U
GetCurrentMethod
ññU e
(
ññe f
)
ññf g
!
ññg h
.
ññh i
Name
ññi m
,
ññm n
	str_clase
ñño x
)
ññy z
;
ññz {
return
óó 
	respuesta
óó 
;
óó 
}
òò 	
public
õõ $
ResCuentasBeneficiario
õõ %&
get_cuentas_beneficiario
õõ& >
(
õõ? @$
ReqCuentasBeneficiario
õõA W&
req_cuentas_beneficiario
õõX p
,
õõp q
string
õõr x
str_operacionõõy Ü
)õõá à
{
úú 	
var
ùù 
	respuesta
ùù 
=
ùù 
new
ùù $
ResCuentasBeneficiario
ùù  6
(
ùù6 7
)
ùù7 8
;
ùù8 9
	respuesta
ûû 
.
ûû 
LlenarResHeader
ûû %
(
ûû% &&
req_cuentas_beneficiario
ûû' ?
)
ûû@ A
;
ûûA B&
req_cuentas_beneficiario
üü $
.
üü$ % 
str_id_transaccion
üü% 7
=
üü8 9
Utils
üü: ?
.
üü? @
ServiceLogs
üü@ K
.
üüK L
SaveHeaderLogs
üüL Z
<
üüZ [$
ReqCuentasBeneficiario
üü[ q
>
üüq r
(
üür s'
req_cuentas_beneficiarioüüt å
,üüå ç
str_operacionüüé õ
,üüõ ú

MethodBaseüüù ß
.üüß ® 
GetCurrentMethodüü® ∏
(üü∏ π
)üüπ ∫
!üü∫ ª
.üüª º
Nameüüº ¿
,üü¿ ¡
	str_claseüü¬ À
)üüÃ Õ
;üüÕ Œ
	respuesta
†† 
.
††  
str_id_transaccion
†† (
=
††) *&
req_cuentas_beneficiario
††+ C
.
††C D 
str_id_transaccion
††D V
;
††V W
try
¢¢ 
{
££ "
RespuestaTransaccion
•• $
res_tran
••% -
=
••. /
new
••0 3
BeneficiariosDat
••4 D
(
••D E
_settingsApi
••F R
)
••S T
.
••T U#
get_ctas_beneficiario
••U j
(
••j k'
req_cuentas_beneficiario••l Ñ
)••Ö Ü
;••Ü á
	respuesta
¶¶ 
.
¶¶ (
str_res_estado_transaccion
¶¶ 4
=
¶¶5 6
res_tran
¶¶7 ?
.
¶¶? @
codigo
¶¶@ F
.
¶¶F G
Equals
¶¶G M
(
¶¶M N
$str
¶¶O T
)
¶¶U V
?
¶¶W X
$str
¶¶Y ]
:
¶¶^ _
$str
¶¶` e
;
¶¶e f
	respuesta
ßß 
.
ßß 
str_res_codigo
ßß (
=
ßß) *
res_tran
ßß+ 3
.
ßß3 4
codigo
ßß4 :
;
ßß: ;
	respuesta
®® 
.
®® &
lst_cuentas_beneficiario
®® 2
=
®®3 4
Utils
®®5 :
.
®®: ;
Utils
®®; @
.
®®@ A-
ConvertConjuntoDatosToListClass
®®A `
<
®®` a$
ResCuentasBeneficiario
®®a w
.
®®w x"
CuentasBeneficiario®®x ã
>®®ã å
(®®å ç
(®®é è
ConjuntoDatos®®è ú
)®®ú ù
res_tran®®û ¶
.®®¶ ß
cuerpo®®ß ≠
)®®Æ Ø
;®®Ø ∞
	respuesta
©© 
.
©© $
str_res_info_adicional
©© 0
=
©©1 2
res_tran
©©3 ;
.
©©; <
diccionario
©©< G
[
©©G H
$str
©©H S
]
©©S T
.
©©T U
ToString
©©U ]
(
©©] ^
)
©©^ _
;
©©_ `
}
´´ 
catch
¨¨ 
(
¨¨ 
	Exception
¨¨ 
	exception
¨¨ %
)
¨¨% &
{
≠≠ 
Utils
ÆÆ 
.
ÆÆ 
ServiceLogs
ÆÆ !
.
ÆÆ! "
SaveExceptionLogs
ÆÆ" 3
(
ÆÆ3 4
	respuesta
ÆÆ5 >
,
ÆÆ> ?
str_operacion
ÆÆ@ M
,
ÆÆM N

MethodBase
ÆÆO Y
.
ÆÆY Z
GetCurrentMethod
ÆÆZ j
(
ÆÆj k
)
ÆÆk l
!
ÆÆl m
.
ÆÆm n
Name
ÆÆn r
,
ÆÆr s
	str_clase
ÆÆt }
,
ÆÆ} ~
	exceptionÆÆ à
)ÆÆâ ä
;ÆÆä ã
throw
ØØ 
;
ØØ 
}
∞∞ 
Utils
≤≤ 
.
≤≤ 
ServiceLogs
≤≤ 
.
≤≤ 
SaveResponseLogs
≤≤ .
(
≤≤. /
	respuesta
≤≤0 9
,
≤≤9 :
str_operacion
≤≤; H
,
≤≤H I

MethodBase
≤≤J T
.
≤≤T U
GetCurrentMethod
≤≤U e
(
≤≤e f
)
≤≤f g
!
≤≤g h
.
≤≤h i
Name
≤≤i m
,
≤≤m n
	str_clase
≤≤o x
)
≤≤y z
;
≤≤z {
return
≥≥ 
	respuesta
≥≥ 
;
≥≥ 
}
¥¥ 	
}
∂∂ 
}∑∑ Üê
cC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\TransferenciasNeg.cs
	namespace 	
wsTransferencias
 
. 
Neg 
{		 
public

 

class

 
TransferenciasNeg

 "
{ 
private 
readonly 
SettingsApi $
_settingsApi% 1
;1 2
private 
readonly 
string 
	str_clase  )
;) *
public 
TransferenciasNeg  
(! "
SettingsApi# .
settingsApi/ :
); <
{ 	
_settingsApi 
= 
settingsApi &
;& '
this 
. 
	str_clase 
= 
GetType $
($ %
)% &
.& '
FullName' /
!/ 0
;0 1
ServiceLogs 
. 
Init 
( 
_settingsApi *
)+ ,
;, -
} 	
public 
ResTransferencia )
get_val_transf_interbancarias  =
(> ?&
ReqValidacionTransferencia@ Z%
req_validar_transferencia[ t
,t u
stringv |
str_operacion	} ä
)
ã å
{ 	
var 
	respuesta 
= 
new 
ResTransferencia  0
(0 1
)1 2
;2 3
	respuesta 
. 
LlenarResHeader %
(% &%
req_validar_transferencia' @
)A B
;B C%
req_validar_transferencia %
.% &
str_id_transaccion& 8
=9 :
Utils; @
.@ A
ServiceLogsA L
.L M
SaveHeaderLogsM [
<[ \&
ReqValidacionTransferencia\ v
>v w
(w x&
req_validar_transferencia	y í
,
í ì
str_operacion
î °
,
° ¢

MethodBase
£ ≠
.
≠ Æ
GetCurrentMethod
Æ æ
(
æ ø
)
ø ¿
!
¿ ¡
.
¡ ¬
Name
¬ ∆
,
∆ «
	str_clase
» —
)
“ ”
;
” ‘
	respuesta 
. 
str_id_transaccion (
=) *%
req_validar_transferencia+ D
.D E
str_id_transaccionE W
;W X
try!! 
{"" 
var## 
res_tran## 
=## 
new## "
TransferenciasDat### 4
(##4 5
_settingsApi##6 B
)##C D
.##D E)
get_val_transf_interbancarias##E b
(##b c%
req_validar_transferencia##d }
)##~ 
;	## Ä
if%% 
(%% 
res_tran%% 
.%% 
codigo%% "
.%%" #
Equals%%# )
(%%) *
$str%%+ 0
)%%1 2
)%%2 3
{&& 
	respuesta'' 
='' 
Utils''  %
.''% &
Utils''& +
.''+ ,'
ConvertConjuntoDatosToClass'', G
<''G H
ResTransferencia''H X
>''X Y
(''Y Z
(''[ \
ConjuntoDatos''\ i
)''i j
res_tran''k s
.''s t
cuerpo''t z
)''{ |
;''| }
if)) 
()) 
	respuesta))  
!))  !
.))! "
int_enviar_banred))" 3
==))4 6
$num))7 8
)))8 9
{** 
string++ )
str_req_validar_transferencia++ <
=++= >
JsonSerializer++? M
.++M N
	Serialize++N W
(++W X%
req_validar_transferencia++Y r
)++s t
;++t u
var,, 
obj_transferencia,, -
=,,. /
JsonSerializer,,0 >
.,,> ?
Deserialize,,? J
<,,J K
ReqTransferencia,,K [
>,,[ \
(,,\ ])
str_req_validar_transferencia,,^ {
),,| }
;,,} ~
Cabecera..  
cabecera..! )
=..* +
llenar_cabecera.., ;
(..; <
obj_transferencia..= N
!..N O
)..P Q
;..Q R 
RespuestaTransaccion// ,/
#respuesta_validaciones_pago_directo//- P
=//Q R%
validaciones_pago_directo//S l
(//l m
	respuesta//n w
,//w x
cabecera	//y Å
)
//Ç É
;
//É Ñ
if11 
(11 /
#respuesta_validaciones_pago_directo11 >
.11> ?
codigo11? E
==11F H
$str11I O
||11P R/
#respuesta_validaciones_pago_directo11S v
.11v w
codigo11w }
==	11~ Ä
$str
11Å Ü
)
11Ü á
{22 
return33 "
	respuesta33# ,
;33, -
}44 
else55 
{66  
RespuestaTransaccion88 0*
respuesta_cambio_tipo_transfer881 O
=88P Q
new88R U
TransferenciasDat88V g
(88g h
_settingsApi88i u
)88v w
.88w x%
set_envio_transf_por_spi	88x ê
(
88ê ë
obj_transferencia
88í £
!
88£ §
)
88• ¶
;
88¶ ß
if:: 
(:: *
respuesta_cambio_tipo_transfer:: =
.::= >
codigo::> D
==::E G
$str::H M
)::M N
{;; 
	respuesta<<  )
.<<) *
int_enviar_banred<<* ;
=<<< =
$num<<> ?
;<<? @
}== 
if?? 
(?? /
#respuesta_validaciones_pago_directo?? B
.??B C
codigo??C I
==??J L
_settingsApi??M Y
.??Y Z1
%codigo_error_datos_incorrectos_banred??Z 
)	?? Ä
{@@ 
ResTransferenciaBB  0&
respuesta_error_validacionBB1 K
=BBL M
newBBN Q
ResTransferenciaBBR b
(BBb c
)BBc d
;BBd e&
respuesta_error_validacionCC  :
.CC: ;
str_res_codigoCC; I
=CCJ K
_settingsApiCCL X
.CCX Y4
'codigo_error_datos_incorrectos_coopmego	CCY Ä
;
CCÄ Å&
respuesta_error_validacionDD  :
.DD: ;"
str_res_info_adicionalDD; Q
=DDR S
_settingsApiDDT `
.DD` a 
msj_error_validacionDDa u
;DDu v
UtilsFF  %
.FF% &
ServiceLogsFF& 1
.FF1 2
SaveResponseLogsFF2 B
(FFB C&
respuesta_error_validacionFFD ^
,FF^ _
str_operacionFF` m
,FFm n

MethodBaseFFo y
.FFy z
GetCurrentMethod	FFz ä
(
FFä ã
)
FFã å
!
FFå ç
.
FFç é
Name
FFé í
,
FFí ì
	str_clase
FFî ù
)
FFû ü
;
FFü †
returnGG  &&
respuesta_error_validacionGG' A
;GGA B
}HH 
}II 
}JJ 
}KK 
	respuestaMM 
.MM &
str_res_estado_transaccionMM 4
=MM5 6
res_tranMM7 ?
.MM? @
codigoMM@ F
.MMF G
EqualsMMG M
(MMM N
$strMMO T
)MMU V
?MMW X
$strMMY ]
:MM^ _
$strMM` e
;MMe f
	respuestaNN 
.NN 
str_res_codigoNN (
=NN) *
res_tranNN+ 3
.NN3 4
codigoNN4 :
;NN: ;
	respuestaOO 
.OO "
str_res_info_adicionalOO 0
=OO1 2
res_tranOO3 ;
.OO; <
diccionarioOO< G
[OOG H
$strOOH S
]OOS T
.OOT U
ToStringOOU ]
(OO] ^
)OO^ _
;OO_ `
}QQ 
catchRR 
(RR 
	ExceptionRR 
	exceptionRR %
)RR% &
{SS 
UtilsTT 
.TT 
ServiceLogsTT !
.TT! "
SaveExceptionLogsTT" 3
(TT3 4
	respuestaTT5 >
!TT> ?
,TT? @
str_operacionTTA N
,TTN O

MethodBaseTTP Z
.TTZ [
GetCurrentMethodTT[ k
(TTk l
)TTl m
!TTm n
.TTn o
NameTTo s
,TTs t
	str_claseTTu ~
,TT~ 
	exception
TTÄ â
)
TTä ã
;
TTã å
throwUU 
;UU 
}VV 
UtilsWW 
.WW 
ServiceLogsWW 
.WW 
SaveResponseLogsWW .
(WW. /
	respuestaWW0 9
,WW9 :
str_operacionWW; H
,WWH I

MethodBaseWWJ T
.WWT U
GetCurrentMethodWWU e
(WWe f
)WWf g
!WWg h
.WWh i
NameWWi m
,WWm n
	str_claseWWo x
)WWy z
;WWz {
returnXX 
	respuestaXX 
;XX 
}YY 	
public\\ 
ResTransferencia\\ %
add_transf_interbancarias\\  9
(\\: ;
ReqTransferencia\\< L
req_transferencia\\M ^
,\\^ _
string\\` f
str_operacion\\g t
)\\u v
{]] 	
ResTransferencia^^ 
	respuesta^^ &
=^^' (
new^^) ,
ResTransferencia^^- =
(^^= >
)^^> ?
;^^? @
try__ 
{`` 
	respuestaaa 
=aa 
newaa 
ResTransferenciaaa  0
(aa0 1
)aa1 2
;aa2 3
	respuestabb 
.bb 
LlenarResHeaderbb )
(bb) *
req_transferenciabb+ <
)bb= >
;bb> ?
req_transferenciacc !
.cc! "
str_id_transaccioncc" 4
=cc5 6
Utilscc7 <
.cc< =
ServiceLogscc= H
.ccH I
SaveHeaderLogsccI W
<ccW X
ReqTransferenciaccX h
>cch i
(cci j
req_transferenciacck |
,cc| }
str_operacion	cc~ ã
,
ccã å

MethodBase
ccç ó
.
ccó ò
GetCurrentMethod
ccò ®
(
cc® ©
)
cc© ™
!
cc™ ´
.
cc´ ¨
Name
cc¨ ∞
,
cc∞ ±
	str_clase
cc≤ ª
)
ccº Ω
;
ccΩ æ
	respuestadd 
.dd 
str_id_transacciondd ,
=dd- .
req_transferenciadd/ @
.dd@ A
str_id_transaccionddA S
;ddS T
vargg 
res_trangg 
=gg 
newgg "
TransferenciasDatgg# 4
(gg4 5
_settingsApigg6 B
)ggC D
.ggD E%
add_transf_interbancariasggE ^
(gg^ _
req_transferenciagg` q
)ggr s
;ggs t
ifii 
(ii 
res_tranii 
.ii 
codigoii "
.ii" #
Equalsii# )
(ii) *
$strii+ 0
)ii1 2
)ii2 3
{jj 
ConjuntoDatoskk !
ds_datos_respuestakk" 4
=kk5 6
(kk7 8
ConjuntoDatoskk8 E
)kkE F
res_trankkG O
.kkO P
cuerpokkP V
;kkV W
ResTransferenciall $
datos_validadosll% 4
=ll5 6
newll7 :
ResTransferenciall; K
(llK L
)llL M
;llM N
ResTransferenciamm $
datos_debitomm% 1
=mm2 3
newmm4 7
ResTransferenciamm8 H
(mmH I
)mmI J
;mmJ K
foreachnn 
(nn 
varnn 
itemnn  $
innn% '
ds_datos_respuestann( :
.nn: ;

lst_tablasnn; E
[nnE F
$numnnF G
]nnG H
.nnH I
	lst_filasnnI R
)nnR S
{oo 
datos_validadospp '
=pp( )
(pp* +
ResTransferenciapp+ ;
)pp; <

Convertingpp= G
.ppG H
MapDictToObjppH T
(ppT U
itemppV Z
.ppZ [
nombre_valorpp[ g
,ppg h
typeofppi o
(ppo p
ResTransferencia	ppq Å
)
ppÇ É
)
ppÑ Ö
;
ppÖ Ü
}rr 
foreachss 
(ss 
varss 
itemss  $
inss% '
ds_datos_respuestass( :
.ss: ;

lst_tablasss; E
[ssE F
$numssF G
]ssG H
.ssH I
	lst_filasssI R
)ssR S
{tt 
datos_debitouu $
=uu% &
(uu' (
ResTransferenciauu( 8
)uu8 9

Convertinguu: D
.uuD E
MapDictToObjuuE Q
(uuQ R
itemuuS W
.uuW X
nombre_valoruuX d
,uud e
typeofuuf l
(uul m
ResTransferenciauun ~
)	uu Ä
)
uuÅ Ç
;
uuÇ É
}vv 
datos_validadosxx #
.xx# $
int_num_referenciaxx$ 6
=xx7 8
datos_debitoxx9 E
.xxE F
int_num_referenciaxxF X
;xxX Y
datos_validadosyy #
.yy# $
int_id_debitoyy$ 1
=yy2 3
datos_debitoyy4 @
.yy@ A
int_id_debitoyyA N
;yyN O
datos_validadoszz #
.zz# $
int_id_comisionzz$ 3
=zz4 5
datos_debitozz6 B
.zzB C
int_id_comisionzzC R
;zzR S
datos_validados{{ #
.{{# $ 
int_id_otra_comision{{$ 8
={{9 :
datos_debito{{; G
.{{G H 
int_id_otra_comision{{H \
;{{\ ]
datos_validados|| #
.||# $

int_estado||$ .
=||/ 0
datos_debito||1 =
.||= >

int_estado||> H
;||H I
datos_validados}} #
.}}# $
str_fecha_transac}}$ 5
=}}6 7
datos_debito}}8 D
.}}D E
str_fecha_transac}}E V
;}}V W
	respuesta 
= 
datos_validados  /
;/ 0
if
ÇÇ 
(
ÇÇ 
datos_validados
ÇÇ &
.
ÇÇ& '
int_enviar_banred
ÇÇ' 8
==
ÇÇ9 ;
$num
ÇÇ< =
&&
ÇÇ> @
datos_validados
ÇÇA P
.
ÇÇP Q

int_estado
ÇÇQ [
==
ÇÇ\ ^
$num
ÇÇ_ `
)
ÇÇ` a
{
ÉÉ 
Cabecera
ÜÜ  
cabecera
ÜÜ! )
=
ÜÜ* +
llenar_cabecera
ÜÜ, ;
(
ÜÜ; <
req_transferencia
ÜÜ= N
)
ÜÜO P
;
ÜÜP Q#
ejecutar_pago_directo
àà -
(
àà- .
datos_validados
àà/ >
,
àà> ?
cabecera
àà@ H
)
ààI J
;
ààJ K
	respuesta
ââ !
=
ââ" #
datos_validados
ââ$ 3
;
ââ3 4
}
ää 
else
ãã 
{
åå 
	respuesta
çç !
.
çç! "(
str_res_estado_transaccion
çç" <
=
çç= >
res_tran
çç? G
.
ççG H
codigo
ççH N
.
ççN O
Equals
ççO U
(
ççU V
$str
ççW \
)
çç] ^
?
çç_ `
$str
çça e
:
ççf g
$str
ççh m
;
ççm n
	respuesta
éé !
.
éé! "
str_res_codigo
éé" 0
=
éé1 2
res_tran
éé3 ;
.
éé; <
codigo
éé< B
;
ééB C
	respuesta
èè !
.
èè! "$
str_res_info_adicional
èè" 8
=
èè9 :
res_tran
èè; C
.
èèC D
diccionario
èèD O
[
èèO P
$str
èèP [
]
èè[ \
.
èè\ ]
ToString
èè] e
(
èèe f
)
èèf g
;
èèg h
return
êê 
	respuesta
êê (
;
êê( )
}
ëë 
}
íí 
	respuesta
ìì 
.
ìì (
str_res_estado_transaccion
ìì 4
=
ìì5 6
res_tran
ìì7 ?
.
ìì? @
codigo
ìì@ F
.
ììF G
Equals
ììG M
(
ììM N
$str
ììO T
)
ììU V
?
ììW X
$str
ììY ]
:
ìì^ _
$str
ìì` e
;
ììe f
	respuesta
îî 
.
îî 
str_res_codigo
îî (
=
îî) *
res_tran
îî+ 3
.
îî3 4
codigo
îî4 :
;
îî: ;
	respuesta
ïï 
.
ïï $
str_res_info_adicional
ïï 0
=
ïï1 2
res_tran
ïï3 ;
.
ïï; <
diccionario
ïï< G
[
ïïG H
$str
ïïH S
]
ïïS T
.
ïïT U
ToString
ïïU ]
(
ïï] ^
)
ïï^ _
;
ïï_ `
}
óó 
catch
òò 
(
òò 
	Exception
òò 
ex
òò 
)
òò 
{
ôô 
throw
öö 
new
öö #
ArgumentNullException
öö /
(
öö/ 0
ex
öö1 3
.
öö3 4
ToString
öö4 <
(
öö< =
)
öö= >
)
öö? @
;
öö@ A
}
õõ 
return
úú 
	respuesta
úú 
;
úú 
}
ùù 	
public
°° "
ResGetTransferencias
°° #)
get_consulta_transferencias
°°$ ?
(
°°@ A"
ReqGetTransferencias
°°B V#
req_get_tranferencias
°°W l
,
°°l m
string
°°n t
str_operacion°°u Ç
)°°É Ñ
{
¢¢ 	
var
££ 
	respuesta
££ 
=
££ 
new
££ "
ResGetTransferencias
££  4
(
££4 5
)
££5 6
;
££6 7
	respuesta
§§ 
.
§§ 
LlenarResHeader
§§ %
(
§§% &#
req_get_tranferencias
§§' <
)
§§= >
;
§§> ?#
req_get_tranferencias
•• !
.
••! " 
str_id_transaccion
••" 4
=
••5 6
ServiceLogs
••7 B
.
••B C
SaveHeaderLogs
••C Q
<
••Q R"
ReqGetTransferencias
••R f
>
••f g
(
••g h#
req_get_tranferencias
••i ~
,
••~ 
str_operacion••Ä ç
,••ç é

MethodBase••è ô
.••ô ö 
GetCurrentMethod••ö ™
(••™ ´
)••´ ¨
!••¨ ≠
.••≠ Æ
Name••Æ ≤
,••≤ ≥
	str_clase••¥ Ω
)••æ ø
;••ø ¿
	respuesta
¶¶ 
.
¶¶  
str_id_transaccion
¶¶ (
=
¶¶) *#
req_get_tranferencias
¶¶+ @
.
¶¶@ A 
str_id_transaccion
¶¶A S
;
¶¶S T
try
®® 
{
©© "
RespuestaTransaccion
™™ $
res_tran
™™% -
=
™™. /
new
™™0 3
TransferenciasDat
™™4 E
(
™™E F
_settingsApi
™™G S
)
™™T U
.
™™U V)
get_consulta_transferencias
™™V q
(
™™q r$
req_get_tranferencias™™s à
)™™â ä
;™™ä ã
	respuesta
¨¨ 
.
¨¨ 
lst_tranferencias
¨¨ +
=
¨¨, -
Utils
¨¨. 3
.
¨¨3 4
Utils
¨¨4 9
.
¨¨9 :-
ConvertConjuntoDatosToListClass
¨¨: Y
<
¨¨Y Z
Transferencias
¨¨Z h
>
¨¨h i
(
¨¨i j
(
¨¨k l
ConjuntoDatos
¨¨l y
)
¨¨y z
res_tran¨¨{ É
.¨¨É Ñ
cuerpo¨¨Ñ ä
)¨¨ã å
;¨¨å ç
	respuesta
ÆÆ 
.
ÆÆ (
str_res_estado_transaccion
ÆÆ 4
=
ÆÆ5 6
(
ÆÆ7 8
res_tran
ÆÆ8 @
.
ÆÆ@ A
codigo
ÆÆA G
.
ÆÆG H
Equals
ÆÆH N
(
ÆÆN O
$str
ÆÆP U
)
ÆÆV W
)
ÆÆW X
?
ÆÆY Z
$str
ÆÆ[ _
:
ÆÆ` a
$str
ÆÆb g
;
ÆÆg h
	respuesta
ØØ 
.
ØØ 
str_res_codigo
ØØ (
=
ØØ) *
res_tran
ØØ+ 3
.
ØØ3 4
codigo
ØØ4 :
;
ØØ: ;
	respuesta
∞∞ 
.
∞∞ $
str_res_info_adicional
∞∞ 0
=
∞∞1 2
res_tran
∞∞3 ;
.
∞∞; <
diccionario
∞∞< G
[
∞∞G H
$str
∞∞H S
]
∞∞S T
.
∞∞T U
ToString
∞∞U ]
(
∞∞] ^
)
∞∞^ _
;
∞∞_ `
}
±± 
catch
≤≤ 
(
≤≤ 
	Exception
≤≤ 
	exception
≤≤ %
)
≤≤% &
{
≥≥ 
ServiceLogs
¥¥ 
.
¥¥ 
SaveExceptionLogs
¥¥ -
(
¥¥- .
	respuesta
¥¥/ 8
,
¥¥8 9
str_operacion
¥¥: G
,
¥¥G H

MethodBase
¥¥I S
.
¥¥S T
GetCurrentMethod
¥¥T d
(
¥¥d e
)
¥¥e f
!
¥¥f g
.
¥¥g h
Name
¥¥h l
,
¥¥l m
	str_clase
¥¥n w
,
¥¥w x
	exception¥¥y Ç
)¥¥É Ñ
;¥¥Ñ Ö
throw
µµ 
;
µµ 
}
∂∂ 
ServiceLogs
∏∏ 
.
∏∏ 
SaveResponseLogs
∏∏ (
(
∏∏( )
	respuesta
∏∏* 3
,
∏∏3 4
str_operacion
∏∏5 B
,
∏∏B C

MethodBase
∏∏D N
.
∏∏N O
GetCurrentMethod
∏∏O _
(
∏∏_ `
)
∏∏` a
!
∏∏a b
.
∏∏b c
Name
∏∏c g
,
∏∏g h
	str_clase
∏∏i r
)
∏∏s t
;
∏∏t u
return
ππ 
	respuesta
ππ 
;
ππ 
}
∫∫ 	
public
ææ "
RespuestaTransaccion
ææ #
ProcesarSolicitud
ææ$ 5
(
ææ6 7"
SolicitudTransaccion
ææ8 L
sol_tran
ææM U
,
ææU V
string
ææW ]
str_operacion
ææ^ k
)
ææl m
{
øø 	"
RespuestaTransaccion
¿¿  
	respuesta
¿¿! *
=
¿¿+ ,
new
¿¿- 0"
RespuestaTransaccion
¿¿1 E
(
¿¿E F
)
¿¿F G
;
¿¿G H
try
¬¬ 
{
√√ 
var
ƒƒ 
req_transaccion
ƒƒ #
=
ƒƒ$ %
JsonSerializer
ƒƒ& 4
.
ƒƒ4 5
Deserialize
ƒƒ5 @
<
ƒƒ@ A
Transaccion
ƒƒA L
>
ƒƒL M
(
ƒƒM N
JsonSerializer
ƒƒO ]
.
ƒƒ] ^
	Serialize
ƒƒ^ g
(
ƒƒg h
sol_tran
ƒƒi q
.
ƒƒq r
cuerpo
ƒƒr x
)
ƒƒy z
)
ƒƒ{ |
;
ƒƒ| }
switch
≈≈ 
(
≈≈ 
req_transaccion
≈≈ &
!
≈≈& '
.
≈≈' (
str_tipo_tran
≈≈( 5
)
≈≈5 6
{
∆∆ 
case
«« 
$str
«« 
:
««  
case
»» 
$str
»» 
:
»»  
case
…… 
$str
…… 
:
……  
	respuesta
ÀÀ !
=
ÀÀ" #
pagar
ÀÀ$ )
(
ÀÀ) *
sol_tran
ÀÀ+ 3
)
ÀÀ4 5
;
ÀÀ5 6
break
ÃÃ 
;
ÃÃ 
default
ÕÕ 
:
ÕÕ 
	respuesta
ŒŒ !
=
ŒŒ" #
validar
ŒŒ$ +
(
ŒŒ+ ,
sol_tran
ŒŒ- 5
)
ŒŒ6 7
;
ŒŒ7 8
break
œœ 
;
œœ 
}
–– 
}
—— 
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
”” 
throw
‘‘ 
new
‘‘ #
ArgumentNullException
‘‘ /
(
‘‘/ 0
ex
‘‘1 3
.
‘‘3 4
ToString
‘‘4 <
(
‘‘< =
)
‘‘= >
)
‘‘? @
;
‘‘@ A
}
’’ 
return
÷÷ 
	respuesta
÷÷ 
;
÷÷ 
}
◊◊ 	
public
ﬂﬂ "
RespuestaTransaccion
ﬂﬂ #
validar
ﬂﬂ$ +
(
ﬂﬂ, -"
SolicitudTransaccion
ﬂﬂ. B
sol_tran
ﬂﬂC K
)
ﬂﬂL M
{
‡‡ 	"
RespuestaTransaccion
··  
	respuesta
··! *
=
··+ ,
new
··- 0"
RespuestaTransaccion
··1 E
(
··E F
)
··F G
;
··G H
try
‚‚ 
{
„„ 
	respuesta
‰‰ 
=
‰‰ 
conectar_banred
‰‰ +
(
‰‰+ ,
sol_tran
‰‰- 5
)
‰‰6 7
;
‰‰7 8
}
ÊÊ 
catch
ÁÁ 
(
ÁÁ 
	Exception
ÁÁ 
ex
ÁÁ 
)
ÁÁ 
{
ËË 
throw
ÈÈ 
new
ÈÈ #
ArgumentNullException
ÈÈ /
(
ÈÈ/ 0
ex
ÈÈ1 3
.
ÈÈ3 4
ToString
ÈÈ4 <
(
ÈÈ< =
)
ÈÈ= >
)
ÈÈ? @
;
ÈÈ@ A
}
ÍÍ 
return
ÎÎ 
	respuesta
ÎÎ 
;
ÎÎ 
}
ÏÏ 	
public
ÙÙ "
RespuestaTransaccion
ÙÙ #
pagar
ÙÙ$ )
(
ÙÙ* +"
SolicitudTransaccion
ÙÙ, @
sol_tran
ÙÙA I
)
ÙÙJ K
{
ıı 	"
RespuestaTransaccion
ˆˆ  
	respuesta
ˆˆ! *
=
ˆˆ+ ,
new
ˆˆ- 0"
RespuestaTransaccion
ˆˆ1 E
(
ˆˆE F
)
ˆˆF G
;
ˆˆG H
try
˜˜ 
{
¯¯ 
var
˘˘ 
req_transaccion
˘˘ #
=
˘˘$ %
JsonSerializer
˘˘& 4
.
˘˘4 5
Deserialize
˘˘5 @
<
˘˘@ A
Transaccion
˘˘A L
>
˘˘L M
(
˘˘M N
JsonSerializer
˘˘O ]
.
˘˘] ^
	Serialize
˘˘^ g
(
˘˘g h
sol_tran
˘˘i q
.
˘˘q r
cuerpo
˘˘r x
)
˘˘y z
)
˘˘{ |
;
˘˘| }
	respuesta
¸¸ 
=
¸¸ 
conectar_banred
¸¸ +
(
¸¸+ ,
sol_tran
¸¸- 5
)
¸¸6 7
;
¸¸7 8
}
˛˛ 
catch
ˇˇ 
(
ˇˇ 
	Exception
ˇˇ 
ex
ˇˇ 
)
ˇˇ 
{
ÄÄ 
throw
ÅÅ 
new
ÅÅ #
ArgumentNullException
ÅÅ /
(
ÅÅ/ 0
ex
ÅÅ1 3
.
ÅÅ3 4
ToString
ÅÅ4 <
(
ÅÅ< =
)
ÅÅ= >
)
ÅÅ? @
;
ÅÅ@ A
}
ÇÇ 
return
ÉÉ 
	respuesta
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
áá "
RespuestaTransaccion
áá #'
validaciones_pago_directo
áá$ =
(
áá> ?
ResTransferencia
áá@ P
datos_validados
ááQ `
,
áá` a
Cabecera
ááb j
cabecera
áák s
)
áát u
{
àà 	"
RespuestaTransaccion
ââ  
	respuesta
ââ! *
=
ââ+ ,
new
ââ- 0"
RespuestaTransaccion
ââ1 E
(
ââE F
)
ââF G
;
ââG H
try
ää 
{
ãã 
	respuesta
çç 
.
çç 
cuerpo
çç  
=
çç! "
datos_validados
çç# 2
;
çç2 3
Transaccion
èè *
datos_para_validacion_banred
èè 8
=
èè9 :
new
èè; >
Transaccion
èè? J
(
èèJ K
)
èèK L
;
èèL M*
datos_para_validacion_banred
ìì ,
.
ìì, -
int_secuencial
ìì- ;
=
ìì< =
datos_validados
ìì> M
.
ììM N
int_secuencial
ììN \
;
ìì\ ]*
datos_para_validacion_banred
ïï ,
.
ïï, -

int_fi_aut
ïï- 7
=
ïï8 9
datos_validados
ïï: I
.
ïïI J

int_fi_aut
ïïJ T
;
ïïT U*
datos_para_validacion_banred
ññ ,
.
ññ, -
str_bin_aut
ññ- 8
=
ññ9 :
datos_validados
ññ; J
.
ññJ K
str_bin_aut
ññK V
;
ññV W*
datos_para_validacion_banred
òò ,
.
òò, -
str_nom_ordenante
òò- >
=
òò? @
datos_validados
òòA P
.
òòP Q"
str_nombre_ordenante
òòQ e
;
òòe f*
datos_para_validacion_banred
ôô ,
.
ôô, -"
str_cuenta_ordenante
ôô- A
=
ôôB C
datos_validados
ôôD S
.
ôôS T#
str_num_cta_ordenante
ôôT i
;
ôôi j*
datos_para_validacion_banred
öö ,
.
öö, -*
str_identificacion_ordenante
öö- I
=
ööJ K
datos_validados
ööL [
.
öö[ \#
str_num_doc_ordenante
öö\ q
;
ööq r*
datos_para_validacion_banred
úú ,
.
úú, -
str_nom_receptor
úú- =
=
úú> ?
datos_validados
úú@ O
.
úúO P
str_nombre_benef
úúP `
;
úú` a*
datos_para_validacion_banred
ùù ,
.
ùù, -!
str_cuenta_receptor
ùù- @
=
ùùA B
datos_validados
ùùC R
.
ùùR S
str_num_cta_benef
ùùS d
;
ùùd e*
datos_para_validacion_banred
ûû ,
.
ûû, -
str_cuenta_bce
ûû- ;
=
ûû< =
datos_validados
ûû> M
.
ûûM N#
str_cta_bce_ifi_benef
ûûN c
;
ûûc d*
datos_para_validacion_banred
üü ,
.
üü, -&
str_tipo_cuenta_receptor
üü- E
=
üüF G
datos_validados
üüH W
.
üüW X 
str_tipo_cta_benef
üüX j
;
üüj k*
datos_para_validacion_banred
°° ,
.
°°, - 
str_info_adicional
°°- ?
=
°°@ A
datos_validados
°°B Q
.
°°Q R 
str_info_adicional
°°R d
;
°°d e*
datos_para_validacion_banred
¢¢ ,
.
¢¢, -)
str_identificacion_receptor
¢¢- H
=
¢¢I J
datos_validados
¢¢K Z
.
¢¢Z [
str_num_doc_benef
¢¢[ l
;
¢¢l m*
datos_para_validacion_banred
££ ,
.
££, -"
int_secuencial_cobis
££- A
=
££B C
datos_validados
££D S
.
££S T
int_id_debito
££T a
;
££a b*
datos_para_validacion_banred
§§ ,
.
§§, -
dec_monto_tran
§§- ;
=
§§< =
datos_validados
§§> M
.
§§M N
dec_monto_tran
§§N \
;
§§\ ]*
datos_para_validacion_banred
•• ,
.
••, -
str_observaciones
••- >
=
••? @
datos_validados
••A P
.
••P Q
str_observaciones
••Q b
;
••b c
switch
®® 
(
®® 
datos_validados
®® &
.
®®& ' 
str_tipo_cta_benef
®®' 9
)
®®9 :
{
©© 
case
™™ 
$str
™™ 
:
™™ *
datos_para_validacion_banred
´´ 4
.
´´4 5&
str_tipo_cuenta_receptor
´´5 M
=
´´N O
$str
´´P T
;
´´T U*
datos_para_validacion_banred
¨¨ 4
.
¨¨4 5
str_tipo_tran
¨¨5 B
=
¨¨C D
$str
¨¨E L
;
¨¨L M
break
≠≠ 
;
≠≠ 
case
ÆÆ 
$str
ÆÆ 
:
ÆÆ *
datos_para_validacion_banred
ØØ 4
.
ØØ4 5&
str_tipo_cuenta_receptor
ØØ5 M
=
ØØN O
$str
ØØP T
;
ØØT U*
datos_para_validacion_banred
∞∞ 4
.
∞∞4 5
str_tipo_tran
∞∞5 B
=
∞∞C D
$str
∞∞E L
;
∞∞L M
break
±± 
;
±± 
case
≤≤ 
$str
≤≤ 
:
≤≤ *
datos_para_validacion_banred
≥≥ 4
.
≥≥4 5&
str_tipo_cuenta_receptor
≥≥5 M
=
≥≥N O
$str
≥≥P T
;
≥≥T U*
datos_para_validacion_banred
¥¥ 4
.
¥¥4 5
str_tipo_tran
¥¥5 B
=
¥¥C D
$str
¥¥E L
;
¥¥L M
break
µµ 
;
µµ 
}
∂∂ *
datos_para_validacion_banred
∏∏ ,
.
∏∏, -
str_nom_receptor
∏∏- =
=
∏∏> ?
$str
∏∏@ B
;
∏∏B C*
datos_para_validacion_banred
ππ ,
.
ππ, -
str_observaciones
ππ- >
=
ππ? @
$str
ππA C
;
ππC D"
SolicitudTransaccion
∫∫ $
sol_tran
∫∫% -
=
∫∫. /
new
∫∫0 3"
SolicitudTransaccion
∫∫4 H
(
∫∫H I
)
∫∫I J
;
∫∫J K
sol_tran
ªª 
.
ªª 
cuerpo
ªª 
=
ªª  !*
datos_para_validacion_banred
ªª" >
;
ªª> ?
sol_tran
ºº 
.
ºº 
cabecera
ºº !
=
ºº" #
cabecera
ºº$ ,
;
ºº, -
	respuesta
ææ 
=
ææ 
ProcesarSolicitud
ææ -
(
ææ- .
sol_tran
ææ/ 7
,
ææ7 8
$str
ææ9 ;
)
ææ< =
;
ææ= >
}
¿¿ 
catch
¡¡ 
(
¡¡ 
	Exception
¡¡ 
ex
¡¡ 
)
¡¡ 
{
¬¬ 
throw
√√ 
new
√√ #
ArgumentNullException
√√ /
(
√√/ 0
ex
√√1 3
.
√√3 4
ToString
√√4 <
(
√√< =
)
√√= >
)
√√? @
;
√√@ A
}
ƒƒ 
return
≈≈ 
	respuesta
≈≈ 
;
≈≈ 
}
∆∆ 	
public
…… "
RespuestaTransaccion
…… #
conectar_banred
……$ 3
(
……4 5"
SolicitudTransaccion
……6 J
sol_tran
……K S
)
……T U
{
   	
var
ÀÀ 
	respuesta
ÀÀ 
=
ÀÀ 
new
ÀÀ "
RespuestaTransaccion
ÀÀ  4
(
ÀÀ4 5
)
ÀÀ5 6
;
ÀÀ6 7
try
ÃÃ 
{
ÕÕ 
string
œœ 
url
œœ 
=
œœ 
_settingsApi
œœ )
.
œœ) *
servicio_banred
œœ* 9
;
œœ9 :
string
–– 
content_type
–– #
=
––$ %$
ApplicationContenTypes
––& <
.
––< =
	JSON_UTF8
––= F
;
––F G
string
““ 
str_usuario
““ "
=
““# $
_settingsApi
““% 1
.
““1 2
user_ws_banred
““2 @
;
““@ A
string
”” 
str_contrasenia
”” &
=
””' (
_settingsApi
””) 5
.
””5 6
pass_ws_banred
””6 D
;
””D E

RestClient
’’ 
rest_client
’’ &
=
’’' (
new
’’) ,

RestClient
’’- 7
(
’’7 8
url
’’9 <
,
’’< =
content_type
’’> J
,
’’J K
str_usuario
’’L W
,
’’W X
str_contrasenia
’’Y h
)
’’i j
;
’’j k
var
◊◊ 
obj
◊◊ 
=
◊◊ 
rest_client
◊◊ %
.
◊◊% &!
post_string_content
◊◊& 9
(
◊◊9 :
sol_tran
◊◊; C
)
◊◊D E
;
◊◊E F
	respuesta
ÿÿ 
=
ÿÿ 
JsonSerializer
ÿÿ *
.
ÿÿ* +
Deserialize
ÿÿ+ 6
<
ÿÿ6 7"
RespuestaTransaccion
ÿÿ7 K
>
ÿÿK L
(
ÿÿL M
obj
ÿÿN Q
.
ÿÿQ R
ToString
ÿÿR Z
(
ÿÿZ [
)
ÿÿ[ \
!
ÿÿ\ ]
)
ÿÿ^ _
;
ÿÿ_ `
}
⁄⁄ 
catch
€€ 
(
€€ 
	Exception
€€ 
ex
€€ 
)
€€ 
{
‹‹ 
throw
›› 
new
›› #
ArgumentNullException
›› /
(
››/ 0
ex
››1 3
.
››3 4
ToString
››4 <
(
››< =
)
››= >
)
››? @
;
››@ A
}
ﬁﬁ 
return
ﬂﬂ 
	respuesta
ﬂﬂ 
!
ﬂﬂ 
;
ﬂﬂ 
}
‡‡ 	
public
‚‚ 
static
‚‚ 
Cabecera
‚‚ 
llenar_cabecera
‚‚ .
(
‚‚/ 0
ReqTransferencia
‚‚1 A
obj
‚‚B E
)
‚‚F G
{
„„ 	
Cabecera
‰‰ 
cabecera
‰‰ 
=
‰‰ 
new
‰‰  #
Cabecera
‰‰$ ,
(
‰‰, -
)
‰‰- .
;
‰‰. /
cabecera
ÂÂ 
.
ÂÂ 
int_sistema
ÂÂ  
=
ÂÂ! "
Convert
ÂÂ# *
.
ÂÂ* +
ToInt32
ÂÂ+ 2
(
ÂÂ2 3
obj
ÂÂ4 7
.
ÂÂ7 8
str_id_sistema
ÂÂ8 F
)
ÂÂG H
;
ÂÂH I
cabecera
ÊÊ 
.
ÊÊ 
str_usuario
ÊÊ  
=
ÊÊ! "
obj
ÊÊ# &
.
ÊÊ& '
	str_login
ÊÊ' 0
;
ÊÊ0 1
cabecera
ÁÁ 
.
ÁÁ 

int_perfil
ÁÁ 
=
ÁÁ  !
Convert
ÁÁ" )
.
ÁÁ) *
ToInt32
ÁÁ* 1
(
ÁÁ1 2
obj
ÁÁ3 6
.
ÁÁ6 7
str_id_oficina
ÁÁ7 E
)
ÁÁF G
;
ÁÁG H
cabecera
ËË 
.
ËË 
int_oficina
ËË  
=
ËË! "
Convert
ËË# *
.
ËË* +
ToInt32
ËË+ 2
(
ËË2 3
obj
ËË4 7
.
ËË7 8
str_id_oficina
ËË8 F
)
ËËG H
;
ËËH I
cabecera
ÈÈ 
.
ÈÈ  
str_nemonico_canal
ÈÈ '
=
ÈÈ( )
obj
ÈÈ* -
.
ÈÈ- . 
str_nemonico_canal
ÈÈ. @
;
ÈÈ@ A
cabecera
ÍÍ 
.
ÍÍ 
str_ip
ÍÍ 
=
ÍÍ 
obj
ÍÍ !
.
ÍÍ! " 
str_ip_dispositivo
ÍÍ" 4
;
ÍÍ4 5
cabecera
ÎÎ 
.
ÎÎ 
str_session
ÎÎ  
=
ÎÎ! "
obj
ÎÎ# &
.
ÎÎ& '

str_sesion
ÎÎ' 1
;
ÎÎ1 2
cabecera
ÏÏ 
.
ÏÏ 
str_mac
ÏÏ 
=
ÏÏ 
obj
ÏÏ "
.
ÏÏ" # 
str_ip_dispositivo
ÏÏ# 5
;
ÏÏ5 6
return
ÓÓ 
cabecera
ÓÓ 
;
ÓÓ 
}
ÔÔ 	
public
ÒÒ "
RespuestaTransaccion
ÒÒ ##
ejecutar_pago_directo
ÒÒ$ 9
(
ÒÒ: ;
ResTransferencia
ÒÒ< L
datos_validados
ÒÒM \
,
ÒÒ\ ]
Cabecera
ÒÒ^ f
cabecera
ÒÒg o
)
ÒÒp q
{
ÚÚ 	"
RespuestaTransaccion
ÛÛ  
	respuesta
ÛÛ! *
=
ÛÛ+ ,
new
ÛÛ- 0"
RespuestaTransaccion
ÛÛ1 E
(
ÛÛE F
)
ÛÛF G
;
ÛÛG H
try
ÙÙ 
{
ıı 
	respuesta
¯¯ 
.
¯¯ 
cuerpo
¯¯  
=
¯¯! "
datos_validados
¯¯# 2
;
¯¯2 3
Transaccion
˙˙ *
datos_para_validacion_banred
˙˙ 8
=
˙˙9 :
new
˙˙; >
Transaccion
˙˙? J
(
˙˙J K
)
˙˙K L
;
˙˙L M*
datos_para_validacion_banred
˚˚ ,
.
˚˚, -
int_secuencial
˚˚- ;
=
˚˚< =
datos_validados
˚˚> M
.
˚˚M N
int_secuencial
˚˚N \
;
˚˚\ ]*
datos_para_validacion_banred
˝˝ ,
.
˝˝, -

int_fi_aut
˝˝- 7
=
˝˝8 9
datos_validados
˝˝: I
.
˝˝I J

int_fi_aut
˝˝J T
;
˝˝T U*
datos_para_validacion_banred
˛˛ ,
.
˛˛, -
str_bin_aut
˛˛- 8
=
˛˛9 :
datos_validados
˛˛; J
.
˛˛J K
str_bin_aut
˛˛K V
;
˛˛V W*
datos_para_validacion_banred
ÄÄ ,
.
ÄÄ, -
str_nom_ordenante
ÄÄ- >
=
ÄÄ? @
datos_validados
ÄÄA P
.
ÄÄP Q"
str_nombre_ordenante
ÄÄQ e
;
ÄÄe f*
datos_para_validacion_banred
ÅÅ ,
.
ÅÅ, -"
str_cuenta_ordenante
ÅÅ- A
=
ÅÅB C
datos_validados
ÅÅD S
.
ÅÅS T#
str_num_cta_ordenante
ÅÅT i
;
ÅÅi j*
datos_para_validacion_banred
ÇÇ ,
.
ÇÇ, -*
str_identificacion_ordenante
ÇÇ- I
=
ÇÇJ K
datos_validados
ÇÇL [
.
ÇÇ[ \#
str_num_doc_ordenante
ÇÇ\ q
;
ÇÇq r*
datos_para_validacion_banred
ÑÑ ,
.
ÑÑ, -
str_nom_receptor
ÑÑ- =
=
ÑÑ> ?
datos_validados
ÑÑ@ O
.
ÑÑO P
str_nombre_benef
ÑÑP `
;
ÑÑ` a*
datos_para_validacion_banred
ÖÖ ,
.
ÖÖ, -!
str_cuenta_receptor
ÖÖ- @
=
ÖÖA B
datos_validados
ÖÖC R
.
ÖÖR S
str_num_cta_benef
ÖÖS d
;
ÖÖd e*
datos_para_validacion_banred
ÜÜ ,
.
ÜÜ, -
str_cuenta_bce
ÜÜ- ;
=
ÜÜ< =
datos_validados
ÜÜ> M
.
ÜÜM N#
str_cta_bce_ifi_benef
ÜÜN c
;
ÜÜc d*
datos_para_validacion_banred
áá ,
.
áá, -&
str_tipo_cuenta_receptor
áá- E
=
ááF G
datos_validados
ááH W
.
ááW X 
str_tipo_cta_benef
ááX j
;
ááj k*
datos_para_validacion_banred
ââ ,
.
ââ, - 
str_info_adicional
ââ- ?
=
ââ@ A
datos_validados
ââB Q
.
ââQ R 
str_info_adicional
ââR d
;
ââd e*
datos_para_validacion_banred
ää ,
.
ää, -)
str_identificacion_receptor
ää- H
=
ääI J
datos_validados
ääK Z
.
ääZ [
str_num_doc_benef
ää[ l
;
ääl m*
datos_para_validacion_banred
ãã ,
.
ãã, -"
int_secuencial_cobis
ãã- A
=
ããB C
datos_validados
ããD S
.
ããS T
int_id_debito
ããT a
;
ããa b*
datos_para_validacion_banred
åå ,
.
åå, -
dec_monto_tran
åå- ;
=
åå< =
datos_validados
åå> M
.
ååM N
dec_monto_tran
ååN \
;
åå\ ]*
datos_para_validacion_banred
çç ,
.
çç, -
str_observaciones
çç- >
=
çç? @
datos_validados
ççA P
.
ççP Q
str_observaciones
ççQ b
;
ççb c
switch
êê 
(
êê 
datos_validados
êê &
.
êê& ' 
str_tipo_cta_benef
êê' 9
)
êê9 :
{
ëë 
case
ìì 
$str
ìì 
:
ìì *
datos_para_validacion_banred
îî 4
.
îî4 5&
str_tipo_cuenta_receptor
îî5 M
=
îîN O
$str
îîP T
;
îîT U*
datos_para_validacion_banred
ïï 4
.
ïï4 5
str_tipo_tran
ïï5 B
=
ïïC D
$str
ïïE K
;
ïïK L
break
ññ 
;
ññ 
case
òò 
$str
òò 
:
òò *
datos_para_validacion_banred
ôô 4
.
ôô4 5&
str_tipo_cuenta_receptor
ôô5 M
=
ôôN O
$str
ôôP T
;
ôôT U*
datos_para_validacion_banred
öö 4
.
öö4 5
str_tipo_tran
öö5 B
=
ööC D
$str
ööE K
;
ööK L
break
õõ 
;
õõ 
case
ùù 
$str
ùù 
:
ùù *
datos_para_validacion_banred
ûû 4
.
ûû4 5&
str_tipo_cuenta_receptor
ûû5 M
=
ûûN O
$str
ûûP T
;
ûûT U*
datos_para_validacion_banred
üü 4
.
üü4 5
str_tipo_tran
üü5 B
=
üüC D
$str
üüE K
;
üüK L
break
†† 
;
†† 
}
°° *
datos_para_validacion_banred
££ ,
.
££, -
str_nom_receptor
££- =
=
££> ?
$str
££@ B
;
££B C*
datos_para_validacion_banred
§§ ,
.
§§, -
str_observaciones
§§- >
=
§§? @
$str
§§A C
;
§§C D"
SolicitudTransaccion
•• $
sol_tran
••% -
=
••. /
new
••0 3"
SolicitudTransaccion
••4 H
(
••H I
)
••I J
;
••J K
sol_tran
¶¶ 
.
¶¶ 
cuerpo
¶¶ 
=
¶¶  !*
datos_para_validacion_banred
¶¶" >
;
¶¶> ?
sol_tran
ßß 
.
ßß 
cabecera
ßß !
=
ßß" #
cabecera
ßß$ ,
;
ßß, -
ProcesarSolicitud
©© !
(
©©! "
sol_tran
©©# +
,
©©+ ,
$str
©©- /
)
©©0 1
;
©©1 2
}
´´ 
catch
¨¨ 
(
¨¨ 
	Exception
¨¨ 
ex
¨¨ 
)
¨¨ 
{
≠≠ 
throw
ÆÆ 
new
ÆÆ #
ArgumentNullException
ÆÆ /
(
ÆÆ/ 0
ex
ÆÆ1 3
.
ÆÆ3 4
ToString
ÆÆ4 <
(
ÆÆ< =
)
ÆÆ= >
)
ÆÆ? @
;
ÆÆ@ A
}
ØØ 
return
∞∞ 
	respuesta
∞∞ 
;
∞∞ 
}
±± 	
public
∂∂ 
ResComun
∂∂ &
validar_transfer_interna
∂∂ 0
(
∂∂1 2(
ReqValidacionTransferencia
∂∂3 M'
req_validar_transferencia
∂∂N g
,
∂∂g h
string
∂∂i o
str_operacion
∂∂p }
)
∂∂~ 
{
∑∑ 	
var
∏∏ 
	respuesta
∏∏ 
=
∏∏ 
new
∏∏ 
ResComun
∏∏  (
(
∏∏( )
)
∏∏) *
;
∏∏* +
	respuesta
ππ 
.
ππ 
LlenarResHeader
ππ %
(
ππ% &'
req_validar_transferencia
ππ' @
)
ππA B
;
ππB C'
req_validar_transferencia
∫∫ %
.
∫∫% & 
str_id_transaccion
∫∫& 8
=
∫∫9 :
ServiceLogs
∫∫; F
.
∫∫F G
SaveHeaderLogs
∫∫G U
<
∫∫U V(
ReqValidacionTransferencia
∫∫V p
>
∫∫p q
(
∫∫q r(
req_validar_transferencia∫∫s å
,∫∫å ç
str_operacion∫∫é õ
,∫∫õ ú

MethodBase∫∫ù ß
.∫∫ß ® 
GetCurrentMethod∫∫® ∏
(∫∫∏ π
)∫∫π ∫
!∫∫∫ ª
.∫∫ª º
Name∫∫º ¿
,∫∫¿ ¡
	str_clase∫∫¬ À
)∫∫Ã Õ
;∫∫Õ Œ
	respuesta
ªª 
.
ªª  
str_id_transaccion
ªª (
=
ªª) *'
req_validar_transferencia
ªª+ D
.
ªªD E 
str_id_transaccion
ªªE W
;
ªªW X
try
ΩΩ 
{
ææ "
RespuestaTransaccion
øø $
res_tran
øø% -
=
øø. /
new
øø0 3
TransferenciasDat
øø4 E
(
øøE F
_settingsApi
øøG S
)
øøT U
.
øøU V&
validar_transfer_interna
øøV n
(
øøn o(
req_validar_transferenciaøøp â
)øøä ã
;øøã å
	respuesta
¡¡ 
.
¡¡ (
str_res_estado_transaccion
¡¡ 4
=
¡¡5 6
(
¡¡7 8
res_tran
¡¡8 @
.
¡¡@ A
codigo
¡¡A G
.
¡¡G H
Equals
¡¡H N
(
¡¡N O
$str
¡¡P U
)
¡¡V W
)
¡¡W X
?
¡¡Y Z
$str
¡¡[ _
:
¡¡` a
$str
¡¡b g
;
¡¡g h
	respuesta
¬¬ 
.
¬¬ 
str_res_codigo
¬¬ (
=
¬¬) *
res_tran
¬¬+ 3
.
¬¬3 4
codigo
¬¬4 :
;
¬¬: ;
	respuesta
√√ 
.
√√ $
str_res_info_adicional
√√ 0
=
√√1 2
res_tran
√√3 ;
.
√√; <
diccionario
√√< G
[
√√G H
$str
√√H S
]
√√S T
.
√√T U
ToString
√√U ]
(
√√] ^
)
√√^ _
;
√√_ `
}
ƒƒ 
catch
≈≈ 
(
≈≈ 
	Exception
≈≈ 
	exception
≈≈ %
)
≈≈% &
{
∆∆ 
ServiceLogs
«« 
.
«« 
SaveExceptionLogs
«« -
(
««- .
	respuesta
««/ 8
,
««8 9
str_operacion
««: G
,
««G H

MethodBase
««I S
.
««S T
GetCurrentMethod
««T d
(
««d e
)
««e f
!
««f g
.
««g h
Name
««h l
,
««l m
	str_clase
««n w
,
««w x
	exception««y Ç
)««É Ñ
;««Ñ Ö
throw
»» 
;
»» 
}
…… 
ServiceLogs
ÀÀ 
.
ÀÀ 
SaveResponseLogs
ÀÀ (
(
ÀÀ( )
	respuesta
ÀÀ* 3
,
ÀÀ3 4
str_operacion
ÀÀ5 B
,
ÀÀB C

MethodBase
ÀÀD N
.
ÀÀN O
GetCurrentMethod
ÀÀO _
(
ÀÀ_ `
)
ÀÀ` a
!
ÀÀa b
.
ÀÀb c
Name
ÀÀc g
,
ÀÀg h
	str_clase
ÀÀi r
)
ÀÀs t
;
ÀÀt u
return
ÃÃ 
	respuesta
ÃÃ 
;
ÃÃ 
}
ÕÕ 	
public
œœ 
ResComun
œœ "
add_transfer_interna
œœ ,
(
œœ- .
ReqTransferencia
œœ/ ?#
req_add_transferencia
œœ@ U
,
œœU V
string
œœW ]
str_operacion
œœ^ k
)
œœl m
{
–– 	
var
—— 
	respuesta
—— 
=
—— 
new
—— 
ResComun
——  (
(
——( )
)
——) *
;
——* +
	respuesta
““ 
.
““ 
LlenarResHeader
““ %
(
““% &#
req_add_transferencia
““' <
)
““= >
;
““> ?#
req_add_transferencia
”” !
.
””! " 
str_id_transaccion
””" 4
=
””5 6
ServiceLogs
””7 B
.
””B C
SaveHeaderLogs
””C Q
<
””Q R
ReqTransferencia
””R b
>
””b c
(
””c d#
req_add_transferencia
””e z
,
””z {
str_operacion””| â
,””â ä

MethodBase””ã ï
.””ï ñ 
GetCurrentMethod””ñ ¶
(””¶ ß
)””ß ®
!””® ©
.””© ™
Name””™ Æ
,””Æ Ø
	str_clase””∞ π
)””∫ ª
;””ª º
	respuesta
‘‘ 
.
‘‘  
str_id_transaccion
‘‘ (
=
‘‘) *#
req_add_transferencia
‘‘+ @
.
‘‘@ A 
str_id_transaccion
‘‘A S
;
‘‘S T
try
÷÷ 
{
◊◊ "
RespuestaTransaccion
ÿÿ $
res_tran
ÿÿ% -
=
ÿÿ. /
new
ÿÿ0 3
TransferenciasDat
ÿÿ4 E
(
ÿÿE F
_settingsApi
ÿÿG S
)
ÿÿT U
.
ÿÿU V'
add_transferencia_interna
ÿÿV o
(
ÿÿo p$
req_add_transferenciaÿÿq Ü
)ÿÿá à
;ÿÿà â
	respuesta
⁄⁄ 
.
⁄⁄ (
str_res_estado_transaccion
⁄⁄ 4
=
⁄⁄5 6
(
⁄⁄7 8
res_tran
⁄⁄8 @
.
⁄⁄@ A
codigo
⁄⁄A G
.
⁄⁄G H
Equals
⁄⁄H N
(
⁄⁄N O
$str
⁄⁄P U
)
⁄⁄V W
)
⁄⁄W X
?
⁄⁄Y Z
$str
⁄⁄[ _
:
⁄⁄` a
$str
⁄⁄b g
;
⁄⁄g h
	respuesta
€€ 
.
€€ 
str_res_codigo
€€ (
=
€€) *
res_tran
€€+ 3
.
€€3 4
codigo
€€4 :
;
€€: ;
	respuesta
‹‹ 
.
‹‹ $
str_res_info_adicional
‹‹ 0
=
‹‹1 2
res_tran
‹‹3 ;
.
‹‹; <
diccionario
‹‹< G
[
‹‹G H
$str
‹‹H S
]
‹‹S T
.
‹‹T U
ToString
‹‹U ]
(
‹‹] ^
)
‹‹^ _
;
‹‹_ `
}
›› 
catch
ﬁﬁ 
(
ﬁﬁ 
	Exception
ﬁﬁ 
	exception
ﬁﬁ %
)
ﬁﬁ% &
{
ﬂﬂ 
ServiceLogs
‡‡ 
.
‡‡ 
SaveExceptionLogs
‡‡ -
(
‡‡- .
	respuesta
‡‡/ 8
,
‡‡8 9
str_operacion
‡‡: G
,
‡‡G H

MethodBase
‡‡I S
.
‡‡S T
GetCurrentMethod
‡‡T d
(
‡‡d e
)
‡‡e f
!
‡‡f g
.
‡‡g h
Name
‡‡h l
,
‡‡l m
	str_clase
‡‡n w
,
‡‡w x
	exception‡‡y Ç
)‡‡É Ñ
;‡‡Ñ Ö
throw
·· 
;
·· 
}
‚‚ 
ServiceLogs
‰‰ 
.
‰‰ 
SaveResponseLogs
‰‰ (
(
‰‰( )
	respuesta
‰‰* 3
,
‰‰3 4
str_operacion
‰‰5 B
,
‰‰B C

MethodBase
‰‰D N
.
‰‰N O
GetCurrentMethod
‰‰O _
(
‰‰_ `
)
‰‰` a
!
‰‰a b
.
‰‰b c
Name
‰‰c g
,
‰‰g h
	str_clase
‰‰i r
)
‰‰s t
;
‰‰t u
return
ÂÂ 
	respuesta
ÂÂ 
;
ÂÂ 
}
ÊÊ 	
}
ÍÍ 
}ÎÎ õ
bC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\Utils\Converting.cs
	namespace 	
wsTransferencias
 
. 
Neg 
. 
Utils $
{		 
public

 

static

 
class

 

Converting

 "
{ 
public 
static 
object 
MapDictToObj )
() *

Dictionary* 4
<4 5
string5 ;
,; <
object= C
>C D
dictE I
,I J
TypeK O

destObjectP Z
)Z [
{ 	
object 
	returnobj 
= 
	Activator (
.( )
CreateInstance) 7
(7 8

destObject8 B
)B C
!C D
;D E
foreach 
( 
string 
key 
in  "
dict# '
.' (
Keys( ,
), -
{ 
object 
value 
= 
dict #
[# $
key$ '
]' (
;( )
var 
targetProperty "
=# $

destObject% /
./ 0
GetProperty0 ;
(; <
key< ?
)? @
;@ A
if 
( 
targetProperty "
!" #
.# $
PropertyType$ 0
==1 3
typeof4 :
(: ;
string; A
)A B
)B C
{ 
targetProperty "
." #
SetValue# +
(+ ,
	returnobj, 5
,5 6
value7 <
)< =
;= >
} 
else 
{ 
var 
parseMethod #
=$ %
targetProperty& 4
.4 5
PropertyType5 A
.A B
	GetMethodB K
(K L
$strL V
,V W
BindingFlags $
.$ %
Public% +
|, -
BindingFlags. :
.: ;
Static; A
,A B
nullC G
,G H
new   
[   
]   
{   
typeof    &
(  & '
string  ' -
)  - .
,  . /
targetProperty  0 >
.  > ?
PropertyType  ? K
.  K L
MakeByRefType  L Y
(  Y Z
)  Z [
}  \ ]
,  ] ^
null  _ c
)  c d
;  d e
if"" 
("" 
parseMethod"" #
!=""$ &
null""' +
)""+ ,
{## 
var$$ 

parameters$$ &
=$$' (
new$$) ,
[$$, -
]$$- .
{$$/ 0
value$$1 6
,$$6 7
null$$8 <
}$$= >
;$$> ?
var%% 
success%% #
=%%$ %
(%%& '
bool%%' +
)%%+ ,
parseMethod%%, 7
.%%7 8
Invoke%%8 >
(%%> ?
null%%? C
,%%C D

parameters%%E O
)%%O P
!%%P Q
;%%Q R
if&& 
(&& 
success&& #
)&&# $
{'' 
targetProperty(( *
.((* +
SetValue((+ 3
(((3 4
	returnobj((4 =
,((= >

parameters((? I
[((I J
$num((J K
]((K L
)((L M
;((M N
})) 
}++ 
},, 
}.. 
return00 
	returnobj00 
;00 
}11 	
}33 
}44 ∆$
iC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\Utils\LoadConfigService.cs
	namespace 	
wsTransferencias
 
. 
Neg 
. 
Utils $
{ 
public 

static 
class 
LoadConfigService )
{ 
public		 
static		 
List		 
<		 
	Parametro		 $
>		$ %
lst_errores		& 1
{		2 3
get		4 7
;		7 8
set		9 <
;		< =
}		> ?
=		@ A
new		B E
(		E F
)		F G
;		G H
public

 
static

 
List

 
<

 
	Parametro

 $
>

$ %
lst_parametros

& 4
{

5 6
get

7 :
;

: ;
set

< ?
;

? @
}

A B
=

C D
new

E H
(

H I
)

I J
;

J K
public 
static 
DateTime 
dt_fecha_codigos /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
static 
void 
LoadConfiguration ,
(- .
SettingsApi/ :
serviceSettings; J
)K L
{ 	
try 
{ 
ReqGetParametros  
req_get_parametros! 3
=4 5
new6 9
(9 :
): ;
;; <
req_get_parametros "
." #

str_nombre# -
=. /
$str0 ?
;? @
req_get_parametros "
." #
str_id_sistema# 1
=2 3
$str4 8
;8 9
req_get_parametros "
." #
str_id_perfil# 0
=1 2
$str3 6
;6 7
req_get_parametros "
." #
str_id_oficina# 1
=2 3
$str4 7
;7 8 
RespuestaTransaccion $
res_tran% -
=. /
new0 3
ParametrosDat4 A
(A B
serviceSettingsC R
)S T
.T U
get_parametrosU c
(c d
req_get_parametrose w
)x y
;y z
lst_errores 
= 
Utils #
.# $+
ConvertConjuntoDatosToListClass$ C
<C D
	ParametroD M
>M N
(N O
(P Q
ConjuntoDatosQ ^
)^ _
res_tran` h
.h i
cuerpoi o
)p q
;q r
req_get_parametros "
." #

str_nombre# -
=. /
$str0 F
;F G 
RespuestaTransaccion   $
	res_tran2  % .
=  / 0
new  1 4
ParametrosDat  5 B
(  B C
serviceSettings  D S
)  T U
.  U V
get_parametros  V d
(  d e
req_get_parametros  f x
)  x y
;  y z
lst_parametros!! 
=!!  
Utils!!! &
.!!& '+
ConvertConjuntoDatosToListClass!!' F
<!!F G
	Parametro!!G P
>!!P Q
(!!Q R
(!!S T
ConjuntoDatos!!T a
)!!a b
	res_tran2!!c l
.!!l m
cuerpo!!m s
)!!t u
;!!u v
dt_fecha_codigos##  
=##! "
DateTime### +
.##+ ,
Now##, /
.##/ 0
Date##0 4
;##4 5
}%% 
catch&& 
{'' 
dt_fecha_codigos((  
=((! "
default((# *
(((* +
DateTime((, 4
)((5 6
;((6 7
})) 
}** 	
public-- 
static-- 
	Parametro-- 
FindErrorCode--  -
(--. /
string--0 6

str_codigo--7 A
)--B C
{.. 	
return// 
lst_errores// 
.// 
Find// #
(//# $
x//% &
=>//' )
x//* +
.//+ ,
str_valor_ini//, 9
==//: <

str_codigo//= G
)//H I
!//I J
;//J K
}00 	
public11 
static11 
	Parametro11 
FindParametro11  -
(11. /
string110 6
str_nemonico117 C
)11D E
{22 	
return33 
lst_parametros33 !
.33! "
Find33" &
(33& '
x33( )
=>33* ,
x33- .
.33. /
str_nemonico33/ ;
==33< >
str_nemonico33? K
)33L M
!33M N
;33N O
}44 	
}77 
}88 û)
cC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\Utils\ServiceHttp.cs
	namespace 	
wsTransferencias
 
. 
Neg 
. 
Utils $
{		 
public

 

class

 
ServiceHttp

 
<

 
T

 
>

 
{ 
public 
async 
Task 
< 
T 
> #
GetRestServiceDataAsync 4
(5 6
string7 =
serviceAddress> L
,L M
stringN T
base64basicAuthU d
)e f
{ 	
try 
{ 
var 
client 
= 
new  

HttpClient! +
(+ ,
), -
;- .
client 
. 
BaseAddress "
=# $
new% (
Uri) ,
(, -
serviceAddress. <
)= >
;> ?
client 
. !
DefaultRequestHeaders ,
., -
Add- 0
(0 1
$str2 A
,A B
$strC K
+L M
base64basicAuthN ]
)^ _
;_ `
HttpResponseMessage #
response$ ,
=- .
client/ 5
.5 6
GetAsync6 >
(> ?
client@ F
.F G
BaseAddressG R
)S T
.T U
ResultU [
;[ \
response 
. #
EnsureSuccessStatusCode 0
(0 1
)1 2
;2 3
string 

jsonResult !
=" #
await$ )
response* 2
.2 3
Content3 :
.: ;
ReadAsStringAsync; L
(L M
)M N
;N O
var 
result 
= 
JsonSerializer +
.+ ,
Deserialize, 7
<7 8
T8 9
>9 :
(: ;

jsonResult< F
)G H
!H I
;I J
return 
result 
; 
} 
catch 
( 
	Exception 
ex 
) 
{   
throw!! 
new!! !
ArgumentNullException!! /
(!!/ 0
ex!!1 3
.!!3 4
ToString!!4 <
(!!< =
)!!= >
)!!? @
;!!@ A
}"" 
}## 	
public-- 
async-- 
Task-- 
<-- 
T-- 
>-- $
PostRestServiceDataAsync-- 5
(--6 7
string--8 >
serializedData--? M
,--M N
string--O U
serviceAddress--V d
,--d e
string--f l

parameters--m w
,--w x
string--y 
base64basicAuth
--Ä è
)
--ê ë
{.. 	
try// 
{00 

HttpClient11 
client11 !
=11" #
new11$ '

HttpClient11( 2
(112 3
)113 4
;114 5
client22 
.22 
BaseAddress22 "
=22# $
new22% (
Uri22) ,
(22, -
serviceAddress22. <
)22= >
;22> ?
client33 
.33 !
DefaultRequestHeaders33 ,
.33, -
Add33- 0
(330 1
$str332 A
,33A B
$str33C K
+33L M
base64basicAuth33N ]
)33^ _
;33_ `
var55 
httpContent55 
=55  !
new55" %
StringContent55& 3
(553 4
serializedData555 C
,55C D
Encoding55E M
.55M N
UTF855N R
,55R S
$str55T f
)55g h
;55h i
HttpResponseMessage66 #
response66$ ,
=66- .
client66/ 5
.665 6
	PostAsync666 ?
(66? @

parameters66A K
,66K L
httpContent66M X
)66Y Z
.66Z [
Result66[ a
;66a b
string77 
resultadoJson77 $
=77% &
await77' ,
response77- 5
.775 6
Content776 =
.77= >
ReadAsStringAsync77> O
(77O P
)77P Q
;77Q R
T88 
	respuesta88 
=88 
default88 %
(88% &
T88' (
)88) *
!88* +
;88+ ,
if99 
(99 
response99 
.99 
IsSuccessStatusCode99 /
)99/ 0
{:: 
	respuesta;; 
=;; 
JsonSerializer;;  .
.;;. /
Deserialize;;/ :
<;;: ;
T;;; <
>;;< =
(;;= >
resultadoJson;;? L
);;M N
!;;N O
;;;O P
}<< 
return>> 
	respuesta>>  
;>>  !
}?? 
catch@@ 
(@@ 
	Exception@@ 
ex@@ 
)@@ 
{AA 
throwBB 
newBB !
ArgumentNullExceptionBB /
(BB/ 0
exBB1 3
.BB3 4
ToStringBB4 <
(BB< =
)BB= >
)BB? @
;BB@ A
}CC 
}DD 	
}EE 
}FF …W
cC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\Utils\ServiceLogs.cs
	namespace 	
wsTransferencias
 
. 
Neg 
. 
Utils $
{ 
public 

static 
class 
ServiceLogs #
{ 
private 
static 
InfoLog 
infoLog &
;& '
static 
SettingsApi 
_settingsApi '
;' (
public 
static 
void 
Init 
(  !
SettingsApi" -
settings. 6
)7 8
{ 	
_settingsApi 
= 
settings #
;# $
infoLog 
. 
str_webservice "
=# $
$str% 7
;7 8
} 	
public   
static   
string   
SaveHeaderLogs   +
<  + ,
T  , -
>  - .
(  / 0
T  1 2
transaction  3 >
,  > ?
String  @ F
str_operacion  G T
,  T U
String  V \

str_metodo  ] g
,  g h
String  i o
	str_clase  p y
)  z {
{!! 	
string"" 
str_id_transaccion"" %
=""& '
String""( .
."". /
Empty""/ 4
;""4 5
infoLog$$ 
.$$ 
	str_clase$$ 
=$$ 
	str_clase$$  )
;$$) *
infoLog%% 
.%% 
str_operacion%% !
=%%" #
str_operacion%%$ 1
;%%1 2
infoLog&& 
.&& 

str_objeto&& 
=&&  
transaction&&! ,
;&&, -
infoLog'' 
.'' 

str_metodo'' 
=''  

str_metodo''! +
;''+ ,
infoLog(( 
.(( 
	str_fecha(( 
=(( 
DateTime((  (
.((( )
Now(() ,
;((, - 
RespuestaTransaccion**  
res_tran_logs**! .
=**/ 0
new**1 4
LogsMongoDat**5 A
(**A B
_settingsApi**C O
)**P Q
.**Q R 
GuardarCabeceraMongo**R f
(**f g
transaction**h s
)**t u
;**u v
str_id_transaccion++ 
=++  
res_tran_logs++! .
.++. /
codigo++/ 5
.++5 6
Equals++6 <
(++< =
$str++> C
)++D E
?++F G
(++H I
String++I O
)++O P
res_tran_logs++Q ^
.++^ _
cuerpo++_ e
:++f g
Utils++h m
.++m n"
GeneraCadenaAleatoria	++n É
(
++É Ñ
)
++Ñ Ö
;
++Ö Ü
infoLog,, 
.,, 
str_id_transaccion,, &
=,,' (
str_id_transaccion,,) ;
;,,; <
infoLog-- 
.-- 
str_tipo-- 
=-- 
$str-- $
;--$ %
LogServicios.. 
... 
RegistrarTramas.. (
(..( )
infoLog..* 1
...1 2
str_tipo..2 :
,..: ;
infoLog..< C
,..C D
_settingsApi..E Q
...Q R$
path_logs_transferencias..R j
)..k l
;..l m
return00 
str_id_transaccion00 %
;00% &
}11 	
public<< 
static<< 
void<< 
SaveResponseLogs<< +
(<<, -
ResComun<<. 6
transaction<<7 B
,<<B C
String<<D J
str_operacion<<K X
,<<X Y
String<<Z `

str_metodo<<a k
,<<k l
String<<m s
	str_clase<<t }
)<<~ 
{== 	
infoLog>> 
.>> 
	str_clase>> 
=>> 
	str_clase>>  )
;>>) *
infoLog?? 
.?? 
str_operacion?? !
=??" #
str_operacion??$ 1
;??1 2
infoLog@@ 
.@@ 

str_objeto@@ 
=@@  
transaction@@! ,
;@@, -
infoLogAA 
.AA 

str_metodoAA 
=AA  

str_metodoAA! +
;AA+ ,
infoLogBB 
.BB 
	str_fechaBB 
=BB 
DateTimeBB  (
.BB( )
NowBB) ,
;BB, - 
RespuestaTransaccionDD  
res_tran_logsDD! .
=DD/ 0
newDD1 4
LogsMongoDatDD5 A
(DDA B
_settingsApiDDC O
)DDP Q
.DDQ R!
GuardarRespuestaMongoDDR g
(DDg h
transactionDDi t
)DDu v
;DDv w
stringEE 
str_id_transaccionEE %
=EE& '
res_tran_logsEE( 5
.EE5 6
codigoEE6 <
.EE< =
EqualsEE= C
(EEC D
$strEEE J
)EEK L
?EEM N
(EEO P
StringEEP V
)EEV W
res_tran_logsEEX e
.EEe f
cuerpoEEf l
:EEm n
UtilsEEo t
.EEt u"
GeneraCadenaAleatoria	EEu ä
(
EEä ã
)
EEã å
;
EEå ç
infoLogFF 
.FF 
str_id_transaccionFF &
=FF' (
str_id_transaccionFF) ;
;FF; <
infoLogGG 
.GG 
str_tipoGG 
=GG 
$strGG $
;GG$ %
LogServiciosHH 
.HH 
RegistrarTramasHH (
(HH( )
infoLogHH* 1
.HH1 2
str_tipoHH2 :
,HH: ;
infoLogHH< C
,HHC D
_settingsApiHHE Q
.HHQ R$
path_logs_transferenciasHHR j
)HHk l
;HHl m
}II 	
publicUU 
staticUU 
voidUU 
SaveExceptionLogsUU ,
(UU- .
ResComunUU/ 7
transactionUU8 C
,UUC D
StringUUE K
str_operacionUUL Y
,UUY Z
StringUU[ a

str_metodoUUb l
,UUl m
StringUUn t
	str_claseUUu ~
,UU~ 
Object
UUÄ Ü
	obj_error
UUá ê
)
UUë í
{VV 	
stringWW 
str_id_transaccionWW %
=WW& '
StringWW( .
.WW. /
EmptyWW/ 4
;WW4 5
infoLogYY 
.YY 
	str_claseYY 
=YY 
	str_claseYY  )
;YY) *
infoLogZZ 
.ZZ 
str_operacionZZ !
=ZZ" #
str_operacionZZ$ 1
;ZZ1 2
infoLog[[ 
.[[ 

str_objeto[[ 
=[[  
transaction[[! ,
;[[, -
infoLog\\ 
.\\ 

str_metodo\\ 
=\\  

str_metodo\\! +
;\\+ ,
infoLog]] 
.]] 
	str_fecha]] 
=]] 
DateTime]]  (
.]]( )
Now]]) ,
;]], - 
RespuestaTransaccion__  
res_tran_logs__! .
=__/ 0
new__1 4
LogsMongoDat__5 A
(__A B
_settingsApi__C O
)__P Q
.__Q R#
GuardarExcepcionesMongo__R i
(__i j
transaction__k v
,__v w
	obj_error	__x Å
)
__Ç É
;
__É Ñ
str_id_transaccion`` 
=``  
res_tran_logs``! .
.``. /
codigo``/ 5
.``5 6
Equals``6 <
(``< =
$str``> C
)``D E
?``F G
(``H I
String``I O
)``O P
res_tran_logs``Q ^
.``^ _
cuerpo``_ e
:``f g
Utils``h m
.``m n"
GeneraCadenaAleatoria	``n É
(
``É Ñ
)
``Ñ Ö
;
``Ö Ü
infoLogaa 
.aa 
str_id_transaccionaa &
=aa' (
str_id_transaccionaa) ;
;aa; <
infoLogbb 
.bb 
str_tipobb 
=bb 
$strbb $
;bb$ %
LogServicioscc 
.cc 
RegistrarTramascc (
(cc( )
infoLogcc* 1
.cc1 2
str_tipocc2 :
,cc: ;
infoLogcc< C
,ccC D
_settingsApiccE Q
.ccQ R$
path_logs_transferenciasccR j
)cck l
;ccl m
}dd 	
publicpp 
staticpp 
stringpp 
SaveAmenazasLogspp -
(pp. /
ValidacionInyeccionpp0 C

validacionppD N
,ppN O
StringppP V
str_operacionppW d
,ppd e
Stringppf l

str_metodoppm w
,ppw x
Stringppy 
	str_clase
ppÄ â
)
ppä ã
{qq 	
stringrr 
str_id_transaccionrr %
=rr& '
Stringrr( .
.rr. /
Emptyrr/ 4
;rr4 5
varss 
res_tran_logsss 
=ss 
newss  # 
RespuestaTransaccionss$ 8
(ss8 9
)ss9 :
;ss: ;
tryuu 
{vv 
infoLogww 
.ww 
	str_claseww !
=ww" #
	str_claseww$ -
;ww- .
infoLogxx 
.xx 
str_operacionxx %
=xx& '
str_operacionxx( 5
;xx5 6
infoLogyy 
.yy 

str_objetoyy "
=yy# $

validacionyy% /
!yy/ 0
;yy0 1
infoLogzz 
.zz 

str_metodozz "
=zz# $

str_metodozz% /
;zz/ 0
infoLog{{ 
.{{ 
	str_fecha{{ !
={{" #
DateTime{{$ ,
.{{, -
Now{{- 0
;{{0 1
res_tran_logs}} 
=}} 
new}}  #
LogsMongoDat}}$ 0
(}}0 1
_settingsApi}}2 >
!}}> ?
)}}@ A
.}}A B 
GuardarAmenazasMongo}}B V
(}}V W

validacion}}X b
!}}b c
)}}d e
;}}e f
str_id_transaccion~~ "
=~~# $
res_tran_logs~~% 2
.~~2 3
Equals~~3 9
(~~9 :
$str~~; @
)~~A B
?~~C D
Utils~~E J
.~~J K!
GeneraCadenaAleatoria~~K `
(~~` a
)~~a b
:~~c d
(~~e f
String~~f l
)~~l m
res_tran_logs~~n {
.~~{ |
cuerpo	~~| Ç
;
~~Ç É
infoLog 
. 
str_id_transaccion *
=+ ,
str_id_transaccion- ?
;? @
infoLog
ÄÄ 
.
ÄÄ 
str_tipo
ÄÄ  
=
ÄÄ! "
$str
ÄÄ# (
;
ÄÄ( )
LogServicios
ÅÅ 
.
ÅÅ 
RegistrarTramas
ÅÅ ,
(
ÅÅ, -
infoLog
ÅÅ. 5
.
ÅÅ5 6
str_tipo
ÅÅ6 >
,
ÅÅ> ?
infoLog
ÅÅ@ G
,
ÅÅG H
_settingsApi
ÅÅI U
.
ÅÅU V 
path_logs_amenazas
ÅÅV h
)
ÅÅi j
;
ÅÅj k
}
ÉÉ 
catch
ÑÑ 
(
ÑÑ 
	Exception
ÑÑ 
)
ÑÑ 
{
ÖÖ  
str_id_transaccion
ÜÜ "
=
ÜÜ# $
String
ÜÜ% +
.
ÜÜ+ ,
Empty
ÜÜ, 1
;
ÜÜ1 2
throw
áá 
;
áá 
}
àà 
return
ââ  
str_id_transaccion
ââ %
;
ââ% &
}
ää 	
}
ãã 
}åå Ôu
]C:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\Utils\Utils.cs
	namespace 	
wsTransferencias
 
. 
Neg 
. 
Utils $
{ 
public 

static 
class 
Utils 
{ 
public 
static 
List 
< 
T 
> +
ConvertConjuntoDatosToListClass =
<= >
T> ?
>? @
(A B
ConjuntoDatosC P
cuerpoQ W
)X Y
{ 	
List 
< 
T 
> 
	lst_array 
= 
new  #
List$ (
<( )
T) *
>* +
(+ ,
), -
;- .
ConjuntoDatos 
conjuntoDatos '
=( )
cuerpo* 0
;0 1
foreach 
( 
var 
item 
in 
conjuntoDatos  -
.- .

lst_tablas. 8
[8 9
$num9 :
]: ;
.; <
	lst_filas< E
)E F
{ 
T 
obj 
= 
( 
T 
) 

Converting &
.& '
MapDictToObj' 3
(3 4
item5 9
.9 :
nombre_valor: F
,F G
typeofH N
(N O
TP Q
)R S
)T U
;U V
	lst_array 
. 
Add 
( 
obj "
)# $
;$ %
}   
return"" 
	lst_array"" 
;"" 
}## 	
public++ 
static++ 
T++ 
?++ '
ConvertConjuntoDatosToClass++ 4
<++4 5
T++5 6
>++6 7
(++8 9
ConjuntoDatos++: G
cuerpo++H N
)++O P
{,, 	
ConjuntoDatos-- 
conjuntoDatos-- '
=--( )
cuerpo--* 0
;--0 1
T.. 
?.. 
obj.. 
=.. 
default.. 
(.. 
T.. 
)..  !
;..! "
foreach// 
(// 
var// 
item// 
in// 
conjuntoDatos//  -
.//- .

lst_tablas//. 8
[//8 9
$num//9 :
]//: ;
.//; <
	lst_filas//< E
)//E F
{00 
obj11 
=11 
(11 
T11 
)11 

Converting11 $
.11$ %
MapDictToObj11% 1
(111 2
item113 7
.117 8
nombre_valor118 D
,11D E
typeof11F L
(11L M
T11N O
)11P Q
)11R S
;11S T
}22 
return44 
obj44 
;44 
}55 	
internal== 
static== 
string== !
GeneraCadenaAleatoria== 4
(==5 6
)==6 7
{>> 	
Random?? 
random?? 
=?? 
new?? 
Random??  &
(??& '
)??' (
;??( )
const@@ 
string@@ 

characters@@ #
=@@$ %
$str@@& 2
;@@2 3
returnAA 
newAA 
stringAA 
(AA 

EnumerableAA )
.AA) *
RepeatAA* 0
(AA0 1

charactersAA2 <
,AA< =
$numAA> @
)AAA B
.BB 
SelectBB 
(BB 
sBB 
=>BB 
sBB 
[BB 
randomBB $
.BB$ %
NextBB% )
(BB) *
sBB+ ,
.BB, -
LengthBB- 3
)BB4 5
]BB5 6
)BB7 8
.BB8 9
ToArrayBB9 @
(BB@ A
)BBA B
)BBC D
;BBD E
}CC 	
publicKK 
asyncKK 
staticKK 
TaskKK  
<KK  !
ResComunKK! )
>KK) *
ValidarTokenKK+ 7
(KK8 9
SettingsApiKK: E
settingsKKF N
,KKN O
stringKKP V
str_dataKKW _
)KK` a
{LL 	
stringMM 

parametrosMM 
=MM 
$strMM  J
;MMJ K
varNN 
serviceNN 
=NN 
newNN 
ServiceHttpNN )
<NN) *
ResComunNN* 2
>NN2 3
(NN3 4
)NN4 5
;NN5 6
ResComunOO 
	respuestaOO 
=OO  
awaitOO! &
serviceOO' .
.OO. /$
PostRestServiceDataAsyncOO/ G
(OOG H
str_dataOOI Q
,OOQ R
settingsOOS [
.OO[ \
servicio_ws_accesoOO\ n
,OOn o

parametrosOOp z
,OOz {
settings	OO| Ñ
.
OOÑ Ö
auth_ws_acceso
OOÖ ì
)
OOî ï
;
OOï ñ
returnPP 
	respuestaPP 
;PP 
}RR 	
publicWW 
staticWW 
BooleanWW #
control_peticion_diariaWW 5
(WW6 7
stringWW8 >
str_operacionWW? L
,WWL M
SettingsApiWWN Y
settingsWWZ b
)WWc d
{XX 	
varZZ 
var_respuestaZZ 
=ZZ 
newZZ  # 
RespuestaTransaccionZZ$ 8
(ZZ8 9
)ZZ9 :
;ZZ: ;
var[[ 
peticion_diaria[[ 
=[[  !
new[[" %
PeticionDiaria[[& 4
([[4 5
)[[5 6
;[[6 7
Boolean\\ 
	respuesta\\ 
=\\ 
false\\  %
;\\% &
string^^ 
str_fecha_diaria^^ #
=^^$ %
DateTime^^& .
.^^. /
Now^^/ 2
.^^2 3
ToString^^3 ;
(^^; <
$str^^= I
)^^J K
;^^K L
string__ 

str_filtro__ 
=__ 
$str__  :
+__; <
str_fecha_diaria__= M
+__N O
$str__P e
+__f g
str_operacion__h u
+__v w
$str__x |
;__| }
tryaa 
{bb 
var_respuestacc 
=cc 
newcc  #
LogsMongoDatcc$ 0
(cc0 1
settingscc2 :
!cc: ;
)cc< =
.cc= >%
buscar_peticiones_diariascc> W
(ccW X

str_filtroccY c
)ccd e
;cce f
ifee 
(ee 
var_respuestaee  
.ee  !
codigoee! '
==ee( *
$stree+ 0
)ee0 1
{ff 
vargg 

resp_mongogg "
=gg# $
var_respuestagg% 2
.gg2 3
cuerpogg3 9
;gg9 :
ifhh 
(hh 

resp_mongohh !
!=hh" $
nullhh% )
&&hh* ,

resp_mongohh- 7
.hh7 8
ToStringhh8 @
(hh@ A
)hhA B
!=hhC E
$strhhF J
)hhJ K
{ii 
varjj 
res_datos_mongojj +
=jj, -
var_respuestajj. ;
.jj; <
cuerpojj< B
.jjB C
ToStringjjC K
(jjK L
)jjL M
!jjM N
.jjN O
ReplacejjO V
(jjV W
$strjjX c
,jjc d
$strjje h
)jji j
.jjj k
Replacejjk r
(jjr s
$strjjt w
,jjw x
$strjjy |
)jj} ~
;jj~ 
res_datos_mongokk '
=kk( )
res_datos_mongokk* 9
.kk9 :
Replacekk: A
(kkA B
$strkkC F
,kkF G
$strkkH J
)kkK L
.kkL M
ReplacekkM T
(kkT U
$strkkV Y
,kkY Z
$strkk[ ]
)kk^ _
;kk_ `
peticion_diariamm '
=mm( )
JsonSerializermm* 8
.mm8 9
Deserializemm9 D
<mmD E
PeticionDiariammE S
>mmS T
(mmT U
res_datos_mongommV e
)mmf g
;mmg h
ifnn 
(nn 
peticion_diariann *
!nn* +
.nn+ ,
_idnn, /
!=nn0 2
nullnn3 7
)nn7 8
{oo 
intpp 
int_act_peticionespp  2
=pp3 4
peticion_diariapp5 D
.ppD E
int_num_peticionppE U
+ppV W
$numppX Y
;ppY Z
intrr 
respuesta_promediorr  2
=rr3 4
newrr5 8
LogsMongoDatrr9 E
(rrE F
settingsrrG O
!rrO P
)rrQ R
.rrR S
obtener_promediorrS c
(rrc d
str_operacionrre r
)rrs t
;rrt u
varss 
cantidad_maximass  /
=ss0 1
respuesta_promedioss2 D
*ssE F
ConvertssG N
.ssN O
ToInt32ssO V
(ssV W
LoadConfigServicessX i
.ssi j
FindParametrossj w
(ssw x
$str	ssy ò
)
ssô ö
!
ssö õ
.
ssõ ú
str_valor_ini
ssú ©
)
ss™ ´
/
ss¨ ≠
$num
ssÆ ±
;
ss± ≤
ifuu 
(uu 
settingsuu '
.uu' (%
valida_peticiones_diariasuu( A
&&uuB D
int_act_peticionesuuE W
>uuX Y
cantidad_maximauuZ i
)uui j
{vv 
	respuestaww  )
=ww* +
trueww, 0
;ww0 1
}xx 
elseyy  
{zz 
string{{  &
str_act_registro{{' 7
={{8 9
$str{{: V
+{{W X
int_act_peticiones{{Y k
+{{l m
$str{{n r
;{{r s
var_respuesta||  -
=||. /
new||0 3
LogsMongoDat||4 @
(||@ A
settings||B J
!||J K
)||L M
.||M N&
actualizar_peticion_diaria||N h
(||h i

str_filtro||j t
,||t u
str_act_registro	||v Ü
)
||á à
;
||à â
}~~ 
} 
}
ÄÄ 
else
ÅÅ 
{
ÇÇ 
object
ÉÉ 
obj_sol
ÉÉ &
=
ÉÉ' (
new
ÉÉ) ,
{
ÉÉ- .
int_num_peticion
ÉÉ/ ?
=
ÉÉ@ A
$num
ÉÉB C
,
ÉÉC D
str_operacion
ÉÉE R
,
ÉÉR S!
str_fecha_solicitud
ÉÉT g
=
ÉÉh i
str_fecha_diaria
ÉÉj z
}
ÉÉ{ |
;
ÉÉ| }
new
ÑÑ 
LogsMongoDat
ÑÑ (
(
ÑÑ( )
settings
ÑÑ* 2
!
ÑÑ2 3
)
ÑÑ4 5
.
ÑÑ5 6.
 guardar_promedio_peticion_diaria
ÑÑ6 V
(
ÑÑV W
str_operacion
ÑÑX e
,
ÑÑe f
str_fecha_diaria
ÑÑg w
)
ÑÑx y
;
ÑÑy z
new
ÖÖ 
LogsMongoDat
ÖÖ (
(
ÖÖ( )
settings
ÖÖ* 2
!
ÖÖ2 3
)
ÖÖ4 5
.
ÖÖ5 6%
guardar_peticion_diaria
ÖÖ6 M
(
ÖÖM N
String
ÖÖO U
.
ÖÖU V
Empty
ÖÖV [
,
ÖÖ[ \
obj_sol
ÖÖ] d
)
ÖÖe f
;
ÖÖf g
}
ÜÜ 
}
áá 
}
àà 
catch
ââ 
(
ââ 
	Exception
ââ 
)
ââ 
{
ää 
Console
ãã 
.
ãã 
	WriteLine
ãã !
(
ãã! "
$str
ãã# %
)
ãã& '
;
ãã' (
throw
åå 
;
åå 
}
çç 
return
éé 
	respuesta
éé 
;
éé 
}
èè 	
public
òò 
async
òò 
static
òò 
Task
òò  
<
òò  !"
RespuestaTransaccion
òò! 5
>
òò5 6
ValidaRequiereOtp
òò7 H
(
òòI J
SettingsApi
òòK V
settings
òòW _
,
òò_ `
Header
òòa g
header
òòh n
,
òòn o
string
òòp v
str_operacionòòw Ñ
)òòÖ Ü
{
ôô 	
var
õõ 

parametros
õõ 
=
õõ 
$str
õõ J
;
õõJ K
var
úú 
service
úú 
=
úú 
new
úú 
ServiceHttp
úú )
<
úú) *"
RespuestaTransaccion
úú* >
>
úú> ?
(
úú? @
)
úú@ A
;
úúA B
var
ûû 
cabecera
ûû 
=
ûû 
new
ûû 
{
üü 
int_id_sistema
°° 
=
°°  
Convert
°°! (
.
°°( )
ToInt32
°°) 0
(
°°0 1
header
°°2 8
.
°°8 9
str_id_sistema
°°9 G
)
°°H I
,
°°I J
int_id_usuario
¢¢ 
=
¢¢  
Convert
¢¢! (
.
¢¢( )
ToInt32
¢¢) 0
(
¢¢0 1
header
¢¢2 8
.
¢¢8 9
str_id_usuario
¢¢9 G
)
¢¢H I
,
¢¢I J
str_usuario
££ 
=
££ 
header
££ $
.
££$ %
	str_login
££% .
,
££. /
int_id_perfil
§§ 
=
§§ 
header
§§  &
.
§§& '
str_id_perfil
§§' 4
,
§§4 5
int_id_oficina
•• 
=
••  
header
••! '
.
••' (
str_id_oficina
••( 6
,
••6 7
str_nombre_canal
¶¶  
=
¶¶! "
header
¶¶# )
.
¶¶) *
str_app
¶¶* 1
,
¶¶1 2 
str_nemonico_canal
ßß "
=
ßß# $
header
ßß% +
.
ßß+ , 
str_nemonico_canal
ßß, >
,
ßß> ?
str_ip
®® 
=
®® 
header
®® 
.
®®   
str_ip_dispositivo
®®  2
,
®®2 3
str_session
©© 
=
©© 
header
©© $
.
©©$ %

str_sesion
©©% /
,
©©/ 0
str_mac
™™ 
=
™™ 
header
™™  
.
™™  !!
str_mac_dispositivo
™™! 4
}
´´ 
;
´´ 
var
≠≠ 
cuerpo
≠≠ 
=
≠≠ 
new
≠≠ 
{
ÆÆ 
str_operacion
ØØ 
=
ØØ 
str_operacion
ØØ  -
,
ØØ- .
}
∞∞ 
;
∞∞ 
var
≤≤ 
raw
≤≤ 
=
≤≤ 
new
≤≤ 
{
≥≥ 
cabecera
¥¥ 
=
¥¥ 
cabecera
¥¥ #
,
¥¥# $
cuerpo
µµ 
=
µµ 
cuerpo
µµ 
}
∂∂ 
;
∂∂ 
string
∏∏ 
str_data
∏∏ 
=
∏∏ 
JsonSerializer
∏∏ ,
.
∏∏, -
	Serialize
∏∏- 6
(
∏∏6 7
raw
∏∏8 ;
)
∏∏< =
;
∏∏= >"
RespuestaTransaccion
ππ  
	respuesta
ππ! *
=
ππ+ ,
await
ππ- 2
service
ππ3 :
.
ππ: ;&
PostRestServiceDataAsync
ππ; S
(
ππS T
str_data
ππU ]
,
ππ] ^
settings
ππ_ g
.
ππg h
servicio_ws_otp
ππh w
,
ππw x

parametrosππy É
,ππÉ Ñ
settingsππÖ ç
.ππç é
auth_ws_otpππé ô
)ππö õ
;ππõ ú
return
ªª 
	respuesta
ªª 
;
ªª 
}
ΩΩ 	
}
¬¬ 
}√√ ˝/
nC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\Utils\ValidacionInyeccionSql.cs
	namespace 	
wsTransferencias
 
. 
Neg 
. 
Utils $
{		 
public

 

static

 
class

 "
ValidacionInyeccionSql

 .
{ 
public 
static 
Boolean  
validar_palabras_sql 2
(3 4
string5 ;
str_palabra_validar< O
,O P
stringQ W
campoX ]
,] ^
string_ e
str_operacionf s
,s t
Headeru {
header	| Ç
,
Ç É
string
Ñ ä
	str_clase
ã î
)
ï ñ
{ 	
ValidacionInyeccion 

validacion  *
=+ ,
new- 0
(0 1
)1 2
;2 3
List 
< 
string 
> $
str_palabras_encontradas 1
=2 3
new4 7
List8 <
<< =
string= C
>C D
{E F
}G H
;H I
Boolean  
bln_encontro_palabra (
=) *
false+ 0
;0 1
Boolean 
bln_cadena_segura %
=& '
false( -
;- .
string 
str_expresion_ini $
=% &
$str' 2
;2 3
string 
str_expresion_fin $
=% &
$str' 2
;2 3
string )
str_expresion_cuerpo_palabras 0
=1 2
String3 9
.9 :
Empty: ?
;? @
string 
str_palabas_pattern &
=' (
String) /
./ 0
Empty0 5
;5 6
str_palabas_pattern 
+=  "
LoadConfigService# 4
.4 5
lst_parametros5 C
.C D
SingleOrDefaultD S
(S T
pU V
=>W Y
pZ [
.[ \
str_nemonico\ h
==i k
$strl }
)~ 
!	 Ä
.
Ä Å
str_valor_ini
Å é
;
é è
str_palabas_pattern 
+=  "
LoadConfigService# 4
.4 5
lst_parametros5 C
.C D
SingleOrDefaultD S
(S T
pU V
=>W Y
pZ [
.[ \
str_nemonico\ h
==i k
$strl }
)~ 
!	 Ä
.
Ä Å
str_valor_ini
Å é
;
é è)
str_expresion_cuerpo_palabras )
=* +
str_expresion_ini, =
+> ?
str_palabas_pattern@ S
+T U
str_expresion_finV g
;g h
Match !
mtc_validar_expresion '
=( )
Regex* /
./ 0
Match0 5
(5 6
str_palabra_validar7 J
.J K
ToLowerK R
(R S
)S T
,T U)
str_expresion_cuerpo_palabrasV s
,s t
RegexOptions	u Å
.
Å Ç

IgnoreCase
Ç å
)
ç é
;
é è
while 
( !
mtc_validar_expresion '
.' (
Success( /
)/ 0
{    
bln_encontro_palabra!! $
=!!% &
true!!' +
;!!+ ,$
str_palabras_encontradas"" (
.""( )
Add"") ,
("", -!
mtc_validar_expresion## -
.##- .
Value##. 3
)$$ 
;$$ !
mtc_validar_expresion%% %
=%%& '!
mtc_validar_expresion%%( =
.%%= >
	NextMatch%%> G
(%%G H
)%%H I
;%%I J
}&& 
if(( 
(((  
bln_encontro_palabra(( #
)((# $
{)) 

validacion** 
.** 
idHeader** #
=**$ %
header**& ,
.**, -
str_id_transaccion**- ?
;**? @

validacion++ 
.++ 
str_mensaje++ &
=++' (
$str++) Q
;++Q R

validacion,, 
.,, %
str_informacion_adicional,, 4
=,,5 6
$str,,7 Y
+,,Z [
JsonSerializer,,\ j
.,,j k
	Serialize,,k t
(,,t u%
str_palabras_encontradas	,,v é
)
,,è ê
;
,,ê ë

validacion-- 
.-- 
str_servicio-- '
=--( )
str_operacion--* 7
;--7 8

validacion.. 
... 
	str_campo.. $
=..% &
campo..' ,
;.., -

validacion// 
.// 
str_ip// !
=//" #
header//$ *
.//* +
str_ip_dispositivo//+ =
;//= >

validacion00 
.00 
	str_valor00 $
=00% &
str_palabra_validar00' :
;00: ;

validacion11 
.11 
str_tipo11 #
=11$ %
$str11& 5
;115 6

validacion22 
.22 
	dtt_fecha22 $
=22% &
DateTime22' /
.22/ 0

ParseExact220 :
(22: ;
DateTime22< D
.22D E
Now22E H
.22H I
ToString22I Q
(22Q R
$str22S h
)22i j
,22j k
$str	22l Å
,
22Å Ç
null
22É á
)
22à â
;
22â ä
ServiceLogs44 
.44 
SaveAmenazasLogs44 ,
(44, -

validacion44. 8
,448 9
str_operacion44: G
,44G H

MethodBase44I S
.44S T
GetCurrentMethod44T d
(44d e
)44e f
!44f g
.44g h
Name44h l
,44l m
	str_clase44n w
)44x y
;44y z
}66 
else77 
{88 
bln_cadena_segura99 !
=99" #
true99$ (
;99( )
};; 
return<< 
bln_cadena_segura<< $
;<<$ %
}== 	
}>> 
}?? ®Ñ
eC:\Users\amloarte\Documents\REPOSITORIO2\wstransferencias\wsTransferencias.Neg\wsTransferenciasNeg.cs
	namespace 	
wsTransferencias
 
. 
Neg 
{ 
public 

class 
WsTransferenciasNeg $
{		 
private

 
readonly

 
SettingsApi

 $
_settingsApi

% 1
;

1 2
public 
WsTransferenciasNeg "
(# $
SettingsApi% 0
settings1 9
): ;
{ 	
this 
. 
_settingsApi 
= 
settings  (
;( )
} 	
public 
object 
procesarSolicitud '
(( )
Object* 0
sol_tran1 9
,9 :
string; A
str_operacionB O
)P Q
{ 	
Object 
	respuesta 
= 
new "
object# )
() *
)* +
;+ ,
var 
validacion_token  
=! "
new# &
ResComun' /
(/ 0
)0 1
;1 2
try 
{ 
switch 
( 
str_operacion $
)$ %
{ 
case 
$str ,
:, -
case 
$str ,
:, -
case 
$str /
:/ 0
case 
$str /
:/ 0
case 
$str 3
:3 4
case 
$str 9
:9 :
var 
str_beneficiarios -
=. /
JsonSerializer0 >
.> ?
	Serialize? H
(H I
sol_tranJ R
)S T
;T U
validacion_token (
=) *
Utils+ 0
.0 1
Utils1 6
.6 7
ValidarToken7 C
(C D
_settingsApiE Q
,Q R
str_beneficiariosS d
)e f
.f g
Resultg m
;m n
	respuesta   !
=  " #
validacion_token  $ 4
.  4 5
str_res_codigo  5 C
.  C D
Equals  D J
(  J K
$str  L Q
)  R S
?  T U*
ProcesarSolicitudBeneficiarios  V t
(  t u
str_beneficiarios	  v á
,
  á à
str_operacion
  â ñ
)
  ó ò
:
  ô ö
validacion_token
  õ ´
;
  ´ ¨
break!! 
;!! 
case## 
$str## /
:##/ 0
string$$ $
str_valida_transferencia$$ 7
=$$8 9
JsonSerializer$$: H
.$$H I
	Serialize$$I R
($$R S
sol_tran$$T \
)$$] ^
;$$^ _
validacion_token%% (
=%%) *
Utils%%+ 0
.%%0 1
Utils%%1 6
.%%6 7
ValidarToken%%7 C
(%%C D
_settingsApi%%E Q
,%%Q R$
str_valida_transferencia%%S k
)%%l m
.%%m n
Result%%n t
;%%t u
	respuesta&& !
=&&" #
validacion_token&&$ 4
.&&4 5
str_res_codigo&&5 C
.&&C D
Equals&&D J
(&&J K
$str&&L Q
)&&R S
?&&T U5
)ProcesarSolicitudValidacionTransferencias&&V 
(	&& Ä&
str_valida_transferencia
&&Å ô
,
&&ô ö
str_operacion
&&õ ®
)
&&© ™
:
&&´ ¨
validacion_token
&&≠ Ω
;
&&Ω æ
break'' 
;'' 
case)) 
$str)) ,
:)), -
string** !
str_add_transferencia** 4
=**5 6
JsonSerializer**7 E
.**E F
	Serialize**F O
(**O P
sol_tran**Q Y
)**Z [
;**[ \
validacion_token++ (
=++) *
Utils+++ 0
.++0 1
Utils++1 6
.++6 7
ValidarToken++7 C
(++C D
_settingsApi++E Q
,++Q R!
str_add_transferencia++S h
)++i j
.++j k
Result++k q
;++q r
	respuesta,, !
=,," #
validacion_token,,$ 4
.,,4 5
str_res_codigo,,5 C
.,,C D
Equals,,D J
(,,J K
$str,,L Q
),,R S
?,,T U2
&ProcesarSolicitudRealizaTransferencias,,V |
(,,| }"
str_add_transferencia	,,~ ì
,
,,ì î
str_operacion
,,ï ¢
)
,,£ §
:
,,• ¶
validacion_token
,,ß ∑
;
,,∑ ∏
break-- 
;-- 
case// 
$str// 6
://6 7
string00 
str_get_parametros00 1
=002 3
JsonSerializer004 B
.00B C
	Serialize00C L
(00L M
sol_tran00N V
)00W X
;00X Y
var11 
req_get_parametros11 .
=11/ 0
JsonSerializer111 ?
.11? @
Deserialize11@ K
<11K L 
ReqGetTransferencias11L `
>11` a
(11a b
str_get_parametros11c u
)11v w
!11w x
;11x y
	respuesta22 !
=22" #
new22$ '
TransferenciasNeg22( 9
(229 :
_settingsApi22; G
)22H I
.22I J'
get_consulta_transferencias22J e
(22e f
req_get_parametros22g y
,22y z
str_operacion	22{ à
)
22â ä
;
22ä ã
break33 
;33 
default55 
:55 
break66 
;66 
}88 
}99 
catch:: 
(:: 
	Exception:: 
):: 
{;; 
ResException<< 
resException<< )
=<<* +
new<<, /
ResException<<0 <
(<<< =
)<<= >
{== &
str_res_estado_transaccion>> .
=>>/ 0
$str>>1 6
,>>6 7
str_res_codigo?? "
=??# $
$str??% *
,??* +"
str_res_info_adicional@@ *
=@@+ ,
$str@@- a
}AA 
;AA 
returnBB 
resExceptionBB #
;BB# $
}CC 
returnEE 
	respuestaEE 
;EE 
}FF 	
publicII 
ObjectII *
ProcesarSolicitudBeneficiariosII 4
(II5 6
stringII7 =
str_sol_tranII> J
,IIJ K
stringIIL R
str_operacionIIS `
)IIa b
{JJ 	
ObjectKK 
	respuestaKK 
=KK 
newKK "
(KK" #
)KK# $
;KK$ %
tryLL 
{MM 
switchNN 
(NN 
str_operacionNN $
)NN$ %
{OO 
caseQQ 
$strQQ ,
:QQ, -
varRR  
req_add_beneficiarioRR 0
=RR1 2
JsonSerializerRR3 A
.RRA B
DeserializeRRB M
<RRM N
ReqAddBeneficiarioRRN `
>RR` a
(RRa b
str_sol_tranRRc o
)RRp q
;RRq r
	respuestaSS !
=SS" #
newSS$ '
BeneficiariosNegSS( 8
(SS8 9
_settingsApiSS: F
)SSG H
.SSH I
add_beneficiarioSSI Y
(SSY Z 
req_add_beneficiarioSS[ o
!SSo p
,SSp q
str_operacionSSr 
)
SSÄ Å
;
SSÅ Ç
breakTT 
;TT 
caseVV 
$strVV /
:VV/ 0
varWW #
req_update_beneficiarioWW 3
=WW4 5
JsonSerializerWW6 D
.WWD E
DeserializeWWE P
<WWP Q!
ReqUpdateBeneficiarioWWQ f
>WWf g
(WWg h
str_sol_tranWWi u
)WWv w
;WWw x
	respuestaXX !
=XX" #
newXX$ '
BeneficiariosNegXX( 8
(XX8 9
_settingsApiXX: F
)XXG H
.XXH I
update_beneficiarioXXI \
(XX\ ]#
req_update_beneficiarioXX^ u
!XXu v
,XXv w
str_operacion	XXx Ö
)
XXÜ á
;
XXá à
breakYY 
;YY 
case[[ 
$str[[ /
:[[/ 0
var\\ #
req_delete_beneficiario\\ 3
=\\4 5
JsonSerializer\\6 D
.\\D E
Deserialize\\E P
<\\P Q!
ReqDeleteBeneficiario\\Q f
>\\f g
(\\g h
str_sol_tran\\i u
)\\v w
;\\w x
	respuesta]] !
=]]" #
new]]$ '
BeneficiariosNeg]]( 8
(]]8 9
_settingsApi]]: F
)]]G H
.]]H I
delete_beneficiario]]I \
(]]\ ]#
req_delete_beneficiario]]^ u
!]]u v
,]]v w
str_operacion	]]x Ö
)
]]Ü á
;
]]á à
break^^ 
;^^ 
case`` 
$str`` ,
:``, -
varaa  
req_get_beneficiarioaa 0
=aa1 2
JsonSerializeraa3 A
.aaA B
DeserializeaaB M
<aaM N
ReqGetBeneficiarioaaN `
>aa` a
(aaa b
str_sol_tranaac o
)aap q
;aaq r
	respuestabb !
=bb" #
newbb$ '
BeneficiariosNegbb( 8
(bb8 9
_settingsApibb: F
)bbG H
.bbH I
get_beneficiariobbI Y
(bbY Z 
req_get_beneficiariobb[ o
!bbo p
,bbp q
str_operacionbbr 
)
bbÄ Å
;
bbÅ Ç
breakcc 
;cc 
caseee 
$stree 3
:ee3 4
varff !
get_ctas_beneficiarioff 1
=ff2 3
JsonSerializerff4 B
.ffB C
DeserializeffC N
<ffN O"
ReqCuentasBeneficiarioffO e
>ffe f
(fff g
str_sol_tranffh t
)ffu v
;ffv w
	respuestagg !
=gg" #
newgg$ '
BeneficiariosNeggg( 8
(gg8 9
_settingsApigg: F
)ggG H
.ggH I$
get_cuentas_beneficiarioggI a
(gga b!
get_ctas_beneficiarioggc x
!ggx y
,ggy z
str_operacion	gg{ à
)
ggâ ä
;
ggä ã
breakhh 
;hh 
casejj 
$strjj 9
:jj9 :
varkk  
valida_beneficiarioskk 0
=kk1 2
JsonSerializerkk3 A
.kkA B
DeserializekkB M
<kkM N!
ReqValidaBeneficiariokkN c
>kkc d
(kkd e
str_sol_trankkf r
)kks t
;kkt u
	respuestall !
=ll" #
newll$ '
BeneficiariosNegll( 8
(ll8 9
_settingsApill: F
)llG H
.llH I*
validar_registro_beneficiariosllI g
(llg h 
valida_beneficiarioslli }
!ll} ~
,ll~ 
str_operacion
llÄ ç
)
llé è
;
llè ê
breakmm 
;mm 
}nn 
}oo 
catchpp 
(pp 
	Exceptionpp 
)pp 
{qq 
ResExceptionrr 
resExceptionrr )
=rr* +
newrr, /
ResExceptionrr0 <
(rr< =
)rr= >
{ss &
str_res_estado_transacciontt .
=tt/ 0
$strtt1 6
,tt6 7
str_res_codigouu "
=uu# $
$struu% *
,uu* +"
str_res_info_adicionalvv *
=vv+ ,
$strvv- a
}ww 
;ww 
returnxx 
resExceptionxx #
;xx# $
}yy 
return{{ 
	respuesta{{ 
;{{ 
}|| 	
public~~ 
Object~~ 5
)ProcesarSolicitudValidacionTransferencias~~ ?
(~~@ A
string~~B H 
str_va_transferencia~~I ]
,~~] ^
string~~_ e
str_operacion~~f s
)~~t u
{ 	
Object
ÄÄ 
	respuesta
ÄÄ 
=
ÄÄ 
new
ÄÄ "
(
ÄÄ" #
)
ÄÄ# $
;
ÄÄ$ %
try
ÅÅ 
{
ÇÇ 
var
ÉÉ &
req_valida_transferencia
ÉÉ ,
=
ÉÉ- .
JsonSerializer
ÉÉ/ =
.
ÉÉ= >
Deserialize
ÉÉ> I
<
ÉÉI J(
ReqValidacionTransferencia
ÉÉJ d
>
ÉÉd e
(
ÉÉe f"
str_va_transferencia
ÉÉg {
)
ÉÉ| }
;
ÉÉ} ~
switch
ÖÖ 
(
ÖÖ &
req_valida_transferencia
ÖÖ /
!
ÖÖ/ 0
.
ÖÖ0 1-
str_nemonico_tipo_transferencia
ÖÖ1 P
)
ÖÖP Q
{
ÜÜ 
case
áá 
$str
áá 3
:
áá3 4
case
àà 
$str
àà 5
:
àà5 6
	respuesta
ââ !
=
ââ" #
new
ââ$ '
TransferenciasNeg
ââ( 9
(
ââ9 :
_settingsApi
ââ; G
)
ââH I
.
ââI J&
validar_transfer_interna
ââJ b
(
ââb c&
req_valida_transferencia
ââd |
!
ââ| }
,
ââ} ~
str_operacionââ å
)ââç é
;ââé è
break
ää 
;
ää 
case
åå 
$str
åå '
:
åå' (
	respuesta
çç !
=
çç" #
new
çç$ '
TransferenciasNeg
çç( 9
(
çç9 :
_settingsApi
çç; G
)
ççH I
.
ççI J+
get_val_transf_interbancarias
ççJ g
(
ççg h'
req_valida_transferenciaççi Å
!ççÅ Ç
,ççÇ É
str_operacionççÑ ë
)ççí ì
;ççì î
break
éé 
;
éé 
}
èè 
}
ëë 
catch
íí 
(
íí 
	Exception
íí 
)
íí 
{
ìì 
ResException
îî 
resException
îî )
=
îî* +
new
îî, /
ResException
îî0 <
(
îî< =
)
îî= >
{
ïï (
str_res_estado_transaccion
ññ .
=
ññ/ 0
$str
ññ1 6
,
ññ6 7
str_res_codigo
óó "
=
óó# $
$str
óó% *
,
óó* +$
str_res_info_adicional
òò *
=
òò+ ,
$str
òò- a
}
ôô 
;
ôô 
return
öö 
resException
öö #
;
öö# $
}
õõ 
return
ùù 
	respuesta
ùù 
;
ùù 
}
ûû 	
public
†† 
Object
†† 4
&ProcesarSolicitudRealizaTransferencias
†† <
(
††= >
string
††? E"
str_va_transferencia
††F Z
,
††Z [
string
††\ b
str_operacion
††c p
)
††q r
{
°° 	
Object
¢¢ 
	respuesta
¢¢ 
=
¢¢ 
new
¢¢ "
(
¢¢" #
)
¢¢# $
;
¢¢$ %
try
££ 
{
§§ 
var
•• #
req_add_transferencia
•• )
=
••* +
JsonSerializer
••, :
.
••: ;
Deserialize
••; F
<
••F G
ReqTransferencia
••G W
>
••W X
(
••X Y"
str_va_transferencia
••Z n
)
••o p
;
••p q
switch
ßß 
(
ßß #
req_add_transferencia
ßß ,
!
ßß, -
.
ßß- .-
str_nemonico_tipo_transferencia
ßß. M
)
ßßM N
{
®® 
case
©© 
$str
©© 3
:
©©3 4
case
™™ 
$str
™™ 5
:
™™5 6
	respuesta
´´ !
=
´´" #
new
´´$ '
TransferenciasNeg
´´( 9
(
´´9 :
_settingsApi
´´; G
)
´´H I
.
´´I J"
add_transfer_interna
´´J ^
(
´´^ _#
req_add_transferencia
´´` u
!
´´u v
,
´´v w
str_operacion´´x Ö
)´´Ü á
;´´á à
break
¨¨ 
;
¨¨ 
case
ÆÆ 
$str
ÆÆ '
:
ÆÆ' (
	respuesta
ØØ !
=
ØØ" #
new
ØØ$ '
TransferenciasNeg
ØØ( 9
(
ØØ9 :
_settingsApi
ØØ; G
)
ØØH I
.
ØØI J'
add_transf_interbancarias
ØØJ c
(
ØØc d#
req_add_transferencia
ØØe z
,
ØØz {
str_operacionØØ| â
)ØØä ã
;ØØã å
break
∞∞ 
;
∞∞ 
}
±± 
}
≥≥ 
catch
¥¥ 
(
¥¥ 
	Exception
¥¥ 
)
¥¥ 
{
µµ 
ResException
∂∂ 
resException
∂∂ )
=
∂∂* +
new
∂∂, /
ResException
∂∂0 <
(
∂∂< =
)
∂∂= >
{
∑∑ (
str_res_estado_transaccion
∏∏ .
=
∏∏/ 0
$str
∏∏1 6
,
∏∏6 7
str_res_codigo
ππ "
=
ππ# $
$str
ππ% *
,
ππ* +$
str_res_info_adicional
∫∫ *
=
∫∫+ ,
$str
∫∫- a
}
ªª 
;
ªª 
return
ºº 
resException
ºº #
;
ºº# $
}
ΩΩ 
return
øø 
	respuesta
øø 
;
øø 
}
¿¿ 	
}
¡¡ 
}¬¬ 