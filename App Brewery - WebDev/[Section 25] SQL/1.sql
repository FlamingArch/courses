-- CRUD = Create, Read, Update, Destroy

-- C : Create 
CREATE TABLE products (
    id INT NOT NULL,
    name STRING,
    price MONEY,
    PRIMARY KEY (id)
)

INSERT INTO products VALUES (1, 'Pen', 1.20)

INSERT INTO products (id, name) VALUES (2, 'Pencil')

-- INSERT INTO products (name, price) VALUES ('Rubber', 1.30)
-- -- NOT NULL Constraints failed: products.id

-- R : Read 
SELECT * from products

SELECT name, price FROM products 

SELECT * from products where id = 1

-- U : Updatew

-- Dangerous, would update all values to 0.8
-- update products
-- set price = 0.8

UPDATE products
SET price = 0.8
WHERE id = 2

ALTER TABLE products 
ADD stock INT

-- Challenge
UPDATE products
SET stock = 32
WHERE id = 1
UPDATE products
SET stock = 12
WHERE id = 2

-- D : Delete
-- Dangerous, would delete entire table
-- DELETE FROM products

DELETE FROM products
WHERE id = 2

-- Creating relationships using Foreign Keys
CREATE TABLE orders (
    id INT NOT NULL,
    order_number INT,
    customer_id INT,
    product_id INT,
    PRIMARY KEY (id)
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    FOREIGN KEY (product_id) REFERENCES products(id)
)

INSERT INTO orders
VALUES (1, 4362, 2, 1)

-- Join values
SELECT orders.order_number, products.name, products.price, products.stock
FROM orders
INNER JOIN products ON orders.product_id = products.id

SELECT 