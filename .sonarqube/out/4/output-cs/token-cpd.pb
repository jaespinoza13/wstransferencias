��
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
req_add_beneficiario	l �
,
� �
str_operacion
� �
,
� �

MethodBase
� �
.
� �
GetCurrentMethod
� �
(
� �
)
� �
!
� �
.
� �
Name
� �
,
� �
	str_clase
� �
)
� �
;
� �
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
req_add_beneficiario	p �
)
� �
;
� �
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
	exception	&& �
)
&&� �
;
&&� �
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
req_update_beneficiario	33r �
,
33� �
str_operacion
33� �
,
33� �

MethodBase
33� �
.
33� �
GetCurrentMethod
33� �
(
33� �
)
33� �
!
33� �
.
33� �
Name
33� �
,
33� �
	str_clase
33� �
)
33� �
;
33� �
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
	exception	?? �
)
??� �
;
??� �
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
req_delete_beneficiario	LLr �
,
LL� �
str_operacion
LL� �
,
LL� �

MethodBase
LL� �
.
LL� �
GetCurrentMethod
LL� �
(
LL� �
)
LL� �
!
LL� �
.
LL� �
Name
LL� �
,
LL� �
	str_clase
LL� �
)
LL� �
;
LL� �
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
	exception	XX �
)
XX� �
;
XX� �
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
req_get_beneficiario	eel �
,
ee� �
str_operacion
ee� �
,
ee� �

MethodBase
ee� �
.
ee� �
GetCurrentMethod
ee� �
(
ee� �
)
ee� �
!
ee� �
.
ee� �
Name
ee� �
,
ee� �
	str_clase
ee� �
)
ee� �
;
ee� �
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
ConjuntoDatos	pp} �
)
pp� �
res_tran
pp� �
.
pp� �
cuerpo
pp� �
)
pp� �
;
pp� �
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
	exception	tt �
)
tt� �
;
tt� �
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
str_operacion	}}z �
)
}}� �
{~~ 	
var
�� 
	respuesta
�� 
=
�� 
new
�� #
ResValidaBeneficiario
��  5
(
��5 6
)
��6 7
;
��7 8
	respuesta
�� 
.
�� 
LlenarResHeader
�� %
(
��% &#
validar_beneficiarios
��' <
)
��= >
;
��> ?#
validar_beneficiarios
�� !
.
��! " 
str_id_transaccion
��" 4
=
��5 6
Utils
��7 <
.
��< =
ServiceLogs
��= H
.
��H I
SaveHeaderLogs
��I W
<
��W X#
ReqValidaBeneficiario
��X m
>
��m n
(
��n o$
validar_beneficiarios��p �
,��� �
str_operacion��� �
,��� �

MethodBase��� �
.��� � 
GetCurrentMethod��� �
(��� �
)��� �
!��� �
.��� �
Name��� �
,��� �
	str_clase��� �
)��� �
;��� �
	respuesta
�� 
.
��  
str_id_transaccion
�� (
=
��) *#
validar_beneficiarios
��+ @
.
��@ A 
str_id_transaccion
��A S
;
��S T
try
�� 
{
�� 
var
�� 
res_tran
�� 
=
�� 
new
�� "
BeneficiariosDat
��# 3
(
��3 4
_settingsApi
��5 A
)
��B C
.
��C D,
validar_registro_beneficiarios
��D b
(
��b c#
validar_beneficiarios
��d y
)
��z {
;
��{ |
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 4
=
��5 6
res_tran
��7 ?
.
��? @
codigo
��@ F
.
��F G
Equals
��G M
(
��M N
$str
��O T
)
��U V
?
��W X
$str
��Y ]
:
��^ _
$str
��` e
;
��e f
	respuesta
�� 
.
�� 
bl_requiere_otp
�� )
=
��* +
Utils
��, 1
.
��1 2
Utils
��2 7
.
��7 8
ValidaRequiereOtp
��8 I
(
��I J
_settingsApi
��K W
,
��W X#
validar_beneficiarios
��Y n
,
��n o
str_operacion
��p }
)
��~ 
.�� �
Result��� �
.��� �
codigo��� �
.��� �
Equals��� �
(��� �
$str��� �
)��� �
;��� �
	respuesta
�� 
.
�� 
str_res_codigo
�� (
=
��) *
res_tran
��+ 3
.
��3 4
codigo
��4 :
;
��: ;
	respuesta
�� 
.
�� $
str_res_info_adicional
�� 0
=
��1 2
res_tran
��3 ;
.
��; <
diccionario
��< G
[
��G H
$str
��H S
]
��S T
.
��T U
ToString
��U ]
(
��] ^
)
��^ _
;
��_ `
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
�� 
Utils
�� 
.
�� 
ServiceLogs
�� !
.
��! "
SaveExceptionLogs
��" 3
(
��3 4
	respuesta
��5 >
,
��> ?
str_operacion
��@ M
,
��M N

MethodBase
��O Y
.
��Y Z
GetCurrentMethod
��Z j
(
��j k
)
��k l
!
��l m
.
��m n
Name
��n r
,
��r s
	str_clase
��t }
,
��} ~
	exception�� �
)��� �
;��� �
throw
�� 
;
�� 
}
�� 
Utils
�� 
.
�� 
ServiceLogs
�� 
.
�� 
SaveResponseLogs
�� .
(
��. /
	respuesta
��0 9
,
��9 :
str_operacion
��; H
,
��H I

MethodBase
��J T
.
��T U
GetCurrentMethod
��U e
(
��e f
)
��f g
!
��g h
.
��h i
Name
��i m
,
��m n
	str_clase
��o x
)
��y z
;
��z {
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� $
ResCuentasBeneficiario
�� %&
get_cuentas_beneficiario
��& >
(
��? @$
ReqCuentasBeneficiario
��A W&
req_cuentas_beneficiario
��X p
,
��p q
string
��r x
str_operacion��y �
)��� �
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� $
ResCuentasBeneficiario
��  6
(
��6 7
)
��7 8
;
��8 9
	respuesta
�� 
.
�� 
LlenarResHeader
�� %
(
��% &&
req_cuentas_beneficiario
��' ?
)
��@ A
;
��A B&
req_cuentas_beneficiario
�� $
.
��$ % 
str_id_transaccion
��% 7
=
��8 9
Utils
��: ?
.
��? @
ServiceLogs
��@ K
.
��K L
SaveHeaderLogs
��L Z
<
��Z [$
ReqCuentasBeneficiario
��[ q
>
��q r
(
��r s'
req_cuentas_beneficiario��t �
,��� �
str_operacion��� �
,��� �

MethodBase��� �
.��� � 
GetCurrentMethod��� �
(��� �
)��� �
!��� �
.��� �
Name��� �
,��� �
	str_clase��� �
)��� �
;��� �
	respuesta
�� 
.
��  
str_id_transaccion
�� (
=
��) *&
req_cuentas_beneficiario
��+ C
.
��C D 
str_id_transaccion
��D V
;
��V W
try
�� 
{
�� "
RespuestaTransaccion
�� $
res_tran
��% -
=
��. /
new
��0 3
BeneficiariosDat
��4 D
(
��D E
_settingsApi
��F R
)
��S T
.
��T U#
get_ctas_beneficiario
��U j
(
��j k'
req_cuentas_beneficiario��l �
)��� �
;��� �
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 4
=
��5 6
res_tran
��7 ?
.
��? @
codigo
��@ F
.
��F G
Equals
��G M
(
��M N
$str
��O T
)
��U V
?
��W X
$str
��Y ]
:
��^ _
$str
��` e
;
��e f
	respuesta
�� 
.
�� 
str_res_codigo
�� (
=
��) *
res_tran
��+ 3
.
��3 4
codigo
��4 :
;
��: ;
	respuesta
�� 
.
�� &
lst_cuentas_beneficiario
�� 2
=
��3 4
Utils
��5 :
.
��: ;
Utils
��; @
.
��@ A-
ConvertConjuntoDatosToListClass
��A `
<
��` a$
ResCuentasBeneficiario
��a w
.
��w x"
CuentasBeneficiario��x �
>��� �
(��� �
(��� �
ConjuntoDatos��� �
)��� �
res_tran��� �
.��� �
cuerpo��� �
)��� �
;��� �
	respuesta
�� 
.
�� $
str_res_info_adicional
�� 0
=
��1 2
res_tran
��3 ;
.
��; <
diccionario
��< G
[
��G H
$str
��H S
]
��S T
.
��T U
ToString
��U ]
(
��] ^
)
��^ _
;
��_ `
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
�� 
Utils
�� 
.
�� 
ServiceLogs
�� !
.
��! "
SaveExceptionLogs
��" 3
(
��3 4
	respuesta
��5 >
,
��> ?
str_operacion
��@ M
,
��M N

MethodBase
��O Y
.
��Y Z
GetCurrentMethod
��Z j
(
��j k
)
��k l
!
��l m
.
��m n
Name
��n r
,
��r s
	str_clase
��t }
,
��} ~
	exception�� �
)��� �
;��� �
throw
�� 
;
�� 
}
�� 
Utils
�� 
.
�� 
ServiceLogs
�� 
.
�� 
SaveResponseLogs
�� .
(
��. /
	respuesta
��0 9
,
��9 :
str_operacion
��; H
,
��H I

MethodBase
��J T
.
��T U
GetCurrentMethod
��U e
(
��e f
)
��f g
!
��g h
.
��h i
Name
��i m
,
��m n
	str_clase
��o x
)
��y z
;
��z {
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
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
str_operacion	} �
)
� �
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
req_validar_transferencia	y �
,
� �
str_operacion
� �
,
� �

MethodBase
� �
.
� �
GetCurrentMethod
� �
(
� �
)
� �
!
� �
.
� �
Name
� �
,
� �
	str_clase
� �
)
� �
;
� �
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
;	## �
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
cabecera	//y �
)
//� �
;
//� �
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
==	11~ �
$str
11� �
)
11� �
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
set_envio_transf_por_spi	88x �
(
88� �
obj_transferencia
88� �
!
88� �
)
88� �
;
88� �
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
)	?? �
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
'codigo_error_datos_incorrectos_coopmego	CCY �
;
CC� �&
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
GetCurrentMethod	FFz �
(
FF� �
)
FF� �
!
FF� �
.
FF� �
Name
FF� �
,
FF� �
	str_clase
FF� �
)
FF� �
;
FF� �
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
TT� �
)
TT� �
;
TT� �
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
str_operacion	cc~ �
,
cc� �

MethodBase
cc� �
.
cc� �
GetCurrentMethod
cc� �
(
cc� �
)
cc� �
!
cc� �
.
cc� �
Name
cc� �
,
cc� �
	str_clase
cc� �
)
cc� �
;
cc� �
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
ResTransferencia	ppq �
)
pp� �
)
pp� �
;
pp� �
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
)	uu �
)
uu� �
;
uu� �
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
�� 
(
�� 
datos_validados
�� &
.
��& '
int_enviar_banred
��' 8
==
��9 ;
$num
��< =
&&
��> @
datos_validados
��A P
.
��P Q

int_estado
��Q [
==
��\ ^
$num
��_ `
)
��` a
{
�� 
Cabecera
��  
cabecera
��! )
=
��* +
llenar_cabecera
��, ;
(
��; <
req_transferencia
��= N
)
��O P
;
��P Q#
ejecutar_pago_directo
�� -
(
��- .
datos_validados
��/ >
,
��> ?
cabecera
��@ H
)
��I J
;
��J K
	respuesta
�� !
=
��" #
datos_validados
��$ 3
;
��3 4
}
�� 
else
�� 
{
�� 
	respuesta
�� !
.
��! "(
str_res_estado_transaccion
��" <
=
��= >
res_tran
��? G
.
��G H
codigo
��H N
.
��N O
Equals
��O U
(
��U V
$str
��W \
)
��] ^
?
��_ `
$str
��a e
:
��f g
$str
��h m
;
��m n
	respuesta
�� !
.
��! "
str_res_codigo
��" 0
=
��1 2
res_tran
��3 ;
.
��; <
codigo
��< B
;
��B C
	respuesta
�� !
.
��! "$
str_res_info_adicional
��" 8
=
��9 :
res_tran
��; C
.
��C D
diccionario
��D O
[
��O P
$str
��P [
]
��[ \
.
��\ ]
ToString
��] e
(
��e f
)
��f g
;
��g h
return
�� 
	respuesta
�� (
;
��( )
}
�� 
}
�� 
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 4
=
��5 6
res_tran
��7 ?
.
��? @
codigo
��@ F
.
��F G
Equals
��G M
(
��M N
$str
��O T
)
��U V
?
��W X
$str
��Y ]
:
��^ _
$str
��` e
;
��e f
	respuesta
�� 
.
�� 
str_res_codigo
�� (
=
��) *
res_tran
��+ 3
.
��3 4
codigo
��4 :
;
��: ;
	respuesta
�� 
.
�� $
str_res_info_adicional
�� 0
=
��1 2
res_tran
��3 ;
.
��; <
diccionario
��< G
[
��G H
$str
��H S
]
��S T
.
��T U
ToString
��U ]
(
��] ^
)
��^ _
;
��_ `
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
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
ex
��1 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
)
��? @
;
��@ A
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
ResGetTransferencias
�� #)
get_consulta_transferencias
��$ ?
(
��@ A"
ReqGetTransferencias
��B V#
req_get_tranferencias
��W l
,
��l m
string
��n t
str_operacion��u �
)��� �
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
ResGetTransferencias
��  4
(
��4 5
)
��5 6
;
��6 7
	respuesta
�� 
.
�� 
LlenarResHeader
�� %
(
��% &#
req_get_tranferencias
��' <
)
��= >
;
��> ?#
req_get_tranferencias
�� !
.
��! " 
str_id_transaccion
��" 4
=
��5 6
ServiceLogs
��7 B
.
��B C
SaveHeaderLogs
��C Q
<
��Q R"
ReqGetTransferencias
��R f
>
��f g
(
��g h#
req_get_tranferencias
��i ~
,
��~ 
str_operacion��� �
,��� �

MethodBase��� �
.��� � 
GetCurrentMethod��� �
(��� �
)��� �
!��� �
.��� �
Name��� �
,��� �
	str_clase��� �
)��� �
;��� �
	respuesta
�� 
.
��  
str_id_transaccion
�� (
=
��) *#
req_get_tranferencias
��+ @
.
��@ A 
str_id_transaccion
��A S
;
��S T
try
�� 
{
�� "
RespuestaTransaccion
�� $
res_tran
��% -
=
��. /
new
��0 3
TransferenciasDat
��4 E
(
��E F
_settingsApi
��G S
)
��T U
.
��U V)
get_consulta_transferencias
��V q
(
��q r$
req_get_tranferencias��s �
)��� �
;��� �
	respuesta
�� 
.
�� 
lst_tranferencias
�� +
=
��, -
Utils
��. 3
.
��3 4
Utils
��4 9
.
��9 :-
ConvertConjuntoDatosToListClass
��: Y
<
��Y Z
Transferencias
��Z h
>
��h i
(
��i j
(
��k l
ConjuntoDatos
��l y
)
��y z
res_tran��{ �
.��� �
cuerpo��� �
)��� �
;��� �
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 4
=
��5 6
(
��7 8
res_tran
��8 @
.
��@ A
codigo
��A G
.
��G H
Equals
��H N
(
��N O
$str
��P U
)
��V W
)
��W X
?
��Y Z
$str
��[ _
:
��` a
$str
��b g
;
��g h
	respuesta
�� 
.
�� 
str_res_codigo
�� (
=
��) *
res_tran
��+ 3
.
��3 4
codigo
��4 :
;
��: ;
	respuesta
�� 
.
�� $
str_res_info_adicional
�� 0
=
��1 2
res_tran
��3 ;
.
��; <
diccionario
��< G
[
��G H
$str
��H S
]
��S T
.
��T U
ToString
��U ]
(
��] ^
)
��^ _
;
��_ `
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
�� 
ServiceLogs
�� 
.
�� 
SaveExceptionLogs
�� -
(
��- .
	respuesta
��/ 8
,
��8 9
str_operacion
��: G
,
��G H

MethodBase
��I S
.
��S T
GetCurrentMethod
��T d
(
��d e
)
��e f
!
��f g
.
��g h
Name
��h l
,
��l m
	str_clase
��n w
,
��w x
	exception��y �
)��� �
;��� �
throw
�� 
;
�� 
}
�� 
ServiceLogs
�� 
.
�� 
SaveResponseLogs
�� (
(
��( )
	respuesta
��* 3
,
��3 4
str_operacion
��5 B
,
��B C

MethodBase
��D N
.
��N O
GetCurrentMethod
��O _
(
��_ `
)
��` a
!
��a b
.
��b c
Name
��c g
,
��g h
	str_clase
��i r
)
��s t
;
��t u
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
�� #
ProcesarSolicitud
��$ 5
(
��6 7"
SolicitudTransaccion
��8 L
sol_tran
��M U
,
��U V
string
��W ]
str_operacion
��^ k
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
�� 
var
�� 
req_transaccion
�� #
=
��$ %
JsonSerializer
��& 4
.
��4 5
Deserialize
��5 @
<
��@ A
Transaccion
��A L
>
��L M
(
��M N
JsonSerializer
��O ]
.
��] ^
	Serialize
��^ g
(
��g h
sol_tran
��i q
.
��q r
cuerpo
��r x
)
��y z
)
��{ |
;
��| }
switch
�� 
(
�� 
req_transaccion
�� &
!
��& '
.
��' (
str_tipo_tran
��( 5
)
��5 6
{
�� 
case
�� 
$str
�� 
:
��  
case
�� 
$str
�� 
:
��  
case
�� 
$str
�� 
:
��  
	respuesta
�� !
=
��" #
pagar
��$ )
(
��) *
sol_tran
��+ 3
)
��4 5
;
��5 6
break
�� 
;
�� 
default
�� 
:
�� 
	respuesta
�� !
=
��" #
validar
��$ +
(
��+ ,
sol_tran
��- 5
)
��6 7
;
��7 8
break
�� 
;
�� 
}
�� 
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
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
ex
��1 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
)
��? @
;
��@ A
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
�� #
validar
��$ +
(
��, -"
SolicitudTransaccion
��. B
sol_tran
��C K
)
��L M
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
�� 
	respuesta
�� 
=
�� 
conectar_banred
�� +
(
��+ ,
sol_tran
��- 5
)
��6 7
;
��7 8
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
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
ex
��1 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
)
��? @
;
��@ A
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
�� #
pagar
��$ )
(
��* +"
SolicitudTransaccion
��, @
sol_tran
��A I
)
��J K
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
�� 
var
�� 
req_transaccion
�� #
=
��$ %
JsonSerializer
��& 4
.
��4 5
Deserialize
��5 @
<
��@ A
Transaccion
��A L
>
��L M
(
��M N
JsonSerializer
��O ]
.
��] ^
	Serialize
��^ g
(
��g h
sol_tran
��i q
.
��q r
cuerpo
��r x
)
��y z
)
��{ |
;
��| }
	respuesta
�� 
=
�� 
conectar_banred
�� +
(
��+ ,
sol_tran
��- 5
)
��6 7
;
��7 8
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
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
ex
��1 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
)
��? @
;
��@ A
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
validaciones_pago_directo
��$ =
(
��> ?
ResTransferencia
��@ P
datos_validados
��Q `
,
��` a
Cabecera
��b j
cabecera
��k s
)
��t u
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
�� 
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
datos_validados
��# 2
;
��2 3
Transaccion
�� *
datos_para_validacion_banred
�� 8
=
��9 :
new
��; >
Transaccion
��? J
(
��J K
)
��K L
;
��L M*
datos_para_validacion_banred
�� ,
.
��, -
int_secuencial
��- ;
=
��< =
datos_validados
��> M
.
��M N
int_secuencial
��N \
;
��\ ]*
datos_para_validacion_banred
�� ,
.
��, -

int_fi_aut
��- 7
=
��8 9
datos_validados
��: I
.
��I J

int_fi_aut
��J T
;
��T U*
datos_para_validacion_banred
�� ,
.
��, -
str_bin_aut
��- 8
=
��9 :
datos_validados
��; J
.
��J K
str_bin_aut
��K V
;
��V W*
datos_para_validacion_banred
�� ,
.
��, -
str_nom_ordenante
��- >
=
��? @
datos_validados
��A P
.
��P Q"
str_nombre_ordenante
��Q e
;
��e f*
datos_para_validacion_banred
�� ,
.
��, -"
str_cuenta_ordenante
��- A
=
��B C
datos_validados
��D S
.
��S T#
str_num_cta_ordenante
��T i
;
��i j*
datos_para_validacion_banred
�� ,
.
��, -*
str_identificacion_ordenante
��- I
=
��J K
datos_validados
��L [
.
��[ \#
str_num_doc_ordenante
��\ q
;
��q r*
datos_para_validacion_banred
�� ,
.
��, -
str_nom_receptor
��- =
=
��> ?
datos_validados
��@ O
.
��O P
str_nombre_benef
��P `
;
��` a*
datos_para_validacion_banred
�� ,
.
��, -!
str_cuenta_receptor
��- @
=
��A B
datos_validados
��C R
.
��R S
str_num_cta_benef
��S d
;
��d e*
datos_para_validacion_banred
�� ,
.
��, -
str_cuenta_bce
��- ;
=
��< =
datos_validados
��> M
.
��M N#
str_cta_bce_ifi_benef
��N c
;
��c d*
datos_para_validacion_banred
�� ,
.
��, -&
str_tipo_cuenta_receptor
��- E
=
��F G
datos_validados
��H W
.
��W X 
str_tipo_cta_benef
��X j
;
��j k*
datos_para_validacion_banred
�� ,
.
��, - 
str_info_adicional
��- ?
=
��@ A
datos_validados
��B Q
.
��Q R 
str_info_adicional
��R d
;
��d e*
datos_para_validacion_banred
�� ,
.
��, -)
str_identificacion_receptor
��- H
=
��I J
datos_validados
��K Z
.
��Z [
str_num_doc_benef
��[ l
;
��l m*
datos_para_validacion_banred
�� ,
.
��, -"
int_secuencial_cobis
��- A
=
��B C
datos_validados
��D S
.
��S T
int_id_debito
��T a
;
��a b*
datos_para_validacion_banred
�� ,
.
��, -
dec_monto_tran
��- ;
=
��< =
datos_validados
��> M
.
��M N
dec_monto_tran
��N \
;
��\ ]*
datos_para_validacion_banred
�� ,
.
��, -
str_observaciones
��- >
=
��? @
datos_validados
��A P
.
��P Q
str_observaciones
��Q b
;
��b c
switch
�� 
(
�� 
datos_validados
�� &
.
��& ' 
str_tipo_cta_benef
��' 9
)
��9 :
{
�� 
case
�� 
$str
�� 
:
�� *
datos_para_validacion_banred
�� 4
.
��4 5&
str_tipo_cuenta_receptor
��5 M
=
��N O
$str
��P T
;
��T U*
datos_para_validacion_banred
�� 4
.
��4 5
str_tipo_tran
��5 B
=
��C D
$str
��E L
;
��L M
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� *
datos_para_validacion_banred
�� 4
.
��4 5&
str_tipo_cuenta_receptor
��5 M
=
��N O
$str
��P T
;
��T U*
datos_para_validacion_banred
�� 4
.
��4 5
str_tipo_tran
��5 B
=
��C D
$str
��E L
;
��L M
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� *
datos_para_validacion_banred
�� 4
.
��4 5&
str_tipo_cuenta_receptor
��5 M
=
��N O
$str
��P T
;
��T U*
datos_para_validacion_banred
�� 4
.
��4 5
str_tipo_tran
��5 B
=
��C D
$str
��E L
;
��L M
break
�� 
;
�� 
}
�� *
datos_para_validacion_banred
�� ,
.
��, -
str_nom_receptor
��- =
=
��> ?
$str
��@ B
;
��B C*
datos_para_validacion_banred
�� ,
.
��, -
str_observaciones
��- >
=
��? @
$str
��A C
;
��C D"
SolicitudTransaccion
�� $
sol_tran
��% -
=
��. /
new
��0 3"
SolicitudTransaccion
��4 H
(
��H I
)
��I J
;
��J K
sol_tran
�� 
.
�� 
cuerpo
�� 
=
��  !*
datos_para_validacion_banred
��" >
;
��> ?
sol_tran
�� 
.
�� 
cabecera
�� !
=
��" #
cabecera
��$ ,
;
��, -
	respuesta
�� 
=
�� 
ProcesarSolicitud
�� -
(
��- .
sol_tran
��/ 7
,
��7 8
$str
��9 ;
)
��< =
;
��= >
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
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
ex
��1 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
)
��? @
;
��@ A
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
�� #
conectar_banred
��$ 3
(
��4 5"
SolicitudTransaccion
��6 J
sol_tran
��K S
)
��T U
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� "
RespuestaTransaccion
��  4
(
��4 5
)
��5 6
;
��6 7
try
�� 
{
�� 
string
�� 
url
�� 
=
�� 
_settingsApi
�� )
.
��) *
servicio_banred
��* 9
;
��9 :
string
�� 
content_type
�� #
=
��$ %$
ApplicationContenTypes
��& <
.
��< =
	JSON_UTF8
��= F
;
��F G
string
�� 
str_usuario
�� "
=
��# $
_settingsApi
��% 1
.
��1 2
user_ws_banred
��2 @
;
��@ A
string
�� 
str_contrasenia
�� &
=
��' (
_settingsApi
��) 5
.
��5 6
pass_ws_banred
��6 D
;
��D E

RestClient
�� 
rest_client
�� &
=
��' (
new
��) ,

RestClient
��- 7
(
��7 8
url
��9 <
,
��< =
content_type
��> J
,
��J K
str_usuario
��L W
,
��W X
str_contrasenia
��Y h
)
��i j
;
��j k
var
�� 
obj
�� 
=
�� 
rest_client
�� %
.
��% &!
post_string_content
��& 9
(
��9 :
sol_tran
��; C
)
��D E
;
��E F
	respuesta
�� 
=
�� 
JsonSerializer
�� *
.
��* +
Deserialize
��+ 6
<
��6 7"
RespuestaTransaccion
��7 K
>
��K L
(
��L M
obj
��N Q
.
��Q R
ToString
��R Z
(
��Z [
)
��[ \
!
��\ ]
)
��^ _
;
��_ `
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
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
ex
��1 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
)
��? @
;
��@ A
}
�� 
return
�� 
	respuesta
�� 
!
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
Cabecera
�� 
llenar_cabecera
�� .
(
��/ 0
ReqTransferencia
��1 A
obj
��B E
)
��F G
{
�� 	
Cabecera
�� 
cabecera
�� 
=
�� 
new
��  #
Cabecera
��$ ,
(
��, -
)
��- .
;
��. /
cabecera
�� 
.
�� 
int_sistema
��  
=
��! "
Convert
��# *
.
��* +
ToInt32
��+ 2
(
��2 3
obj
��4 7
.
��7 8
str_id_sistema
��8 F
)
��G H
;
��H I
cabecera
�� 
.
�� 
str_usuario
��  
=
��! "
obj
��# &
.
��& '
	str_login
��' 0
;
��0 1
cabecera
�� 
.
�� 

int_perfil
�� 
=
��  !
Convert
��" )
.
��) *
ToInt32
��* 1
(
��1 2
obj
��3 6
.
��6 7
str_id_oficina
��7 E
)
��F G
;
��G H
cabecera
�� 
.
�� 
int_oficina
��  
=
��! "
Convert
��# *
.
��* +
ToInt32
��+ 2
(
��2 3
obj
��4 7
.
��7 8
str_id_oficina
��8 F
)
��G H
;
��H I
cabecera
�� 
.
��  
str_nemonico_canal
�� '
=
��( )
obj
��* -
.
��- . 
str_nemonico_canal
��. @
;
��@ A
cabecera
�� 
.
�� 
str_ip
�� 
=
�� 
obj
�� !
.
��! " 
str_ip_dispositivo
��" 4
;
��4 5
cabecera
�� 
.
�� 
str_session
��  
=
��! "
obj
��# &
.
��& '

str_sesion
��' 1
;
��1 2
cabecera
�� 
.
�� 
str_mac
�� 
=
�� 
obj
�� "
.
��" # 
str_ip_dispositivo
��# 5
;
��5 6
return
�� 
cabecera
�� 
;
�� 
}
�� 	
public
�� "
RespuestaTransaccion
�� ##
ejecutar_pago_directo
��$ 9
(
��: ;
ResTransferencia
��< L
datos_validados
��M \
,
��\ ]
Cabecera
��^ f
cabecera
��g o
)
��p q
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
�� 
	respuesta
�� 
.
�� 
cuerpo
��  
=
��! "
datos_validados
��# 2
;
��2 3
Transaccion
�� *
datos_para_validacion_banred
�� 8
=
��9 :
new
��; >
Transaccion
��? J
(
��J K
)
��K L
;
��L M*
datos_para_validacion_banred
�� ,
.
��, -
int_secuencial
��- ;
=
��< =
datos_validados
��> M
.
��M N
int_secuencial
��N \
;
��\ ]*
datos_para_validacion_banred
�� ,
.
��, -

int_fi_aut
��- 7
=
��8 9
datos_validados
��: I
.
��I J

int_fi_aut
��J T
;
��T U*
datos_para_validacion_banred
�� ,
.
��, -
str_bin_aut
��- 8
=
��9 :
datos_validados
��; J
.
��J K
str_bin_aut
��K V
;
��V W*
datos_para_validacion_banred
�� ,
.
��, -
str_nom_ordenante
��- >
=
��? @
datos_validados
��A P
.
��P Q"
str_nombre_ordenante
��Q e
;
��e f*
datos_para_validacion_banred
�� ,
.
��, -"
str_cuenta_ordenante
��- A
=
��B C
datos_validados
��D S
.
��S T#
str_num_cta_ordenante
��T i
;
��i j*
datos_para_validacion_banred
�� ,
.
��, -*
str_identificacion_ordenante
��- I
=
��J K
datos_validados
��L [
.
��[ \#
str_num_doc_ordenante
��\ q
;
��q r*
datos_para_validacion_banred
�� ,
.
��, -
str_nom_receptor
��- =
=
��> ?
datos_validados
��@ O
.
��O P
str_nombre_benef
��P `
;
��` a*
datos_para_validacion_banred
�� ,
.
��, -!
str_cuenta_receptor
��- @
=
��A B
datos_validados
��C R
.
��R S
str_num_cta_benef
��S d
;
��d e*
datos_para_validacion_banred
�� ,
.
��, -
str_cuenta_bce
��- ;
=
��< =
datos_validados
��> M
.
��M N#
str_cta_bce_ifi_benef
��N c
;
��c d*
datos_para_validacion_banred
�� ,
.
��, -&
str_tipo_cuenta_receptor
��- E
=
��F G
datos_validados
��H W
.
��W X 
str_tipo_cta_benef
��X j
;
��j k*
datos_para_validacion_banred
�� ,
.
��, - 
str_info_adicional
��- ?
=
��@ A
datos_validados
��B Q
.
��Q R 
str_info_adicional
��R d
;
��d e*
datos_para_validacion_banred
�� ,
.
��, -)
str_identificacion_receptor
��- H
=
��I J
datos_validados
��K Z
.
��Z [
str_num_doc_benef
��[ l
;
��l m*
datos_para_validacion_banred
�� ,
.
��, -"
int_secuencial_cobis
��- A
=
��B C
datos_validados
��D S
.
��S T
int_id_debito
��T a
;
��a b*
datos_para_validacion_banred
�� ,
.
��, -
dec_monto_tran
��- ;
=
��< =
datos_validados
��> M
.
��M N
dec_monto_tran
��N \
;
��\ ]*
datos_para_validacion_banred
�� ,
.
��, -
str_observaciones
��- >
=
��? @
datos_validados
��A P
.
��P Q
str_observaciones
��Q b
;
��b c
switch
�� 
(
�� 
datos_validados
�� &
.
��& ' 
str_tipo_cta_benef
��' 9
)
��9 :
{
�� 
case
�� 
$str
�� 
:
�� *
datos_para_validacion_banred
�� 4
.
��4 5&
str_tipo_cuenta_receptor
��5 M
=
��N O
$str
��P T
;
��T U*
datos_para_validacion_banred
�� 4
.
��4 5
str_tipo_tran
��5 B
=
��C D
$str
��E K
;
��K L
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� *
datos_para_validacion_banred
�� 4
.
��4 5&
str_tipo_cuenta_receptor
��5 M
=
��N O
$str
��P T
;
��T U*
datos_para_validacion_banred
�� 4
.
��4 5
str_tipo_tran
��5 B
=
��C D
$str
��E K
;
��K L
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� *
datos_para_validacion_banred
�� 4
.
��4 5&
str_tipo_cuenta_receptor
��5 M
=
��N O
$str
��P T
;
��T U*
datos_para_validacion_banred
�� 4
.
��4 5
str_tipo_tran
��5 B
=
��C D
$str
��E K
;
��K L
break
�� 
;
�� 
}
�� *
datos_para_validacion_banred
�� ,
.
��, -
str_nom_receptor
��- =
=
��> ?
$str
��@ B
;
��B C*
datos_para_validacion_banred
�� ,
.
��, -
str_observaciones
��- >
=
��? @
$str
��A C
;
��C D"
SolicitudTransaccion
�� $
sol_tran
��% -
=
��. /
new
��0 3"
SolicitudTransaccion
��4 H
(
��H I
)
��I J
;
��J K
sol_tran
�� 
.
�� 
cuerpo
�� 
=
��  !*
datos_para_validacion_banred
��" >
;
��> ?
sol_tran
�� 
.
�� 
cabecera
�� !
=
��" #
cabecera
��$ ,
;
��, -
ProcesarSolicitud
�� !
(
��! "
sol_tran
��# +
,
��+ ,
$str
��- /
)
��0 1
;
��1 2
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
ex
��1 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
)
��? @
;
��@ A
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
�� 
ResComun
�� &
validar_transfer_interna
�� 0
(
��1 2(
ReqValidacionTransferencia
��3 M'
req_validar_transferencia
��N g
,
��g h
string
��i o
str_operacion
��p }
)
��~ 
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� 
ResComun
��  (
(
��( )
)
��) *
;
��* +
	respuesta
�� 
.
�� 
LlenarResHeader
�� %
(
��% &'
req_validar_transferencia
��' @
)
��A B
;
��B C'
req_validar_transferencia
�� %
.
��% & 
str_id_transaccion
��& 8
=
��9 :
ServiceLogs
��; F
.
��F G
SaveHeaderLogs
��G U
<
��U V(
ReqValidacionTransferencia
��V p
>
��p q
(
��q r(
req_validar_transferencia��s �
,��� �
str_operacion��� �
,��� �

MethodBase��� �
.��� � 
GetCurrentMethod��� �
(��� �
)��� �
!��� �
.��� �
Name��� �
,��� �
	str_clase��� �
)��� �
;��� �
	respuesta
�� 
.
��  
str_id_transaccion
�� (
=
��) *'
req_validar_transferencia
��+ D
.
��D E 
str_id_transaccion
��E W
;
��W X
try
�� 
{
�� "
RespuestaTransaccion
�� $
res_tran
��% -
=
��. /
new
��0 3
TransferenciasDat
��4 E
(
��E F
_settingsApi
��G S
)
��T U
.
��U V&
validar_transfer_interna
��V n
(
��n o(
req_validar_transferencia��p �
)��� �
;��� �
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 4
=
��5 6
(
��7 8
res_tran
��8 @
.
��@ A
codigo
��A G
.
��G H
Equals
��H N
(
��N O
$str
��P U
)
��V W
)
��W X
?
��Y Z
$str
��[ _
:
��` a
$str
��b g
;
��g h
	respuesta
�� 
.
�� 
str_res_codigo
�� (
=
��) *
res_tran
��+ 3
.
��3 4
codigo
��4 :
;
��: ;
	respuesta
�� 
.
�� $
str_res_info_adicional
�� 0
=
��1 2
res_tran
��3 ;
.
��; <
diccionario
��< G
[
��G H
$str
��H S
]
��S T
.
��T U
ToString
��U ]
(
��] ^
)
��^ _
;
��_ `
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
�� 
ServiceLogs
�� 
.
�� 
SaveExceptionLogs
�� -
(
��- .
	respuesta
��/ 8
,
��8 9
str_operacion
��: G
,
��G H

MethodBase
��I S
.
��S T
GetCurrentMethod
��T d
(
��d e
)
��e f
!
��f g
.
��g h
Name
��h l
,
��l m
	str_clase
��n w
,
��w x
	exception��y �
)��� �
;��� �
throw
�� 
;
�� 
}
�� 
ServiceLogs
�� 
.
�� 
SaveResponseLogs
�� (
(
��( )
	respuesta
��* 3
,
��3 4
str_operacion
��5 B
,
��B C

MethodBase
��D N
.
��N O
GetCurrentMethod
��O _
(
��_ `
)
��` a
!
��a b
.
��b c
Name
��c g
,
��g h
	str_clase
��i r
)
��s t
;
��t u
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� 
ResComun
�� "
add_transfer_interna
�� ,
(
��- .
ReqTransferencia
��/ ?#
req_add_transferencia
��@ U
,
��U V
string
��W ]
str_operacion
��^ k
)
��l m
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� 
ResComun
��  (
(
��( )
)
��) *
;
��* +
	respuesta
�� 
.
�� 
LlenarResHeader
�� %
(
��% &#
req_add_transferencia
��' <
)
��= >
;
��> ?#
req_add_transferencia
�� !
.
��! " 
str_id_transaccion
��" 4
=
��5 6
ServiceLogs
��7 B
.
��B C
SaveHeaderLogs
��C Q
<
��Q R
ReqTransferencia
��R b
>
��b c
(
��c d#
req_add_transferencia
��e z
,
��z {
str_operacion��| �
,��� �

MethodBase��� �
.��� � 
GetCurrentMethod��� �
(��� �
)��� �
!��� �
.��� �
Name��� �
,��� �
	str_clase��� �
)��� �
;��� �
	respuesta
�� 
.
��  
str_id_transaccion
�� (
=
��) *#
req_add_transferencia
��+ @
.
��@ A 
str_id_transaccion
��A S
;
��S T
try
�� 
{
�� "
RespuestaTransaccion
�� $
res_tran
��% -
=
��. /
new
��0 3
TransferenciasDat
��4 E
(
��E F
_settingsApi
��G S
)
��T U
.
��U V'
add_transferencia_interna
��V o
(
��o p$
req_add_transferencia��q �
)��� �
;��� �
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 4
=
��5 6
(
��7 8
res_tran
��8 @
.
��@ A
codigo
��A G
.
��G H
Equals
��H N
(
��N O
$str
��P U
)
��V W
)
��W X
?
��Y Z
$str
��[ _
:
��` a
$str
��b g
;
��g h
	respuesta
�� 
.
�� 
str_res_codigo
�� (
=
��) *
res_tran
��+ 3
.
��3 4
codigo
��4 :
;
��: ;
	respuesta
�� 
.
�� $
str_res_info_adicional
�� 0
=
��1 2
res_tran
��3 ;
.
��; <
diccionario
��< G
[
��G H
$str
��H S
]
��S T
.
��T U
ToString
��U ]
(
��] ^
)
��^ _
;
��_ `
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
�� 
ServiceLogs
�� 
.
�� 
SaveExceptionLogs
�� -
(
��- .
	respuesta
��/ 8
,
��8 9
str_operacion
��: G
,
��G H

MethodBase
��I S
.
��S T
GetCurrentMethod
��T d
(
��d e
)
��e f
!
��f g
.
��g h
Name
��h l
,
��l m
	str_clase
��n w
,
��w x
	exception��y �
)��� �
;��� �
throw
�� 
;
�� 
}
�� 
ServiceLogs
�� 
.
�� 
SaveResponseLogs
�� (
(
��( )
	respuesta
��* 3
,
��3 4
str_operacion
��5 B
,
��B C

MethodBase
��D N
.
��N O
GetCurrentMethod
��O _
(
��_ `
)
��` a
!
��a b
.
��b c
Name
��c g
,
��g h
	str_clase
��i r
)
��s t
;
��t u
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
}44 �$
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
}88 �)
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
--� �
)
--� �
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
}FF �W
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
GeneraCadenaAleatoria	++n �
(
++� �
)
++� �
;
++� �
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
GeneraCadenaAleatoria	EEu �
(
EE� �
)
EE� �
;
EE� �
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
UU� �
	obj_error
UU� �
)
UU� �
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
	obj_error	__x �
)
__� �
;
__� �
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
GeneraCadenaAleatoria	``n �
(
``� �
)
``� �
;
``� �
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
pp� �
)
pp� �
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
cuerpo	~~| �
;
~~� �
infoLog 
. 
str_id_transaccion *
=+ ,
str_id_transaccion- ?
;? @
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
$str
��# (
;
��( )
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
infoLog
��. 5
.
��5 6
str_tipo
��6 >
,
��> ?
infoLog
��@ G
,
��G H
_settingsApi
��I U
.
��U V 
path_logs_amenazas
��V h
)
��i j
;
��j k
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
��  
str_id_transaccion
�� "
=
��# $
String
��% +
.
��+ ,
Empty
��, 1
;
��1 2
throw
�� 
;
�� 
}
�� 
return
��  
str_id_transaccion
�� %
;
��% &
}
�� 	
}
�� 
}�� �u
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
settings	OO| �
.
OO� �
auth_ws_acceso
OO� �
)
OO� �
;
OO� �
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
$str	ssy �
)
ss� �
!
ss� �
.
ss� �
str_valor_ini
ss� �
)
ss� �
/
ss� �
$num
ss� �
;
ss� �
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
str_act_registro	||v �
)
||� �
;
||� �
}~~ 
} 
}
�� 
else
�� 
{
�� 
object
�� 
obj_sol
�� &
=
��' (
new
��) ,
{
��- .
int_num_peticion
��/ ?
=
��@ A
$num
��B C
,
��C D
str_operacion
��E R
,
��R S!
str_fecha_solicitud
��T g
=
��h i
str_fecha_diaria
��j z
}
��{ |
;
��| }
new
�� 
LogsMongoDat
�� (
(
��( )
settings
��* 2
!
��2 3
)
��4 5
.
��5 6.
 guardar_promedio_peticion_diaria
��6 V
(
��V W
str_operacion
��X e
,
��e f
str_fecha_diaria
��g w
)
��x y
;
��y z
new
�� 
LogsMongoDat
�� (
(
��( )
settings
��* 2
!
��2 3
)
��4 5
.
��5 6%
guardar_peticion_diaria
��6 M
(
��M N
String
��O U
.
��U V
Empty
��V [
,
��[ \
obj_sol
��] d
)
��e f
;
��f g
}
�� 
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
Console
�� 
.
�� 
	WriteLine
�� !
(
��! "
$str
��# %
)
��& '
;
��' (
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
�� 
async
�� 
static
�� 
Task
��  
<
��  !"
RespuestaTransaccion
��! 5
>
��5 6
ValidaRequiereOtp
��7 H
(
��I J
SettingsApi
��K V
settings
��W _
,
��_ `
Header
��a g
header
��h n
,
��n o
string
��p v
str_operacion��w �
)��� �
{
�� 	
var
�� 

parametros
�� 
=
�� 
$str
�� J
;
��J K
var
�� 
service
�� 
=
�� 
new
�� 
ServiceHttp
�� )
<
��) *"
RespuestaTransaccion
��* >
>
��> ?
(
��? @
)
��@ A
;
��A B
var
�� 
cabecera
�� 
=
�� 
new
�� 
{
�� 
int_id_sistema
�� 
=
��  
Convert
��! (
.
��( )
ToInt32
��) 0
(
��0 1
header
��2 8
.
��8 9
str_id_sistema
��9 G
)
��H I
,
��I J
int_id_usuario
�� 
=
��  
Convert
��! (
.
��( )
ToInt32
��) 0
(
��0 1
header
��2 8
.
��8 9
str_id_usuario
��9 G
)
��H I
,
��I J
str_usuario
�� 
=
�� 
header
�� $
.
��$ %
	str_login
��% .
,
��. /
int_id_perfil
�� 
=
�� 
header
��  &
.
��& '
str_id_perfil
��' 4
,
��4 5
int_id_oficina
�� 
=
��  
header
��! '
.
��' (
str_id_oficina
��( 6
,
��6 7
str_nombre_canal
��  
=
��! "
header
��# )
.
��) *
str_app
��* 1
,
��1 2 
str_nemonico_canal
�� "
=
��# $
header
��% +
.
��+ , 
str_nemonico_canal
��, >
,
��> ?
str_ip
�� 
=
�� 
header
�� 
.
��   
str_ip_dispositivo
��  2
,
��2 3
str_session
�� 
=
�� 
header
�� $
.
��$ %

str_sesion
��% /
,
��/ 0
str_mac
�� 
=
�� 
header
��  
.
��  !!
str_mac_dispositivo
��! 4
}
�� 
;
�� 
var
�� 
cuerpo
�� 
=
�� 
new
�� 
{
�� 
str_operacion
�� 
=
�� 
str_operacion
��  -
,
��- .
}
�� 
;
�� 
var
�� 
raw
�� 
=
�� 
new
�� 
{
�� 
cabecera
�� 
=
�� 
cabecera
�� #
,
��# $
cuerpo
�� 
=
�� 
cuerpo
�� 
}
�� 
;
�� 
string
�� 
str_data
�� 
=
�� 
JsonSerializer
�� ,
.
��, -
	Serialize
��- 6
(
��6 7
raw
��8 ;
)
��< =
;
��= >"
RespuestaTransaccion
��  
	respuesta
��! *
=
��+ ,
await
��- 2
service
��3 :
.
��: ;&
PostRestServiceDataAsync
��; S
(
��S T
str_data
��U ]
,
��] ^
settings
��_ g
.
��g h
servicio_ws_otp
��h w
,
��w x

parametros��y �
,��� �
settings��� �
.��� �
auth_ws_otp��� �
)��� �
;��� �
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
}
�� 
}�� �/
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
header	| �
,
� �
string
� �
	str_clase
� �
)
� �
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
!	 �
.
� �
str_valor_ini
� �
;
� �
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
!	 �
.
� �
str_valor_ini
� �
;
� �)
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
RegexOptions	u �
.
� �

IgnoreCase
� �
)
� �
;
� �
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
str_palabras_encontradas	,,v �
)
,,� �
;
,,� �

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
$str	22l �
,
22� �
null
22� �
)
22� �
;
22� �
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
}?? ��
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
str_beneficiarios	  v �
,
  � �
str_operacion
  � �
)
  � �
:
  � �
validacion_token
  � �
;
  � �
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
(	&& �&
str_valida_transferencia
&&� �
,
&&� �
str_operacion
&&� �
)
&&� �
:
&&� �
validacion_token
&&� �
;
&&� �
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
str_add_transferencia	,,~ �
,
,,� �
str_operacion
,,� �
)
,,� �
:
,,� �
validacion_token
,,� �
;
,,� �
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
str_operacion	22{ �
)
22� �
;
22� �
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
SS� �
;
SS� �
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
str_operacion	XXx �
)
XX� �
;
XX� �
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
str_operacion	]]x �
)
]]� �
;
]]� �
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
bb� �
;
bb� �
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
str_operacion	gg{ �
)
gg� �
;
gg� �
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
ll� �
)
ll� �
;
ll� �
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
�� 
	respuesta
�� 
=
�� 
new
�� "
(
��" #
)
��# $
;
��$ %
try
�� 
{
�� 
var
�� &
req_valida_transferencia
�� ,
=
��- .
JsonSerializer
��/ =
.
��= >
Deserialize
��> I
<
��I J(
ReqValidacionTransferencia
��J d
>
��d e
(
��e f"
str_va_transferencia
��g {
)
��| }
;
��} ~
switch
�� 
(
�� &
req_valida_transferencia
�� /
!
��/ 0
.
��0 1-
str_nemonico_tipo_transferencia
��1 P
)
��P Q
{
�� 
case
�� 
$str
�� 3
:
��3 4
case
�� 
$str
�� 5
:
��5 6
	respuesta
�� !
=
��" #
new
��$ '
TransferenciasNeg
��( 9
(
��9 :
_settingsApi
��; G
)
��H I
.
��I J&
validar_transfer_interna
��J b
(
��b c&
req_valida_transferencia
��d |
!
��| }
,
��} ~
str_operacion�� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
$str
�� '
:
��' (
	respuesta
�� !
=
��" #
new
��$ '
TransferenciasNeg
��( 9
(
��9 :
_settingsApi
��; G
)
��H I
.
��I J+
get_val_transf_interbancarias
��J g
(
��g h'
req_valida_transferencia��i �
!��� �
,��� �
str_operacion��� �
)��� �
;��� �
break
�� 
;
�� 
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
ResException
�� 
resException
�� )
=
��* +
new
��, /
ResException
��0 <
(
��< =
)
��= >
{
�� (
str_res_estado_transaccion
�� .
=
��/ 0
$str
��1 6
,
��6 7
str_res_codigo
�� "
=
��# $
$str
��% *
,
��* +$
str_res_info_adicional
�� *
=
��+ ,
$str
��- a
}
�� 
;
�� 
return
�� 
resException
�� #
;
��# $
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
�� 
Object
�� 4
&ProcesarSolicitudRealizaTransferencias
�� <
(
��= >
string
��? E"
str_va_transferencia
��F Z
,
��Z [
string
��\ b
str_operacion
��c p
)
��q r
{
�� 	
Object
�� 
	respuesta
�� 
=
�� 
new
�� "
(
��" #
)
��# $
;
��$ %
try
�� 
{
�� 
var
�� #
req_add_transferencia
�� )
=
��* +
JsonSerializer
��, :
.
��: ;
Deserialize
��; F
<
��F G
ReqTransferencia
��G W
>
��W X
(
��X Y"
str_va_transferencia
��Z n
)
��o p
;
��p q
switch
�� 
(
�� #
req_add_transferencia
�� ,
!
��, -
.
��- .-
str_nemonico_tipo_transferencia
��. M
)
��M N
{
�� 
case
�� 
$str
�� 3
:
��3 4
case
�� 
$str
�� 5
:
��5 6
	respuesta
�� !
=
��" #
new
��$ '
TransferenciasNeg
��( 9
(
��9 :
_settingsApi
��; G
)
��H I
.
��I J"
add_transfer_interna
��J ^
(
��^ _#
req_add_transferencia
��` u
!
��u v
,
��v w
str_operacion��x �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
$str
�� '
:
��' (
	respuesta
�� !
=
��" #
new
��$ '
TransferenciasNeg
��( 9
(
��9 :
_settingsApi
��; G
)
��H I
.
��I J'
add_transf_interbancarias
��J c
(
��c d#
req_add_transferencia
��e z
,
��z {
str_operacion��| �
)��� �
;��� �
break
�� 
;
�� 
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
ResException
�� 
resException
�� )
=
��* +
new
��, /
ResException
��0 <
(
��< =
)
��= >
{
�� (
str_res_estado_transaccion
�� .
=
��/ 0
$str
��1 6
,
��6 7
str_res_codigo
�� "
=
��# $
$str
��% *
,
��* +$
str_res_info_adicional
�� *
=
��+ ,
$str
��- a
}
�� 
;
�� 
return
�� 
resException
�� #
;
��# $
}
�� 
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
}
�� 
}�� 