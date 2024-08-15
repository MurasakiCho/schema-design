/*
--Briana O'Neal FastTrack Scheme Design Assignment

--Q1 & Q2. Create ERD

CREATE TABLE person(
	id SERIAL primary key,
	first_name VARCHAR(12),
	last_name VARCHAR(12),
	age integer
);


CREATE TABLE person_location (
	id SERIAL primary key,
	city VARCHAR,
	us_state VARCHAR,
	country VARCHAR
);


CREATE TABLE person_interest (
);

--Q4

INSERT INTO person_location (city, us_state, country) 
VALUES 
	('Nashville', 'Tennessee', 'United States'),
	('Memphis', 'Tennessee', 'United States'),
	('Phoenix', 'Arizona', 'United States'),
	('Denver', 'Colorado', 'United States');


SELECT * from person_location;

--Q5
INSERT INTO person (first_name, last_name, age, location_id) VALUES
	('Chickie', 'Ourtic', 21, 1),
	('Hilton', 'O''Hanley', 37, 1),
	('Barbe', 'Purver', 50, 3),
	('Reeta', 'Sammons', 34, 2),
	('Abbott', 'Fisbburne', 49, 1),
	('Winnie', 'Whines', 19, 4),
	('Samantha', 'Leese', 35, 2),
	('Edouard', 'Lorimer', 29, 1),
	('Mattheus', 'Shaplin', 27, 3),
	('Donnell', 'Corney', 25, 3),
	('Wallis', 'Kauschke', 28, 3),
	('Melva', 'Lanham', 20, 2),
	('Amelina', 'McNirlan', 22, 4),
	('Courtney', 'Holley', 22, 1),
	('Sigismond', 'Vala', 21, 4),
	('Jacquelynn', 'Halfacre', 24, 2),
	('Alanna', 'Spino', 25, 3),
	('Isa', 'Slight', 32, 1),
	('Kakalina', 'Renne', 26, 3);


--Q6
INSERT INTO interest (title) VALUES
	('Programming'),
	('Gaming'),
	('Computers'),
	('Music'),
	('Movies'),
	('Cooking'),
	('Sports');

--Q7
INSERT INTO person_interest (person_id, interest_id) VALUES
	(1, 1),
	(1, 2),
	(1, 6),
	(2, 1),
	(2, 7),
	(2, 4),
	(3, 1),
	(3, 3),
	(3, 4),
	(4, 1),
	(4, 2),
	(4, 7),
	(5, 6),
	(5, 3),
	(5, 4),
	(6, 2),
	(6, 7),
	(7, 1),
	(7, 3),
	(8, 2),
	(8, 4),
	(9, 5),
	(9, 6),
	(10, 7),
	(10, 5),
	(11, 1),
	(11, 2),
	(11, 5),
	(12, 1),
	(12, 4),
	(12, 5),
	(13, 2),
	(13, 3),
	(13, 7),
	(14, 2),
	(14, 4),
	(14, 6),
	(15, 1),
	(15, 5),
	(15, 7),
	(16, 2),
	(16, 3),
	(16, 4),
	(17, 1),
	(17, 3),
	(17, 5),
	(17, 7),
	(18, 2),
	(18, 4),
	(18, 6),
	(19, 1),
	(19, 2),
	(19, 3),
	(19, 4),
	(19, 5),
	(19, 6),
	(19, 7);


SELECT * FROM person;

--Q8
UPDATE person SET age= age + 1 WHERE (first_name, last_name) IN 
	(('Chickie', 'Ourtic'),
	('Winnie', 'Whines'),
	('Edouard', 'Lorimer'),
	('Courtney', 'Holley'),
	('Melva', 'Lanham'),
	('Isa', 'Slight'),
	('Abbott', 'Fisbburne'),
	('Reeta', 'Sammons'));

--Q9
DELETE FROM person_interest WHERE person_id IN (2, 17);
DELETE FROM person WHERE (first_name, last_name) IN
	(('Hilton', 'O''Hanley'), ('Alanna', 'Spino'));


--Q10.A
SELECT first_name, last_name FROM person;

--Q10.B
SELECT first_name, last_name, city, us_state 
FROM person
INNER JOIN person_location 
	ON person_location.id = person.location_id
	AND (city, us_state) = ('Nashville', 'Tennessee');


--Q10.C
SELECT city, COUNT(person.location_id) AS city_dwellers
FROM person
INNER JOIN person_location
	ON person_location.id = person.location_id
GROUP BY city;


--Q10.D
SELECT title, COUNT(person_interest.person_id)
FROM person_interest
INNER JOIN interest
	ON person_interest.interest_id = interest.id
GROUP BY title;


--Q10.E
SELECT first_name, last_name, city, us_state, interest.title
FROM person
JOIN person_location 
	ON person_location.id = person.location_id
	AND (city, us_state) = ('Nashville', 'Tennessee')
JOIN person_interest
	ON person_interest.person_id = person.idperson
JOIN interest
	ON interest.id = person_interest.interest_id
	AND interest.title = 'Programming';


--Q10.F
SELECT COUNT(*), CASE
	WHEN age BETWEEN 20 AND 30 THEN '20-30'
	WHEN age BETWEEN 30 AND 40 THEN '30-40'
	WHEN age BETWEEN 40 AND 50 THEN '40-50'
	END AS range
FROM person
GROUP BY range;
*/