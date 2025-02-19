﻿using Application.Common.Interfaces;
using Application.Common.Models;

using Infrastructure.Common.Tramas;
using Infrastructure.gGRPC_Clients.Mongo;

using Microsoft.Extensions.Options;
using System.Text.Json;

namespace Infrastructure.Services;

public class LogsService : ILogs
{
    private readonly InfoLog infoLog = new();
    private readonly ApiSettings _settings;
    private readonly IMongoDat _mongoDat;

    public LogsService(IOptionsMonitor<ApiSettings> options, IMongoDat mongoDat)
    {
        this._settings = options.CurrentValue;
        this.infoLog.str_webservice = _settings.nombre_base_mongo;
        this._mongoDat = mongoDat;
    }

    /// <summary>
    /// Guarda en mongodb la cabecera de la petición
    /// </summary>
    /// <param name="Transaccion"></param>
    /// <param name="str_operacion"></param>
    /// <param name="str_metodo"></param>
    /// <param name="str_clase"></param>
    /// <returns></returns>
    /// 
    public async Task SaveHeaderLogs(dynamic transaction, String str_operacion, String str_metodo, String str_clase)
    {
        var diccionario_logs = JsonSerializer.Deserialize<Dictionary<string, object>>( JsonSerializer.Serialize( transaction ) );
        limpiarLogs( diccionario_logs );
        infoLog.str_id_transaccion = transaction.str_id_transaccion;
        infoLog.str_clase = str_clase;
        infoLog.str_operacion = str_operacion;
        infoLog.str_objeto = diccionario_logs!;
        infoLog.str_metodo = str_metodo;
        infoLog.str_fecha = transaction.dt_fecha_operacion;
        infoLog.str_tipo = "s:<";

        // REGISTRA LOGS DE TEXTO 
        TextFiles.RegistrarTramas( infoLog.str_tipo, infoLog, _settings.logs_path_peticiones );

        // REGISTRA LOGS DE MONGO
        await _mongoDat.GuardarCabeceraMongo( diccionario_logs! );
    }

    /// <summary> 
    /// Guarda en mongodb la respuesta de la petición
    /// </summary>
    /// <param name="Transaccion"></param>
    /// <param name="str_operacion"></param>
    /// <param name="str_metodo"></param>
    /// <param name="str_clase"></param>
    /// <returns></returns>
    /// 
    public async Task SaveResponseLogs(dynamic transaction, String str_operacion, String str_metodo, String str_clase)
    {
        infoLog.str_id_transaccion = transaction.str_id_transaccion;
        infoLog.str_clase = str_clase;
        infoLog.str_operacion = str_operacion;
        infoLog.str_objeto = transaction;
        infoLog.str_metodo = str_metodo;
        infoLog.str_fecha = transaction.dt_fecha_operacion;
        infoLog.str_tipo = "r:>";

        // REGISTRA LOGS DE TEXTO 
        TextFiles.RegistrarTramas( infoLog.str_tipo, infoLog, _settings.logs_path_peticiones );

        // REGISTRA LOGS DE MONGO
        await _mongoDat.GuardarRespuestaMongo( transaction );
    }

    /// <summary>
    /// Guarda exepciones de codigo
    /// </summary>
    /// <param name="Transaccion"></param>
    /// <param name="str_operacion"></param>
    /// <param name="str_metodo"></param>
    /// <param name="str_clase"></param>
    /// <param name="obj_error"></param>
    /// <returns></returns>
    /// 
    public async Task SaveExceptionLogs(dynamic transaction, String str_operacion, String str_metodo, String str_clase, Object obj_error)
    {
        var objError = new { peticion = transaction, error = obj_error };

        infoLog.str_id_transaccion = transaction.str_id_transaccion;
        infoLog.str_clase = str_clase;
        infoLog.str_operacion = str_operacion;
        infoLog.str_objeto = objError.ToString()!;
        infoLog.str_metodo = str_metodo;
        infoLog.str_fecha = transaction.dt_fecha_operacion;
        infoLog.str_tipo = "e:<";

        // REGISTRA LOGS DE TEXTO 
        TextFiles.RegistrarTramas( infoLog.str_tipo, infoLog, _settings.logs_path_errores );

        //REGISTRA LOGS DE MONGO
        await _mongoDat.GuardarExcepcionesMongo( transaction, obj_error );
    }

    public async Task SaveAmenazasLogs(ValidacionInyeccion validacion, String str_operacion, String str_metodo, String str_clase)
    {
        infoLog.str_clase = str_clase;
        infoLog.str_operacion = str_operacion;
        infoLog.str_objeto = validacion!;
        infoLog.str_metodo = str_metodo;
        infoLog.str_fecha = validacion.dtt_fecha;
        infoLog.str_id_transaccion = validacion.str_id_transaccion;
        infoLog.str_tipo = "s:<";

        // REGISTRA LOGS DE TEXTO 
        TextFiles.RegistrarTramas( infoLog.str_tipo, infoLog, _settings.logs_path_amenazas );

        //REGISTRA LOGS DE MONGO
        await _mongoDat.GuardarAmenazasMongo( validacion! );
    }

    /// <summary>
    /// Guarda cualquier error 
    /// </summary>
    /// <param name="Transaccion"></param>
    /// <param name="str_operacion"></param>
    /// <param name="str_metodo"></param>
    /// <param name="str_clase"></param>
    /// <param name="obj_error"></param>
    /// <param name="str_id_transaccion"></param>
    /// <returns></returns>
    /// 
    public async Task SaveHttpErrorLogs(dynamic transaction, String str_metodo, String str_clase, dynamic obj_error, String str_id_transaccion)
    {
        var objError = new { peticion = transaction, error = obj_error };

        infoLog.str_id_transaccion = str_id_transaccion;
        infoLog.str_clase = str_clase;
        infoLog.str_objeto = objError.ToString()!;
        infoLog.str_metodo = str_metodo;
        infoLog.str_fecha = DateTime.Now;
        infoLog.str_tipo = "e:<";

        //REGISTRA LOGS DE TEXTO 
        TextFiles.RegistrarTramas( infoLog.str_tipo, infoLog, _settings.logs_path_errores_http );

        //REGISTRA LOGS DE MONGO
        await _mongoDat.GuardaErroresHttp( transaction, obj_error, str_id_transaccion );
    }

    public async Task SaveExcepcionDataBaseSybase(dynamic transaction, String str_metodo, Exception excepcion, string str_clase)
    {
        infoLog.str_id_transaccion = transaction.str_id_transaccion;
        infoLog.str_clase = str_clase;
        infoLog.str_operacion = transaction.str_id_servicio;
        infoLog.str_objeto = excepcion.ToString();
        infoLog.str_metodo = str_metodo;
        infoLog.str_fecha = transaction.dt_fecha_operacion;
        infoLog.str_tipo = "e:<";

        //REGISTRA LOGS DE TEXTO 
        TextFiles.RegistrarTramas( infoLog.str_tipo, infoLog, _settings.logs_path_errores_db );

        //REGISTRA LOGS DE MONGO
        await _mongoDat.GuardarExcepcionesDataBase( transaction, excepcion );
    }
    public void limpiarLogs(Dictionary<string, object> diccionario)
    {
        _settings.lst_atributos_sin_logs!.ForEach( atributo =>
        {
            if (diccionario.ContainsKey( atributo ))
            {
                diccionario[atributo] = "";
            }

        } );

        foreach (var obj in diccionario)
        {
            try
            {
                if (obj.Value != null)
                {
                    String cadena_value = obj.Value.ToString()!;

                    if (!String.IsNullOrEmpty( cadena_value ) && cadena_value!.Substring( 0, 1 ) == "{" && cadena_value.Substring( cadena_value.Length - 1 ) == "}")
                    {
                        var diccionario_interno = JsonSerializer.Deserialize<Dictionary<string, object>>( JsonSerializer.Serialize( obj.Value ) );
                        _settings.lst_atributos_sin_logs!.ForEach( atributo => {
                            if (diccionario_interno!.ContainsKey( atributo ))
                            {
                                diccionario_interno[atributo] = "";
                            }

                        } );
                        diccionario[obj.Key] = diccionario_interno!;
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine( "Error de limpiar logs" + ex.ToString() );

            }
        }
    }
}
