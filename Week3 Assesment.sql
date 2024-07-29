create database Myassesment3

use Myassesment3

create table Subject (
subjectId int primary key,
subtitle varchar(20)
)
create table Book(
bookId int,
title varchar,
price int,
volume int,
author varchar(20),
publishDate date,
subjectId int,
foreign key (subjectId) references Subject(subjectId)
);


INSERT INTO Subject  VALUES (1, 'Maths');
INSERT INTO Subject  VALUES (2, 'Science');
INSERT INTO Subject  VALUES (3, 'English');
INSERT INTO Subject  VALUES (4, 'History');
INSERT INTO Subject  VALUES (5, 'Geography');


INSERT INTO Book  VALUES (1, 'Algebra', 600, 1, 'Author A', '2021-01-01', 1);
INSERT INTO Book  VALUES (2, 'Calculus', 700, 2, 'Author B', '2020-02-15', 1);
INSERT INTO Book  VALUES (3, 'Geometry', 500, 1, 'Author C', '2019-03-20', 1);
INSERT INTO Book  VALUES (4, 'Trigonometry', 650, 2, 'Author D', '2018-04-10', 1);
INSERT INTO Book  VALUES (5, 'Physics', 800, 1, 'Author E', '2022-05-25', 2);
INSERT INTO Book VALUES (6, 'Chemistry', 750, 2, 'Author F', '2021-06-30', 2);
INSERT INTO Book  VALUES (7, 'Biology', 650, 1, 'Author G', '2020-07-05', 2);
INSERT INTO Book  VALUES (8, 'Zoology', 700, 2, 'Author H', '2019-08-15', 2);
INSERT INTO Book  VALUES (9, 'Literature', 600, 1, 'Author I', '2018-09-25', 3);
INSERT INTO Book  VALUES (10, 'Grammar', 500, 2, 'Author J', '2017-10-10', 3);
INSERT INTO Book  VALUES (11, 'Poetry', 700, 1, 'Author K', '2016-11-15', 3);
INSERT INTO Book  VALUES (12, 'Ancient History', 800, 2, 'Author L', '2015-12-20', 4);
INSERT INTO Book VALUES (13, 'H History', 750, 1, 'Author M', '2014-01-25', 4);
INSERT INTO Book  VALUES (14, 'M History', 700, 2, 'Author N', '2013-02-10', 4);
INSERT INTO Book  VALUES (15, 'Geography ', 800, 1, 'Author O','2019-04-09',3);

EXEC sp_help 'Book';
ALTER TABLE Book
ALTER COLUMN Title VARCHAR(255);



SELECT b.bookId, b.title, s.subtitle 
FROM Book b
inner join Subject s ON b.subjectId = s.subjectId;

SELECT * FROM Book 
WHERE publishDate BETWEEN '2021-01-01' AND '2020-07-05';



SELECT author, COUNT(*) AS num_books 
FROM Book 
GROUP BY author;


SELECT s.subtitle, COUNT(*) AS num_books 
FROM Book b
INNER JOIN Subject s on b.subjectId = s.subjectId
GROUP BY s.subtitle;


SELECT COUNT(*) AS num_books 
FROM Book 
WHERE YEAR(publishDate) = 2000;

UPDATE Book 
SET price = 550, volume = 2 
WHERE bookId = 1;

UPDATE Book 
SET price = price * 10 
WHERE subjectId = (select subjectId from Subject where subtitle = 'English');

DELETE FROM Book 
WHERE bookId = 5;


SELECT * FROM Book 
WHERE price > 500 AND subjectId = (SELECT subjectId FROM Subject WHERE subtitle = 'Maths');

SELECT b.bookId, b.title, s.subtitle 
FROM Book b
INNER JOIN Subject s on b.subjectId = s.subjectId
ORDER BY s.subtitle asc


SELECT * FROM Book 
WHERE price = (SELECT MIN(price) FROM Book);


SELECT * FROM Book 
WHERE price = (SELECT MIN(price) FROM Book);

SELECT COUNT(*) as  num_books 
FROM Book 
WHERE subjectId = (select subjectId FROM Subject where subtitle = 'Maths');

SELECT * FROM Book 
WHERE subjectId in (SELECT subjectId FROM Subject WHERE subtitle in ('English', 'Maths', 'Science'));