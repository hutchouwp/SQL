create table account(
	account_id serial primary key,
	name varchar(50),
	balance numeric(12,2) not null
);

-- 1 สร้าง user a , b ให้สิท insert update delete
create user A ;
create user B ;

grant insert, update ,delete on table account to A ; 
grant insert, update ,delete on table account to B ; 

alter user a with password '12345678' ;
-- 2 สลับไป user A แล้ว insert
---- psql tool   lab09-# \c lab09 a
insert into account(name,balance) values
('A',5000),
('B',3000);
select * from account ;
-- 3 เริ่ม Transaction
begin ; 
-- 4 แก้ไขข้อมูล
update account set balance = balance - 500 where account_id = 1 ;
update account set balance = balance + 500 where account_id = 2 ;

select * from account ;
-- 5 ทดลอง rollback
rollback ;
select * from account ;

--6 ใช้ save point
-- เริ่ม transaction
begin ;
-- 7 ทำรายการแรก
update account set balance = balance - 100 where account_id = 1 ;
savepoint sp1 ;
select * from account ;
-- 8 ทำรายการที่สอง
update account set balance = balance - 300 where account_id = 1 ;
savepoint sp2 ;
select * from account ;
-- 9 rollback บางส่วน
rollback to sp1 ;
select * from account ; 
-- 10 ปิด transaction
commit ; 

-- 5 LAB 3 การโอนเงินระหว่างบัญชี
-- โอนเงิน 1000 จากบัญชี 1 ไปบัญชี 2 
begin ;

update account set balance = balance - 1000 where account_id = 1 ;
update account set balance = balance + 1000 where account_id = 2 ;

commit ;

-- สร้าง error เพื่อสาธิตการ rollback อัตโนมัติ
begin 

update account set balance = balance - 1000 where account_id = 1 ;
update account set balance = balance + 1000 where account_id = 9999 ;

commit;
rollback;
select * from account ;