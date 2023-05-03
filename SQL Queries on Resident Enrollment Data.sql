--Check accuracy of tables--

SELECT * FROM residents;

SELECT * FROM activities;

SELECT * fROM resident_enrollment;

SELECT * FROM staff;

SELECT * FROM activity_leaders;

--Query Basics--

--Selects residents at least 80 years of age, ordered by increasing age--
SELECT * FROM residents
WHERE age >= 80
ORDER BY age;

--Selects activites that occur in Rooms 2, 3, and 4--
SELECT activity_title FROM activities
WHERE room_no BETWEEN 2 AND 4;

--Selects residents who are participating in Dancing or Mini Golf--
SELECT resident_no FROM resident_enrollment
WHERE activity_id IN ('D','G');

--Selects staff who earn a salary of more than $50,000--
SELECT last_name, salary FROM staff
WHERE salary >= 50000;

--Select resident last names (in all upper case) and age from residents table--
SELECT UPPER(resident_lname), age
FROM residents;

--Will show where the last name 'Francis' is located in the table--
SELECT POSITION('Francis' IN resident_lname) FROM residents;

--Will select last name and salary of staff member with highest salary--
SELECT last_name, MAX(salary) FROM staff
GROUP BY last_name
LIMIT 1;

--Selects activities with two or more residents enrolled--
SELECT activity_id, COUNT(*) FROM resident_enrollment
GROUP BY activity_id
HAVING COUNT(*) >= 2
ORDER BY COUNT(*);

--Adding entries--
INSERT INTO staff
VALUES ('Anderson',75000,'2012-05-02');

ALTER TABLE residents
ADD mobility varchar(20);

UPDATE residents SET mobility = 2 WHERE resident_lname = 'Adams';
UPDATE residents SET mobility = 1 WHERE resident_lname = 'Bentley';
UPDATE residents SET mobility = 1 WHERE resident_lname = 'Cunningham';
UPDATE residents SET mobility = 2 WHERE resident_lname = 'Donovan';
UPDATE residents SET mobility = 0 WHERE resident_lname = 'Eller';
UPDATE residents SET mobility = 0 WHERE resident_lname = 'Francis';
UPDATE residents SET mobility = 1 WHERE resident_lname = 'Gordon';
UPDATE residents SET mobility = 1 WHERE resident_lname = 'Hotop';
UPDATE residents SET mobility = 2 WHERE resident_lname = 'Ingalls';
UPDATE residents SET mobility = 2 WHERE resident_lname = 'Jackson';
SELECT * FROM residents

--Subqueries--
--Selects last names and salary of staff who lead activities--
SELECT last_name, salary FROM staff
WHERE last_name IN (SELECT last_name from activity_leaders);

--Case Statements--
--Adding a column defining mobility classes--
SELECT *,
CASE
WHEN mobility = '0' THEN 'Low Mobility'
WHEN mobility = '1' THEN 'Medium Mobility'
WHEN mobility = '2' THEN 'High Mobility'
END AS mobility_class
FROM residents;

--Joins--
--Using Join to show last names and mobility class enrolled in each activity--
SELECT r.resident_lname, a.activity_title, r.mobility
FROM residents r INNER JOIN resident_enrollment e
ON r.resident_no = e.resident_no 
INNER JOIN activities a
ON e.activity_id = a.activity_id
ORDER BY a.activity_title;




 



