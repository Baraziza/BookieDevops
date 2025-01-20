import os

DB_USER = "bookie_user"
DB_PASSWORD = "bookie_pass"
DB_HOST = "db"
DB_NAME = "bookie_db"

SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}"
SQLALCHEMY_TRACK_MODIFICATIONS = False
