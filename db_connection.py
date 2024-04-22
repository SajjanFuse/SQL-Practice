import sqlite3

conn = sqlite3.connect('example.db')

cursor = conn.cursor()

# AUTOINCREMENT in sqlite, AUTO_INCREMENT in MYSQL
cursor.execute('''CREATE TABLE IF NOT EXISTS Employees (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, department TEXT)''')
cursor.execute('''INSERT INTO Employees (name, age, department) VALUES ('Castle', 30, 'HR')''')

conn.commit()

# Fetch and print data from the Employees table
cursor.execute('''SELECT * FROM Employees''')
rows = cursor.fetchall()

for row in rows:
    print(row)

# Close connection
conn.close()
conn.close()
