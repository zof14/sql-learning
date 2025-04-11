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

--1341. Movie Rating

(SELECT  u.name AS results
FROM Users u
JOIN MovieRating m
ON u.user_id = m.user_id
GROUP BY u.user_id, u.name
ORDER BY COUNT(*) DESC, u.name ASC
 LIMIT 1
)
UNION ALL

(SELECT mv.title AS results
FROM Movies mv
JOIN MovieRating mr
ON mv.movie_id = mr.movie_id
WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY mv.movie_id, mv.title
ORDER BY AVG(rating) DESC , mv.title ASC
LIMIT 1
);

 
