-- 1 แสดงมูลลูกค้าทั้งหมดจาก sales.customers
SELECT * FROM sales.customers ;
-- 2 แสดงชื่อและนามสกุลพนักงานจาก sales.staffs
SELECT first_name,last_name FROM sales.staffs;
-- 3  ค้นหาสินค้าที่มีราคาเกิน 80 บาท
SELECT product_name,list_price FROM production.products WHERE list_price > 80 ;
-- 4  แสดงร้านสาขาที่ province_id = 1
SELECT store_name,province_id FROM sales.stores WHERE province_id = 1 ;
-- 5 แสดงรายการออเดอร์ทั้งหมดเรียงจาก order_id น้อยไปมาก
SELECT * FROM sales.orders ORDER BY order_id ASC ;
-- 6 แสดงข้อมูลลูกค้าที่อยู่ในอำเภอ Pathum Wan
SELECT * FROM sales.customers WHERE district = 'Pathum Wan' ;
-- 7 ค้นหาพนักงานที่ active = 1
SELECT first_name,last_name,active  FROM sales.staffs WHERE active = 1 ;
-- 8 ค้นหาสินค้าที่มีราคาอยู่ระหวาง 70–100 บาท 
SELECT product_name,list_price FROM production.products WHERE list_price BETWEEN 70 AND 100 ; 
-- 9 ค้นหาลูกค้าที่ province_id เท่ากับ 1 หรือ 2
SELECT first_name,last_name,province_id FROM sales.customers WHERE province_id IN (1,2);
-- 10 ค้นหาพนักงานที่อีเมลลงท้ายด้วย @cafedelight.co.th
SELECT first_name,last_name,email FROM sales.staffs WHERE email LIKE '%@cafedelight.co.th'; 
-- 11 ค้นหาลูกค้าที่ province_id = 1 และ zip_code ขึ้นต้นด้วย 10
SELECT first_name,last_name,province_id,zip_code FROM sales.customers 
WHERE province_id = 1 AND zip_code LIKE '10%';
-- 12 ค้นหาสินค้าประเภทเบเกอรี่ (category_id = 4) ที่ราคาน้อยกว่า 70 บาท
SELECT product_name,category_id,list_price FROM production.products WHERE category_id = 4 AND list_price < 70 ;
-- 13 ค้นหาร้านสาขาที่ชื่อมีคำว่า Nimman
SELECT store_name FROM sales.stores WHERE store_name LIKE '%Nimman%' ; 
-- 14 ค้นหาพนักงานที่เบอร์โทรขึ้นต้นด้วย 08 
SELECT first_name,last_name,phone FROM sales.staffs WHERE phone LIKE '08%' ;
-- 15 ค้นหาออเดอร์ที่ order_status = 4 ในช่วงปี 2025  (ไม่ใช้ฟังก์ชันวันที่)
SELECT customer_id,order_status,order_date FROM sales.orders 
WHERE order_status = 4 AND order_date >= '2025-01-01' AND order_date <= '2025-12-31';
-- 16 ค้นหาสินค้าที่ชื่อมีคำว่า ลาเต้ หรือ Latte
SELECT product_name FROM production.products 
WHERE product_name LIKE '%ลาเต้%' OR product_name Like '%Latte%';
-- 17 ค้นหาลูกค้าที่อยู่ในตำบล Suthep
SELECT first_name,last_name,district FROM sales.customers 
WHERE subdistrict = 'Suthep' ;
-- 18 แสดงมูลค่าสินค้าเรียงตามราคาจากมากไปน้อย
SELECT product_name,list_price FROM production.products 
ORDER BY list_price DESC ;
-- 19 ค้นหาสินค้าที่ราคาไม่เท่ากับ 85 บาท
SELECT product_name,list_price FROM production.products WHERE list_price <> 85 ; 
-- 20 ค้นหาลูกค้าที่ province_id ไม่ใช่ 1, 2 และ 3
SELECT first_name,last_name,province_id FROM sales.customers WHERE province_id NOT IN(1,2,3);
-- 21 ค้นหาสินค้าที่มีราคาอยู่ระหว่าง 60–100 บาท 
SELECT product_name,list_price FROM production.products WHERE list_price BETWEEN 60 AND 100 ;
-- 22 ค้นหาออเดอรที่อยู่ระหว่างวันที่ 2025-01-10 ถึง 2025-01-20 
SELECT customer_id,order_date FROM sales.orders WHERE order_date BETWEEN '2025-01-10' AND '2025-01-20' ;
-- 23 ค้นหาสินค้าที่ราคาแพงที่สุด (แสดงเฉพาะ 1 รายการ)
SELECT product_name,list_price FROM production.products ORDER BY list_price DESC LIMIT 1 ;