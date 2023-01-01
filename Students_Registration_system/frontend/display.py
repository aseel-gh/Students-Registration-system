from flask import Flask, render_template
from utils2 import *

app = Flask(__name__)


# display courses------------------
@app.route("/courses")
def courses():
    data_dict = get_courses()
    context = {'data': data_dict}
    return render_template("courses.html", **context)


# display courses schedule------------------
@app.route("/courses_schedule")
def courses_schedule():
    data_dict = get_schedules()
    context = {'data': data_dict}
    return render_template("courses_schedule.html", **context)


# display students------------------
@app.route("/students")
def my_students():
    data_dict = get_students()
    context = {'data': data_dict}
    return render_template("students.html", **context)


app.run(debug=True, host='127.0.0.1', port=5000)
