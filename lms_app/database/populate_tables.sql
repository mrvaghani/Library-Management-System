-- Populate Publisher Table
Insert into publisher (publisherid,pubname,address) VALUES (71205,'Donall Linskey', '85 Crownhardt Place');
Insert into publisher (publisherid,pubname,address) VALUES (87373,'Maddi Leah', '55 Sauthoff Street');
Insert into publisher (publisherid,pubname,address) VALUES (26915,'Ernest Poulsom', '4421 Morningstar Hill');
Insert into publisher (publisherid,pubname,address) VALUES (47438,'Eleonora Ruthen', '9 Gina Trail');
Insert into publisher (publisherid,pubname,address) VALUES (25064,'Buck Gunstone', '21916 Sutteridge Place');
Insert into publisher (publisherid,pubname,address) VALUES (21148,'Averil Harroll', '90615 Truax Way');
Insert into publisher (publisherid,pubname,address) VALUES (68241,'Randene Thow', '302 Towne Plaza');
Insert into publisher (publisherid,pubname,address) VALUES (79166,'Marcela Beddow', '66 Upham Circle');
Insert into publisher (publisherid,pubname,address) VALUES (75158,'Westleigh Filyakov', '9679 6th Trail');
Insert into publisher (publisherid,pubname,address) VALUES (21515,'Ruddy Yeskov', '4326 Marquette Avenue');
-- Added after initial table creation
Insert into publisher (publisherid,pubname,address) VALUES (29511,'Verla Spada', '9 5th Pass');
Insert into publisher (publisherid,pubname,address) VALUES (41257,'Calv Fearnside', '898 Northwestern Point');
Insert into publisher (publisherid,pubname,address) VALUES (22217,'Christie Pretious', '72 Lighthouse Bay Alley');
Insert into publisher (publisherid,pubname,address) VALUES (37433,'Beverie Budgen', '6 Gulseth Circle');
Insert into publisher (publisherid,pubname,address) VALUES (94273,'Biron Carslake', '9692 Menomonie Trail');
Insert into publisher (publisherid,pubname,address) VALUES (12275,'Dacie Ridge', '6 Waxwing Point');


-- Populate Document Table
insert into document (docid, title, pdate, publisherid) values (1, 'Handbook of Amygdala Structure and Function', '2020-11-29', 71205);
insert into document (docid, title, pdate, publisherid) values (2, 'Dysphagia  (Third Edition)', '2011-11-07', 87373);
insert into document (docid, title, pdate, publisherid) values (3, 'Extrusion Cooking', '2010-08-23', 26915);
insert into document (docid, title, pdate, publisherid) values (4, 'Obesity Hypoventilation Syndrome', '2011-05-14', 47438);
insert into document (docid, title, pdate, publisherid) values (5, 'Metabolic Disorders and Shen in Integrative Cardiovascular Chinese Medicine', '2013-06-27', 25064);
insert into document (docid, title, pdate, publisherid) values (6, 'Bioactive Natural Products', '2016-12-12', 21148);
insert into document (docid, title, pdate, publisherid) values (7, 'Handbook of Chitin and Chitosan', '2017-08-14', 68241);
insert into document (docid, title, pdate, publisherid) values (8, 'Vibrational Spectroscopy Applications in Biomedical, Pharmaceutical and Food Sciences', '2021-02-14', 79166);
insert into document (docid, title, pdate, publisherid) values (9, 'Handbook on Miniaturization in Analytical Chemistry', '2017-07-07', 75158);
insert into document (docid, title, pdate, publisherid) values (10, 'Geological Records of Tsunamis and Other Extreme Waves', '2010-03-15', 21515);
-- Added after initial table creation
Insert into document (docid,title,pdate,publisherid) VALUES (11,'Harry Potter and the Goblet of Fire', '10/29/1990', 29511);
Insert into document (docid,title,pdate,publisherid) VALUES (12,'White Teeth', '08/07/1991', 41257);
Insert into document (docid,title,pdate,publisherid) VALUES (13,'The Corrections', '09/13/1991', 68241);
Insert into document (docid,title,pdate,publisherid) VALUES (14,'Runaway', '04/30/1993', 29511);
Insert into document (docid,title,pdate,publisherid) VALUES (15,'Cloud Atlas', '11/02/1993', 47438);
Insert into document (docid,title,pdate,publisherid) VALUES (16,'Never Let Me Go ', '12/30/1993', 75158);
Insert into document (docid,title,pdate,publisherid) VALUES (17,'Kafka on the Shore', '08/19/1994', 68241);
Insert into document (docid,title,pdate,publisherid) VALUES (18,'The Road', '09/13/1994', 47438);
Insert into document (docid,title,pdate,publisherid) VALUES (19,'The Last Samurai', '12/30/1996', 22217);
Insert into document (docid,title,pdate,publisherid) VALUES (20,'The Neapolitan Novels', '10/10/1997', 21515);
Insert into document (docid,title,pdate,publisherid) VALUES (21,'The Argonauts', '12/08/1997', 75158);
Insert into document (docid,title,pdate,publisherid) VALUES (22,'The Sellout', '11/09/1998', 37433);
Insert into document (docid,title,pdate,publisherid) VALUES (23,'The Wind-Up Bird Chronicle', '11/07/2001', 37433);
Insert into document (docid,title,pdate,publisherid) VALUES (24,'Harry Potter and the Philosophers Stone', '12/26/2005', 21515);
Insert into document (docid,title,pdate,publisherid) VALUES (25,'Rabbit at Rest', '03/08/2006', 68241);
Insert into document (docid,title,pdate,publisherid) VALUES (26,'Disgrace', '09/14/2006', 26915);
Insert into document (docid,title,pdate,publisherid) VALUES (27,'The Shipping News', '01/18/2007', 94273);
Insert into document (docid,title,pdate,publisherid) VALUES (28,'Possession', '01/23/2007', 22217);
Insert into document (docid,title,pdate,publisherid) VALUES (29,'The Poisonwood Bible', '12/10/2007', 12275);
Insert into document (docid,title,pdate,publisherid) VALUES (30,'The Secret History', '07/11/2008', 94273);
Insert into document (docid,title,pdate,publisherid) VALUES (31,'The God of Small Things', '12/22/2008', 68241);
Insert into document (docid,title,pdate,publisherid) VALUES (32,'All the Pretty Horses', '01/19/2010', 87373);
Insert into document (docid,title,pdate,publisherid) VALUES (33,'Infinite Jest', '06/11/2010', 21515);
Insert into document (docid,title,pdate,publisherid) VALUES (34,'A Suitable Boy', '09/02/2010', 71205);
Insert into document (docid,title,pdate,publisherid) VALUES (35,'Regeneration', '10/15/2010', 21515);


-- Populate Branch Table
Insert into branch (bid,lname,location) VALUES (1,'Nutley Library', 'Nutley');
Insert into branch (bid,lname,location) VALUES (2,'Bloomfield Library', 'Bloomfield');
Insert into branch (bid,lname,location) VALUES (3,'Parsippany Library', 'Parsippany');
Insert into branch (bid,lname,location) VALUES (4,'Newark Library', 'Newark');
Insert into branch (bid,lname,location) VALUES (5,'Morristown Library', 'Morristown');
Insert into branch (bid,lname,location) VALUES (6,'Clifton Library', 'Clifton');


-- Populate Copy Table
Insert into copy (docid,copyno,bid,position) VALUES (1,1, 1, '001A03');
Insert into copy (docid,copyno,bid,position) VALUES (1,2, 1, '001A03');
Insert into copy (docid,copyno,bid,position) VALUES (1,3, 1, '001A03');
Insert into copy (docid,copyno,bid,position) VALUES (1,4, 1, '001A03');
Insert into copy (docid,copyno,bid,position) VALUES (1,5, 1, '001A03');
Insert into copy (docid,copyno,bid,position) VALUES (1,6, 1, '001A03');
Insert into copy (docid,copyno,bid,position) VALUES (2,1, 1, '001A04');
Insert into copy (docid,copyno,bid,position) VALUES (2,2, 1, '001A04');
Insert into copy (docid,copyno,bid,position) VALUES (2,3, 1, '001A04');
Insert into copy (docid,copyno,bid,position) VALUES (2,4, 1, '001A04');
Insert into copy (docid,copyno,bid,position) VALUES (1,1, 2, '001B01');
Insert into copy (docid,copyno,bid,position) VALUES (1,2, 2, '001B01');
Insert into copy (docid,copyno,bid,position) VALUES (2,1, 2, '001B02');
Insert into copy (docid,copyno,bid,position) VALUES (2,2, 2, '001B02');
Insert into copy (docid,copyno,bid,position) VALUES (3,1, 2, '001B02');
Insert into copy (docid,copyno,bid,position) VALUES (3,2, 2, '001B02');
Insert into copy (docid,copyno,bid,position) VALUES (3,3, 2, '001B02');
Insert into copy (docid,copyno,bid,position) VALUES (4,1, 3, '001C05');
Insert into copy (docid,copyno,bid,position) VALUES (5,1, 3, '001C05');
Insert into copy (docid,copyno,bid,position) VALUES (5,2, 3, '001C05');
Insert into copy (docid,copyno,bid,position) VALUES (5,3, 3, '001C05');
Insert into copy (docid,copyno,bid,position) VALUES (6,1, 4, '001C05');
Insert into copy (docid,copyno,bid,position) VALUES (6,2, 4, '001C05');
Insert into copy (docid,copyno,bid,position) VALUES (6,3, 4, '001C05');
Insert into copy (docid,copyno,bid,position) VALUES (7,1, 5, '001D01');
Insert into copy (docid,copyno,bid,position) VALUES (7,2, 5, '001D01');
Insert into copy (docid,copyno,bid,position) VALUES (7,3, 5, '001D01');
Insert into copy (docid,copyno,bid,position) VALUES (8,1, 6, '001D01');
Insert into copy (docid,copyno,bid,position) VALUES (9,1, 6, '001E01');
Insert into copy (docid,copyno,bid,position) VALUES (10,1, 6, '001E01');
Insert into copy (docid,copyno,bid,position) VALUES (10,2, 6, '001E01');


-- Populate Borrowing Table
Insert into borrowing (bor_no,bdtime,rdtime) VALUES (103,'07-13-2020 10:00AM', '07-28-2020 11:00AM');
Insert into borrowing (bor_no,bdtime,rdtime) VALUES (104,'08-01-2020 03:00PM', '08-25-2020 01:00PM');
Insert into borrowing (bor_no,bdtime,rdtime) VALUES (105,'10-22-2020 04:00PM', '10-23-2020 02:00PM');
Insert into borrowing (bor_no,bdtime,rdtime) VALUES (106,'12-23-2020 08:00AM', '12-25-2020 05:00PM');
Insert into borrowing (bor_no,bdtime,rdtime) VALUES (107,'04-04-2020 12:00PM', '04-10-2020 09:00AM');
Insert into borrowing (bor_no,bdtime,rdtime) VALUES (108,'05-05-2020 02:30PM', '05-26-2020 12:30PM');
Insert into borrowing (bor_no,bdtime,rdtime) VALUES (109,'10-18-2020 09:30AM', '10-29-2020 04:30PM');


-- Populate Reader Table
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (300,'Student', 'James', 'NO 2,First Street,Harrison,NJ07029', '1111111111');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (301,'Senior Citizen', 'Gerrard', 'NO 4,Euclid Avenue, Kearny, NJ07032', '2222222222');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (302,'Student', 'Messi', 'NO 12, Second Cross Street, Paterson, NJ07040', '3333333333');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (303,'Staff', 'Ronaldo', 'NO 5, Halstead Street, Kearny, NJ07032', '4444444444');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (304,'Senior Citizen', 'Lampard', 'NO 7, Hudson Avenue, Hudson, NJ07033', '5555555555');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (305,'Staff', 'Drogba', 'NO 8, Third Street, Paterson, NJ07040', '6666666666');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (306,'Student', 'Neymar', 'NO 15, Union Street, Newark, NJ07107', '7777777777');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (307,'Senior Citizen', 'Ramos', 'NO 49, Bloomfield Avuenue, Bloomfield, NJ07100', '8888888888');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (308,'Student', 'Rooney', 'NO 30, Third Cross Street, Paterson, NJ07040', '9898989898');
Insert into reader (rid,rtype,rname, raddress,phone_no) VALUES (309,'Staff', 'Henderson', 'NO 20, Manor Avunue, Harrison, NJ07029', '2525252525');


-- Populate Reservation Table
Insert into reservation (res_no,dtime) VALUES (991,'10-05-2020 1:30AM');
Insert into reservation (res_no,dtime) VALUES (992,'11-10-2020 09:00AM');
Insert into reservation (res_no,dtime) VALUES (993,'09-22-2020 01:00PM');
Insert into reservation (res_no,dtime) VALUES (994,'07-23-2020 10:00AM');
Insert into reservation (res_no,dtime) VALUES (995,'08-01-2020 03:00PM');
Insert into reservation (res_no,dtime) VALUES (996,'10-22-2020 04:00PM');
Insert into reservation (res_no,dtime) VALUES (997,'12-23-2020 08:00AM');
Insert into reservation (res_no,dtime) VALUES (998,'04-04-2020 12:00PM');
Insert into reservation (res_no,dtime) VALUES (999,'05-15-2020 02:30PM');
Insert into reservation (res_no,dtime) VALUES (1000,'10-18-2020 09:30AM');


-- Populate Borrows Table
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (100, 1, 1, 1, 300);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (101, 1, 2, 1, 302);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (102, 1, 3, 1, 301);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (103, 1, 4, 1, 304);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (104, 1, 5, 1, 306);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (105, 1, 6, 1, 305);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (106, 2, 1, 1, 307);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (107, 2, 2, 1, 308);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (108, 2, 3, 1, 303);
Insert into borrows (bor_no,docid,copyno,bid,rid) VALUES (109, 2, 4, 1, 309);


-- Populate Reserves Table
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (302, 995, 1, 1, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (301, 991, 1, 2, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (306, 998, 1, 3, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (309, 999, 1, 4, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (307, 994, 1, 5, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (305, 996, 1, 6, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (308, 993, 2, 1, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (303, 1000, 2, 2, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (304, 992, 2, 3, 1);
Insert into reserves (rid,reservation_no,docid,copyno,bid) VALUES (305, 997, 2, 4, 1);

-- Populate Person Table
Insert into person (pid,pname) VALUES (1,'Johanna Ehrlich');
Insert into person (pid,pname) VALUES (2,'David Ferris');
Insert into person (pid,pname) VALUES (3,'Marlo Garner');
Insert into person (pid,pname) VALUES (4,'Matthew Gibson');
Insert into person (pid,pname) VALUES (5,'Karin Graham');
Insert into person (pid,pname) VALUES (6,'Susan Maia Grossman');
Insert into person (pid,pname) VALUES (7,'Jeff Karon');
Insert into person (pid,pname) VALUES (8,'Barbara Kimble');
Insert into person (pid,pname) VALUES (9,'John David Kudrick');
Insert into person (pid,pname) VALUES (10,'Thomas Wray');
Insert into person (pid,pname) VALUES (11,'Garald Tomley');
Insert into person (pid,pname) VALUES (12,'Aurel Jirousek');
Insert into person (pid,pname) VALUES (13,'Dirk Seville');
Insert into person (pid,pname) VALUES (14,'Leilah Biggin');
Insert into person (pid,pname) VALUES (15,'Wadsworth Gennings');
Insert into person (pid,pname) VALUES (16,'Zoe Jouanot');
Insert into person (pid,pname) VALUES (17,'Elwyn Santoro');
Insert into person (pid,pname) VALUES (18,'Leonelle Kenion');
Insert into person (pid,pname) VALUES (19,'Nan Birtwistle');
Insert into person (pid,pname) VALUES (20,'Norry Carrol');
Insert into person (pid,pname) VALUES (21,'Daria Ketteman');
Insert into person (pid,pname) VALUES (22,'Danita Heaslip');
Insert into person (pid,pname) VALUES (23,'Jud Duplan');
Insert into person (pid,pname) VALUES (24,'Allen Hardaker');
Insert into person (pid,pname) VALUES (25,'Lissa Cubley');
Insert into person (pid,pname) VALUES (26,'Nickey Offill');
Insert into person (pid,pname) VALUES (27,'Mirelle Kennifick');
Insert into person (pid,pname) VALUES (28,'Rivkah Thridgould');
Insert into person (pid,pname) VALUES (29,'Rourke Casoni');
Insert into person (pid,pname) VALUES (30,'Cheryl Griffoen');



-- Populate Book Table
Insert into book (docid,isbn) VALUES (1, '0-9679-2960-1');
Insert into book (docid,isbn) VALUES (2, '0-5634-7877-2');
Insert into book (docid,isbn) VALUES (3, '0-5390-2424-4');
Insert into book (docid,isbn) VALUES (4, '0-4851-7475-8');
Insert into book (docid,isbn) VALUES (5, '0-2492-7116-8');
Insert into book (docid,isbn) VALUES (6, '0-3719-5464-9');
Insert into book (docid,isbn) VALUES (7, '0-8064-7777-6');
Insert into book (docid,isbn) VALUES (8, '0-5613-2838-2');
Insert into book (docid,isbn) VALUES (9, '0-1470-1981-8');
Insert into book (docid,isbn) VALUES (10, '0-7239-3800-8');


-- Populate Journal Volume Table
Insert into journal_volume (docid,volume_no,editor) VALUES (11, 2, 11);
Insert into journal_volume (docid,volume_no,editor) VALUES (12, 5, 12);
Insert into journal_volume (docid,volume_no,editor) VALUES (13, 2, 13);
Insert into journal_volume (docid,volume_no,editor) VALUES (14, 4, 14);
Insert into journal_volume (docid,volume_no,editor) VALUES (15, 6, 15);
Insert into journal_volume (docid,volume_no,editor) VALUES (16, 7, 16);
Insert into journal_volume (docid,volume_no,editor) VALUES (17, 2, 17);
Insert into journal_volume (docid,volume_no,editor) VALUES (18, 3, 18);
Insert into journal_volume (docid,volume_no,editor) VALUES (19, 8, 19);
Insert into journal_volume (docid,volume_no,editor) VALUES (20, 1, 20);


-- Populate Proceedings Table
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (21, '10/21/2015', 'California ', 'David Alan');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (22, '05/18/2018', 'Florida ', 'Ann Aubrey');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (23, '08/12/2019', 'Maryland', 'Amy Bennett');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (24, '02/20/2014', 'Mississippi ', 'James N. Bond');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (25, '11/28/2016', ' Ohio ', 'Lauren Brenzy');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (26, '01/11/2011', 'Arizona ', 'Theodora Bryant');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (27, '06/12/2018', 'Tennessee ', 'Peggy Campbell');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (28, '03/30/2003', 'New Jersey', 'Carrie Cantor');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (29, '09/22/2020', 'Washington', 'Henry Denard');
Insert into proceedings (docid,cdate,clocation,ceditor) VALUES (30, '04/08/2012', 'Ohio ', 'Ana Howard');


-- Populate Authors Table
Insert into authors (pid,docid) VALUES (1, 1);
Insert into authors (pid,docid) VALUES (2, 2);
Insert into authors (pid,docid) VALUES (3, 3);
Insert into authors (pid,docid) VALUES (4, 4);
Insert into authors (pid,docid) VALUES (5, 5);
Insert into authors (pid,docid) VALUES (6, 6);
Insert into authors (pid,docid) VALUES (7, 7);
Insert into authors (pid,docid) VALUES (8, 8);
Insert into authors (pid,docid) VALUES (9, 9);
Insert into authors (pid,docid) VALUES (10, 10);


-- Populate Journal Issue Table
Insert into journal_issue (docid,issue_no,scope) VALUES (11, 1, 'science');
Insert into journal_issue (docid,issue_no,scope) VALUES (11, 2, 'science');
Insert into journal_issue (docid,issue_no,scope) VALUES (11, 3, 'science');
Insert into journal_issue (docid,issue_no,scope) VALUES (11, 4, 'science');
Insert into journal_issue (docid,issue_no,scope) VALUES (12, 1, 'nature');
Insert into journal_issue (docid,issue_no,scope) VALUES (12, 2, 'nature');
Insert into journal_issue (docid,issue_no,scope) VALUES (12, 3, 'nature');
Insert into journal_issue (docid,issue_no,scope) VALUES (13, 1, 'cars');
Insert into journal_issue (docid,issue_no,scope) VALUES (13, 2, 'cars');
Insert into journal_issue (docid,issue_no,scope) VALUES (14, 1, 'cars');
Insert into journal_issue (docid,issue_no,scope) VALUES (14, 2, 'cars');
Insert into journal_issue (docid,issue_no,scope) VALUES (15, 1, 'physics');
Insert into journal_issue (docid,issue_no,scope) VALUES (15, 2, 'physics');
Insert into journal_issue (docid,issue_no,scope) VALUES (16, 1, 'science');
Insert into journal_issue (docid,issue_no,scope) VALUES (17, 1, 'science');
Insert into journal_issue (docid,issue_no,scope) VALUES (18, 1, 'science');
Insert into journal_issue (docid,issue_no,scope) VALUES (19, 1, 'science');
Insert into journal_issue (docid,issue_no,scope) VALUES (20, 1, 'science');


-- Populate Gedits Table
Insert into gedits (docid,issue_no,pid) VALUES (11, 1, 19);
Insert into gedits (docid,issue_no,pid) VALUES (11, 2, 19);
Insert into gedits (docid,issue_no,pid) VALUES (11, 3, 19);
Insert into gedits (docid,issue_no,pid) VALUES (11, 4, 19);
Insert into gedits (docid,issue_no,pid) VALUES (12, 1, 19);
Insert into gedits (docid,issue_no,pid) VALUES (12, 2, 19);
Insert into gedits (docid,issue_no,pid) VALUES (12, 3, 19);
Insert into gedits (docid,issue_no,pid) VALUES (13, 1, 19);
Insert into gedits (docid,issue_no,pid) VALUES (13, 2, 19);
Insert into gedits (docid,issue_no,pid) VALUES (14, 1, 19);
Insert into gedits (docid,issue_no,pid) VALUES (14, 2, 12);
Insert into gedits (docid,issue_no,pid) VALUES (15, 1, 12);
Insert into gedits (docid,issue_no,pid) VALUES (15, 2, 12);
Insert into gedits (docid,issue_no,pid) VALUES (16, 1, 12);
Insert into gedits (docid,issue_no,pid) VALUES (17, 1, 12);
Insert into gedits (docid,issue_no,pid) VALUES (18, 1, 12);
Insert into gedits (docid,issue_no,pid) VALUES (19, 1, 12);
Insert into gedits (docid,issue_no,pid) VALUES (20, 1, 12);


-- Populate Chairs Table
Insert into chairs (pid,docid) VALUES (21, 21);
Insert into chairs (pid,docid) VALUES (22, 22);
Insert into chairs (pid,docid) VALUES (23, 23);
Insert into chairs (pid,docid) VALUES (24, 24);
Insert into chairs (pid,docid) VALUES (25, 25);
Insert into chairs (pid,docid) VALUES (26, 26);
Insert into chairs (pid,docid) VALUES (27, 27);
Insert into chairs (pid,docid) VALUES (28, 28);
Insert into chairs (pid,docid) VALUES (29, 29);
Insert into chairs (pid,docid) VALUES (30, 30);

