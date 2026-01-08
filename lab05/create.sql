CREATE TABLE employees (
 empNo VARCHAR(10) PRIMARY KEY,
 firstName VARCHAR(50) NOT NULL,
 lastName VARCHAR(50) NOT NULL,
 email VARCHAR(100),
 empAddr VARCHAR(50),
 salary NUMERIC(10,2)
);
INSERT INTO employees (empNo, firstName, lastName, email, empAddr, salary) VALUES
('AA01122','Daniel','Santos','daniel@gmail.com','Denver',35000),
('AA02233','Linda','Jankins','linda@gmail.com','Seattle',42000),
('BB03344','Peter','Wood','peter@yahoo.com','Oxford',28000),
('BB04455','Nancy','Brown','nancy@gmail.com','Liverpool',50000),
('CC05566','Robert','Stone','robert@gmail.com','Norwood',39000),
('AA06677','Helen','Clark','helen@hotmail.com','Brentwood',31000);