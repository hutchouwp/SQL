select * from custtbl ;

select * from emptbl ;

select * from orderdetail ;

select * from ordertbl ; 

select * from prodtbl ;

-- Group by
-- 1) จำนวนลูกค้าทั้งหมด
select count(custno) from custtbl ;
-- 2) จำนวนพนักงานทั้งหมด
select count(emp) from emptbl ; 
-- 3) ราคาสินค้าสูงที่สุด ต่ำที่สุด และ ค่าเฉลี่ย
select max(prodprice),min(prodprice),avg(prodprice) from prodtbl ;
-- 4) จำนวนใบสั่งซื้อทั้งหมด
select count(orderno) from ordertbl ;
-- 5) จำนวนใบสั่งซืืื้อของลูกค้าแต่ละคน
select custno,count(custno) from ordertbl group by custNo ; 
-- 6) จำนวนครั้งที่ลูกค้าสั่งซื้อ (จำนวนแถว)
select prodno,count(prodno) from orderdetail group by prodno ;
-- 7) จำนวนสินค้าที่ขายได้รวมของแต่ละสินค้น
select prodno,count(orderqty) from orderdetail group by prodno ;
-- 8) จำนวนสินค้าเฉลี่ยต่อการสั่งซื้อ (แต่ละสินค้า)
select prodno,avg(orderqty) from orderdetail group by prodno ;

-- Having
-- 9) สินค้าที่ขายได้มากกว่า 5 ชิ้น
select prodno,sum(orderqty) from orderdetail group by prodno having sum(orderqty) > 5; 
-- 10) ลูกค้าที่มีใบสั่งซื้อมากกว่า 2 
select custno,count(*) from ordertbl group by custno having count(*) > 2 ;
-- 11) สินค้าทีู่กสั่งซื้อเกิน 3 ครั้ง
select prodno,count(*) from orderdetail group by prodno having count(*) > 3 ;
-- 12) พนักงานที่รับผิิดชอบใบสั่งซื้อมากกว่า 1 
select empno,count(*) from ordertbl group by empno having count(*) > 1 ;
-- 13) ใบสั่งซื้อที่มีจำนวนสินค้ารวมมากกว่า 5 ชิ้น
select orderno,sum(orderqty) from orderdetail group by orderno having sum(orderqty) > 5;
-- 14) จำนวนใบสั่งซื้อในแต่ละเดือน (YYYY-MM)
select orderdate,count(orderdate) from ordertbl group by orderdate;
-- 15) จำนวนลูกค้าไม่ซ้ำในแต่ละเดือน
select count(distinct custno),orderdate from ordertbl group by orderdate ; 
-- 16) จำนวนใบสั่งซื้อแยกตามปี
select extract(year from orderdate),count(*) from ordertbl 
group by extract(year from orderdate);
-- 17) จำนวนใบสั่งซื้อในเดือนตุลาคม 2016
select count(*) from ordertbl where orderdate >= '2016-10-01' and orderdate <= '2016-11-01';
-- 18) เดือนที่มีจำนวนใบสั่งซื้อมากกว่า 2 ใบ
select * from ordertbl ;
select orderdate,count(*) from ordertbl group by orderdate having count(*) > 2 ;
-- 19) ใบสั่งซื้อที่มีจำนวนสินค้ารวมสูงที่สุด
select orderno,sum(orderqty) from orderdetail 
group by orderno order by sum(orderqty) desc limit 1; 
-- 20) สินค้าที่ขายได้รวมมากที่สุด
select * from orderdetail ;
select prodno,sum(orderqty) from orderdetail
group by prodno order by sum(orderqty) desc limit 1 ; 