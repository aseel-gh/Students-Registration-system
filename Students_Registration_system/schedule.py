from connection import cur, conn


# schedule class------------------------------------
class Schedule:

    @staticmethod
    def create_schedule():
        print('---------------- \n')
        while True:
            day = input("Select Day(Weekdays):")
            if day.isalpha():
                pass
            else:
                print("Invalid day!")
                break

            course_id = input("course id:")
            if course_id.isdigit():
                pass
            else:
                print("Invalid course id!")
                break

            start_time = input("start time (HH:MM:SS):")

            duration = input("duration:")
            if duration.isdigit():
                pass
            else:
                print("Invalid duration!")
                break

            query1 = f"""insert into course_shedules(course_id, day, duration, start_time) \
            values('{course_id}', '{day}', '{duration}', '{start_time}')"""

            con1 = f"""select * from course_shedules \
            where day= '{day}' and start_time='{start_time}' and duration = {duration};"""
            cur.execute(con1)
            result1 = tuple(cur)

            if len(result1) == 0:
                cur.execute(query1)
                conn.commit()
                print("schedule created successfully")
                print('---------------- \n')
                break
            else:
                print('sorry, there is class in the same day and start time!')
                print('---------------- \n')
                break

# ----------------------------------------
    @staticmethod
    def display_schedule():
        print('---------------- \n')
        while True:
            student_id = input("student id:")
            if student_id.isdigit():
                pass
            else:
                print("Invalid student id!")
                break

            query1 = f"""select c2.course_id,c2.course_name,cs.day,cs.start_time\
            from course_shedules cs join (select e.course_id, c.course_name\
            from enrollment_histories e join courses c on c.course_id = e.course_id\
            where e.student_id = {student_id}) c2 on c2.course_id = cs.course_id"""
            cur.execute(query1)
            result = tuple(cur)

            for i in range(len(result)):
                print(result[i])
                print("\n")
            print('---------------- \n')
            break


schedule = Schedule()  # create object from Schedule class.
