import datetime

import pyodbc
import os
from os.path import join, dirname
from dotenv import load_dotenv, find_dotenv

dotenv_path = join(os.path.realpath('../../ENV'), 'SQL_SERVER.env')
# dotenv_path = find_dotenv('SQL_SERVER.env')
load_dotenv(dotenv_path)

sql_server = 'localhost'
sql_database = 'CS631'
sql_username = os.environ.get("MSSQL_SA_USER")
sql_password = os.environ.get("MSSQL_SA_PASSWORD")

cnxn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={sql_server};DATABASE={sql_database};UID={sql_username};PWD={sql_password}')
cursor = cnxn .cursor()

# Sample select query
cursor.execute("SELECT * FROM CS631.dbo.document;")
row = cursor.fetchone()
while row:
    print(f'{row[0]}\t {row[1]}')
    row = cursor.fetchone()


# cnxn2 = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={sql_server};DATABASE=Testdb;UID={sql_username};PWD={sql_password}')
# cursor2 = cnxn2 .cursor()
# # Sample insert query
# # https://docs.microsoft.com/en-us/sql/connect/python/pyodbc/step-3-proof-of-concept-connecting-to-sql-using-pyodbc?view=sql-server-ver15
# CURRENT_TIMESTAMP = datetime.datetime.now()
# count = cursor.execute("""
# INSERT INTO Testdb.dbo.sample (firstname, lastname, age, dob)
# VALUES (?,?,?,?)""",
# 'John2', 'Cena', 50, '01/20/2020').rowcount
# cnxn.commit()
# print('Rows inserted: ' + str(count))
