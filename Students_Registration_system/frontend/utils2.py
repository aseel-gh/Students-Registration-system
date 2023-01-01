import requests


url_students = 'http://127.0.0.1:6000/api/students'
# headers = {'api_key': '12345'}
url_courses = 'http://127.0.0.1:6000/api/courses'
url_schedule = 'http://127.0.0.1:6000/api/schedules'


def get_students():
    # response = requests.get(url_students, headers=headers)
    response = requests.get(url_students)
    if response.status_code == 200:
        return response.json()
    else:
        print('Error in response')


def get_courses():
    response = requests.get(url_courses)

    if response.status_code == 200:
        return response.json()
    else:
        print('Error in response')


def get_schedules():
    response = requests.get(url_schedule)

    if response.status_code == 200:
        return response.json()
    else:
        print('Error in response')
