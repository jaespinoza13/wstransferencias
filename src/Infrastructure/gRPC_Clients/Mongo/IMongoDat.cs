﻿using Application.Common.Models;

namespace Infrastructure.gGRPC_Clients.Mongo;

public interface IMongoDat
{
    Task GuardarCabeceraMongo(dynamic cabecera);
    Task GuardarRespuestaMongo(dynamic ObjRespPeticion);
    Task GuardarExcepcionesMongo(dynamic obj_respuesta, object excepcion);
    Task GuardarExcepcionesDataBase(dynamic obj_respuesta, object excepcion);
    Task GuardarAmenazasMongo(ValidacionInyeccion obj_respuesta);
    Task GuardaErroresHttp(Object any, object excepcion, String str_id_transaccion);
    RespuestaTransaccion buscar_peticiones_diarias(string filtro);
    void actualizar_peticion_diaria(string filtro, string peticion);
    void guardar_promedio_peticion_diaria(string str_operacion, string str_fecha);
    int calcular_promedio(string str_operacion);
    int obtener_promedio(string str_operacion);
}
