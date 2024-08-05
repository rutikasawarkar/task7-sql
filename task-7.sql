select * from product

select * from customer

select * from sales

--1) create a report of all state sales,quantity,discount,profit with following agg,sum,avg,min,max,count

Select  c.state, sum(sales) as sum_total_sales,avg(sales) as avg_sales,min(quantity) as min_quantity,
max(quantity) as max_quantity,count(discount) count_discount, sum(profit) as sum_profit from sales as s
     inner join customer as c 
     on s.customer_id = c.customer_id
 group by c.state

--2)get data of all state and city's avg customer age

select state,city,AVG(age) as avg_customer_age from customer group by state,city

--3)get data from 2017 to 2018 with product name and sales per quantity

select product_name,s.ship_date,sum(sales)/sum(quantity) as sales_per_quantity 
from
sales as s
inner join product as p
on s.product_id=p.product_id
where ship_date between '2017-01-01' and '2018-12-31'
group by product_name,s.ship_date

--4)create 4 ques on your data like above and solve
--1)Find the total no of orders,total sales,and total profit for each customer 
SELECT  c.customer_name, 
    COUNT(s.order_id) AS total_orders, 
    SUM(s.sales) AS total_sales, 
    SUM(s.profit) AS total_profit
FROM  sales AS s
INNER JOIN  customer AS c 
ON  s.customer_id = c.customer_id
GROUP BY  c.customer_name

	
2) idenrify the average sales,total discount ,and profit for each product category across all states

SELECT  s.product_category, 
    AVG(s.sales) AS avg_sales, 
    SUM(s.discount) AS total_discount, 
    SUM(s.profit) AS total_profit
FROM sales AS s
INNER JOIN customer AS c 
ON  s.customer_id = c.customer_id
GROUP BY p.product_category


3) Calculate the minimum, maximum, and average quantity of products sold in each region.
SELECT  c.region, 
    MIN(s.quantity) AS min_quantity, 
    MAX(s.quantity) AS max_quantity, 
    AVG(s.quantity) AS avg_quantity
FROM sales AS s
INNER JOIN customer AS c 
ON s.customer_id = c.customer_id
GROUP BY 
    c.region

4)Determine the total sales and profit for each combination of product category and state 

SELECT  s.product_category,  c.state, 
    SUM(s.sales) AS total_sales, 
    SUM(s.profit) AS total_profit
FROM  sales AS s
INNER JOIN  customer AS c 
ON  s.customer_id = c.customer_id
GROUP BY 
    s.product_category, 
    c.state




