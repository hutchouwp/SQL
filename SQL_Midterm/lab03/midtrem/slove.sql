-- 1) สร้างตาราง employee 
create table Employee (
	employee_id char(4) primary key,
	first_name varchar(20) not null,
	last_name varchar(25) not null,
	email varchar(25),
	phont_number varchar(20),
	hire_date date,
	job_id varchar(10),
	salary float,
	commission_pct char(4),
	department_id integer,
	ratehour int,
	address varchar(100),
	birthdate date
);
-- 2) เปลี่ยนชื่อตารางเป็น employees
alter table Employee rename to Employees ;
-- 3) เพ่ิมคุณสมบัติ
alter table Employees add constraint chk_salary check (salary >= 0 ) ;
-- 4) เพิ่มข้อมูล
insert into Employees(employee_id,first_name,last_name,department_id,ratehour,address,birthdate)
values('1','Nathca','Srikun',1000,1000,'Tasala Muangnear','1975-01-03'),
('3','Panita','Narak',1000,1500,'Samoon Maunglai','1974-01-06'),
('4','Auschara','Bunhouy',1000,2500,'Suksai	Samsorn','1972-01-01'),
('5','Natee','Deeharm',1000,1500,'Silpakorn Tappitak','1979-05-01'),
('6','SomSkul','Deeharm',1000,1000,'Tasala Muangnear','1985-01-01'),
('7','Pethan','Deeharm',1000,1000,'Samsoon Muangthai','1980-07-01'),
('8','Aumnath','Khangkrang',1000,3000,'Tasung Muangtong','1977-06-01');
-- 5) เปลี่ยนชนิดข้อมูล department_id จาก int เป็น char
alter table Employees alter column department_id type char(4) ;
-- 6) แก้ไขค่า Department_id ตามเงื่อนไข
	-- employ_id 1,3,4 -> department_id = '4'
	-- employ_id 5,6,7,8 -> department_id = '2'
update Employees set department_id = '4' where employee_id in ('1','3','4') ; 
update Employees set department_id = '2' where employee_id in ('5','6','7','8') ;
-- 7) ลบคนชื่อ Aumnath
delete from Employees where first_name = 'Aumnath';
-- 8) แสดงพนักงานที่อยู่ตำบล Tasala Muangthai
select * from Employees where
address like '%Tasala Mauangthai%' ;


--ลบ constraint: 
--	ALTER TABLE dept DROP CONSTRAINT dept_unique 
--	RESTRICT; 
--	ALTER TABLE dept DROP CONSTRAINT dept_unique 
--	CASCADE;
select employee_id,first_name,last_name,department_id,ratehour,address,birthdate from Employees ;
