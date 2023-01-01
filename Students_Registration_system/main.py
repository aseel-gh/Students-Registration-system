# from connection import cur, conn
import regester
import course
import schedule


# main class-----------------------------------------
class Home:
    # print the main menu
    while True:
        print("1.Register New Student\n"
              "2.Enroll Course\n"
              "3.Create New Course\n"
              "4.Create New Schedule\n"
              "5.Display Student Course Schedule\n"
              "6.Exit")

        num = int(input("choose from the menu:"))  # turn input into integer.

        if num == 1:
            regester.student.register_student()
        elif num == 2:
            course.course.enroll_course()
        elif num == 3:
            course.course.create_course()
        elif num == 4:
            schedule.schedule.create_schedule()
        elif num == 5:
            schedule.schedule.display_schedule()
        elif num == 6:
            exit()
        else:
            print("Insufficient entry!")
