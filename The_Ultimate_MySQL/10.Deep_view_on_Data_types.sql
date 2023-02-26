# SECTION 10: Deep_view_on_Data_types

CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

DESC people;

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

SELECT CURTIME();
SELECT CURDATE();
SELECT NOW();
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

SELECT 
    name,
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate),
    MONTHNAME(birthdate)
FROM
    people;

SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;
 
SELECT 
    birthdt,
    MONTH(birthdt),
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;

SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

SELECT birthdate FROM people;
SELECT DATEDIFF(CURDATE(), birthdate) FROM people;
SELECT DATEDIFF(CURDATE(), birthdt) FROM people;

SELECT DATE_ADD(CURDATE(), INTERVAL 1 DAY) FROM people;
SELECT DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
SELECT birthdate, DATE_ADD(birthdate, INTERVAL 18 year) FROM people;
SELECT TIMEDIFF(CURTIME(), '07:00:00');
SELECT NOW() - INTERVAL 18 year;
SELECT name, birthdate, birthdate + INTERVAL 21 YEAR FROM people;
SELECT name, birthdate, YEAR(birthdate + INTERVAL 21 YEAR) AS will_be_21 FROM people;

CREATE TABLE captions (
	text VARCHAR(150),
    create_ate TIMESTAMP default CURRENT_TIMESTAMP
);
INSERT INTO captions (text) VALUES ('Just me and the girls chiling');
INSERT INTO captions (text) VALUES ('Beautiful sunset');
SELECT * FROM captions;

CREATE TABLE captions2 (
	text VARCHAR(150),
    create_at TIMESTAMP default CURRENT_TIMESTAMP,
	updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO captions2 (text) VALUES ('I love life.');
SELECT * FROM captions2;
UPDATE captions2 SET text='I love live!!!!!';


# Exercises S10.172 -------------------------

-- CHAR is most efficient when used in sitiations where we know how many characters we want, for example a post-card: 1800-140;
-- Used for text that we know has a fixed length, e.g., State abbreviations, 
-- abbreviated company names, etc.

CREATE TABLE inventory (
	item_id INT AUTO_INCREMENT,
	item_name VARCHAR(50) NOT NULL DEFAULT 'standard iten',
    price DECIMAL(8,2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    PRIMARY KEY (item_id)
);

-- DATETIME() or NOW() give us the date and time between year 1000 and 9999.
-- TIMESTAMP does the same except gives time between year 1970 and 2038.
-- They both store datetime information, but there's a difference in the range, 
-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
-- TIMESTAMP is used for things like meta-data about when something is created
-- or updated.

SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(NOW()); -- OR: SELECT DAYOFWEEK(CURDATE()); OR: SELECT DATE_FORMAT(NOW(), '%w') + 1;
SELECT DATE_FORMAT(NOW(), '%W'); -- OR: SELECT DATE_FORMAT(NOW(), '%a');

SELECT 
    CONCAT(MONTH(NOW()),
            '/',
            DAY(NOW()),
            '/',
            YEAR(NOW())) AS 'mm/dd/yyyy';
-- OR:
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

SELECT DATE_FORMAT(NOW(), '%M %D at %H:%i');

CREATE TABLE tweets (
    tweet_id INT AUTO_INCREMENT,
    content VARCHAR(200) NOT NULL DEFAULT 'No content',
    username VARCHAR(20) NOT NULL,
    creation_time TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (tweet_id)
);
DESC tweets;

INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat'); 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');

SELECT * FROM tweets;