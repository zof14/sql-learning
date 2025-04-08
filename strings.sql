--1667. Fix Names in a Table
SELECT user_id, CONCAT(UPPER(LEFT(name,1)),LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id ASC;


--1527. Patients With a Condition
SELECT patient_id,patient_name,conditions
FROM Patients
WHERE conditions LIKE '% DIAB1' OR conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%';