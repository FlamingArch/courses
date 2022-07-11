from flask import Flask

secretKey = 'NOT TO BE INCLUDED IN PRODUCTION, ONLY INCLUDED HERE TO SHOW AN EXAMPLE'


def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = ''

    from .views import views
    from .auth import auth

    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')
    return app
