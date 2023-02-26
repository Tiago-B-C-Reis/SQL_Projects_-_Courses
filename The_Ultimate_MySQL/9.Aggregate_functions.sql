# SECTION 9: Aggregate_functions

# count the number of rows
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT(author_fname)) FROM books ;
SELECT COUNT(DISTINCT(released_year)) FROM books ;
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
select author_lname FROM books GROUP BY author_lname;
select author_lname, COUNT(*) AS books_writen FROM books GROUP BY author_lname ORDER BY books_writen DESC;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;
SELECT MIN(author_lname), MAX(author_lname) FROM books;
INSERT INTO books(title, pages) VALUES('my life in words', 634);
# using a sub-query, that is basicaly a small query inside the main query
SELECT 
    title, pages
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);
# similar to:
SELECT title, pages FROM books WHERE pages = 634;
SELECT title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_fname) AS full_name, COUNT(*) FROM books GROUP BY full_name;
SELECT 
    author_fname,
    author_lname,
    COUNT(*) AS books_written,
    MIN(released_year) AS earliest_release,
    MAX(released_year) AS latest_release,
    MAX(pages) AS longest_page_count
FROM
    books
GROUP BY author_fname, author_lname;
SELECT SUM(pages) FROM books;
SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;
SELECT AVG(released_year) FROM books;
SELECT AVG(pages) FROM books;
SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year;


# Exercises S9.148 -------------------------
SELECT * FROM books;
DESC books;

SELECT 
    COUNT(*)
FROM
    books;
    
SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;

SELECT 
    SUM(stock_quantity)
FROM
    books;

SELECT AVG(released_year) 
FROM books GROUP BY author_lname, author_fname;    

SELECT released_year, COUNT(*) 
FROM books GROUP BY released_year;

SELECT 
    CONCAT(author_fname, '', author_lname) AS author,
    AVG(released_year)
FROM
    books
GROUP BY author;

SELECT AVG(released_year) 
FROM books GROUP BY author_lname, author_fname;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

SELECT 
    released_year AS 'year',
    COUNT(*) AS 'books',
    AVG(pages) AS 'avg pages'
FROM
    books
GROUP BY released_year
ORDER BY 1;