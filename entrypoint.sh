#!/bin/bash

# Wait for the database to be ready
echo "Waiting for MySQL to be ready..."
while ! nc -z db 3306; do
  sleep 1
done
echo "MySQL is ready!"

# Wait a bit more to ensure MySQL is fully initialized
sleep 5

# Check if migrations directory exists, if not create it
echo "Ensuring migrations directory exists..."
mkdir -p website/migrations
touch website/migrations/__init__.py

# Remove any existing migration files to start fresh
echo "Cleaning up old migrations..."
find website/migrations -name "*.py" ! -name "__init__.py" -delete

# Create fresh migrations
echo "Creating fresh migrations..."
python manage.py makemigrations website

# Apply all migrations
echo "Applying migrations..."
python manage.py migrate

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Create superuser if it doesn't exist
echo "Creating superuser..."
python manage.py shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123')
    print('Superuser created: admin/admin123')
else:
    print('Superuser already exists')
"

# Create sample data
echo "Creating sample data..."
python manage.py create_sample_data

# Start server
echo "Starting Django development server..."
python manage.py runserver 0.0.0.0:8000
