# SECTION 15: Views_and_Modes

-- INSTEAD OF TYPING THIS QUERY ALL THE TIME...
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    reviews
        JOIN
    series ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;
 
-- WE CAN CREATE A VIEW:
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
 
-- NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- (AT LEAST WHEN IT COMES TO SELECTING)
SELECT * FROM full_reviews;
SELECT * FROM full_reviews WHERE genre = 'Animation';

# Some virtual tables can be updatable/modified like the one bellow
CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;
INSERT INTO ordered_series (title, released_year, genre)
VALUES ('The Great', 2020, 'Comedy');

# Replace the virtual table with one that is modified
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

DROP VIEW ordered_series;

SELECT * FROM full_reviews;
SELECT * FROM full_reviews GROUP BY title;
SELECT 
    title, COUNT(title) AS review_count, AVG(rating)
FROM
    full_reviews
GROUP BY title HAVING title = 'Archer';

# After we use 'group by' is there we use 'having' to control which group we want to appear
SELECT 
    title, COUNT(title) AS review_count, AVG(rating)
FROM
    full_reviews
GROUP BY title HAVING COUNT(rating) > 1;

SELECT title, AVG(rating) FROM full_reviews GROUP BY title;
# This one creates a row on the botton of the table that contains
# the AVG of all the ratings and not per group:
SELECT 
    title, AVG(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;

SELECT 
    title, COUNT(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;

SELECT 
    released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year, genre WITH ROLLUP;


SELECT 
    first_name, released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;


-- To View Modes:
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;
 
-- To Set Them:
SET GLOBAL sql_mode = 'modes';
SET SESSION sql_mode = 'modes';