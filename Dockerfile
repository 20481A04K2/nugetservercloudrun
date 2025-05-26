# Use .NET 7 SDK base image for runtime and dependencies
FROM mcr.microsoft.com/dotnet/aspnet:7.0

# Install required tools (curl, unzip)
RUN apt-get update && apt-get install -y curl unzip && apt-get clean

# Create application directory
WORKDIR /app

# Download and extract BaGet application
RUN curl -L -o baget.zip https://github.com/loic-sharma/BaGet/releases/download/v0.4.0-preview2/BaGet.zip \
    && unzip baget.zip -d . \
    && rm baget.zip

# Expose port 80
EXPOSE 80

# Set environment variables for ASP.NET Core
ENV ASPNETCORE_URLS=http://+:80

# Start the BaGet server
ENTRYPOINT ["dotnet", "BaGet.dll"]
