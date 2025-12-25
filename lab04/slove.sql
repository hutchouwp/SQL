SELECT * FROM custtbl;
SELECT * FROM emptbl ;
SELECT * FROM orderdetail ;
SELECT * FROM ordertbl ;
SELECT * FROM prodtbl ;
---Aggregate + GROUP BY
--1) จำนวนลูกค้าทั้งหมด
SELECT COUNT(custName) FROM custTbl ;
--2) จำนวนพนักงานทั้งหมด
SELECT COUNT(empName) FROM empTbl ;
--3) ราคาสินค้าสูงสุด ต่ำสุด และ เฉลี่ย
SELECT MIN(prodPrice),MAX(prodPrice),AVG(prodPrice) FROM prodTbl;
--4) จำนวนใบสั่งซื้อทั้งหมด
SELECT COUNT(orderNo) FROM ordertbl ;
--5) จำนวนใบสั่งซื้อของลูกค้าแต่ละคน
SELECT custNo,count(orderNo) FROM orderTbl 
GROUP BY custNo ;
--6) จำนวนใบสั่งซื้อของลูกค้าแต่ละคน (จำนวนแถว)
SELECT prodNo,COUNT(orderQty) FROM orderdetail
GROUP BY prodNo;
--7) จำนวนสินค้าที่ขายไดรวมของแต่ละสินค้า
SELECT prodNo,SUM(orderQty) FROM orderdetail
GROUP BY prodNo;
--8) จำนวนสินค้าเฉลี่ยต่อการสั่งซื้อ (แต่ละสินค้า)
SELECT prodNo,AVG(orderQty) FROM orderdetail
GROUP BY prodNo; 
---HAVING
--9) สินค้าที่ขายได้มากกว่า 5 ชิ้นฃ
SELECT prodNo,SUM(orderQty) FROM orderdetail
GROUP BY prodNo HAVING SUM(orderQty) > 5 ;
--10) ลูกค้าที่มีจำนวนใบสั่งซื้อมากกว่า 2 ครั้ง
SELECT custNo, COUNT(orderNo) FROM orderTbl 
GROUP By custNo HAVING COUNT(orderNo) > 2 ;
--11) 