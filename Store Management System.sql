DROP DATABASE store_managment_system;
CREATE database store_managment_system;
use store_managment_system;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    pass_word VARCHAR(20) NOT NULL,
    address VARCHAR(100),
    user_type VARCHAR(10) CHECK (user_type IN ('admin', 'client')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(20)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(20) NOT NULL UNIQUE, 
    price FLOAT NOT NULL,
    quantity INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

CREATE TABLE shoping_cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    user_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

CREATE TABLE user_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    order_status VARCHAR(50) NOT NULL CHECK (order_status IN ('Shipped', 'Processing', 'Canceled')),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE SET NULL
);

CREATE TABLE orders_details (
    order_details_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date TIMESTAMP,
    product_id INT,
    quantity INT,
    price_on_purchase FLOAT,
    FOREIGN KEY (order_id) REFERENCES user_orders(order_id) ON DELETE SET NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE SET NULL
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    rating INT CHECK(rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE SET NULL
);


INSERT INTO categories(category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Toys');

INSERT INTO users(user_id, first_name, last_name, email, pass_word, address, user_type, created_at) 
VALUES 
(1, 'Shahda', 'Mohamed', 'shahda@mail.com', 'sghjja2215', 'Benha', 'client', NOW()),
(2, 'Amina', 'Adel', 'amina123@gmail.com', '321anima', 'Cairo', 'client', NOW()),
(3, 'Kareem', 'Ryad', 'kareem.ryad@gmail.com', '9875ryad', 'Obour', 'client', NOW());

INSERT INTO products (product_id, product_name, price, quantity, category_id)
VALUES
(1, 'Smartphone', 69999.99, 50, 1),
(2, 'Laptop', 77550, 30, 1),
(3, 'T-shirt', 599.99, 200, 2),
(4, 'Cookbook', 150.0, 20, 4),
(5, 'Action figure', 30.99, 100, 5),
(6, 'Blender', 1999.99, 25, 3);

INSERT INTO user_orders(order_id, user_id, product_id, order_status, order_date) 
VALUES
(1, 1, 1, 'Shipped', NOW()),
(2, 1, 3, 'Processing', NOW()),
(3, 2, 2, 'Shipped', NOW()), 
(4, 3, 5, 'Canceled', NOW()),
(5, 2, 6, 'Shipped', NOW());

INSERT INTO orders_details (order_details_id, order_id, order_date, product_id, quantity, price_on_purchase) 
VALUES
(1, 1, NOW(), 1, 1, 69999.99),
(2, 2, NOW(), 3, 2, 599.99), 
(3, 3, NOW(), 2, 1, 77550),
(4, 4, NOW(), 5, 1, 30.99),
(5, 5, NOW(), 6, 1, 1999.99);

