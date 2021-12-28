��
OC:\SistemasMego\wsTransferencias_net_6\wsTransferencias.Neg\BeneficiariosNeg.cs
	namespace 	
wsTransferencias
 
. 
Neg 
{ 
public 

class 
BeneficiariosNeg !
{ 
private 
readonly 
ServiceSettings (
_serviceSettings) 9
;9 :
InfoLog 
infoLog 
; 
readonly 
string 
str_entrada #
=$ %
$str& +
;+ ,
readonly 
string 

str_salida "
=# $
$str% *
;* +
readonly 
string 
str_excepcion %
=& '
$str( -
;- .
readonly 
string 
str_ruta  
=! "
string# )
.) *
Empty* /
;/ 0
public 
BeneficiariosNeg 
(  
ServiceSettings  /
serviceSettings0 ?
)? @
{ 	
_serviceSettings 
= 
serviceSettings .
;. /
infoLog 
. 
	str_clase 
= 
$str  2
;2 3
infoLog 
. 
	str_fecha 
= 
DateTime  (
.( )
Now) ,
;, -
str_ruta 
= 
serviceSettings &
.& '
path_logs_consultas' :
;: ;
} 	
public!! 
ResBeneficiarios!! (
procesar_datos_beneficiarios!!  <
(!!< =
ReqBeneficiarios!!= M
req_beneficiarios!!N _
,!!_ `
string!!a g
str_operacion!!h u
)!!u v
{"" 	
var## 
	respuesta## 
=## 
new## 
ResBeneficiarios##  0
(##0 1
)##1 2
;##2 3
	respuesta$$ 
.$$ 
LlenarResHeader$$ %
($$% &
req_beneficiarios$$& 7
)$$7 8
;$$8 9
infoLog%% 
.%% 
str_tipo%% 
=%% 
str_entrada%% *
;%%* +
infoLog&& 
.&& 
str_operacion&& !
=&&" #
str_operacion&&$ 1
;&&1 2
infoLog'' 
.'' 

str_objeto'' 
=''  
req_beneficiarios''! 2
;''2 3
infoLog(( 
.(( 

str_metodo(( 
=((  
$str((! ?
;((? @
LogServicios)) 
.)) 
RegistrarTramas)) (
())( )
str_entrada))) 4
,))4 5
infoLog))6 =
,))= >
str_ruta))? G
)))G H
;))H I
try++ 
{,, 
var.. 
res_tran.. 
=.. 
new.. " 
RespuestaTransaccion..# 7
(..7 8
)..8 9
;..9 :
if11 
(11 
req_beneficiarios11 %
.11% &
str_operacion11& 3
==114 6
_serviceSettings117 G
.11G H
add_beneficiarios11H Y
)11Y Z
{22 
infoLog33 
.33 
str_tipo33 $
=33% &
str_entrada33' 2
;332 3
infoLog44 
.44 
str_operacion44 )
=44* +
str_operacion44, 9
;449 :
infoLog55 
.55 

str_objeto55 &
=55' (
req_beneficiarios55) :
;55: ;
infoLog66 
.66 

str_metodo66 &
=66' (
$str66) D
;66D E
LogServicios77  
.77  !
RegistrarTramas77! 0
(770 1
str_entrada771 <
,77< =
infoLog77> E
,77E F
str_ruta77G O
)77O P
;77P Q
res_tran99 
=99 
new99 "
BeneficiariosDat99# 3
(993 4
_serviceSettings994 D
,99D E
infoLog99F M
)99M N
.99N O%
add_cuentas_beneficiarios99O h
(99h i
req_beneficiarios99i z
)99z {
;99{ |
infoLog;; 
.;; 
str_tipo;; $
=;;% &

str_salida;;' 1
;;;1 2
infoLog<< 
.<< 
str_operacion<< )
=<<* +
str_operacion<<, 9
;<<9 :
infoLog== 
.== 

str_objeto== &
===' (
req_beneficiarios==) :
;==: ;
infoLog>> 
.>> 

str_metodo>> &
=>>' (
$str>>) D
;>>D E
LogServicios??  
.??  !
RegistrarTramas??! 0
(??0 1

str_salida??1 ;
,??; <
infoLog??= D
,??D E
str_ruta??F N
)??N O
;??O P
}@@ 
elseAA 
ifAA 
(AA 
req_beneficiariosAA *
.AA* +
str_operacionAA+ 8
==AA9 ;
_serviceSettingsAA< L
.AAL M 
update_beneficiariosAAM a
)AAa b
{BB 
infoLogDD 
.DD 
str_tipoDD $
=DD% &
str_entradaDD' 2
;DD2 3
infoLogEE 
.EE 
str_operacionEE )
=EE* +
str_operacionEE, 9
;EE9 :
infoLogFF 
.FF 

str_objetoFF &
=FF' (
req_beneficiariosFF) :
;FF: ;
infoLogGG 
.GG 

str_metodoGG &
=GG' (
$strGG) G
;GGG H
LogServiciosHH  
.HH  !
RegistrarTramasHH! 0
(HH0 1
str_entradaHH1 <
,HH< =
infoLogHH> E
,HHE F
str_rutaHHG O
)HHO P
;HHP Q
res_tranJJ 
=JJ 
newJJ "
BeneficiariosDatJJ# 3
(JJ3 4
_serviceSettingsJJ4 D
,JJD E
infoLogJJF M
)JJM N
.JJN O(
update_cuentas_beneficiariosJJO k
(JJk l
req_beneficiariosJJl }
)JJ} ~
;JJ~ 
infoLogLL 
.LL 
str_tipoLL $
=LL% &

str_salidaLL' 1
;LL1 2
infoLogMM 
.MM 
str_operacionMM )
=MM* +
str_operacionMM, 9
;MM9 :
infoLogNN 
.NN 

str_objetoNN &
=NN' (
req_beneficiariosNN) :
;NN: ;
infoLogOO 
.OO 

str_metodoOO &
=OO' (
$strOO) G
;OOG H
LogServiciosPP  
.PP  !
RegistrarTramasPP! 0
(PP0 1

str_salidaPP1 ;
,PP; <
infoLogPP= D
,PPD E
str_rutaPPF N
)PPN O
;PPO P
}RR 
elseSS 
ifSS 
(SS 
req_beneficiariosSS *
.SS* +
str_operacionSS+ 8
==SS9 ;
_serviceSettingsSS< L
.SSL M 
delete_beneficiariosSSM a
)SSa b
{TT 
infoLogUU 
.UU 
str_tipoUU $
=UU% &

str_salidaUU' 1
;UU1 2
infoLogVV 
.VV 
str_operacionVV )
=VV* +
str_operacionVV, 9
;VV9 :
infoLogWW 
.WW 

str_objetoWW &
=WW' (
req_beneficiariosWW) :
;WW: ;
infoLogXX 
.XX 

str_metodoXX &
=XX' (
$strXX) G
;XXG H
LogServiciosYY  
.YY  !
RegistrarTramasYY! 0
(YY0 1
str_entradaYY1 <
,YY< =
infoLogYY> E
,YYE F
str_rutaYYG O
)YYO P
;YYP Q
res_tran[[ 
=[[ 
new[[ "
BeneficiariosDat[[# 3
([[3 4
_serviceSettings[[4 D
,[[D E
infoLog[[F M
)[[M N
.[[N O(
delete_cuentas_beneficiarios[[O k
([[k l
req_beneficiarios[[l }
)[[} ~
;[[~ 
infoLog]] 
.]] 
str_tipo]] $
=]]% &
str_entrada]]' 2
;]]2 3
infoLog^^ 
.^^ 
str_operacion^^ )
=^^* +
str_operacion^^, 9
;^^9 :
infoLog__ 
.__ 

str_objeto__ &
=__' (
req_beneficiarios__) :
;__: ;
infoLog`` 
.`` 

str_metodo`` &
=``' (
$str``) G
;``G H
LogServiciosaa  
.aa  !
RegistrarTramasaa! 0
(aa0 1

str_salidaaa1 ;
,aa; <
infoLogaa= D
,aaD E
str_rutaaaF N
)aaN O
;aaO P
}dd 
elseee 
ifee 
(ee 
req_beneficiariosee *
.ee* +
str_operacionee+ 8
==ee9 ;
_serviceSettingsee< L
.eeL M!
listado_beneficiarioseeM b
)eeb c
{ff 
infoLoggg 
.gg 
str_tipogg $
=gg% &

str_salidagg' 1
;gg1 2
infoLoghh 
.hh 
str_operacionhh )
=hh* +
str_operacionhh, 9
;hh9 :
infoLogii 
.ii 

str_objetoii &
=ii' (
req_beneficiariosii) :
;ii: ;
infoLogjj 
.jj 

str_metodojj &
=jj' (
$strjj) B
;jjB C
LogServicioskk  
.kk  !
RegistrarTramaskk! 0
(kk0 1
str_entradakk1 <
,kk< =
infoLogkk> E
,kkE F
str_rutakkG O
)kkO P
;kkP Q
res_tranmm 
=mm 
newmm "
BeneficiariosDatmm# 3
(mm3 4
_serviceSettingsmm4 D
,mmD E
infoLogmmF M
)mmM N
.mmN O#
get_datos_beneficiariosmmO f
(mmf g
req_beneficiariosmmg x
)mmx y
;mmy z
infoLogoo 
.oo 
str_tipooo $
=oo% &
str_entradaoo' 2
;oo2 3
infoLogpp 
.pp 
str_operacionpp )
=pp* +
str_operacionpp, 9
;pp9 :
infoLogqq 
.qq 

str_objetoqq &
=qq' (
req_beneficiariosqq) :
;qq: ;
infoLogrr 
.rr 

str_metodorr &
=rr' (
$strrr) B
;rrB C
LogServiciosss  
.ss  !
RegistrarTramasss! 0
(ss0 1

str_salidass1 ;
,ss; <
infoLogss= D
,ssD E
str_rutassF N
)ssN O
;ssO P
ConjuntoDatosuu !#
ds_posicion_consolidadauu" 9
=uu: ;
(uu< =
ConjuntoDatosuu= J
)uuJ K
res_tranuuK S
.uuS T
cuerpouuT Z
;uuZ [
Listww 
<ww 
Beneficiarioww %
>ww% &
lst_beneficiariosww' 8
=ww9 :
newww; >
Listww? C
<wwC D
BeneficiariowwD P
>wwP Q
(wwQ R
)wwR S
;wwS T
foreachyy 
(yy 
varyy  
itemyy! %
inyy& (#
ds_posicion_consolidadayy) @
.yy@ A

lst_tablasyyA K
[yyK L
$numyyL M
]yyM N
.yyN O
	lst_filasyyO X
)yyX Y
{zz 
Beneficiario{{ $
obj{{% (
={{) *
({{+ ,
Beneficiario{{, 8
){{8 9

Converting{{9 C
.{{C D
MapDictToObj{{D P
({{P Q
item{{Q U
.{{U V
nombre_valor{{V b
,{{b c
typeof{{d j
({{j k
Beneficiario{{k w
){{w x
){{x y
;{{y z
lst_beneficiarios|| )
.||) *
Add||* -
(||- .
obj||. 1
)||1 2
;||2 3
}}} 
	respuesta 
. 
lst_beneficiarios /
=0 1
lst_beneficiarios2 C
;C D
}
�� 
if
�� 
(
�� 
res_tran
�� 
.
�� 
codigo
�� #
.
��# $
Equals
��$ *
(
��* +
$str
��+ 0
)
��0 1
)
��1 2
{
�� 
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 8
=
��9 :
$str
��; ?
;
��? @
}
�� 
else
�� 
{
�� 
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 8
=
��9 :
$str
��; @
;
��@ A
}
�� 
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
��: ;
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
�� 
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_excepcion
��# 0
;
��0 1
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
��. /
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_excepcion
��- :
,
��: ;
infoLog
��< C
,
��C D
str_ruta
��E M
)
��M N
;
��N O
throw
�� 
;
�� 
}
�� 
infoLog
�� 
.
�� 
str_tipo
�� 
=
�� 

str_salida
�� )
;
��) *
infoLog
��+ 2
.
��2 3
str_operacion
��3 @
=
��A B
str_operacion
��C P
;
��P Q
infoLog
��R Y
.
��Y Z

str_objeto
��Z d
=
��e f
req_beneficiarios
��g x
;
��x y
LogServicios
�� 
.
�� 
RegistrarTramas
�� (
(
��( )
str_entrada
��) 4
,
��4 5
infoLog
��6 =
,
��= >
str_ruta
��? G
)
��G H
;
��H I
return
�� 
	respuesta
�� 
;
�� 
}
�� 	
public
�� 
ResBeneficiarios
�� ,
validar_registro_beneficiarios
��  >
(
��> ?
ReqBeneficiarios
��? O#
validar_beneficiarios
��P e
,
��e f
string
��g m
str_operacion
��n {
)
��{ |
{
�� 	
var
�� 
	respuesta
�� 
=
�� 
new
�� 
ResBeneficiarios
��  0
(
��0 1
)
��1 2
;
��2 3
	respuesta
�� 
.
�� 
LlenarResHeader
�� %
(
��% &#
validar_beneficiarios
��& ;
)
��; <
;
��< =
infoLog
�� 
.
�� 
str_tipo
�� 
=
�� 
str_entrada
�� *
;
��* +
infoLog
�� 
.
�� 
str_operacion
�� !
=
��" #
str_operacion
��$ 1
;
��1 2
infoLog
�� 
.
�� 

str_objeto
�� 
=
��  #
validar_beneficiarios
��! 6
;
��6 7
infoLog
�� 
.
�� 

str_metodo
�� 
=
��  
$str
��! A
;
��A B
LogServicios
�� 
.
�� 
RegistrarTramas
�� (
(
��( )
str_entrada
��) 4
,
��4 5
infoLog
��6 =
,
��= >
str_ruta
��? G
)
��G H
;
��H I
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
��3 4
_serviceSettings
��4 D
,
��D E
infoLog
��F M
)
��M N
.
��N O,
validar_registro_beneficiarios
��O m
(
��m n$
validar_beneficiarios��n �
)��� �
;��� �
if
�� 
(
�� 
res_tran
�� 
.
�� 
codigo
�� #
.
��# $
Equals
��$ *
(
��* +
$str
��+ 0
)
��0 1
)
��1 2
{
�� 
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 8
=
��9 :
$str
��; ?
;
��? @
}
�� 
else
�� 
{
�� 
	respuesta
�� 
.
�� (
str_res_estado_transaccion
�� 8
=
��9 :
$str
��; @
;
��@ A
}
�� 
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
��: ;
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
�� 
infoLog
�� 
.
�� 
str_tipo
��  
=
��! "
str_excepcion
��# 0
;
��0 1
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
��. /
LogServicios
�� 
.
�� 
RegistrarTramas
�� ,
(
��, -
str_excepcion
��- :
,
��: ;
infoLog
��< C
,
��C D
str_ruta
��E M
)
��M N
;
��N O
throw
�� 
;
�� 
}
�� 
infoLog
�� 
.
�� 
str_tipo
�� 
=
�� 

str_salida
�� )
;
��) *
infoLog
��+ 2
.
��2 3
str_operacion
��3 @
=
��A B
str_operacion
��C P
;
��P Q
infoLog
��R Y
.
��Y Z

str_objeto
��Z d
=
��e f#
validar_beneficiarios
��g |
;
��| }
LogServicios
�� 
.
�� 
RegistrarTramas
�� (
(
��( )
str_entrada
��) 4
,
��4 5
infoLog
��6 =
,
��= >
str_ruta
��? G
)
��G H
;
��H I
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
}�� �
RC:\SistemasMego\wsTransferencias_net_6\wsTransferencias.Neg\wsTransferenciasNeg.cs
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
Neg

 
{ 
public 

class 
wsTransferenciasNeg $
{ 
private 
readonly 
ServiceSettings (
serviceSettings) 8
;8 9
public 
wsTransferenciasNeg "
(" #
ServiceSettings# 2
settings3 ;
); <
{ 	
this 
. 
serviceSettings  
=! "
settings# +
;+ ,
} 	
public 
object 
procesarSolicitud '
(' (
Object( .
sol_tran/ 7
,7 8
string9 ?
str_operacion@ M
)M N
{ 	
object 
	respuesta 
= 
new "
object# )
() *
)* +
;+ ,
string 

jsonString 
= 
$str  "
;" #
try 
{ 
switch 
( 
str_operacion %
)% &
{ 
case 
$str (
:( )

jsonString "
=# $
JsonSerializer% 3
.3 4
	Serialize4 =
(= >
sol_tran> F
)F G
;G H
var 
req_beneficiarios -
=. /
JsonSerializer0 >
.> ?
Deserialize? J
<J K
ReqBeneficiariosK [
>[ \
(\ ]

jsonString] g
)g h
;h i
	respuesta !
=" #
new$ '
BeneficiariosNeg( 8
(8 9
serviceSettings9 H
)H I
.I J(
procesar_datos_beneficiariosJ f
(f g
req_beneficiariosg x
,x y
str_operacion	y �
)
� �
;
� �
break   
;   
case!! 
$str!! 9
:!!9 :

jsonString"" "
=""# $
JsonSerializer""% 3
.""3 4
	Serialize""4 =
(""= >
sol_tran""> F
)""F G
;""G H
var##  
valida_beneficiarios## 0
=##1 2
JsonSerializer##3 A
.##A B
Deserialize##B M
<##M N
ReqBeneficiarios##N ^
>##^ _
(##_ `

jsonString##` j
)##j k
;##k l
	respuesta$$ !
=$$" #
new$$$ '
BeneficiariosNeg$$( 8
($$8 9
serviceSettings$$9 H
)$$H I
.$$I J*
validar_registro_beneficiarios$$J h
($$h i 
valida_beneficiarios$$i }
,$$} ~
str_operacion	$$ �
)
$$� �
;
$$� �
break&& 
;&& 
default'' 
:'' 
break(( 
;(( 
}** 
}++ 
catch,, 
(,, 
	Exception,, 
ex,, 
),,  
{-- 
ResException.. 
resException.. )
=..* +
new.., /
ResException..0 <
(..< =
)..= >
{// &
str_res_estado_transaccion00 .
=00/ 0
$str001 6
,006 7
str_res_codigo11 "
=11# $
$str11% *
,11* +"
str_res_info_adicional22 *
=22+ ,
ex22- /
.22/ 0
ToString220 8
(228 9
)229 :
}33 
;33 
return44 
resException44 #
;44# $
}55 
return77 
	respuesta77 
;77 
}88 	
}99 
}:: 