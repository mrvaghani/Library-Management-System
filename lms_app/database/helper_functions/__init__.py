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

def add_document(doc_title: str, doc_pdate: str, doc_publisherid: int, doc_type: dict) -> dict:
    """
    Add a new document to database.
    :param doc_title: Document title

    :param doc_pdate: Date when the document was published

    :param doc_publisherid: ID of the publisher of the document

    :param doc_type: The type of document and additional data along with it.
            If doc_type = book:
                {
                    doc_type: "book",
                    isbn: "1-1234-5678-9",
                    author_pid: "123"
                }
            If doc_type = journal:
                {
                    doc_type: "journal",
                    volume_no: "123",
                    editor_pid: "123",
                    issue_no: "123",
                    scope: "science"
                }
            If doc_type = proceedings:
                {
                    doc_type: "proceedings",
                    cdate: "02/15/2020",
                    clocation: "New Jersey",
                    ceditor: "David Alan",
                    chair_pid: "123"
                }

    :return:
        {
            status: "success",
            msg: "1 row affected"
        }
    """
    pass


def get_document_copy_status(docid: int, copy_no: int, bid: int) -> dict:
    """
    Given DocumentID, Copy Number and Branch ID, return the current status of the document copy.
    Possible status: Reserved, Borrowed, Available

    :param docid: Document ID of the document we want to search
    :param copy_no: Copy number of the document we want to search
    :param bid: Branch ID of where the document is located
    :return: The status of the document
            {
            docid: "<given document id>",
            status: "Reserved|Borrowed|Available",
            err_msg: "Unable to find document"
            }
    """
    pass

