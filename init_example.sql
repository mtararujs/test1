-- Create tables
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price NUMERIC(10, 2)
);

CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Populate tables with sample data

-- Customers
INSERT INTO customers (name, email) VALUES
    ('John Doe', 'john.doe@example.com'),
    ('Jane Smith', 'jane.smith@example.com'),
    ('Alice Johnson', 'alice.johnson@example.com'),
    ('Bob Brown', 'bob.brown@example.com');

-- Products
INSERT INTO products (name, price) VALUES
    ('Product A', 10.00),
    ('Product B', 20.00),
    ('Product C', 15.00),
    ('Product D', 25.00),
    ('Product E', 30.00);

-- Orders
INSERT INTO orders (customer_id, product_id, quantity) VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 3),
    (3, 4, 1),
    (4, 5, 2),
    (3, 1, 1),
    (2, 4, 2),
    (1, 5, 1),
    (4, 3, 3),
    (3, 2, 2),
    (2, 1, 1),
    (1, 3, 2);

-- Add more sample orders
DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO orders (customer_id, product_id, quantity)
        VALUES (1, 1, 1);
    END LOOP;
END $$;

DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO orders (customer_id, product_id, quantity)
        VALUES (2, 2, 1);
    END LOOP;
END $$;

DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO orders (customer_id, product_id, quantity)
        VALUES (3, 3, 1);
    END LOOP;
END $$;

DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO orders (customer_id, product_id, quantity)
        VALUES (4, 4, 1);
    END LOOP;
END $$;
