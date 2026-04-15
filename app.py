from bottle import route, run, template, static_file

@route('/')
def index():
    return template('index')

@route('/wiki')
def wiki():
    return template('wiki')

@route('/static/<filename:path>')
def static_files(filename):
    return static_file(filename, root='./static')

run(host='localhost', port=8080, debug=True, reloader=True)