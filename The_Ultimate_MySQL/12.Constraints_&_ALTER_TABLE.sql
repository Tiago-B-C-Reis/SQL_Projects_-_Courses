# SECTION 12: Constraints_&_ALTER_TABLE 

CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
 
-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    age INT CHECK (age > 0) 
);
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
);
INSERT INTO palindromes (word) VALUES ('rececar');
INSERT INTO palindromes (word) VALUES ('mommy'); # this one doesn't respect the 'check' that we defined above

CREATE TABLE users2 (
    username VARCHAR(50) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK(age >0) 
);
INSERT INTO users2 (username, age) VALUES ('chickenlady', -9);

CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

SELECT * FROM companies;
ALTER TABLE companies ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL; # Here it puts to the default nº of 0.
ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

ALTER TABLE companies DROP COLUMN phone;
ALTER TABLE companies DROP COLUMN employee_count;

SELECT * FROM companies;
RENAME TABLE companies TO suppliers;
SELECT * FROM suppliers;
ALTER TABLE suppliers RENAME TO companies;
SHOW TABLES;

SELECT * FROM companies;
ALTER TABLE companies RENAME COLUMN name TO company_name;

DESC companies;
ALTER TABLE companies MODIFY company_name VARCHAR(100) DEFAULT 'unknown';
INSERT INTO companies (address) VALUES ('2554 rose lane');
ALTER TABLE companies CHANGE address company_address VARCHAR(255) NOT NULL;

SELECT * FROM houses;
DESC houses;
ALTER TABLE houses ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);
INSERT INTO houses (purchase_price, sale_price) VALUES (-1, 4);
INSERT INTO houses (purchase_price, sale_price) VALUES (10, 3);
INSERT INTO houses (purchase_price, sale_price) VALUES (5, 7);
ALTER TABLE houses DROP CONSTRAINT positive_pprice; 