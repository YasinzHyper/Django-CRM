#!/bin/bash

echo "=== Django CRM Troubleshooting Script ==="
echo ""

echo "1. Checking Django installation..."
python -c "import django; print(f'Django version: {django.get_version()}')"

echo ""
echo "2. Checking database connection..."
python manage.py dbshell --command="SELECT 1;" 2>/dev/null && echo "✓ Database connection successful" || echo "✗ Database connection failed"

echo ""
echo "3. Checking migrations..."
python manage.py showmigrations

echo ""
echo "4. Checking static files..."
python manage.py findstatic css/style.css 2>/dev/null && echo "✓ Static files configured" || echo "✗ Static files not found"

echo ""
echo "5. Checking for records in database..."
python manage.py shell -c "
from website.models import Record
count = Record.objects.count()
print(f'Records in database: {count}')
if count > 0:
    print('Sample records:')
    for record in Record.objects.all()[:3]:
        print(f'  - {record.first_name} {record.last_name}')
"

echo ""
echo "6. Checking superuser..."
python manage.py shell -c "
from django.contrib.auth.models import User
admin_users = User.objects.filter(is_superuser=True)
print(f'Superusers: {admin_users.count()}')
for user in admin_users:
    print(f'  - {user.username}')
"

echo ""
echo "=== Troubleshooting Complete ==="
