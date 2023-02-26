# SECTION 11: Comparison_&_Logical_operators

SELECT * FROM books WHERE released_year = 2017;
SELECT * FROM books WHERE released_year != 2017;
SELECT title, author_lname from books WHERE author_lname != 'Gaiman';
SELECT title FROM books WHERE title LIKE '% %';
SELECT title FROM books WHERE title NOT LIKE '% %';
SELECT 
    title, author_fname, author_lname
FROM
    books
WHERE
    author_fname LIKE 'da%';
SELECT 
    title, author_fname, author_lname
FROM
    books
WHERE
    author_fname NOT LIKE 'da%';
SELECT title FROM books WHERE title NOT LIKE '%a%'; 
SELECT * FROM books WHERE released_year > 2005;
SELECT * FROM books WHERE pages > 500;
SELECT  title, released_year FROM books WHERE released_year >= 2010;
SELECT * FROM books WHERE released_year < 2000;
SELECT * FROM books WHERE released_year <= 1985;
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Eggers'
        AND released_year > 2010;
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'Eggers'
        AND released_year > 2010
        AND title LIKE '%novel%';
SELECT 
    title, pages
FROM
    books
WHERE
    CHAR_LENGTH(title) > 30 AND pages > 500;

SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'Eggers'
        OR released_year > 2010;

SELECT 
    title, pages
FROM
    books
WHERE
    pages < 200 OR title LIKE '%stories%';

SELECT 
    title, released_year
FROM
    books
WHERE
    released_year >= 2004
        AND released_year <= 2015
ORDER BY released_year;
-- OR:
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year BETWEEN 2004 AND 2015
ORDER BY released_year;

SELECT 
    title, pages
FROM
    books
WHERE
    pages NOT BETWEEN 200 AND 300
ORDER BY pages;

SELECT * FROM people WHERE YEAR(birthdate) < 2005;
SELECT * FROM people WHERE HOUR(birthtime) > 12;

SELECT CAST('9:00:30' AS TIME);
SELECT 
    *
FROM
    people
WHERE
    birthtime BETWEEN CAST('8:12:40' AS TIME) AND CAST('18:00:00' AS TIME);

SELECT  title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT  title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');

SELECT 10 % 4; # returns the dividend of a division

SELECT  title, released_year FROM books
WHERE released_year >= 2000 AND released_year % 2 != 0;

SELECT 
    title,
    released_year,
    CASE
        WHEN released_year >= 2000 THEN 'modern lit'
        ELSE '20th century lit'
    END AS genre
FROM
    books;

SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 104 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books
ORDER BY 2;

-- OR:

SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 104 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books
ORDER BY 2;

SELECT * FROM books WHERE author_lname IS NULL;
SELECT * FROM books WHERE author_lname IS NOT NULL;
SELECT * FROM books WHERE title IS NULL;
DELETE FROM books WHERE title IS NULL;


# Exercises S11.197 -------------------------
SELECT * FROM books;
SELECT * FROM books WHERE released_year > 1980;
SELECT * FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year >= 2000;
SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;
SELECT author_lname FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE '%S';

SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');

SELECT title, author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
		WHEN title LIKE '%Just Kids%' THEN 'Memoir'
        WHEN title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
		ELSE 'Novel'
	END AS Type
FROM books;

SELECT 
    author_fname,
    author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM
    books
WHERE
    author_lname IS NOT NULL
GROUP BY author_fname , author_lname;
