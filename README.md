# Implementing SQL: TechCorp
TechCorp is an e-commerce company specializing in the sale of electronic products such as laptops, smartphones, and accessories. TechCorp also provides customer support services to assist customers with technical issues and inquiries about the products it sells. The data will be analyzed for financial reporting and business performance analysis purposes.
There are 6 tables contain data needed for the analysis, such as products table, customers table, orders table, order details table, employees table, and the support tickets table. Each of the table explanation given below:
+ **Products**: Stores information about the products being sold.
+ **Customers**: Stores information about customers.
+ **Orders**: Stores information about orders placed by customers.
+ **OrderDetails**: Stores detailed information for each order.
+ **Employees**: Stores information about employees working at TechCorp.
+ **Support tickets**: Stores information about support tickets submitted by customers.

# SQL Queries and Techniques
+ ***Data Manipulation Language (DML)**: some SQL DML fuctions used in this analysis includes grouping data using GROUP BY, filtering data using some condition functions (WHERE, BETWEEN, LIKE, AND/OR, DISTINCT, IN, IS NULL), some aggregate functions (SUM and AVG).
+ ***Data Definition Language (DML)**: Creating and using CTEs in SQL queries.

## Let's get to the analysis!
### Identify the top 3 customers based on the total order amount
```js
SELECT 
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_order
FROM
    customers AS c
        JOIN
    orders AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_order DESC
LIMIT 3;
```
+ **Result**: John Doe is the top customer with $3535 in purchases, indicating strong loyalty. Jane Smith follows with $1135, contributing moderately, while Michael Brown's $300 represents a smaller share but shows potential for growth with targeted marketing. 

### Calculate the average order amount for each customer
```js
SELECT 
    c.first_name,
    c.last_name,
    AVG(total_amount) AS rerata_nominal_pesanan
FROM
    customers AS c
        JOIN
    orders AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY rerata_nominal_pesanan DESC;
```
+ **Result**: Customer with the highest average order amount is John Doe with $1767, while the lowest average order amount owned by Emily Johnson at $25.
 
### Collect the data of all employees who have resolved more than 4 support tickets
``` js
SELECT DISTINCT
    e.first_name, e.last_name, COUNT(s.ticket_id)
FROM
    employees AS e
        JOIN
    supporttickets AS s ON s.employee_id = e.employee_id
WHERE
    status = 'resolved'
GROUP BY e.employee_id
HAVING COUNT(s.ticket_id) > 4;
```
+ **Result**: The only employee who has completed more than 4 support tickets is Alice Williams with a total of 5 support tickets.

### Identify which product that have never been ordered
```js
SELECT 
    p.product_name
FROM
    products p
        LEFT JOIN
    orderdetails od ON od.product_id = p.product_id
WHERE
    od.order_id IS NULL;
```
+ **Result**: Wireless Earphone is the only item that no one has ever brought. This can be an insight for the company to boost the promotion for Wireless Earphone, either eith the massive campaign or with some kind of promo/bundling package.

### Calculate the total revenue generated from product sales
```js
SELECT 
    SUM(quantity * unit_price) total_penjualan_produk
FROM
    orderdetails;
```
+ **Result**= Total revenue that gained from product sales is $5145

### Find the average price of products for each category and identify which categories with an average price greater than $500.
``` js
SELECT 
    category, AVG(price) harga_rata_rata_produk
FROM
    products
GROUP BY category
HAVING harga_rata_rata_produk > 500;
```
+ **Result**: Given two items that their average price is greater than $500. Those items are Laptop ($1750) and Smartphone ($550).


### Identify customer who have made at least one order with a total amount greater than 100.
#### Using "Join" Query:
```js
SELECT 
    c.first_name, c.last_name
FROM
    customers c
        JOIN
    orders o ON o.customer_id = c.customer_id
WHERE
    total_amount > 1000
GROUP BY c.customer_id;
```

#### Using Subquery:
```js
SELECT 
    *
FROM
    customers
WHERE
    customer_id IN (SELECT 
            customer_id
        FROM
            orders
        WHERE
            total_amount > 1000);
```
+ **Result**: Customer that matches with the criteria is John Doe. The difference between those two ways is that in Join query, the result shown only customer name, while in subquery, the whole data about the customer (in this case, John Doe) is shown including his email, phone, and address.


## Recommendation
+ **Customer Loyalty**: Retain loyal customers, especially the top 3 such as John Doe, Jane Smith, and Michael Brown. This can be achieved by offering loyalty programs, discounts, or other incentives that can boost sales. Additionally, intensify promotions for customers with the lowest average purchases, such as offering bonuses for specific purchases.
+ **Product Efficiency**: Boost promotions for wireless earphones to increase sales. Promotions can include campaigns or content specifically focused on the product. Another approach is bundling wireless earphones with other high-selling products to increase their exposure.
+ **Employee Improvement Program**: Based on the analysis, Alice Williams is the employee with the best performance, as seen from the support tickets she has resolved. Therefore, it is important for Alice to receive recognition for her performance. Besides that, to improve the performance of other employees, training programs can be implemented to support the company's sales performance.
+ **Sales Improvment**: Design a strategy to increase sales in the upcoming weeks of July. This can be achieved by combining information from total sales and products with relatively high prices to boost revenue. For example, in the upcoming week, products that should be highlighted are smartphones and laptops. Therefore, both products could be promoted through social media campaigns with higher frequency than before. Engage copywriting and design as attractively as possible to appeal to customers from various demographics, especially Gen Z or Gen Y who are very familiar to gadgets.
