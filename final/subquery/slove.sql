-- 1 แสดงพนักงานที่ salary > ค่าเฉลี่ย
select * from hr.employees where salary > (select avg(salary) from hr.employees) ;
-- 2 แสดงพนักงานที่ salary = เงินเดือนสูงสุดของบริษัท
select * from hr.employees where salary = (select max(salary) from hr.employees) ;
-- 3 พนักงานที่ salary > ค่าเฉลี่ยของแผนกตนเอง (correlated)
select * from hr.employees e 
where salary > (select avg(salary) from hr.employees where department_id = e.department_id);
-- 4 แผนกที่ avg salary สูงกว่าค่าเฉลี่ยทั้งบริษัท
select department_id , avg(salary) as avg_salary from hr.employees group by department_id
having avg(salary) > (select avg(salary) from hr.employees) ;
-- 5 job_title ที่ avg salary สูงกว่าค่าเฉลี่ยทั้งบริษัท
select j.job_title, avg(e.salary) as avg_salary from hr.employees e
join hr.jobs j on j.job_id = e.job_id group by j.job_title 
having avg(e.salary) >  (select avg(salary) from hr.employees) ;
-- 6 Top 5 เงินเดือนสูงสุด พร้อมแผนกและตำแหน่ง
select 
	e.first_name,
	e.last_name,
	e.salary,
	d.department_name,
	j.job_title
from hr.employees e
join hr.departments d on d.department_id = e.department_id
join hr.jobs j on j.job_id = e.job_id order by e.salary DESC limit 5 ;
-- 7 CTE: headcount ต่อแผนก แล้วหาแผนกที่มากที่สุด
with dept_count as (
	select department_id, count(*) as headcount
	from hr.employees 
	group by department_id
)

select * from dept_count where headcount = (select max(headcount) from dept_count ) ; 
-- 8 CTE: avg salary ต่อ job แล้วเอา 3 อันดับสูงสุด
with job_avg as (
	select job_id,avg(salary) as avg_salary
	from hr.employees 
	group by job_id
)
select * from job_avg order by avg_salary desc limit 3 ;
-- 9 EXISTS: แผนกที่มี commission อย่างน้อย 1 คน
SELECT *
FROM hr.departments d
WHERE EXISTS (
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.commission_pct IS NOT NULL
); 
-- 10 NOT EXISTS: แผนกที่ไม่มีพนักงาน
SELECT *
FROM hr.departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
);
-- 11 SELECT location_id, COUNT(*) AS dept_count
FROM hr.departments
GROUP BY location_id
HAVING COUNT(*) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM hr.departments
        GROUP BY location_id
    ) t
);
-- 12 CTE: manager ที่มีลูกทีม > 5 คน
WITH manager_team AS (
    SELECT manager_id, COUNT(*) AS team_size
    FROM hr.employees
    WHERE manager_id IS NOT NULL
    GROUP BY manager_id
)

SELECT *
FROM manager_team
WHERE team_size > 5;
-- 13 CTE: พนักงานที่มี job_history แล้วแสดง 10 คนแรก
WITH emp_history AS (
    SELECT DISTINCT employee_id
    FROM hr.job_history
)

SELECT e.*
FROM hr.employees e
JOIN emp_history h ON h.employee_id = e.employee_id
LIMIT 10;