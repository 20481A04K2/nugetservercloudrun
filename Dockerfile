FROM mcr.microsoft.com/dotnet/aspnet:7.0

# Install curl and unzip
RUN apt-get update && apt-get install -y curl unzip

# Download BaGet zip (v0.4.0-preview2 since others failed)
RUN curl -L -o baget.zip https://github.com/loic-sharma/BaGet/releases/download/v0.4.0-preview2/BaGet.zip \
    && unzip baget.zip -d /app \
    && rm baget.zip

# Set working directory
WORKDIR /app

# Create persistent directory for packages
RUN mkdir /app/packages

# Expose default Cloud Run port
ENV PORT=8080
EXPOSE 8080

# Set entrypoint with PORT binding
ENTRYPOINT ["dotnet", "BaGet.dll", "--urls", "http://0.0.0.0:8080"]
