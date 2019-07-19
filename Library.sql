/*All code written by me without any help.*/

CREATE DATABASE db_library
GO

USE db_library

-----------------==============CREATE TABLES===========----------------

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	FullName VARCHAR(50) NOT NULL,
	BorAddress VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
)

CREATE TABLE LibraryBranch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	BrAddress VARCHAR(50) NOT NULL
)

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PubAddress VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
)

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) FOREIGN KEY REFERENCES Publisher(PublisherName)
)

CREATE TABLE BookCopies (
	BookID INT FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT FOREIGN KEY REFERENCES LibraryBranch,
	NumberOfCopies INT NOT NULL
)

CREATE TABLE BookAuthors (
	BookID INT FOREIGN KEY REFERENCES Books(BookID),
	AuthorName VARCHAR(40)
)

CREATE TABLE BookLoans (
	BookID INT FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT FOREIGN KEY REFERENCES LibraryBranch(BranchID),
	CardNo INT FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
)

-----------------------------------/END CREATE TABLES--------------------------------



---------------------==========POPULATE TABLES WITH DATA==============---------------


INSERT INTO LibraryBranch
VALUES
('Central', 'Elm Street'),
('Sharpstown', '21 Jump Street'),
('Quahog', 'Spooner Street'),
('Springfield', 'Evergreen Terrace')

INSERT INTO Books(Title)
VALUES
('The Book of Mormon'), ('My Life'), ('The Lost Tribe'), ('IT'), ('Harry Potter 1'), ('Harry Potter 2'), ('Harry Potter 3'), ('Harry Potter 4'), ('Harry Potter 5'),
('Harry Potter 6'), ('Harry Potter 7'), ('Lord of the Rings: Fellowship of the Rings'), ('Lord of the Rings: The Two Towers'),
('Lord of the Rings: Return of the King'), ('Grapes of Wrath'), ('Watchmen'), ('League of Extraordinary Gentlemen'),
('The Hobbit'), ('Cujo'), ('Pet Sematary'), ('The Alchemist'), ('Tantric Kama Sutra'), ('SQL for Dummies'), ('Zelda Official Strategy Guide'),
('Siddhartha'), ('A Million Little Fibers'), ('How To Cook Humans'), ('The Anarchist''s Cookbook'), ('Sweatin'' to the Oldies'), 
('King James Bible'), ('The Mysterious Case of the Dog in the Night'), ('Cat''s Cradle'),  ('Slaughterhouse Five'), ('The Art of War'),
('Ender''s Game'), ('Radical Acceptance'), ('A Song of Ice and Fire'), ('Batman: The Killing Joke'), ('Maus'), ('Zen and the Art of Mixing'), 
('Hardball'), ('Star Wars: Galaxy of Fear'), ('Dungeons and Dragons'), ('MAD Magazine'), ('The Dark Tower'), ('The Three Musketeers'),
('America''s Test Kitchen'), ('V For Vendetta')
;

INSERT INTO Publisher(PublisherName, PubAddress, Phone)
VALUES ('Penguin Random House', 'Reading Rainbow Road', '1800GETBOOK'), ('Tavern Books', 'Baker Street', '1800Library')

/*INSERT INTO Books(PublisherName)
VALUES ('Penguin Random House'), ('Tavern Books')
;*/

UPDATE Books
SET PublisherName = 'Penguin Random House'
WHERE BookID < 20;
UPDATE Books
SET PublisherName = 'Tavern Books'
WHERE BookID >= 20;

INSERT INTO Borrower (FullName, Phone, BorAddress)
VALUES
('Belle', '1+ 342-2222-222', 'Quiet Predential Town'), ('Hermione', '555-523-5555', 'Hogwarts'), ('Homer Simpson', '555-532-5667', 'Springfield'),
('Patrick', '9', 'Bikini Bottom'),  ('Kuzko', '22', 'Kuzkotopia'), ('Hannah', 'unlisted', 'Bachelor Pad'), 
('Luke Skywalker', '1221', 'Tattooine'), ('Danaerys', '1212121212', 'Qarth'), ('One Who Doesn''t Read', 'Unknown', 'N/A')

INSERT INTO BookAuthors (AuthorName)
VALUES
('Stephen King'), ('JK Rowling'), ('George RR Martin'), ('J.R.R. Tolkien'), ('George Steinbeck'), ('George Orwell'), ('F. Scott Fitzgerald'),
('R.L. Stein'), ('Seymour Butts'), ('Amanda Huginkiss')
;

INSERT INTO BookLoans (BookID, BranchID, CardNo, DateOut, DateDue)
VALUES 
(4, 1, 1, '2019-05-14', '2019-05-21'),
(4, 2, 2, '2019-05-10', '2019-05-17'),
(20, 3, 1, '2019-05-14', '2019-05-21'),
(20, 4, 1, '2019-05-07', '2019-05-14'),
(3, 1, 2, '2019-05-14', '2019-05-21'),
(4, 2, 1, '2019-05-14', '2019-05-21'),
(5, 3, 1, '2019-05-14', '2019-05-21'),
(6, 4, 2, '2019-05-14', '2019-05-21'),
(7, 1, 2, '2019-05-14', '2019-05-21'),
(8, 2, 2, '2019-05-14', '2019-05-21'),
(12, 3, 2, '2019-05-14', '2019-05-21'),
(13, 4, 2, '2019-05-14', '2019-05-21'),
(15, 1, 2, '2019-05-14', '2019-05-21'),
(20, 2, 1, '2019-05-14', '2019-05-21'),
(8, 3, 2, '2019-05-14', '2019-05-21'),
(33, 4, 2, '2019-05-14', '2019-05-21'),
(39, 1, 2, '2019-05-14', '2019-05-21'),
(40, 2, 1, '2019-05-14', '2019-05-21'),
(45, 3, 1, '2019-05-14', '2019-05-21'),
(47, 4, 1, '2019-05-14', '2019-05-21'),
(41, 1, 3, '2019-05-14', '2019-05-21'),
(21, 2, 4, '2019-05-14', '2019-05-21'),
(23, 3, 5, '2019-05-14', '2019-05-21'),
(24, 4, 6, '2019-05-14', '2019-05-21'),
(26, 1, 7, '2012-05-14', '2012-05-21'),
(28, 2, 8, '2019-05-14', '2019-05-21'),
(28, 3, 4, '2019-12-12', '2019-05-21'),
(29, 4, 5, '2019-05-14', '2019-05-21'),
(29, 1, 6, '2019-03-14', '2019-05-21'),
(8, 2, 7, '2019-03-14', '2019-05-21'),
(8, 3, 8, '2019-05-14', '2019-05-21'),
(8, 4, 4, '2019-05-14', '2019-05-21'),
(7, 1, 5, '2018-05-14', '2019-05-21'),
(6, 2, 6, '2018-05-14', '2019-05-21'),
(15, 3, 7, '2019-05-14', '2019-05-21'),
(15, 4, 8, '2019-05-14', '2019-05-21'),
(15, 1, 4, '2019-05-24', '2019-05-21'),
(18, 2, 5, '2019-05-14', '2019-05-21'),
(19, 3, 6, '2019-05-14', '2019-05-21'),
(20, 4, 7, '2019-05-14', '2019-05-01'),
(4, 1, 8, '2019-05-14', '2019-05-01'),
(22, 2, 4, '2019-05-14', '2019-05-20'),
(39, 3, 5, '2019-01-14', '2019-05-22'),
(42, 4, 6, '2019-03-14', '2019-05-21'),
(32, 1, 7, '2019-03-14', '2019-05-21'),
(31, 2, 8, '2019-04-14', '2019-05-21'),
(20, 3, 4, '2019-05-14', '2019-05-21'),
(8, 4, 5, '2019-05-14', '2019-05-21'),
(19, 1, 6, '2019-05-14', '2019-05-21'),
(17, 2, 7, '2019-05-14', '2019-05-21'),
(29, 3, 8, '2019-05-14', '2019-05-21'),
(30, 4, 5, '2019-05-14', '2019-05-21')
;

INSERT INTO BookCopies (BookID, BranchID, NumberOfCopies)
VALUES
(4,2,2), (19,2,2),(20,2,2),
(3,1,2), (5,1,2), (10,1,2), (15,1,2), (20,1,2), (25,1,2), (30,1,2), (35,1,2), (40,1,2), (41,1,2), 
(4,2,2), (6,2,2), (11,2,2), (16,2,2), (21,2,2), (26,2,2), (31,2,2), (36,2,2), (42,2,2), (43,2,2),  
(19,3,2), (8,3,2), (13,3,2), (18,3,2), (23,3,2), (28,3,2), (33,3,2), (38,3,2), (39,3,2), (43,3,2),   
(4,4,2), (9,4,2), (11,4,2), (13,4,2), (12,4,2), (15,4,2), (16,4,2), (21,4,2), (31,4,2), (41,4,2)
;

INSERT INTO BookAuthors (BookID, AuthorName)
VALUES
(3, 'Mark W. Lee'), (32, 'Kurt Vonnegut'), (34, 'Sun Tzu'), (26, 'Towelie'), (21, 'Paulo Coelho'), 
(30, 'JESUS'), (35, 'Orson Scott Card'), (37, 'George R.R. Martin'), (48, 'Alan Watts'), 
(4, 'Stephen King'), (19, 'Stephen King'), (20, 'Stephen King'), (45, 'Stephen King'), (5, 'J.K. Rowling'), 
(6, 'J.K. Rowling'), (7, 'J.K. Rowling'), (8, 'J.K. Rowling'), (9, 'J.K. Rowling'), (10, 'J.K. Rowling'), (11, 'J.K. Rowling'),
(12, 'J.R.R. Tolkien'), (13, 'J.R.R. Tolkien'), (14, 'J.R.R. Tolkien'), (18, 'J.R.R. Tolkien')
; 

---------------------/END DATA POPULATION------------------------



/*===================PROCEDURES===============*/

/*===================1How many copies of the lost tribe at sharpstown===============*/
CREATE PROCEDURE Proc1
AS
Begin
	SELECT a1.NumberOfCopies
	FROM BookCopies a1
	INNER JOIN Books on a1.BookID = Books.BookID
	INNER JOIN LibraryBranch a2 ON a1.NumberOfCopies = a2.BranchID
	WHERE Books.Title = 'The Lost Tribe' AND a2.BranchName = 'Sharpstown'
	;
END

/*===================2How many copies of the lost tribe at each library branch===============*/
CREATE PROCEDURE Proc2
AS
BEGIN
	SELECT a2.Title, a3.BranchName, a1.NumberOfCopies
	FROM BookCopies a1
	INNER JOIN Books a2 ON a1.BookID = a2.BookID
	INNER JOIN LibraryBranch a3 ON a1.BranchID = a3.BranchID
	WHERE a2.Title = 'The Lost Tribe'
	;
END

/*===================3Names of all  borrowers who do not have any books checked out===============*/
CREATE PROCEDURE Proc3
AS
BEGIN
	SELECT a1.FullName
	FROM Borrower a1
	LEFT JOIN BookLoans a2 ON a1.CardNo = a2.CardNo
	GROUP BY a1.Fullname
	HAVING COUNT(a2.BookID) = 0
	;
END

/*===================4From each book that is loaned out from Sharpstown and DueDate is today===============*/
CREATE PROCEDURE Proc4
AS
BEGIN
	DECLARE @Date DATE SET @Date = GETDATE()
	SELECT a1.BookID, a2.FullName, a2.BorAddress
	FROM BookLoans a1
	INNER JOIN Borrower a2 ON a1.CardNo = a2.CardNo
	INNER JOIN LibraryBranch a3 ON a1.BranchID = a3.BranchID
	WHERE a1.DateDue = @Date  AND a3.BranchName = 'Sharpstown'
	;
END

/*===================5For each branch, retrieve the name and total number of books loaned out===============*/
CREATE PROCEDURE Proc5
AS
BEGIN
	SELECT LibraryBranch.BranchName, COUNT(BookLoans.BookID) AS LoanedOutBooks
	FROM LibraryBranch
	INNER JOIN BookLoans ON LibraryBranch.BranchID = BookLoans.BranchID
	GROUP BY LibraryBranch.BranchName
	;
END

/*===================6Retrieve the names, addresses, and # of books for all borrowers with more than 5 books===============*/
CREATE PROCEDURE Proc6
AS
BEGIN
	SELECT a1.FullName, a1.BorAddress, COUNT(a2.BookID) AS BooksLoaned
	FROM Borrower a1
	INNER JOIN BookLoans a2 ON a1.CardNo = a2.CardNo
	GROUP BY a1.FullName, a1.BorAddress
	HAVING COUNT(a2.BookID) > 5
	;
END

/*===================7For each book authored by stephen king, retrieve the title and number of copies owned by the Central library branch===============*/
CREATE PROCEDURE Proc7
AS
BEGIN
	SELECT a1.Title, a2.NumberOfCopies
	FROM Books a1
	INNER JOIN BookCopies a2 ON a1.BookID = a2.BookID
	INNER JOIN BookAuthors a3 ON a1.BookID = a3.BookID
	INNER JOIN LibraryBranch a4 ON a2.BranchID = a4.BranchID
	WHERE a4.BranchName = 'Central' AND a3.AuthorName = 'Stephen King'
	;
END
