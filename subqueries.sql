--1978. Employees Whose Manager Left the Company
SELECT employee_id 
FROM Employees
WHERE salary<30000 AND manager_id IS NOT NULL AND manager_id NOT IN (SELECT
employee_id FROM Employees)
ORDER BY employee_id;

--626. Exchange Seats
SELECT CASE WHEN id%2 = 1 AND id+1<=(SELECT MAX(id) FROM Seat) THEN id+1
 WHEN id%2 = 0  THEN id-1
ELSE id
END AS id, student
FROM Seat
ORDER BY id ASC;