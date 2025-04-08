--1731. The Number of Employees Which Report to Each Employee
SELECT e1.employee_id,e1.name, COUNT(*) AS reports_count,ROUND(AVG(e2.age)) AS average_age
FROM Employees e1
JOIN Employees e2
ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id
ORDER BY e1.employee_id;

--1789. Primary Department for Each Employee
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
OR employee_id IN(
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(*) = 1

);
--OR
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id, department_id
HAVING COUNT(*) = 1;

--610. Triangle Judgement
SELECT x,y,z,(CASE WHEN x+y>z AND x+z>y AND z+y>x THEN 'Yes' ELSE 'No' END) AS triangle
FROM Triangle;
--180. Consecutive Numbers
SELECT  DISTINCT l1.num  AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 
ON l1.id = l2.id - 1
JOIN Logs l3 
ON l1.id = l3.id - 2
WHERE l1.num = l2.num AND l1.num = l3.num;
--1164. Product Price at a Given Date
SELECT product_id , 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date)>"2019-08-16"

UNION

SELECT product_id, new_price
FROM Products
WHERE (product_id,change_date) IN
(SELECT product_id, MAX(change_date)
FROM Products 
WHERE change_date <= "2019-08-16" 
GROUP BY product_id) ;

--1204
SELECT person_name
FROM(
    SELECT person_name,
    SUM(weight) OVER (ORDER BY turn) AS total_weight, turn
    FROM Queue
) AS boarding
WHERE total_weight<=1000
ORDER BY total_weight DESC
LIMIT 1;