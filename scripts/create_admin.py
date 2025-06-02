from werkzeug.security import generate_password_hash
from flask_appbuilder.security.sqla.models import User, Role
from sqlalchemy.exc import IntegrityError
from sqlalchemy import inspect
from airflow import settings

def main():
    session = settings.Session()
    inspector = inspect(session.bind)
    if not inspector.has_table("ab_user"):
        print("Tabela 'ab_user' nie istnieje w bazie. Pomijam tworzenie użytkownika.")
        return

    existing = session.query(User).filter_by(username="admin").first()
    if existing:
        print("User 'admin' already exists - not creating again.")
        return

    admin_role = session.query(Role).filter_by(name="Admin").first()
    if not admin_role:
        print("Admin role not found in the database. Please ensure Airflow has been started at least once.")
        return

    u = User()
    u.first_name = "admin"
    u.last_name = "user"
    u.username = "admin"
    u.email = "admin@example.com"

    u.password = generate_password_hash("admin", method='pbkdf2:sha256', salt_length=8)

    u.roles = [admin_role]

    session.add(u)
    try:
        session.commit()
        print("✔ User 'admin' has been successfully created with password 'admin'.")
    except IntegrityError:
        session.rollback()
        print("‼ There was a problem creating the user - it may already exist.")

if __name__ == "__main__":
    main()