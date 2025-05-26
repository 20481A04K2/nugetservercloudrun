# Use the official .NET Core 3.1 ASP.NET runtime image
FROM mcr.microsoft.com/dotnet/aspnet:3.1

RUN apt-get update && apt-get install -y curl unzip

# Download BaGet v0.4.0-preview2 release ZIP
RUN curl -L -o baget.zip https://github.com/loic-sharma/BaGet/releases/download/v0.4.0-preview2/BaGet.zip \
    && unzip baget.zip -d /app \
    && rm baget.zip

WORKDIR /app

# Cloud Run expects the app to listen on $PORT (default 8080)
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "BaGet.dll"]
