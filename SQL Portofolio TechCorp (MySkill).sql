create database techcorp;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10 , 2 ),
    stock_quantity INT,
    discount DECIMAL(5 , 2 ) DEFAULT 0
);
INSERT INTO Products (product_name, category, price, stock_quantity, discount)
VALUES
('Laptop Pro 15', 'Laptop', 1500.00, 100, 0),
('Smartphone X', 'Smartphone', 800.00, 200, 0),
('Wireless Mouse', 'Accessories', 25.00, 500, 0),
('USB-C Charger', 'Accessories', 20.00, 300, 0),
('Gaming Laptop', 'Laptop', 2000.00, 50, 10),
('Budget Smartphone', 'Smartphone', 300.00, 150, 5),
('Noise Cancelling Headphones', 'Accessories', 150.00, 120, 15),
('Wireless Earphones', 'Accessories', 100.00, 100, 10);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(250) UNIQUE,
    phone VARCHAR(100),
    address VARCHAR(250)
);
INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street'),
('Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '456 Oak Street'),
('Emily', 'Johnson', 'emily.johnson@example.com', '123-456-7892', '789 Pine Street'),
('Michael', 'Brown', 'michael.brown@example.com', '123-456-7893', '101 Maple Street'),
('Sarah', 'Davis', 'sarah.davis@example.com', '123-456-7894', '202 Birch Street');

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10 , 2 ),
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2023-07-01', 1525.00),
(2, '2023-07-02', 820.00),
(3, '2023-07-03', 25.00),
(1, '2023-07-04', 2010.00),
(4, '2023-07-05', 300.00),
(2, '2023-07-06', 315.00),
(5, '2023-07-07', 165.00);

CREATE TABLE orderdetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10 , 2 ),
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);
INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 1500.00),
(1, 3, 1, 25.00),
(2, 2, 1, 800.00),
(2, 4, 1, 20.00),
(3, 3, 1, 25.00),
(4, 5, 1, 2000.00),
(4, 6, 1, 10.00),
(5, 6, 1, 300.00),
(6, 6, 1, 300.00),
(7, 7, 1, 150.00),
(7, 4, 1, 15.00);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(100),
    hire_date DATE,
    department VARCHAR(100)
);
INSERT INTO Employees (first_name, last_name, email, phone, hire_date, department)
VALUES
('Alice', 'Williams', 'alice.williams@example.com', '123-456-7895', '2022-01-15', 'Support'),
('Bob', 'Miller', 'bob.miller@example.com', '123-456-7896', '2022-02-20', 'Sales'),
('Charlie', 'Wilson', 'charlie.wilson@example.com', '123-456-7897', '2022-03-25', 'Development'),
('David', 'Moore', 'david.moore@example.com', '123-456-7898', '2022-04-30', 'Support'),
('Eve', 'Taylor', 'eve.taylor@example.com', '123-456-7899', '2022-05-10', 'Sales');

CREATE TABLE supporttickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    issue TEXT,
    status VARCHAR(50),
    created_at DATETIME,
    resolved_at DATETIME,
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    FOREIGN KEY (employee_id)
        REFERENCES employees (employee_id)
);
INSERT INTO SupportTickets (customer_id, employee_id, issue, status, created_at, resolved_at)
VALUES
(1, 1, 'Cannot connect to Wi-Fi', 'resolved', '2023-07-01 10:00:00', '2023-07-01 11:00:00'),
(2, 1, 'Screen flickering', 'resolved', '2023-07-02 12:00:00', '2023-07-02 13:00:00'),
(3, 1, 'Battery drains quickly', 'open', '2023-07-03 14:00:00', NULL),
(4, 2, 'Late delivery', 'resolved', '2023-07-04 15:00:00', '2023-07-04 16:00:00'),
(5, 2, 'Damaged product', 'open', '2023-07-05 17:00:00', NULL),
(1, 3, 'Software issue', 'resolved', '2023-07-06 18:00:00', '2023-07-06 19:00:00'),
(2, 3, 'Bluetooth connectivity issue', 'resolved', '2023-07-07 20:00:00', '2023-07-07 21:00:00'),
(5, 4, 'Account issue', 'open', '2023-07-08 22:00:00', NULL),
(3, 4, 'Payment issue', 'resolved', '2023-07-09 23:00:00', '2023-07-09 23:30:00'),
(4, 5, 'Physical damage', 'open', '2023-07-10 08:00:00', NULL),
(4, 1, 'Laptop blue screen', 'resolved', '2024-01-05 10:00:00', '2024-02-05 12:00:00'),
(5, 1, 'Laptop lagging', 'resolved', '2024-01-06 10:00:00', '2024-01-25 12:00:00'),
(3, 1, 'Some part of laptop broken', 'resolved', '2024-02-05 10:00:00', '2024-03-05 12:00:00');

-- menamppilkan tabel
SELECT 
    *
FROM
    products;
SELECT 
    *
FROM
    customers;
SELECT 
    *
FROM
    orders;
SELECT 
    *
FROM
    orderdetails;
SELECT 
    *
FROM
    employees;
SELECT 
    *
FROM
    supporttickets;

-- Identifikasi 3 pelanggan teratas berdasarkan total nominal pesanan
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

-- Rata-rata nominal pesanan untuk tiap customer
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

-- Temukan semua karyawan yang telah menyelesaikan lebih dari 4 tiket support
SELECT DISTINCT
    e.first_name, e.last_name, COUNT(ticket_id)
FROM
    employees AS e
        JOIN
    supporttickets AS s ON s.employee_id = e.employee_id
GROUP BY e.employee_id
HAVING COUNT(status = 'resolved') > 4;

-- cara lain
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

-- Temukan semua produk yang belum pernah dipesan
SELECT 
    p.product_name
FROM
    products p
        LEFT JOIN
    orderdetails od ON od.product_id = p.product_id
WHERE
    od.order_id IS NULL;

-- Hitung total pendapatan yang dihasilkan dari penjualan produk
SELECT 
    SUM(quantity * unit_price) total_penjualan_produk
FROM
    orderdetails;

-- Temukan harga rata-rata produk untuk setiap kategori dan temukan kategori dengan harga rata-rata > $500
SELECT 
    category, AVG(price) harga_rata_rata_produk
FROM
    products
GROUP BY category
HAVING harga_rata_rata_produk > 500;

-- coba pake cte
with cte_avg_price as (
select category, avg(price) harga_rata_rata_produk
from products
group by category
)
select * from cte_avg_price where harga_rata_rata_produk > 500;

-- Temukan pelanggan yang telah membuat setidaknya satu pesanan ddengan total jumlah > 100
SELECT 
    c.first_name, c.last_name
FROM
    customers c
        JOIN
    orders o ON o.customer_id = c.customer_id
WHERE
    total_amount > 1000
GROUP BY c.customer_id;

-- Cara lain (versi data lengkap pelanggan)
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