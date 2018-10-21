from flask import Flask
from flask_cors import CORS

from api import v1

def create_app():
    app = Flask(__name__)
    CORS(app)

    app.register_blueprint(v1.api_bp, url_prefix=f'/v{v1.VERSION}')

    return app
