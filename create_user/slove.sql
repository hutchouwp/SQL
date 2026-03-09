-- ดูว่าเชื่อ db อันไหน
-- \conninfo -- psql
select current_database(),current_user,session_user ;
-- create USER
create user testcoffee with password 'testcoffee123' ;
create user u_cashier with password 'cashier123' ;
-- alter ROLE
alter role testcoffee login password 'testcoffee123' ;
alter role u_cashier login password 'cashier123' ;
-- ตรวจคำสั่ง
-- \du -- psql
select rolname,rolcanlogin from pg_roles where rolname in('testcoffee','u_cashiere');
-- grant สิท
grant connect on database coffee_lab to testcoffee, u_cashier ;
grant usage on schema coffee to testcoffee, u_cashier ;
-- grant viewe
grant select on coffee.v_order_summary, coffee.v_daily_sales to testcoffee, u_cashier ;
-- connect เป็น testcoffee
-- \c "host = 127.0.0.1 port = 5432 dbname = coffee_lab user = testcoffee password = testcoffee123"
-- select current_user , session_user ;
-- ทดสอบคำสั่ง select 
select * from coffee.v_order_summary order by order_id ;
select * from coffee.v_daily_sales ;
-- connect เป็น u_cashier
-- \c "host = 127.0.0.1 port = 5432 dbname = coffee_lab user = u_cashier password = cashier123"
-- insert into coffee.category(category_name) values('ShouldlFail'); หากสิทถูกต้องระบบควรแจ้ง error:permission denied...