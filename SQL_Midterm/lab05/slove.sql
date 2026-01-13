drop table if exists employees ;

create table employees(
	empNo varchar(10) primary key,
	firstName varchar(10) not null,
	lastName varchar(10) not null,
	email varchar(100),
	empAddr varchar(50),
	salary numeric(10,2)
);

insert into employees(empno,firstname,lastname,email,empaddr,salary) values
('AA01122','Daniel','Santos','daniel@gmail.com','Denver',35000),
('AA02233','Linda','Jankins','linda@gmail.com','Seattle',42000),
('BB03344','Peter','Wood','peter@gmail.com','Oxford',28000),
('CC05566','Robert','Stone','robert@gmail.com','Norwood',39000),
('AA06677','Helen','Clark','helen@gmail.com','Brentwood',31000);

-- 1) แสดงรายการข้อมูลพนักงานที่ใช้ Gmail เรียงลำดับจากมากไปน้อย (Z -> A)
	-- แสดงชื่อพนักงานเป็นอักษรใหญ๋ ตั้งชื่อคอลลัมว่า empName 
select upper(firstname),email as empname from employees order by email desc;
-- 2) แสดงหมายเลขประจำตัวพนักงาน โดยตัดอักขระ 2 ตัวแรกออกไปก่อน เช่น 01122,02233
	-- ตั้งชื่อคอลลัมว่า empNo
select substring(empno,3,length(empno)) as empNo from employees ;
-- 3) แสดงชื่อพนักงาน และจำนวนอักษขระของชื่อพนักงาน
	-- ตั้งชื่อคอลลัมว่า Name_Length
select firstname ,length(firstname) as Name_length from employees ; 
-- 4) แสดงรายการข้อมูลพนักงานแผนก AA (รหัสพนักงานขึ้นต้นด้วย AAxxxxx) โดยเรียงลำดับรหัสพนักงานจากน้อยไปมาก
select empno from employees where empno like 'AA%' order by empno asc ; 
-- 5) แสดงรายชื่เมือง (empAddr) ที่แตกต่างกัน (ไม่ซ้ำ) โดยแสดงตัวอักษร 3 ตัวสุดท้ายของชื่อเมือง
select substring(empaddr,length(empaddr) - 2) from employees ; 
-- 6) แสดงชื่อเมือง 3 ตัวอักษร และ ชื่อ พนักงาน 3 ตัวอักษร โดยมี '-' คั่นกลาง
	-- ตั้งชื่อคอลลัมว่า City_Name เรียงลำดับชื่อเมืองจากมากไปน้อย หากชื่อเมืองเท่ากันให้เรียงชื่อพนักงานจากน้อยไปมาก
select concat(substring(empaddr,1,3),'-',substring(firstname,1,3)) as City_Name,
empaddr,firstname from employees order by empaddr desc,firstname asc; 
-- 7) แสดงหมายเลขพนักงาน และหมายเลขพนักงานที่มี '-' คั่นระหว่างแผนกและเลขลำดับ
select empno,concat(substring(empno,1,2),'-',substring(empno,2,length(empno))) from employees ; 
-- 8) แสดงนามสกุลพนักงานทั้งหมด โดยต้องไม่มีนามสกุลซ้ำ
	-- ตั้งชื่อคอลลัม Last_name เรียงลำดับ A -> Z 
select distinct lastname from employees order by lastname asc ;
-- 9) แสดงหมายเลขพนักงาน ชื่อพนักงาน เงินเดือนพนักงาน(บาท) และเงินเดือนพนักงาน (K)
select concat(firstname,' ',lastname) as fullname , salary , 
round(salary / 1000.0,2) as salary_K from employees ; 
-- 10) แสดงค่าเงินเดือนเฉลี่ยของพนักงานทั้งหมด
select avg(salary) from employees ; 
-- 11) แสดงจำนวนพนักงานทั้งหมดในตาราง
select count(empno) from employees ; 