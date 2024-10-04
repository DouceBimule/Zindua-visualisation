USE practice101;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Orders;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    contact_name VARCHAR(100),
    contact_email VARCHAR(100)
);
INSERT INTO Products (product_name, price, supplier_id)
VALUES 
('Smartphone', 599.99, 1),
('Laptop', 999.99, 1),
('Headphones', 49.99, 2),
('Monitor', 199.99, 2);
INSERT INTO Suppliers (supplier_name, contact_name, contact_email)
VALUES 
('TechCorp', 'John Smith', 'john@techcorp.com'),
('GadgetsPlus', 'Jane Doe', 'jane@gadgetsplus.com');
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES 
(1, '2023-10-01', 649.99),
(2, '2023-10-03', 1049.98);
INSERT INTO OrderDetails (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 599.99),
(1, 3, 1, 49.99),
(2, 2, 1, 999.99),
(2, 4, 1, 199.99);
-- inner join
SELECT Customers.customer_name, Products.product_name, OrderDetails.quantity, OrderDetails.price
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
INNER JOIN OrderDetails ON Orders.order_id = OrderDetails.order_id
INNER JOIN Products ON OrderDetails.product_id = Products.product_id;
-- Left join 
SELECT Customers.customer_name, Orders.order_id
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;
-- RIGHT JOIN
SELECT Suppliers.supplier_name, Products.product_name
FROM Suppliers
RIGHT JOIN Products ON Suppliers.supplier_id = Products.supplier_id;
-- FULL JOIN
SELECT Customers.customer_name, Orders.order_id
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.customer_name, Orders.order_id
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;
--  Answer Business Questions
-- What is the total revenue generated?
SELECT SUM(total_amount) AS total_revenue FROM Orders;
-- Which customer has made the highest number of orders?
SELECT Customers.customer_name, COUNT(Orders.order_id) AS number_of_orders
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_name
ORDER BY number_of_orders DESC
LIMIT 1;
-- which product was most frequently ordered?
SELECT Products.product_name, SUM(OrderDetails.quantity) AS total_quantity
FROM Products
INNER JOIN OrderDetails ON Products.product_id = OrderDetails.product_id
GROUP BY Products.product_name
ORDER BY total_quantity DESC
LIMIT 1;
-- average order value
SELECT AVG(total_amount) AS average_order_value FROM Orders;

-- Which supplier provides the most expensive product?
SELECT Suppliers.supplier_name, Products.product_name, Products.price
FROM Suppliers
INNER JOIN Products ON Suppliers.supplier_id = Products.supplier_id
ORDER BY Products.price DESC
LIMIT 1;









