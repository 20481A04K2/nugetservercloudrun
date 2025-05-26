# Use the official BaGet release from NuGet (via Microsoft ASP.NET runtime base image)
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app

# Download BaGet server release package (replace version if needed)
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*
RUN curl -L -o baget.zip https://github.com/loic-sharma/BaGet/releases/download/v0.8.1/baget.zip \
    && unzip baget.zip -d /app \
    && rm baget.zip

# Expose port 80 for Cloud Run
EXPOSE 80

# Set environment variables here or pass them via Cloud Run
ENV ASPNETCORE_URLS=http://+:80

# Run BaGet
ENTRYPOINT ["dotnet", "BaGet.dll"]
