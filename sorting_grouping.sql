--2356. Number of Unique Subjects Taught by Each Teacher
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
--1141. User Activity for the Past 30 Days I

SELECT activity_date AS day, COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE activity_date BETWEEN (DATE('2019-07-27') - INTERVAL 30 DAY) AND DATE('2019-07-27')
GROUP BY activity_date;

SELECT activity_date AS day, COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE activity_date BETWEEN  '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
ORDER BY activity_date;
--1070. Product Sales Analysis III
SELECT s.product_id, 
       first_sales.first_year, 
       s.quantity, 
       s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) AS first_sales
  ON s.product_id = first_sales.product_id
  AND s.year = first_sales.first_year;
--596. Classes More Than 5 Students
SELECT class 
FROM Courses

GROUP BY class
HAVING COUNT(*)>=5;
--1729. Find Followers Count
SELECT user_id, COUNT(follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;
aa