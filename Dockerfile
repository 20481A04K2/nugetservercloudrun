FROM mcr.microsoft.com/dotnet/aspnet:7.0

RUN apt-get update && apt-get install -y curl unzip

# Download BaGet zip
RUN curl -L -o baget.zip https://github.com/loic-sharma/BaGet/releases/download/v0.4.0-preview2/BaGet.zip \
    && unzip baget.zip -d /app \
    && rm baget.zip

WORKDIR /app

# Expose Cloud Run port
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "BaGet.dll"]
