# Docker Setup Guide for Django CRM

## Quick Start

1. **Start the application:**
   ```bash
   docker-compose up --build
   ```

2. **Access the application:**
   - URL: http://localhost:8000
   - Username: `admin`
   - Password: `admin123`

## Troubleshooting

### If you see error pages after logging in:

1. **Check the logs:**
   ```bash
   docker-compose logs web
   ```

2. **Run the troubleshooting script:**
   ```bash
   docker-compose exec web ./troubleshoot.sh
   ```

3. **Manually create sample data if needed:**
   ```bash
   docker-compose exec web python manage.py create_sample_data
   ```

4. **Check database contents:**
   ```bash
   docker-compose exec web python manage.py shell
   ```
   Then run:
   ```python
   from website.models import Record
   print(f"Records count: {Record.objects.count()}")
   for record in Record.objects.all()[:5]:
       print(f"{record.first_name} {record.last_name} - {record.email}")
   ```

5. **Collect static files if needed:**
   ```bash
   docker-compose exec web python manage.py collectstatic --noinput
   ```

### Common Issues and Solutions:

1. **"No records found" message:**
   - Run: `docker-compose exec web python manage.py create_sample_data`

2. **Static files not loading:**
   - Run: `docker-compose exec web python manage.py collectstatic --noinput`
   - Restart: `docker-compose restart web`

3. **Database connection errors:**
   - Wait for MySQL to fully start: `docker-compose logs db`
   - Restart both services: `docker-compose restart`

4. **Permission errors:**
   - On Linux/Mac: `chmod +x entrypoint.sh troubleshoot.sh`

## Development Commands

### Database Management:
```bash
# Apply new migrations
docker-compose exec web python manage.py migrate

# Create new migrations
docker-compose exec web python manage.py makemigrations

# Access Django shell
docker-compose exec web python manage.py shell

# Access database shell
docker-compose exec web python manage.py dbshell
```

### User Management:
```bash
# Create a new superuser
docker-compose exec web python manage.py createsuperuser

# Change user password
docker-compose exec web python manage.py changepassword username
```

### Logs and Debugging:
```bash
# View application logs
docker-compose logs web

# View database logs
docker-compose logs db

# Follow logs in real-time
docker-compose logs -f web

# Access container shell
docker-compose exec web bash
```

## Stopping the Application

```bash
# Stop services
docker-compose down

# Stop and remove volumes (WARNING: This will delete all data)
docker-compose down -v
```

## Production Considerations

For production deployment:
1. Change default passwords in `.env` file
2. Set `DEBUG=False` in Django settings
3. Use a proper web server (nginx + gunicorn)
4. Use SSL certificates
5. Set up proper backup for MySQL data
