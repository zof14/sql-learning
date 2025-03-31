--1757 Recyclable Products--
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
--584. Find Customer Referee
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;
--595. Big Countries
SELECT name,population,area
FROM World
WHERE area>= 3000000 OR population>=25000000;
--1148. Article Views I
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC;