FROM mcr.microsoft.com/dotnet/aspnet:3.1

RUN apt-get update && apt-get install -y curl unzip

# Download BaGet release ZIP
RUN curl -L -o baget.zip https://github.com/loic-sharma/BaGet/releases/download/v0.4.0-preview2/BaGet.zip \
    && unzip baget.zip -d /app \
    && rm baget.zip


WORKDIR /app

# Set default URL to listen on port 8080
ENV ASPNETCORE_URLS=http://+:8080

EXPOSE 8080

ENTRYPOINT ["dotnet", "BaGet.dll"]
