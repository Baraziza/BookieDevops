from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config["SQLALCHEMY_DATABASE_URI"] = os.getenv("DATABASE_URL")
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.init_app(app)

    from app.models import Book  
    with app.app_context():
        db.create_all()

    from app.routes import app as routes_blueprint
    app.register_blueprint(routes_blueprint, url_prefix="/")  
    return app
