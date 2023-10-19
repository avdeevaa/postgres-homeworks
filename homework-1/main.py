"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2

import csv

connect = psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="1234"
)
cursor = connect.cursor()

#без этого не получается получить файлы в папке north data
customers = r"C:\Users\avdeevaa\PycharmProjects\postgres-homeworks\homework-1\north_data\customers_data.csv"
employees = r"C:\Users\avdeevaa\PycharmProjects\postgres-homeworks\homework-1\north_data\employees_data.csv"
orders = r"C:\Users\avdeevaa\PycharmProjects\postgres-homeworks\homework-1\north_data\orders_data.csv"

with open(customers) as file: #первая таблица
    cust = csv.reader(file)
    next(cust) # without this I have such error psycopg2.errors.StringDataRightTruncation: value too long for type character(7)
    for x in cust:
        cursor.execute('INSERT INTO customers VALUES (%s, %s, %s)', (x[0], x[1], x[2]))

connect.commit() #sending it to pgAdmin4

with open(employees) as file: #вторая таблица
    empl = csv.reader(file)
    next(empl)
    for x in empl:
        cursor.execute('INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)', (x[0], x[1], x[2], x[3], x[4], x[5]))

connect.commit() #sending second to pgAdmin4

with open(orders) as file: #третья таблица
    ord = csv.reader(file)
    next(ord)
    for x in ord:
        cursor.execute('INSERT INTO orders VALUES (%s, %s, %s, %s, %s)', (x[0], x[1], x[2], x[3], x[4]))

connect.commit() #sending third to pgAdmin4

