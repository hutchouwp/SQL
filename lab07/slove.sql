-- 1. แสดงพนักงานที่ salary > ค่าเฉลี่ยทั้งบริษัท
select employee_id , first_name from hr.employees 
where salary > (select avg(salary) from hr.employees) ;

-- 2.แสดงพนักงานที่ salary = เงินเดือนสูงสุดของบริษัท
select employee_id , first_name from hr.employees
where salary >= (select max(salary) from hr.employees )

-- 3.แสดงพนักงานที่ salary > ค่าเฉลี่ยของแผนกตนเอง (correlated)
select job_id from jobs ;