DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

CREATE TABLE users (
	user_id SERIAL PRIMARY KEY
	, name TEXT NOT NULL
	, email VARCHAR NOT NULL
);

CREATE TABLE products (
	product_id SERIAL PRIMARY KEY
	, name TEXT NOT NULL
	, price FLOAT NOT NULL
);

CREATE TABLE orders (
	order_id SERIAL PRIMARY KEY
	, user_id INTEGER REFERENCES users(user_id)
	, product_id INTEGER REFERENCES products(product_id)	
);

INSERT INTO users (name, email)
VALUES ('user1', 'email1'), ('user2', 'email2'), ('user3', 'email3');

INSERT INTO products (name, price)
VALUES ('product1', 1.00), ('product2', 2.00), ('product3', 3.00);

INSERT INTO orders (user_id, product_id)
VALUES (1,3), (2,2), (3,1);

SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;

-- Get all products for the first order --

SELECT * FROM products
JOIN orders ON products.product_id = orders.order_id
WHERE order_id = 1;

-- Get all orders --

SELECT * FROM orders

-- Get total cost of an order --

SELECT SUM(products.price) FROM orders
JOIN products ON orders.product_id = products.product_id
WHERE products.product_id = 3;

-- Add a foreign key reference from orders to users --

ALTER TABLE orders
ADD COLUMN user_id INTEGER REFERENCES users(user_id);

-- Update the orders table to link a user to each order --

UPDATE orders
SET user_id = 1
WHERE order_id = 3;

-- Get all orders for a user --

SELECT * FROM orders
JOIN users ON orders.user_id = users.user_id
WHERE users.user_id = 2;

-- Get how many order each user has --

SELECT COUNT(*) FROM orders
WHERE orders.user_id = 1