# Django CRM Database Reset Script for Windows PowerShell

Write-Host "=== Django CRM Database Reset Script ===" -ForegroundColor Green
Write-Host ""

Write-Host "1. Stopping any running containers..." -ForegroundColor Yellow
docker-compose down -v

Write-Host ""
Write-Host "2. Removing old Docker images..." -ForegroundColor Yellow
docker-compose build --no-cache

Write-Host ""
Write-Host "3. Starting fresh containers..." -ForegroundColor Yellow
docker-compose up -d

Write-Host ""
Write-Host "4. Waiting for services to be ready..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

Write-Host ""
Write-Host "5. Checking container status..." -ForegroundColor Yellow
docker-compose ps

Write-Host ""
Write-Host "6. Showing logs..." -ForegroundColor Yellow
docker-compose logs web

Write-Host ""
Write-Host "=== Setup Complete ===" -ForegroundColor Green
Write-Host "Access the application at: http://localhost:8000" -ForegroundColor Cyan
Write-Host "Login: admin / admin123" -ForegroundColor Cyan
