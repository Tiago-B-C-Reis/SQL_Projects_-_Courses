# Section 5 - CRUD Basics

#CRUD
# - Create (Insert Into...)
# - Read (SELECT * FROM... WHERE...) 
# - Update (UPDATE...SET...WHERE...)
# - Delete (DELETE FROM...WHERE...)

CREATE DATABASE pet_shop;

SHOW DATABASES;

USE pet_shop;

CREATE TABLE cats
  (
      cat_id INT AUTO_INCREMENT,
      name VARCHAR(100),
      breed VARCHAR(100),
      age INT,
      PRIMARY KEY (cat_id)
  );

INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

SELECT * FROM cats;

SELECT names FROM cats;
SELECT age FROM cats;
SELECT age, name FROM cats;
SELECT * FROM cats WHERE age=4;
SELECT name, age FROM cats WHERE age=4; # WHERE hapens first then comes the SELECT
SELECT * FROM cats WHERE name='Egg';
SELECT * FROM cats WHERE name='egg'; # it's not lower case sensitive

# Exercise S5.62
SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id=age;


SELECT cat_id AS id, name FROM cats;

UPDATE employees SET current_status='laid-off', last_name='how cares'; 
UPDATE cats SET age=14 WHERE name='Misty';

# Check up before modifing: example
SELECT * FROM cats WHERE cats='Misty';
UPDATE cats SET age=14 WHERE cats='Misty';

# Exercise S5.70:
SELECT * FROM cats WHERE name='Jackson'; 
UPDATE cats SET name='Jack' WHERE name='Jackson\'s';
SELECT * FROM cats WHERE name='Jackson'; 
SELECT * FROM cats WHERE name='Jack'; 
SELECT * FROM cats WHERE name='Ringo'; 
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
SELECT * FROM cats; 
UPDATE cats SET age=12 WHERE breed='Maine Coon';
SELECT * FROM cats WHERE breed='Maine Coon';


# Delete:
# Delete all cats with name of 'Egg':
DELETE FROM cats WHERE name='Egg';
# Delete all rows in the cats table:
DELETE FROM cats;


# Exercise S5.75:
SELECT * FROM cats WHERE age=4;
DELETE FROM cats WHERE age=4;
SELECT * FROM cats WHERE age=cat_id;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;
