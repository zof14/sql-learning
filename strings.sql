--1667. Fix Names in a Table
SELECT user_id, CONCAT(UPPER(LEFT(name,1)),LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id ASC;


--1527. Patients With a Condition
SELECT patient_id,patient_name,conditions
FROM Patients
WHERE conditions LIKE '% DIAB1' OR conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%';

--196. Delete Duplicate Emails
DELETE p1 
FROM Person p1
JOIN Person p2
ON p1.id>p2.id AND p1.email=p2.email;
--176. Second Highest Salary
SELECT (
    SELECT MAX(salary)
    FROM Employee
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employee
    )
) AS SecondHighestSalary;

--1484. Group Sold Products By The Date

SELECT  sell_date, COUNT(DISTINCT product) as num_sold,GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
--1327. List the Products Ordered in a Period
SELECT p.product_name, SUM(unit) as unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY product_name
HAVING SUM(unit)>=100
;
--1517. Find Users With Valid E-Mails
SELECT user_id, name,mail
FROM Users
WHERE mail  REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$';