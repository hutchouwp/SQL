-- 1 แสดงผลรวมจำนวนสินค้า ที่ขายได้แต่ละเดือน เฉพราะเดือนที่ขายได้มากกว่า 8 ชิ้น
select 
	date_trunc('month',o.orderdate) :: date as month_start,
	sum(od.orderqty) as total_qty 
from ordertbl o 
join orderdetail od on od.orderno = o.orderno
group by month_start 
having sum(od.orderqty) > 8
order by month_start ;
-- 2 แสดงยอดขายรวม ในแต่ละเดือน เฉพาะเดือนที่ยอดขายมากกว่า 20,000 บาท
select 
	date_trunc('month',o.orderdate) :: date as month_start,
	sum(od.orderqty * p.prodprice) as total_sales
from ordertbl O 
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by month_start
having sum(od.orderqty * prodprice) > 20000
order by month_start ;
-- 3 แสดงสินค้า (prodno,prodname) ที่มียอดขายมากกว่า 10000 บาท และจำนวนมากกว่า 2 ชิ้น
select
	p.prodno , p.prodname , sum(od.orderqty) as total_qty,
	sum(od.orderqty * p.prodprice) as total_sales
from orderdetail od
join prodtbl p on p.prodno = od.prodno 
join ordertbl o on o.orderno = od.orderno
group by p.prodno , p.prodname 
having sum(od.orderqty * p.prodprice) > 10000
and sum(od.orderqty) > 2 
order by total_sales desc ;
-- 4 แสดงใบเสร็จเดือน october 2016 ที่มียอดขายรวมมมากกว่า 15000 บาท พร้อมชื่อลูกค้า และ ชื่อพนักงาน
select 
    o.orderno,
    to_char(o.orderdate,'FMMonth YYYY') as order_month,
    c.custname,
    e.empname,
    sum(od.orderqty * p.prodprice) as order_total
from ordertbl o 
join custtbl c on c.custno = o.custno 
left join emptbl e on e.empno = o.empno
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by o.orderno , order_month , c.custname, e.empname
having to_char(o.orderdate,'FMMonth YYYY') = 'October 2016'
   and sum(od.orderqty * p.prodprice) > 15000
order by order_total desc;
-- 5 แสดงข้อมูลระดับบรรทัดการสั่งซื้อ (orderNo, custName, empName, prodNo, prodName) 
-- คำนวณยอดบรรทัด = (ราคาต่อหน่วย * SUM(qty ของสินค้านั้นในใบเสร็จ)) 
select 
	o.orderno,
	c.custname,
	e.empname,
	p.prodno,
	p,prodname,
	sum(od.orderqty) as total_qty_in_order,
	(p.prodprice * sum(od.orderqty)) as line_total
from ordertbl o
join custtbl c on c.custno = o.custno
left join emptbl e on e.empno = o.empno
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by o.orderno,c.custname,e.empname,p.prodno,p.prodname,p.prodprice
having (p.prodprice * sum(od.orderqty)) > 10000
order by line_total desc ;
-- 6 แสดงลูกค้าที่มียอดซื้อรวมมากกว่า 20000 บาท และมีจำนวนใบเสร็จอย่างน้อย 2 ใบ
select 
	c.custno,
	c.custname,
	count(distinct o.orderno) as order_count,
	sum(od.orderqty * p.prodprice) as total_sales
from custtbl c 
join ordertbl o on o.custno = c.custno
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by c.custno , c.custname
having sum(od.orderqty * p.prodprice) > 20000
	and count(distinct o.orderno) >= 2 
order by total_sales desc ;
-- 7 แสดงใบเสร็จที่ซื้อสินค้า P18000 รวมมากกว่า 2 ชิ้น (orderno และจำนวนซื้อ)
select 
	o.orderno,
	p.prodno,
	p.prodname,	
	sum(od.orderqty) as qty_p18000
from ordertbl o 
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by o.orderno , p.prodno , p.prodname
having p.prodno = 'P18000'
	and sum(od.orderqty) > 2
order by qty_p18000 desc ;
-- 8 แสดงพนักงานที่มียอดขายรวมมากกว่า 15000 บาท และจำนวนใบเสร็จอย่างน้อย 2 ใบ
-- ไม่นับ(order ที่ empno เป็น null)
select 
	e.empno,
	e.empname,
	count(distinct o.orderno) as order_count,
	sum(od.orderqty * p.prodprice) as total_sales
from emptbl e 
join ordertbl o on o.empno = e.empno
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by e.empno , e.empname
having sum(od.orderqty * p.prodprice) > 15000
	and count(distinct o.orderno) >= 2
order by total_sales desc ;
-- 9 แสดงลูกค้าที้่ซื้อสินค้าต่างชนิดอย่างน้อย 3 รายการ(count distinct prodno) พร้อมจำนวนสินค้า
-- และยอดซื้อรวม
select 
	c.custno,
	c.custname,
	count(distinct od.prodno) as distinct_products,
	sum(od.orderqty * p.prodprice) as total_sales
from custtbl c 
join ordertbl o on o.custno = c.custno
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno 
group by c.custno , c.custname
having count(distinct od.prodno) >= 3
order by distinct_products desc , total_sales desc ;
-- 10 แสดงสินค้าที่ถูกซื้อโดยลูกค้าอย่างน้อย 2 คน และมีจำนวนขายรวมมากกว่า 3 ชิ้น
SELECT 
  p.prodNo, 
  p.prodName, 
  COUNT(DISTINCT o.custNo) AS customer_count, 
  SUM(od.orderQty) AS total_qty 
FROM prodTbl p 
JOIN orderDetail od ON od.prodNo = p.prodNo 
JOIN orderTbl o ON o.orderNo = od.orderNo 
GROUP BY p.prodNo, p.prodName 
HAVING COUNT(DISTINCT o.custNo) >= 2 
   AND SUM(od.orderQty) > 3 
ORDER BY customer_count DESC, total_qty DESC; 
-- 11 แสดงเดือนที่มีจำนวนใบเสร็จมากกว่า 1 ใบ และยอดขายรวมมากกว่า 10000 บาท
select 
	date_trunc('month',o.orderdate) :: date as month_start,
	count(distinct o.orderno) as order_count,
	sum(od.orderqty * p.prodprice) as total_sales
from ordertbl o 
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by month_start
having count(distinct o.orderno) > 1 
	and sum(od.orderqty * p.prodprice) > 10000
order by month_start ;
-- 12 แสดงลูกค้าที่มียอดเฉลี่ยต่อบรรทัดรายการสินค้า (avg(price*qty)) มากกว่า 3000 บาท
select 
	c.custno ,
	c.custname ,
	avg(od.orderqty * prodprice) as avg_line_total
from custtbl c
join ordertbl o on  o.custno = c.custno
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by c.custno , c.custname
having avg(od.orderqty * p.prodprice) > 3000
order by avg_line_total desc ;
-- 13 แสดงพนักงานที่มีอัตราคอมมิชชัน >= 0.02 และมียอดสินค้ารวมมากกว่า 10000 บาท
select 
	e.empno,
	e.empname,
	e.empcommrate,
	sum(od.orderqty * p.prodprice) as total_sales
from emptbl e 
join ordertbl o on o.empno = e.empno
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by e.empno,e.empname,e.empcommrate
having e.empcommrate >= 0.02
	and sum(od.orderqty * p.prodprice) > 10000
order by total_sales desc ;
-- 14 แสดงลูกค้าในเดือน October 2016 ที่มียอดซื้อรวมมากกว่า 12000 บาท (แสดง custname,เดือน,ยอดรวม)
select 
	c.custno,
	c.custname,
	to_char(o.orderdate,'FMMonth YYYY') as order_month,
	sum(od.orderqty * p.prodprice) as total_sales
from custtbl c
join ordertbl o on o.custno = c.custno
join orderdetail od on od.orderno = o.orderno
join prodtbl p on p.prodno = od.prodno
group by c.custno,c.custname,order_month
having to_char(o.orderdate,'FMMonth YYYY') = 'October 2016'
	and sum(od.orderqty * p.prodprice) > 12000
order by total_sales desc ;
-- 15 แสดงสินค้าในเดือน June 2016 ที่มีจำนวนขายรวมมากกว่า 4 ชิ้น(แสดง prodno,prodname,total_qty)
select 
	p.prodno,
	p.prodname,
	to_char(o.orderdate,'YYYY-MMM') as ym,
	sum(od.orderqty) as total_qty
from prodtbl p 
join orderdetail od on od.prodno = p.prodno
join ordertbl o on o.orderno = od.orderno
where to_char(o.orderdate,'YYYY-MM') = '2016-06'
group by p.prodno,p.prodname, ym
having sum(od.orderqty) > 4
order by total_qty desc ;
