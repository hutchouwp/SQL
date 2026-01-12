
-- Insert provinces
INSERT INTO sales.thai_provinces (province_name) VALUES
('Bangkok'), ('Chiang Mai'), ('Nakhon Pathom');

-- Categories
INSERT INTO production.categories (category_name) VALUES
('กาแฟร้อน'), ('กาแฟเย็น'), ('ชาและเครื่องดื่ม'), ('เบเกอรี่'), ('ของหวาน');

-- Brands
INSERT INTO production.brands (brand_name) VALUES
('House Blend'), ('Single Origin'), ('Signature Bakery');

-- Stores
INSERT INTO sales.stores (store_name, phone, email, street, district, subdistrict, zip_code, province_id) VALUES
('Cafe Delight - Siam Square', '021234567', 'siam@cafedelight.co.th', 'ซอยสยามสแควร์ 3', 'Pathum Wan', 'Lumphini', '10330', 1),
('Cafe Delight - Nimman', '053123456', 'nimman@cafedelight.co.th', 'ถนนนิมมานเหมินท์', 'Mueang Chiang Mai', 'Suthep', '50200', 2),
('Cafe Delight - Riverside', '034254000', 'riverside@cafedelight.co.th', 'ถนนริมแม่น้ำท่าจีน', 'Mueang Nakhon Pathom', 'Sanam Chandra Palace', '73000', 3);

-- Staffs
INSERT INTO sales.staffs (first_name, last_name, email, phone, active, store_id, manager_id) VALUES
('Korn','Wattanachai','korn.siam@cafedelight.co.th','0811111111',1,1,NULL),
('Siriporn','Chaikham','siriporn.siam@cafedelight.co.th','0822222222',1,1,1),
('Niran','Kongsan','niran.nimman@cafedelight.co.th','0833333333',1,2,NULL),
('Pimchan','Boonyong','pimchan.nimman@cafedelight.co.th','0844444444',1,2,3),
('Anan','Phusit','anan.river@cafedelight.co.th','0855555555',1,3,NULL);

-- Customers
INSERT INTO sales.customers (first_name, last_name, phone, email, street, subdistrict, district, zip_code, province_id) VALUES
('Orawan','Chaowalit','0890000001','orawan.cafe@example.com','ซอยสุขุมวิท 50','Lumphini','Pathum Wan','10260',1),
('Natcha','Seekan','0890000002','natcha.cafe@example.com','ถนนท่าศาลา','Si Phum','Mueang Chiang Mai','50000',2),
('Kittipong','Buranapong','0890000003','kittipong.cafe@example.com','ถนนราชดำริ','Lumphini','Pathum Wan','10330',1),
('Ploy','Sukjai','0890000004','ploy.cafe@example.com','ถนนนิมมานเหมินท์ ซ.7','Suthep','Mueang Chiang Mai','50200',2);

-- Products
INSERT INTO production.products (product_name, brand_id, category_id, model_year, list_price) VALUES
('ลาเต้ร้อน (Hot Latte)',1,1,2025,85),
('อเมริกาโน่เย็น (Iced Americano)',1,2,2025,75),
('มัทฉะลาเต้เย็น (Iced Matcha Latte)',2,3,2025,95),
('ครัวซองต์เนยสด (Butter Croissant)',3,4,2025,65),
('บราวนี่ช็อกโกแลต (Chocolate Brownie)',3,5,2025,70),
('ชีสเค้กสตรอว์เบอร์รี (Strawberry Cheesecake)',3,5,2025,120);

-- Stock
INSERT INTO production.stocks (store_id, product_id, quantity) VALUES
(1,1,50),(1,2,60),(1,4,40),(1,5,35),
(2,1,30),(2,3,45),(2,4,25),
(3,2,30),(3,3,30),(3,6,20);

-- Orders
INSERT INTO sales.orders (customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id) VALUES
(1,4,'2025-01-10','2025-01-10','2025-01-10',1,2),
(2,4,'2025-01-12','2025-01-12','2025-01-12',2,4),
(3,2,'2025-01-15','2025-01-15',NULL,1,1),
(4,4,'2025-01-18','2025-01-18','2025-01-18',3,5);

-- Order Items
INSERT INTO sales.order_items (order_id, item_id, product_id, quantity, list_price, discount) VALUES
(1,1,1,1,85,0),
(1,2,4,1,65,0),
(2,1,3,1,95,0.05),
(2,2,6,1,120,0.10),
(3,1,2,2,75,0),
(4,1,2,1,75,0),
(4,2,5,1,70,0);