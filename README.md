# 🛒 Store Management System Database
## 📌 Overview
**The Store Management System Database** is designed to manage an online store's users, products, categories, shopping cart, orders, and reviews efficiently. This relational database provides a structured and scalable approach to handling e-commerce operations, from product management to customer transactions.

## 🏗 Features
- **User Management:** Store user details, including authentication and role-based access (Admin & Client).

- **Product & Category Management:** Organize products into categories with pricing and stock control.

- **Shopping Cart:** Allow users to add products to their cart before checkout.

- **Order Management:** Track customer orders with statuses (Shipped, Processing, Canceled).

- **Order Details:** Maintain purchase history with order date, quantity, and price at the time of purchase.

- **Reviews & Ratings:** Allow customers to leave reviews and rate products.

## 🗂 Database Schema
The database consists of the following tables:

### 1️⃣ Users Table
Stores user information, including name, email, password, address, and role (Admin or Client).

### 2️⃣ Categories Table
Contains different product categories such as Electronics, Clothing, Books, etc.

### 3️⃣ Products Table
Stores product details, including name, price, quantity, and category association.

### 4️⃣ Shopping Cart Table
Handles temporary product selections before checkout.

### 5️⃣ User Orders Table
Tracks customer orders and their statuses (Shipped, Processing, Canceled).

### 6️⃣ Order Details Table
Records specific details of an order, including purchase price and quantity.

### 7️⃣ Reviews Table
Allows users to leave ratings (1-5 stars) and comments on purchased products.

## 🔧 Technologies Used
- **Database Management System:** MySQL.

- **Query Language:** SQL.

- **Data Integrity:** Constraints (Primary Keys, Foreign Keys, CHECK, UNIQUE).

## 📜 Installation & Setup
1. Clone the repository:
```bash
git clone https://github.com/your-username/store-management-system.git

```

2. Open MySQL and create the database:
```sql
CREATE DATABASE store_management_system;
USE store_management_system;
```

3. Run the provided SQL script to create tables and insert sample data.

4. Connect the database to your backend system (Django, Flask, etc.).
