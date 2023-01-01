import modules.utils
from connection import cur, conn


# course class---------------------------------------
class Course:

    # enroll course-------------------------------------------
    @staticmethod
    def enroll_course():
        print('---------------- \n')
        while True:
            student_id = input("student id:")
            if student_id.isdigit():
                pass
            else:
                print("Invalid student id!")
                break

            course_id = input("course id:")
            if course_id.isdigit():
                pass
            else:
                print("Invalid course id!")
                break

            total_hour = input("total hour:")
            if total_hour.isdigit():
                pass
            else:
                print("Invalid total hour!")
                break

            enroll_date = modules.utils.get_today()

            query = f"""insert into enrollment_histories( student_id, course_id, enroll_date, total_hours)\
                                         values ('{student_id}', '{course_id}', '{enroll_date}','{total_hour}')"""

            con1 = f"""select course_id,student_id from enrollment_histories\
             where course_id = {course_id} and student_id = {student_id}"""
            cur.execute(con1)
            result1 = tuple(cur)

            con2 = f"""select * from students join courses c on students.level_id = c.level_id\
            where student_id ={student_id} and course_id = {course_id}"""
            cur.execute(con2)
            result2 = tuple(cur)

            con3 = f"""select count(student_id),`max_ capacity` from enrollment_histories \
            join courses c on c.course_id = enrollment_histories.course_id where c.course_id ={course_id}"""
            cur.execute(con3)
            result3 = tuple(cur)

            if len(result1) == 0:
                pass
            else:
                print('student already enrolled in course!')
                print('---------------- \n')
                break

            if len(result2) > 0:
                pass
            else:
                print('you should be in the same level to enroll!')
                print('---------------- \n')
                break

            if result3[0][0] <= int(result3[0][1]):
                cur.execute(query)
                conn.commit()
                print('course enrolled successfully')
                print('---------------- \n')
                break
            else:
                print('sorry class is full!')
                print('---------------- \n')
                break

    # create course-------------------------------------------
    @staticmethod
    def create_course():
        print('---------------- \n')
        while True:
            course_code = input("course code:")
            if course_code.isdigit():
                pass
            else:
                print("Invalid course code!")
                break

            course_name = input("course name:")

            validated_levels = ['A', 'B', 'C', 'D', 'a', 'b', 'c', 'd']
            level = input("Select level (A,B,C,D)")
            if level in validated_levels:
                level.upper()
                pass
            else:
                print("Invalid Level!")
                break

            max_capacity = input("max capacity:")
            hour_rate = input("hour rate:")

            cur.execute(f"""select level_id from levels where level_name='{level}'""")  # search in levels table
            result2 = tuple(cur)
            level_id = result2[0][0]

            query = f"""insert into courses( course_id, level_id, course_name, `max_ capacity`, rate_per_hour) \
            values ('{course_code}', '{level_id}','{course_name}','{max_capacity}','{hour_rate}')"""
            cur.execute(query)
            conn.commit()
            print("Course created successfully")
            print('---------------- \n')
            break


course = Course()  # create object from Course class.
