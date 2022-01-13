using Microsoft.OpenApi.Models;
using wsTransferencias.Middleware;
using wsTransferencias.Model;

var builder = WebApplication.CreateBuilder( args );

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen( c =>
 {
     c.SwaggerDoc( "v1", new OpenApiInfo
     {
         Title = "Servicio de transferencias",
         Version = "v1",
         Description = "Servicio de transferencias de la banca virutal `CoopMego`",
     } );

     c.AddSecurityDefinition( "basic", new OpenApiSecurityScheme
     {
         Name = "Authorization",
         Type = SecuritySchemeType.Http,
         Scheme = "basic",
         In = ParameterLocation.Header,
         Description = "Seguridad básica del Api",


     } );
 } );



builder.Services.Configure<SettingsApi>( builder.Configuration.GetSection( "SettingsApi:BasicAuth" ) );
builder.Services.Configure<SettingsApi>( builder.Configuration.GetSection( "SettingsApi:Databases" ) );
builder.Services.Configure<SettingsApi>( builder.Configuration.GetSection( "SettingsApi:Endpoints" ) );
builder.Services.Configure<SettingsApi>( builder.Configuration.GetSection( "SettingsApi:PathLogs" ) );
builder.Services.Configure<SettingsApi>( builder.Configuration.GetSection( "SettingsApi:Config" ) );

builder.Services.AddOptions();


var app = builder.Build();

// Configure the HTTP request pipeline.
if(app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseMiddleware<BasicAuthentication>();

app.UseAuthorization();

app.MapControllers();

app.Run();
