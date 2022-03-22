
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["wsTransferencias/wsTransferencias.csproj", "wsTransferencias/"]
COPY ["wsTransferencias.Model/wsTransferencias.Model.csproj", "wsTransferencias.Model/"]
COPY ["wsTransferencias.Neg/wsTransferencias.Neg.csproj", "wsTransferencias.Neg/"]
COPY ["wsTransferencias.Dat/wsTransferencias.Dat.csproj", "wsTransferencias.Dat/"]
COPY ["wsTransferencias.Dto/wsTransferencias.Dto.csproj", "wsTransferencias.Dto/"]
RUN dotnet restore "wsTransferencias/wsTransferencias.csproj"
COPY . .
WORKDIR "/src/wsTransferencias"
RUN dotnet build "wsTransferencias.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "wsTransferencias.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "wsTransferencias.dll"]