# 🛒 Supermarket Database Project (`supermarketSql`)

This project contains a collection of SQL scripts designed to build and manage a **Supermarket Management System** database.  
It aims to simplify the process of tracking and managing essential data such as **products**, **sales transactions**, **inventory**, **employees**, and **customers**.

---

## 🚀 Key Features

- **Product Management:** Store product details including name, price, and category.  
- **Sales Tracking:** Record each sales transaction, including items sold and total amounts.  
- **Inventory Control:** Monitor current stock levels and support triggers for low-stock alerts.  
- **Sales Reports:** Includes example scripts for daily or monthly reports such as total sales and best-selling products.  

---

## 🛠️ Technologies Used

- **Language:** SQL (Structured Query Language)  
- **Database Management System (DBMS):** PostgreSQL  

---

## 📖 How to Use

### 1. Prerequisites

Make sure you have the following installed:
- **PostgreSQL Server** (or another compatible DBMS)
- A database management tool such as **DBeaver** or **pgAdmin**

### 2. Clone the Repository

```bash
git clone https://github.com/Ihzaanandar/supermarketSql.git
cd supermarketSql
```

### 3. Set Up the Database

Open your database client and run the following commands in order:

```sql
-- Create a new database
CREATE DATABASE supermarket_db;
\c supermarket_db;  -- Connect to the newly created database

-- Create tables and schema
\i schema/create_tables.sql;

-- (Optional) Insert sample data
\i data/insert_sample_data.sql;
```

### 4. Run Example Queries

You can find useful queries for testing and reporting in the `queries/` folder, for example:

```sql
\i queries/report_best_selling_items.sql;
```

---

## 👥 Contributors

This project is created and maintained by:  
**[Ihza Anandar](https://github.com/Ihzaanandar)**  

Contributions and suggestions are always welcome.  
Feel free to open a *pull request* or *issue* to improve the project.

---

## 📜 License

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute this project with proper credit.
