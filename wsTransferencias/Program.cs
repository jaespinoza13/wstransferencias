using wsTransferencias.Model;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();



builder.Services.Configure<ServiceSettings>(builder.Configuration.GetSection("ServiceSettings:BasicAuth"));
builder.Services.Configure<ServiceSettings>(builder.Configuration.GetSection("ServiceSettings:Databases"));
builder.Services.Configure<ServiceSettings>(builder.Configuration.GetSection("ServiceSettings:Endpoints"));
builder.Services.Configure<ServiceSettings>(builder.Configuration.GetSection("ServiceSettings:PathLogs"));
builder.Services.Configure<ServiceSettings>(builder.Configuration.GetSection("ServiceSettings:Beneficiarios"));
builder.Services.AddOptions();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
