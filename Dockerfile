# Use ASP.NET 7.0 runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0

# Install necessary tools
RUN apt-get update && apt-get install -y curl unzip

# Download and extract BaGet
RUN curl -L -o baget.zip https://github.com/loic-sharma/BaGet/releases/download/v0.4.0-preview2/BaGet.zip \
    && unzip baget.zip -d /app \
    && rm baget.zip

# Set working directory
WORKDIR /app

# Create packages directory for local storage
RUN mkdir -p /app/packages

# Set environment variable for Cloud Run's expected port
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

# Set entrypoint to run BaGet on Cloud Run's port
ENTRYPOINT ["dotnet", "BaGet.dll"]
