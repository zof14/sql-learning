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