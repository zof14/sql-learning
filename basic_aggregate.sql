--620. Not Boring Movies
--Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
-- Return the result table ordered by rating in descending order.
-- The result format is in the following example.
SELECT * 
FROM Cinema
WHERE id%2!=0 AND description!= 'boring'
ORDER BY rating DESC;

--1251. Average Selling Price
SELECT p.product_id, 
       ROUND(SUM(p.price * u.units) / NULLIF(SUM(u.units), 0), 2)AS average_price
FROM Prices p
LEFT JOIN UnitsSold u 
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
--1075. Project Employees I
SELECT project_id, ROUND(AVG(experience_years),2) as average_years
FROM Employee
JOIN Project
ON Employee.employee_id = Project.employee_id
GROUP BY project_id;

--1211
SELECT query_name, ROUND(AVG(rating/position),2) as quality, ROUND(SUM(rating<3)*100/COUNT(query_name),2) as poor_query_percentage
FROM  Queries
GROUP BY query_name;


--1193. Monthly Transactions I
SELECT 
DATE_FORMAT(trans_date,'%Y-%m') AS month, country, COUNT(*) AS trans_count, SUM(state='approved') AS approved_count, SUM(amount) AS trans_total_amount,SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY DATE_FORMAT(trans_date,'%Y-%m') , country;
--1174. Immediate Food Delivery II
SELECT ROUND(SUM(CASE WHEN customer_pref_delivery_date = order_date THEN 1 ELSE 0 END) *100/COUNT( customer_id),2) AS immediate_percentage
FROM 
(SELECT *
FROM Delivery d1
WHERE order_date = (
    SELECT MIN(order_date)
    FROM Delivery d2
    WHERE d1.customer_id = d2.customer_id
)) AS first_order;

--or
Select 
    ROUND(SUM(CASE WHEN customer_pref_delivery_date = order_date THEN 1 ELSE 0 END) *100/COUNT( customer_id),2) AS immediate_percentage
from Delivery
where (customer_id, order_date) in (
  Select customer_id, min(order_date) 
  from Delivery
  group by customer_id
);

--550. Game Play Analysis IV

SELECT ROUND(COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM 
(SELECT *
FROM Activity d1
WHERE event_date = (
    SELECT MIN(event_date)
    FROM Activity d2
    WHERE d1.player_id = d2.player_id
) + INTERVAL 1 DAY
) AS first_log;
--or
SELECT 
  ROUND(COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity d1
WHERE (player_id, event_date) IN (
  SELECT player_id, DATE_ADD(MIN(event_date), INTERVAL 1 DAY)
  FROM Activity
  GROUP BY player_id
);
