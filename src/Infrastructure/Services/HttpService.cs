﻿using Microsoft.Extensions.Options;

using System.Reflection;
using System.Text;
using System.Text.Json;

using Application.Common.Interfaces;
using Application.Common.Models;

namespace Infrastructure.Services;

public class HttpService : IHttpService
{
    private readonly ILogs _logs;
    private readonly ApiSettings _settings;
    private readonly string str_clase;
    public HttpService(IOptionsMonitor<ApiSettings> option, ILogs logs)
    {
        _logs = logs;
        _settings = option.CurrentValue;
        str_clase = GetType().FullName!;
    }

    public async Task<T> GetRestServiceDataAsync<T>(string serviceAddress)
    {
        try
        {
            var client = new HttpClient
            {
                BaseAddress = new Uri( serviceAddress )
            };
            var response = await client.GetAsync( client.BaseAddress );
            response.EnsureSuccessStatusCode();
            var jsonResult = await response.Content.ReadAsStringAsync();
            var result = JsonSerializer.Deserialize<T>( jsonResult )!;
            return result!;
        }
        catch
        {
            Console.WriteLine( "Error" );
            throw;
        }
    }


    /// <summary>
    /// Servicio de peticiónes POST
    /// </summary>
    /// <param name="serializedData"></param>
    /// <param name="parameters"></param>
    /// <param name="serviceAddress"></param>
    /// <param name="auth"></param>
    /// <param name="authorizationType"></param>
    /// <param name="str_id_transaccion"></param>
    /// <returns></returns>
    public async Task<T> PostRestServiceDataAsync<T>(string serializedData,
                                                        string serviceAddress,
                                                        string parameters,
                                                        string auth,
                                                        string authorizationType,
                                                        string str_id_transaccion,
                                                        int timeout = 0)
    {
        try
        {
            HttpClient client = new();
            client.BaseAddress = new Uri( serviceAddress );
            client.DefaultRequestHeaders.Add( "Authorization", authorizationType + " " + auth );
            client.Timeout = (timeout == 0) ? TimeSpan.FromSeconds( _settings.timeOutHttp ) :
                TimeSpan.FromSeconds( _settings.timeOutHttpBanRed );

            var httpContent = new StringContent( serializedData, Encoding.UTF8, "application/json" );

            HttpResponseMessage response = await client.PostAsync( parameters, httpContent );
            string resultadoJson = await response.Content.ReadAsStringAsync();

            T respuesta = default( T )!;

            if (response.IsSuccessStatusCode)
            {
                respuesta = JsonSerializer.Deserialize<T>( resultadoJson )!;
            }
            else
            {
                var res_servicio = new
                {
                    codigo = response.StatusCode,
                    cabecera = response.Headers,
                    cuerpo = response.Content.ReadAsStreamAsync()
                };

                _logs.SaveHttpErrorLogs( JsonSerializer.Deserialize<dynamic>( serializedData ), MethodBase.GetCurrentMethod()!.Name, "HttpService", res_servicio, str_id_transaccion );
            }
			client.Dispose();
            return respuesta;
        }
        catch (Exception ex)
        {
            var data = JsonSerializer.Deserialize<dynamic>( serializedData );
            _logs.SaveHttpErrorLogs( data, MethodBase.GetCurrentMethod()!.Name, str_clase, ex, str_id_transaccion );
            throw new Exception( data!.str_id_transaccion )!;
        }
    }
   
}