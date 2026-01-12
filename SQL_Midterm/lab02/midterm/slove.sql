-- production ; 
select * from production.brands ; 
select * from production.categories ;
select * from production.products ;
select * from production.stocks ;  
-- sales ;
select * from sales.order_items ; 
select * from sales.customers ;
select * from sales.orders ; 
select * from sales.staffs ;
select * from sales.stores ; 
select * from sales.thai_provinces ; 
	
-- 1) แสดงข้อมูลลูกค้าทั้งหมดจาก sales.customers 
select * from sales.customers ;
-- 2) แสดงชื่อและนามสกุลพนักงานจาก sales.staffs 
select first_name,last_name from sales.staffs ;
-- 3) ค้นหาสินค้าที่มีราคาเกิน 80 บาท
select product_name,list_price from production.products where list_price > 80 ;
-- 4) แสดงร้านสาขาที่ province_id = 1 ;
select * from sales.thai_provinces where province_id = 1 ;
-- 5) แสดงรายการออเดอร์ทั้งหมดเรียงจาก order_id น้อยไปมาก
select * from sales.orders order by order_id asc ; 
-- 6) แสดงข้อมูลลูกค้าที่อยู๋ในอำเภอ Pathun wan
select * from sales.customers where district = 'Pathum Wan'  ; 
-- 7) ค้นหาพนักงานที่ active = 1 
select * from sales.staffs where active = 1 ; 
-- 8) ค้นหาสินค้าที่มีราคาอยู่ระหว่าง 70 - 100 บาท 
	-- select * from production.products where list_price >= 70 and list_price <= 120;
select * from production.products where list_price between 70 and 120 ; 
-- 9) ค้นหาลูกค้าที่ province_id เท่ากับ 1 หรือ 2 
select * from sales.customers where province_id = 1 or province_id = 2 ;
	-- select * from sales.customers where province_id in (1,2) ;
-- 10) ค้นหาพนักงานที่อีเมลลงท้ายด้วย @cafedelight.co.th 
select * from sales.staffs where email like '%@cafedelight.co.th' ;
-- 11) ค้นหาลูกค้าที่ province_id = 1 และ zip_code ขึ้นต้นด้วย 10
select * from sales.customers where province_id = 1 and zip_code like '10%';
-- 12) ค้นหาสินค้าประเภทเบเกอรี่(category_id = 4)ที่ราคาน้อยกว่า 70 บาท
select * from production.products where category_id = 4 and list_price < 70 ;
-- 13) ค้นหาร้านสาขาที่ชื่อมีคำว่า Nimman
select * from sales.stores where store_name like '%Nimman%' ; 
-- 14) ค้นหาพนักงานที่เบอร์โทรขึ้นต้นด้วย 08
select * from sales.staffs where phone like '08%' ; 
-- 15) ค้นหาออเดอร์ที่ order_status = 4 ในช่วงปี 2025 (ไม่ใช้ฟังก์ชั่นวันที่)
select * from sales.orders where order_status = 4 and order_date >= '2025-01-01' 
and order_date <= '2026-01-01' ;
-- 16) ค้นหาสินค้าที่ชื่อมีคำว่า ลาเต้ หรือ Latte
select * from production.products where product_name like '%ลาเต้%' or product_name like '%Latte%' ;
-- 17) ค้นหาลูกค้าที่อยู่ในตำบล Suthep
select * from sales.customers where subdistrict like '%Suthep%' ; 
-- 18) แสดงมูลสินค้าเรียงตามราคาจากมากไปน้อย
select * from production.products order by list_price desc ;
-- 19) ค้นหาสินค้าที่ราคาไม่เท่ากับ 85 บาท
select * from production.products where list_price != 85 ; 
	-- where list_price <> 85
-- 20) ค้นหาลูกค้าที่ province_id ไม่ใช่ 1,2 และ 3
select * from sales.customers where province_id not in(1,2,3) ;
-- 21) ค้นหาสินค้าที่มีราคาอยู๋ระหว่าง 60-100 บาท
select * from production.products where list_price between 60 and 100 ;
-- 22) ค้นหาออเดอร์ที่อยู่ระหว่างวันที่ 2025-01-10 ถึง 2025-01-20
select * from sales.orders where order_date >= '2025-01-10' and order_date <= '2025-01-20' ; 
-- 23) ค้นหาสินค้าที่ราคาแพงที่สุด (แสดงเฉพาะ 1 รายการ)
select * from production.products order by list_price desc limit 1; 