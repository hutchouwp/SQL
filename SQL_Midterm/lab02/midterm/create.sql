
-- CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS production;
CREATE SCHEMA IF NOT EXISTS sales;

-- Provinces reference table
CREATE TABLE IF NOT EXISTS sales.thai_provinces (
    province_id SERIAL PRIMARY KEY,
    province_name VARCHAR(100) NOT NULL UNIQUE
);

-- Categories
CREATE TABLE IF NOT EXISTS production.categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Brands
CREATE TABLE IF NOT EXISTS production.brands (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

-- Products (Menu)
CREATE TABLE IF NOT EXISTS production.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES production.brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES production.categories(category_id)
);

-- Stores
CREATE TABLE IF NOT EXISTS sales.stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    email VARCHAR(255),
    street VARCHAR(255),
    district VARCHAR(255),
    subdistrict VARCHAR(255),
    zip_code VARCHAR(10),
    province_id INT,
    FOREIGN KEY (province_id) REFERENCES sales.thai_provinces(province_id)
);

-- Staffs
CREATE TABLE IF NOT EXISTS sales.staffs (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(25),
    active SMALLINT NOT NULL,
    store_id INT NOT NULL,
    manager_id INT,
    FOREIGN KEY (store_id) REFERENCES sales.stores(store_id),
    FOREIGN KEY (manager_id) REFERENCES sales.staffs(staff_id)
);

-- Customers (Thailand format)
CREATE TABLE IF NOT EXISTS sales.customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    email VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    subdistrict VARCHAR(100),
    district VARCHAR(100),
    zip_code VARCHAR(10),
    province_id INT,
    FOREIGN KEY (province_id) REFERENCES sales.thai_provinces(province_id)
);

-- Orders
CREATE TABLE IF NOT EXISTS sales.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_status SMALLINT NOT NULL,
    order_date DATE NOT NULL,
    required_date DATE NOT NULL,
    shipped_date DATE,
    store_id INT NOT NULL,
    staff_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES sales.stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES sales.staffs(staff_id)
);

-- Order Items
CREATE TABLE IF NOT EXISTS sales.order_items (
    order_id INT,
    item_id INT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    list_price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(4, 2) NOT NULL DEFAULT 0,
    PRIMARY KEY(order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES sales.orders(order_id),
    FOREIGN KEY (product_id) REFERENCES production.products(product_id)
);

-- Stock
CREATE TABLE IF NOT EXISTS production.stocks (
    store_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY(store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES sales.stores(store_id),
    FOREIGN KEY (product_id) REFERENCES production.products(product_id)
);

