from flask import Flask, request, jsonify
from flask_mail import Mail, Message


app = Flask(__name__)


app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'kavangajera@gmail.com'
app.config['MAIL_PASSWORD'] = 'wslm qjoe htzp oxhp'
app.config['MAIL_DEFAULT_SENDER'] = 'kavangajera@gmail.com'

mail = Mail(app)


@app.route('/send_email/integrate', methods=['POST'])
def send_email_inte():
    


if __name__ == '__main__':
    app.run(debug=True)