# SECTION 7: STRING functions

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT * FROM books;

DESC books;

# video 90 show how to import datase using "source" comand on linux

SELECT CONCAT('h','e','l','l','o');

SELECT CONCAT(author_fname, '!!!') FROM books;

SELECT 
	CONCAT(author_fname, ' ', author_lname) AS Author_Name 
FROM books;

SELECT 
	CONCAT_WS('-',title, author_fname, author_Lname) 
FROM books;


SELECT SUBSTRING('Hello World!', 1, 7);
SELECT SUBSTRING('Hello World!', 7);
SELECT SUBSTRING('Hello World!', -1);
SELECT SUBSTRING('Hello World!', -3);
SELECT SUBSTRING('Hello World!', -2, 1);

SELECT SUBSTRING(title, 1, 15) FROM books;
SELECT SUBSTR(title, 1, 15) FROM books;

SELECT SUBSTR(author_lname, 1, 1) AS initial, author_lname FROM books;

SELECT
	CONCAT(SUBSTR(title, 1, 10), '...') AS short_title
FROM books;

SELECT 
  CONCAT(
    SUBSTR(author_fname, 1, 1), 
    '.', 
    SUBSTR(author_lname, 1, 1), 
    '.'
  ) AS author_initials 
FROM 
  books;

SELECT REPLACE('Hello World', 'Hell', '%$#@'); # is case sensituve

SELECT REPLACE(title, ' ', '-') FROM books; # this does not modify the data, only retrives the info like we request. To replace we would need to use 'Replace'

SELECT title FROM books;

SELECT REVERSE('Hello World');

SELECT REVERSE(author_fname) FROM books;

SELECT 
    CONCAT(author_fname, REVERSE(author_fname))
FROM
    books;

SELECT CHAR_LENGTH('Hey!');
SELECT LENGTH('Hey!'); # this one counts nº of bites.
SELECT CHAR_LENGTH('平仮名!');
SELECT LENGTH('平仮名!'); # this one counts nº of bites.

SELECT CHAR_LENGTH(title) AS len, title FROM books;

SELECT UPPER('Hello World');
SELECT UCASE('Hello World'); # Same thing
SELECT LOWER('Hello World');
SELECT LCASE('Hello World'); # Same thing

SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

SELECT INSERT('Hello Bobby', 6,0,' there'); # 0 is to the tell the funciton that I dont want to replace any character after the 6 one.

SELECT LEFT('omghahalol!', 3);
 
SELECT RIGHT('omghahalol!', 4);
 
SELECT REPEAT('ha', 4);
 
SELECT TRIM('  pickle  ');
SELECT TRIM(LEADING 'x' FROM 'xxxpicklexxx');
SELECT TRIM(TRAILING 'x' FROM 'xxxpicklexxx');
SELECT TRIM(BOTH 'x' FROM 'xxxpicklexxx');


# Exercises S7.109

SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
  
SELECT 
    REPLACE(title, ' ', '->') AS title
FROM
    books;
  
SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;
  
SELECT 
    UPPER(CONCAT(author_fname, ' ', author_lname)) AS full_name_in_caps
FROM
    books;

SELECT 
    CONCAT(title,
            ' was released in ',
            released_year) AS blurb
FROM
    books;


SELECT 
    title, CHAR_LENGTH(title) AS character_count
FROM
    books;

SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;
