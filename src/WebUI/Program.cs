using WebUI.Middleware;

var builder = WebApplication.CreateBuilder( args );


builder.Services.AddApplicationServices();
builder.Services.AddInfrastructureServices();
builder.Services.AddWebUIServices( builder.Configuration );

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    
}

app.UseSwagger();
app.UseSwaggerUI();

app.UseCors();

app.UseAuthotizationMego();

app.UseValidateCachedParameters();

app.UseAuthorization();

app.UseHttpsRedirection();

app.MapControllers();

app.Run();