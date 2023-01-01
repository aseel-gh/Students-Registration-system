from connection import cur, conn


# student class------------------------------------------------
class Student:

    # Register  New Student function-------------
    @staticmethod
    def register_student():
        print('---------------- \n')
        while True:
            student_name = input("student name:")
            if student_name.isalpha():
                pass
            else:
                print("Invalid name!")
                break

            dob = input("date of birth (DD-MM-YYYY):")

            address = input("address:")

            validated_levels = ['A', 'B', 'C', 'D', 'a', 'b', 'c', 'd']
            level = input("Select level (A,B,C,D)")
            if level in validated_levels:
                level.upper()
                pass
            else:
                print("Invalid Level!")
                break

            mobile_number = input("mobile number:")
            if mobile_number.isdigit():
                pass
            else:
                print("Invalid mobile number!")
                break

            email = input("Email:")
            if '@' in email:
                pass
            else:
                print("Invalid email!")
                break

            # insert into contacts.
            query1 = f"""insert into contacts(mobile_number, email) values ('{mobile_number}', '{email}')"""
            cur.execute(query1)
            cur.execute(f"""select contact_id from contacts where email='{email}' \
            and mobile_number='{mobile_number}'""")  # search in contacts table
            result = tuple(cur)
            contact_id = result[0][0]

            cur.execute(f"""select level_id from levels where level_name='{level}'""")  # search in levels table
            result2 = tuple(cur)
            level_id = result2[0][0]

            cur.execute(f"""insert into addresses(address_description) values ('{address}')""")
            cur.execute(f"""select address_id  from addresses where address_description='{address}'""")
            result3 = tuple(cur)
            address_id = result3[0][0]

            query2 = f"""insert into students( student_name, contact_id, address_id, level_id, DOB)\
             values('{student_name}', '{contact_id}', '{address_id}', '{level_id}', '{dob}')"""
            cur.execute(query2)
            conn.commit()
            print("Student registered successfully")
            print('---------------- \n')
            break


student = Student()  # create object from Student class.
