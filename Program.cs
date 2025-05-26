using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "✅ Hello from .NET 7 on a GCP VM via Cloud Build and systemd!");

app.Run("http://0.0.0.0:8080");
