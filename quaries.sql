--Q1. Write a query to display customer_id, gender, category, and purchase amount.
SELECT customer_id, gender, category, purchase_amount_usd
FROM customer;


--Q2. Retrieve all customers who spent more than 50 USD.
SELECT *
FROM customer
WHERE purchase_amount_usd > 50;


--Q3. List the top 10 highest spending customers.
SELECT customer_id, purchase_amount_usd
FROM customer
ORDER BY purchase_amount_usd DESC 
LIMIT 10;


--Q4. Find total revenue generated from each product category.
SELECT 
    category,
    SUM(purchase_amount_usd) AS total_revenue
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;


--Q5. Perform an INNER JOIN between customer table & category_info table.
SELECT 
    c.customer_id,
    c.item_purchased,
    c.category,
    ci.department
FROM customer c
INNER JOIN category_info ci
ON c.category = ci.category;


--Q6. LEFT JOIN to show all customers even if no department exists.
SELECT 
    c.customer_id,
    c.item_purchased,
    c.category,
    ci.department
FROM customer c
LEFT JOIN category_info ci
ON c.category = ci.category;


--Q7. RIGHT JOIN to show all departments even if no purchases happened.
SELECT 
    ci.category,
    ci.department, 
    c.item_purchased
FROM customer c
RIGHT JOIN category_info ci
ON c.category = ci.category;


--Q8. Find customers who spent above the average purchase amount.
SELECT customer_id, purchase_amount_usd
FROM customer
WHERE purchase_amount_usd > (
    SELECT AVG(purchase_amount_usd)
    FROM customer
);


--Q9. Find the total number of customers from each gender.
SELECT gender, COUNT(*) AS total_customers
FROM customer
GROUP BY gender;


--Q10. Find the average age of customers for each product category.
SELECT category, AVG(age) AS avg_age
FROM customer
GROUP BY category
ORDER BY avg_age;


--Q11. Count how many customers purchased each item.
SELECT item_purchased, COUNT(*) AS total_orders
FROM customer
GROUP BY item_purchased
ORDER BY total_orders DESC;


--Q12. Find the total number of online subscription customers.
SELECT subscription_status, COUNT(*) AS total_count
FROM customer
GROUP BY subscription_status;


--Q13. Get the average review rating for each season.
SELECT season, AVG(review_rating) AS avg_rating
FROM customer
GROUP BY season
ORDER BY avg_rating DESC;


--Q14. Find the location with the highest total revenue.
SELECT location, SUM(purchase_amount_usd) AS total_revenue
FROM customer
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 1;


--Q15. Find the total revenue generated during each season.
SELECT season, SUM(purchase_amount_usd) AS total_revenue
FROM customer
GROUP BY season
ORDER BY total_revenue DESC;


--Q16. List customers who used a promo code.
SELECT customer_id, item_purchased, promo_code_used
FROM customer
WHERE promo_code_used = 'Yes';


--Q17. Show the count of purchases based on payment method.
SELECT payment_method, COUNT(*) AS total_purchases
FROM customer
GROUP BY payment_method
ORDER BY total_purchases DESC;


--Q18. Find customers who made more than 5 previous purchases.
SELECT customer_id, previous_purchases
FROM customer
WHERE previous_purchases > 5;


--Q19. List items purchased by female customers only.
SELECT customer_id, item_purchased, category
FROM customer
WHERE gender = 'Female';



--Q20. Fetch the top 5 highest-rated products.
SELECT item_purchased, review_rating
FROM customer
ORDER BY review_rating DESC
LIMIT 5;



