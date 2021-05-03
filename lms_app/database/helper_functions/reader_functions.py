import pyodbc
import os
import time
from os.path import join
from dotenv import load_dotenv


dotenv_path = join(os.path.realpath('../../ENV'), 'SQL_SERVER.env')
load_dotenv(dotenv_path)

sql_server = 'localhost'
sql_database = 'CS631'
sql_username = os.environ.get("MSSQL_SA_USER")
sql_password = os.environ.get("MSSQL_SA_PASSWORD")

cnxn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={sql_server};DATABASE={sql_database};UID={sql_username};PWD={sql_password}', autocommit=True)
cursor = cnxn .cursor()

# Sample select query
# cursor.execute("SELECT * FROM CS631.dbo.document;")
# row = cursor.fetchone()
# while row:
#     print(f'{row[0]}\t {row[1]}')
#     row = cursor.fetchone()

# count = cursor.execute("""
# INSERT INTO Testdb.dbo.sample (firstname, lastname, age, dob)
# VALUES (?,?,?,?)""",
# 'John2', 'Cena', 50, time.strftime('%m-%d-%Y %H:%M:%S')).rowcount
# cnxn.commit()
# print('Rows inserted: ' + str(count))


def is_being_borrowed(db_cursor, doc_id: int, copy_no: int, bid: int) -> bool:

    # Check if the document is in BORROWING table and the RDTIME is set to NULL.
    # In this case, it means document is currently being borrowed and has not been returned.
    query = """
        SELECT COUNT(*)
        FROM dbo.borrowing INNER JOIN dbo.borrows
            ON (dbo.borrowing.bor_no = dbo.borrows.bor_no)
        WHERE rdtime IS NULL 
            AND borrows.docid = ?
            AND borrows.copyno = ?
            AND borrows.bid = ?
                """
    values = doc_id, copy_no, bid
    resp = db_cursor.execute(query, values)
    aa = db_cursor.fetchone()
    row_found = int(aa[0])
    if row_found > 0:
        return True
    else:
        return False


def search_document(db_cursor, doc_id: int = '', doc_title: str = '', publisher_name: str = '') -> dict:
    if doc_id != '':
        resp = db_cursor.execute("""
            SELECT [docid], [title], [pdate], [publisherid]
            FROM CS631.dbo.document
            WHERE docid = ? """, doc_id)

        columns = [column[0] for column in cursor.description]
        results = []
        for row in resp.fetchall():
            results.append(dict(zip(columns, row)))
        return {'data': results, 'msg': None}

    if doc_title != '':
        resp = db_cursor.execute("""
            SELECT [docid], [title], [pdate], [publisherid]
            FROM CS631.dbo.document
            WHERE document.title = ? """, doc_title)

        columns = [column[0] for column in cursor.description]
        results = []
        for row in resp.fetchall():
            results.append(dict(zip(columns, row)))
        return {'data': results, 'msg': None}

    if publisher_name != '':
        resp = db_cursor.execute("""SELECT [docid], [title], [pdate], pubname
            FROM CS631.dbo.document as document, CS631.dbo.publisher as publisher
            WHERE pubname = ? """, publisher_name)

        columns = [column[0] for column in cursor.description]
        results = []
        for row in resp.fetchall():
            results.append(dict(zip(columns, row)))
        return {'data': results, 'msg': None}


def document_checkout(db_cursor, doc_id: int, copy_no: int, bid: int, rid: int, connection) -> dict:

    # If this document is already being borrowed, it is not available for checkout.
    if not is_being_borrowed(db_cursor=db_cursor, doc_id=doc_id, copy_no=copy_no, bid=bid):
        query = """
        SET NOCOUNT ON;
        Insert into dbo.borrowing (bdtime,rdtime)
            VALUES (?, ?);
        SELECT SCOPE_IDENTITY();
        """
        my_values = time.strftime('%m-%d-%Y %H:%M:%S'), None
        db_cursor = connection.cursor()
        db_cursor.execute(query, my_values)
        db_cursor.commit()
        aa = db_cursor.fetchone()
        bor_num = int(aa[0])
        print(f'Found the newly generated value for bor_num: {bor_num}')
        a = db_cursor.commit()

        query2 = """
        SET NOCOUNT OFF;
        Insert into borrows (bor_no,docid,copyno,bid,rid)
        VALUES (?,?,?,?,?);
        """
        my_values2 = bor_num, doc_id, copy_no, bid, rid
        row_count = db_cursor.execute(query2, my_values2)
        db_cursor.commit()
        print('Rows inserted: ' + str(db_cursor.rowcount))
        return {'status': 'success', 'data': None, 'msg': None}
    else:
        return {'status': 'failed', 'data': 'Document is currently being borrowed.', 'msg': None}


def document_return(db_cursor, doc_id: int, copy_no: int, bid: int) -> dict:
    query = """
        UPDATE dbo.borrowing
        SET rdtime = CURRENT_TIMESTAMP
        WHERE bor_no IN (
                        SELECT BOR_NO
                        FROM dbo.borrows
                        WHERE borrows.docid = ? AND borrows.copyno = ? AND borrows.bid = ? 
        )
        """
    my_values = (doc_id, copy_no, bid)
    db_cursor.execute(query, my_values)
    return {'status': 'success', 'data': None, 'msg': None}


def document_reserve(db_cursor, doc_id: int, copy_no: int, bid: int, rid: int):

    # If this document is already being borrowed, it is not available for checkout.
    if is_being_borrowed(db_cursor=db_cursor, doc_id=doc_id, copy_no=copy_no, bid=bid):
        return {'status': 'failed', 'data': 'Document is currently being borrowed.', 'msg': None}
    else:
        query = """
                SET NOCOUNT ON;
                Insert into reservation(dtime) 
                    VALUES (?);
                SELECT SCOPE_IDENTITY();
                """
        my_values = time.strftime('%m-%d-%Y %H:%M:%S')
        db_cursor.execute(query, my_values)
        db_cursor.commit()
        aa = db_cursor.fetchone()
        res_num = int(aa[0])
        print(f'Found the newly generated value for res_num: {res_num}')
        a = db_cursor.commit()

        query2 = """
                SET NOCOUNT OFF;
                Insert into reserves (rid, reservation_no, docid, copyno, bid)
                    VALUES (?, ?, ?, ?, ?);
                """
        my_values2 = rid, res_num, doc_id, copy_no, bid
        row_count = db_cursor.execute(query2, my_values2)
        db_cursor.commit()
        print('Rows inserted: ' + str(db_cursor.rowcount))
        return {'status': 'success', 'data': None, 'msg': None}


cnxn2 = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={sql_server};DATABASE={sql_database};UID={sql_username};PWD={sql_password}', autocommit=True)
# res = document_checkout(db_cursor=cursor, doc_id=1, copy_no=1, bid=1, rid=300, connection=cnxn2)
# res = document_return(db_cursor=cursor, doc_id=1, copy_no=1, bid=1)
# res = is_being_borrowed(db_cursor=cursor, doc_id=9, copy_no=1, bid=6)
res = document_reserve(db_cursor=cursor, doc_id=9, copy_no=1, bid=6, rid=300)
print(res)
