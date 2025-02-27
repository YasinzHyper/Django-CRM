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

## Project Structure 📂

```plaintext
CRM/
├── dcrm/
│   ├── __pycache__/
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│
├── website/
│   ├── __pycache__/
│   ├── migrations/
│   ├── templates/
│   │   ├── add_record.html
│   │   ├── base.html
│   │   ├── home.html
│   │   ├── navbar.html
│   │   ├── record.html
│   │   ├── register.html
│   │   ├── update_record.html
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── forms.py
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   ├── views.py
│
├── .gitignore
├── manage.py
├── requirements.txt
└── virt/  # Virtual environment
```

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
