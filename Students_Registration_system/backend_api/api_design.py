import json
from flask import Flask
from my_db import *

app = Flask(__name__)


# students api ----------------------------------
@app.route('/api/students')
def students():
    students = get_students()
    return json.dumps(students)


# courses api ----------------------------------
@app.route('/api/courses')
def courses():
    courses = get_courses()
    return json.dumps(courses)


# schedules api ----------------------------------
@app.route('/api/schedules')
def schedules():
    schedules = get_schedules()
    return json.dumps(schedules)


app.run(debug=True, host='127.0.0.1', port=6000)
