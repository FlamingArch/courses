from flask import Blueprint, render_template

auth = Blueprint('auth', __name__)

@auth.route('/login')
def login():
    return render_template('login.html', text='Testing', user='John Doe')

@auth.route('/logout')
def logout():
    return '<p>Signed Out</p>'

@auth.route('/signup')
def sign_up():
    return render_template('signup.html')