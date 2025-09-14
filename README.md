# Django-CRM(Customer Relationship Management) 🚀

The Django-based Customer Relationship Management (CRM) system enables user authentication and seamless CRUD operations, allowing users to create, read, update, and delete customer records efficiently while ensuring secure access and data management.

## Features ⚡

- **User Authentication**: Secure login and registration system.
- **CRUD Operations**: Add, View, Update, and Delete customer records.
- **Frontend Templates**: Prebuilt HTML templates for user interaction.
- **Modular Code Structure**: Organized Django apps for scalability.

## Technologies Used 🛠️

- **Backend**: Python (Django Framework)
- **Frontend**: HTML, Bootstrap
- **Database**: MySql
  
## Installation ⚙️

### Option 1: Docker Setup (Recommended) 🐳

The easiest way to run this application is using Docker and Docker Compose:

#### Setup Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/rajkelawala/Django-CRM.git
   cd Django-CRM
   ```

2. **Build and run with Docker Compose**:
   ```bash
   docker-compose up --build
   ```

3. **Access the application**:
   - Open your browser and go to `http://localhost:8000`
   - Login with the default superuser:
     - Username: `admin`
     - Password: `admin123`
   - You should see a dashboard with 5 sample customer records

#### Troubleshooting For Windows Users (Important!)

If you're on Windows and encounter the error `exec /app/entrypoint.sh: no such file or directory`, this is due to line ending differences between Windows and Unix systems. The repository now includes a `.gitattributes` file to handle this automatically, but if you cloned before this fix:

1. **Re-clone the repository** (recommended):
   ```bash
   git clone https://github.com/rajkelawala/Django-CRM.git
   cd Django-CRM
   ```

2. **Or convert line endings manually**:
   ```bash
   git config core.autocrlf false
   git rm --cached -r .
   git reset --hard
   ```

4. **Troubleshooting** (if you see database errors):
   ```bash
   # Reset everything and start fresh
   docker-compose down -v
   docker-compose build --no-cache
   docker-compose up -d
   
   # Check logs if issues persist
   docker-compose logs web
   
   # Run troubleshooting script
   docker-compose exec web ./troubleshoot.sh
   ```

5. **To stop the application**:
   ```bash
   docker-compose down
   ```

6. **To rebuild after making changes**:
   ```bash
   docker-compose up --build
   ```

### Option 2: Manual Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/rajkelawala/Django-CRM.git
   cd Django-CRM
   ```

2. **Create and activate a virtual environment**:

   ```bash
   python3 -m venv virt
   virt\Scripts\activate
   ```

3. **Install dependencies**:

   ```bash
   pip install -r requirements.txt
   ```

4. **Crete Migrations**:
   ```bash
   python manage.py makemigrations
   ```
   
5. **Apply migrations**:

   ```bash
   python manage.py migrate
   ```

6. **Create a superuser**:

   ```bash
   python manage.py createsuperuser
   ```

7. **Start the development server**:

   ```bash
   python manage.py runserver
   ```

## Usage 🎯

After running the development server:

- Navigate to the homepage.
- Register a new account or log in with existing credentials.
- Upon successful login, access protected areas of the application.
- Utilize the dashboard to manage customer information.

## Contributing 🌍

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/YourFeatureName
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m 'Add some feature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature/YourFeatureName
   ```
5. Open a Pull Request.

## License 📄

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact 📬

Developed by Raj Kelawala. For any inquiries or feedback, please contact me at [rajkelawala28@gmail.com](mailto:rajkelawala28@gmail.com).
