import mariadb

conn = mariadb.connect(user='root',
                       password='123456',
                       host='localhost',
                       db='Students_Registration')

cur = conn.cursor()
