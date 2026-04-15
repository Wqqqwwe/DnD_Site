from bottle import route, run, template, static_file

@route('/')
def home():
    return template('index')

@route('/static/<filename:path>')
def server_static(filename):
    return static_file(filename, root='./static')

run(host='localhost', port=8080, debug=True, reloader=True)