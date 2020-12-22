import flask
import os

application = flask.Flask(__name__)

# Only enable Flask debugging if an env var is set to true
application.debug = os.environ.get('FLASK_DEBUG') in ['true', 'True']

# Get application version from env
app_version = os.environ.get('APP_VERSION')

@application.route('/')
def hello_world():
    message = "Hello, world!"
    return flask.render_template('index.html',
                                  title=message,
                                  flask_debug=application.debug,
                                  app_version='1.0.0')


if __name__ == '__main__':
    application.run(host='0.0.0.0',port=8080)
