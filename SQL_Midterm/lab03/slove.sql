-- อย่าหาทำ ยากชิบหาย


-- 1) สร้างตาราง Employee ;
create table Employee(
	Employee char(4),
	First_name varchar(20),
	Last_name varchar(25),
	Email varchar(25),
	Phone_number varchar(20),
	Hire_date date,
	Job_id varchar(10)
);
-- 2) เปลี่ยนชื่อตารางเป็น Employees
alter table Employee rename to Employees ;

-- 3) เพิ่มคอลลัมนน์ให้มีคุณสมบัติครบถ้วน
alter table Employees rename column Employee  to employee_id ; 
	-- add primary key
alter table Employees add constraint  pk_employee primary key (employee_id) ;
	-- set not null
alter table Employees alter column first_name set NOT NULL ;
alter table Employees alter column last_name set not null ;
	-- add column 
alter table Employees add salary float ;
alter table Employees add Commission_pct float ; 
alter table Employees add manager_id char(4) ;
alter table Employees add department_id int ; 
alter table Employees add ratehour int ; 
alter table Employees add address varchar(100) ; 
alter table Employees add birthdate date ;
	-- add constraint 
alter table Employees add constraint chk_salary check (salary >= 0 );
alter table Employees add constraint chk_commission check (commission_pct between 0 and 1) ;

-- 4) เพิ่มข้อมูลตัวอย่าง
insert into Employees(employee_id,first_name,last_name,department_id,ratehour,address,birthdate)values 
('1','Natcha','Srikun',1000,1000,'Tasala Muangnear','1975-01-03');

select * from employees ; 