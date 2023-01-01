from connection import cur
from collections import defaultdict


def get_students():
    query = 'select s.student_id,s.student_name,s.level_id,s.DOB,c.mobile_number,c.email from students s\
     join contacts c on c.contact_id = s.contact_id'
    cur.execute(query)
    data = cur.fetchall()
    students_dictionary = convert(data)
    return students_dictionary


def get_courses():
    query = 'select * from courses'
    cur.execute(query)
    data = cur.fetchall()
    courses_dictionary = convert(data)
    return courses_dictionary


def get_schedules():
    query = 'select * from course_shedules'
    cur.execute(query)
    data = cur.fetchall()
    schedules_dictionary = convert(data)
    return schedules_dictionary


def convert(data):
    res = defaultdict(list)
    for i in range(len(data)):
        for a in data[i]:
            res[i].append(a)

    return dict(res)
