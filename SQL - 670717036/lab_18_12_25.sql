CREATE TABLE dept(
	dept_id int PRIMARY KEY,
	NAME CHAR(10) NOT NULL,
	LOCATION CHAR(20),
	CONSTRAINT dept_unique UNIQUE(NAME)
);

CREATE TABLE employee(
	NAME CHAR(10) NOT NULL,
	salary DECIMAL(10,2),
	dept int,
	CONSTRAINT empref FOREIGN KEY(dept)
	REFERENCES dept(dept_id)
);

ALTER TABLE employee RENAME TO Employees;