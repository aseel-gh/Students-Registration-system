import datetime


def get_today():
    today = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return today
