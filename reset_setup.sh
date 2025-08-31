#!/bin/bash

echo "=== Django CRM Database Reset Script ==="
echo ""

echo "1. Stopping any running containers..."
docker-compose down -v

echo ""
echo "2. Removing old Docker images..."
docker-compose build --no-cache

echo ""
echo "3. Starting fresh containers..."
docker-compose up -d

echo ""
echo "4. Waiting for services to be ready..."
sleep 10

echo ""
echo "5. Checking container status..."
docker-compose ps

echo ""
echo "6. Showing logs..."
docker-compose logs web

echo ""
echo "=== Setup Complete ==="
echo "Access the application at: http://localhost:8000"
echo "Login: admin / admin123"
