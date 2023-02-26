CREATE DATABASE world_population;
USE world_population;

CREATE TABLE country (
    Country_id INT PRIMARY KEY,
    CCA3 VARCHAR(3) NOT NULL,
    Country_Territory VARCHAR(50) UNIQUE NOT NULL,
    Capital VARCHAR(50) NOT NULL,
    Continent VARCHAR(50) NOT NULL
);

CREATE TABLE population (
	country_id INT PRIMARY KEY,
	Population_2022 INT NOT NULL,
	Population_2020 INT NOT NULL,
    Population_2015 INT NOT NULL,
    Population_2010 INT NOT NULL,
    Population_2000 INT NOT NULL,
    Population_1990 INT NOT NULL,
    Population_1980 INT NOT NULL,
    Population_1970 INT NOT NULL,
    Area INT CHECK (Area > 0),
    Density DOUBLE NOT NULL DEFAULT 0,
    Growth_Rate DECIMAL(5,4) NOT NULL DEFAULT 0,
    World_Population_Percentage DECIMAL(4,2) NOT NULL DEFAULT 0,
    FOREIGN KEY(country_id) REFERENCES country(Country_id)
);

-- Basic info:
SELECT * FROM country;
SELECT * FROM population;
SELECT COUNT(*) FROM country;
SELECT COUNT(*) FROM population;
-- Checking if the info is complete on boths tables:
SELECT population.country_id, country.Country_id FROM country LEFT JOIN population ON country.Country_id = population.country_id;

# QUESTIONS:
-- 1. Which countries have the highest and lowest population densities?
-- 2. Which country has the current highest population?
-- 3. Which country is witnessing the highest population growth?
-- 4. What is the total population number by Continents?
-- 5. What is the density number by Continents?
-- 6. Which countries have experienced the fastest population growth over the years?
-- 7. How has the world population changed over time?
-- 8. In percentage, how much has the total population increased since 1970? and by Continent?
-- 9. Is there a country with a negative birth rate?
-- 10. How many people are there per square km on each continent?


-- 1. Which countries have the highest and lowest population densities?
SELECT 
    CCA3, Country_Territory, Density
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id
ORDER BY Density
LIMIT 1;

SELECT 
    CCA3, Country_Territory, Density
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id
ORDER BY Density DESC
LIMIT 1;

SELECT 
    MIN(Density) AS Min_Density
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id;
SELECT 
    MAX(Density) AS Max_Density
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id;


-- 2. Which country has the current highest population?
SELECT 
    CCA3, 
    Country_Territory,
    Density,
    FORMAT(Population_2022, 0)
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id
ORDER BY Population_2022 DESC
LIMIT 1;


-- 3. Which country is witnessing the highest population growth?
SELECT 
    CCA3,
    Country_Territory,
	Density,
    FORMAT((Population_2022 - Population_1970), 0) AS 'Total population growth'
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id
ORDER BY (Population_2022 - Population_1970) DESC
LIMIT 1;


-- 4. What is the total population number by Continents?
SELECT 
    Continent,
    FORMAT(SUM(Population_2022), 0) AS 'Total Population',
    SUM(World_Population_Percentage) AS 'World Population (%)'
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id
GROUP BY Continent ORDER BY 3 DESC;


-- 5. What is the density number by Continents?
SELECT 
    Continent,
    ROUND(SUM(Density), 2) AS 'Total Density'
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id
GROUP BY Continent ORDER BY 2 DESC;


-- 6. Which countries have experienced the fastest population growth over the years?
SELECT 
    CCA3,
    Country_Territory,
    Continent,
    Growth_Rate
FROM
    population
        JOIN country ON population.country_id = country.Country_id ORDER BY Growth_Rate DESC LIMIT 20;


-- 7. How has the world population changed over time?
SELECT 
    population.country_id,
    CCA3,
    Country_Territory,
    Continent,
    Growth_Rate,
    World_Population_Percentage,
    FORMAT((Population_2022 - Population_1970), 0) AS 'Population increase from 1970 to 2022:'
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id
ORDER BY (Population_2022 - Population_1970) DESC;


-- 8. In percentage, how much has the total population increased since 1970? and by Continent?
SELECT 
    ROUND(((SUM(Population_2022) / SUM(Population_1970)) * 100), 2) AS 'Total World population growth in %'
FROM
    population;

SELECT
    Continent,
    SUM(World_Population_Percentage) AS 'World Population Percentage',
    ROUND(((SUM(Population_2022) / SUM(Population_1970)) * 100), 2) AS 'Total population growth in %'
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id GROUP BY Continent ORDER BY 3 DESC;


-- 9. Is there a country with a negative birth rate?
SELECT 
    population.country_id,
    CCA3,
    Country_Territory,
    Continent,
    FORMAT((Population_2022 - Population_1970), 0) AS 'Population difference between 1970 and 2022:'
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id
WHERE
    (Population_2022 - Population_1970) < 0
ORDER BY (Population_2022 - Population_1970) DESC;


-- 10. How many people are there per square km on each continent?
SELECT
    Continent,
    FORMAT((SUM(Population_2022) / SUM(Area)), 1) AS 'Persons per square Km:'
FROM
    population
        JOIN
    country ON population.country_id = country.Country_id GROUP BY Continent ORDER BY SUM(Density) DESC;

