------------------------------------------------
--Administratove Functions Menu Demo Queries
------------------------------------------------

--Add a document copy.
Insert into document (title,pdate,publisherid) 
VALUES ('White Teeth', '08/07/1991', 41257);
SELECT SCOPE_IDENTITY();

Insert into copy (docid,copyno,bid,position) 
VALUES (1,1, 1, '001A03');

--Search document copy and check its status. 
SELECT cp.docid, cp.copyno, cp.bid
FROM dbo.copy as cp
WHERE cp.docid = 1 AND cp.copyno = 2 AND cp.bid = 1

--Add new reader. 
INSERT INTO dbo.reader (rtype, rname, raddress, phone_no)
VALUES ('Student', 'readername', 'reader address', 'reader phone')


--Print branch information (name and location)
SELECT [lname] ,[location]
FROM [CS631].[dbo].[branch]



--Get number N and branch number I as input and print the top N most frequentborrowers (Rid and name) in branch I and the number of books each has borrowed.
SELECT TOP 3 reader.rname as reader_name, borrow_info.rid, borrow_info.C as books_borrowed
FROM dbo.reader 
INNER JOIN (SELECT borrows.rid, count(*) as C
			FROM dbo.borrows
			WHERE borrows.bid = 1
			group by borrows.rid
			) as borrow_info
	ON (dbo.reader.rid = borrow_info.rid)
ORDER BY C DESC


--Get number N as input and print the top N most frequent borrowers (Rid and name) in the library and the number of books each has borrowed
SELECT TOP 3 reader.rname as reader_name, borrow_info.rid, borrow_info.C as books_borrowed
FROM dbo.reader 
INNER JOIN (SELECT borrows.rid, count(*) as C
			FROM dbo.borrows
			group by borrows.rid
			) as borrow_info
	ON (dbo.reader.rid = borrow_info.rid)
ORDER BY C DESC

--Get number N and branch number I as input and print the N most borrowed books in branch I
SELECT borrows.docid, count(*) as C
FROM dbo.borrows, dbo.book
WHERE dbo.book.docid = dbo.borrows.docid AND borrows.bid = 3
GROUP BY borrows.docid
ORDER BY C Desc

--Get number N as input and print the N most borrowed books in the library.
SELECT TOP 2 borrows.docid,count(*) as C
FROM [CS631].[dbo].[borrows], dbo.book
WHERE dbo.book.docid = dbo.borrows.docid
GROUP BY borrows.docid
ORDER BY C Desc

--Get a year as input and print the 10 most popular books of that year in the library. 
-- missing
SELECT book.docid, book.isbn, R.C
FROM dbo.book INNER JOIN 
					 (
					SELECT TOP 5 borrows.docid, count(*) as C
					FROM dbo.borrowing INNER JOIN dbo.borrows
					ON (dbo.borrowing.bor_no = dbo.borrows.bor_no)
					WHERE year(borrowing.bdtime) = '2010'
					GROUP BY borrows.docid
					ORDER BY C DESC
					) as R on book.docid = R.docid


--Get a start date S and an end date E as input and print, for each branch, the branch Id and name and the average fine paid by the borrowers for documents borrowed from this branch during the corresponding period of time.
SELECT branch_info.bid, branch_info.lname, borrow_info.average_fine
FROM dbo.branch as branch_info 
INNER JOIN (SELECT borrows.bid, AVG(dbo.borrowing.fine_in_cents) as average_fine
			FROM dbo.borrowing INNER JOIN dbo.borrows
				ON (dbo.borrowing.bor_no = dbo.borrows.bor_no)
			WHERE borrowing.fine_in_cents > 0 
				and borrowing.bdtime between '2010-01-01' and '2021-12-01'
				and borrows.bid IN (SELECT BID FROM dbo.branch)
			GROUP BY borrows.bid) as borrow_info 
	ON branch_info.bid = borrow_info.bid


-- End of DEMO --
