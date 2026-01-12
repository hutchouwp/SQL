create table student(
	id serial primary key,
	fullname varchar(100),
	major varchar(50),
	gpa numeric(3,2)
);

insert into student(fullname,major,gpa) values
('Alice Somchai','IT',3.45),
('Bob Kittikun','DS',2.80),
('Charlie Meeboon','CS',3.90);

select * from student ;
select fullname from student ; 
select * from student where gpa > 3.0 ; 
select * from student order by gpa desc ; 

update student set gpa = 3.88 where fullname = 'Bob Kittikun' ; 
select * from student ; 

delete from student where gpa < 3.0 ;
select * from student ; 
