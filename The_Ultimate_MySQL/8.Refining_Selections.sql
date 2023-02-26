# SECTION 8: Refining_Selections

DESC books;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT * FROM books;

# returns the values from that table colun but without duplicates
SELECT DISTINCT
    author_fname
FROM
    books; 

SELECT DISTINCT
    CONCAT(author_fname, ' ', author_lname)
FROM
    books;

SELECT DISTINCT
    author_fname, author_lname
FROM
    books;

SELECT DISTINCT
    author_fname, author_lname
FROM
    books;

# this will return all values becasue there is no combination for all these 3 variables
SELECT DISTINCT
    author_fname, author_lname, released_year
FROM
    books; 

# Alfabething (ASCENDING by default) ordering the colun by ...
SELECT 
    book_id, author_fname, author_lname
FROM
    books
ORDER BY author_lname; 

# order in descending way
SELECT 
    book_id, author_fname, author_lname
FROM
    books
ORDER BY author_lname DESC; 


SELECT 
    title, pages
FROM
    books
ORDER BY pages;

# despite the fact that we dont call the realease_year, it goes to sort it anyway
SELECT 
    title, pages
FROM
    books
ORDER BY released_year; 

SELECT 
    book_id, author_fname, author_lname, pages
FROM
    books
ORDER BY pages;
# or:
SELECT 
    book_id, author_fname, author_lname, pages
FROM
    books
ORDER BY 4;

SELECT 
    author_lname, released_year, title
FROM
    books
ORDER BY author_lname , released_year;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
ORDER BY author;

SELECT 
    book_id, title, released_year
FROM
    books
LIMIT 5;

SELECT 
    book_id, title, released_year
FROM
    books
ORDER BY 2
LIMIT 5;

SELECT 
    book_id, title, released_year
FROM
    books
ORDER BY released_year DESC
LIMIT 1 , 5;

# start on row 3 and goes 2 from there
SELECT 
    book_id, title, released_year
FROM
    books
ORDER BY released_year DESC
LIMIT 3 , 2; 

# this fuction can search something without tell him what it is exactly
# % is called a 'wildcard' and looks for, in this case, any word with 'da' in it
SELECT 
    title, author_fname, author_lname
FROM
    books
WHERE
    author_fname LIKE '%da%'; 

# % means 0 or more charaters
SELECT 
    *
FROM
    books
WHERE
    title LIKE '%:%'; 

# I have 4 '_' that means that the function will search for 4 charaters words
SELECT 
    *
FROM
    books
WHERE
    author_fname LIKE '____';

SELECT * FROM books WHERE author_fname LIKE '_a%';

# use \% to actualy look for values with the '%' charater
SELECT 
    *
FROM
    books
WHERE
    title LIKE '%\%%';

#same logic that the one above
SELECT 
    *
FROM
    books
WHERE
    title LIKE '%\_%';


# Exercises S8.127 -------------------------
SELECT 
    title
FROM
    books
WHERE
    title LIKE '%stories%';
SELECT 
    title, pages
FROM
    books
ORDER BY 2 DESC
LIMIT 1;
SELECT 
    CONCAT(title, ' - ', released_year) AS summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';
SELECT 
    title, released_year, stock_quantity
FROM
    books
ORDER BY 3
LIMIT 3;
SELECT 
    title, author_lname
FROM
    books
ORDER BY author_lname , title;
SELECT 
    CONCAT('MY FAVOVITE AUTHOR IS ',
            UPPER(author_fname),
            ' ',
            UPPER(author_lname),
            '!') AS yell
FROM
    books
ORDER BY author_lname; 