create table custTbl
 (custNo char(5),
 custName varchar(20),
 custAddr varchar(50),
 primary key (custNo));
insert into custTbl values
 ('C1000','Teddy Danders','209 McCaffrey'),
 ('C2000','Ammy Jenkins','1234 Rafter Rd'),
 ('C3000','Betty Thomson','72 Hill st.'),
 ('C4000','Harry Hayes','756 Pine st.'),
 ('C5000','Colin White','1749 E.Ravenna');
create table empTbl
 (emp char(5),
 empName char(20),
 empAddr char(50),
 empCommRate NUMERIC(2,2));
 alter table empTbl add primary key (emp);
insert into empTbl values
 ('E0001','Linda Satons','3 Webber Ave.',0.03),
 ('E0002','Nick Thomas','988 Crest Ave.',0.01),
 ('E0003','Boston Tang','75 Main st.',0.03),
 ('E0004','Venus Aulra','222 Lorraine Cir.',0.02),
 ('E0005','Aurolla Switch','89 E.Ravenna',0.03);
create table prodTbl
 (prodNo char(6),
 prodName varchar(30),
 prodPrice NUMERIC(6,2));
alter table prodTbl add primary key (prodNo);
insert into prodTbl values
 ('P11001','Color Black Jet Cartridge',3200.00),
 ('P21040','R500 Color Printer',1200.00),
 ('P14080',' 48-Bit Color Scanner',3500.00),
 ('P22500','Battery System',2490.00),
 ('P18000','ABC Ing Jet Color Printer', 5900.00);
create table orderTbl
 (orderNo char(7),
 orderDate date,
 custNo char(5),
 empNo char(5),
 primary key (orderNo));
insert into orderTbl values
 ('0112200','2016-01-29','C5000','E0001'),
 ('0462200','2016-10-01','C2000',' '),
 ('0127219','2016-04-22','C4000','E0002'),
 ('0123455','2016-08-16','C1000',' '),
 ('0567891','2016-04-12','C4000','E0003'),
 ('0993321','2016-07-10','C3000','E0001'),
 ('0332200','2016-10-01','C1000','E0005'),
 ('0553311','2016-06-02','C3000','E0004'),
 ('0892536','2016-06-03','C5000',' '),
 ('0998811','2016-01-09','C5000','E0002');
create table orderDetail
 (orderNo char(7),
 prodNo char(6),
 orderQty int,
 primary key (orderNo, prodNo));
insert into orderDetail values
 ('0123455','P18000',1),
 ('0123455','P15080',1),
 ('0567891','P21040',1),
 ('0462200','P11001',2),
 ('0993321','P18000',1),
 ('0462200','P18000',5),
 ('0112200','P22500',1),
 ('0462200','P21040',1),
 ('0553311','P15080',4),
 ('0112200','P18000',2),
 ('0332200','P11001',3),
 ('0127219','P18000',1),
 ('0892536','P18000',5),
 ('0553311','P18000',2),
 ('0112200','P21040',1),
 ('0332200','P22500',3),
 ('0553311','P22500',2),
 ('0993321','P11001',4),
 ('0123455','P21040',5),
 ('0127219','P22500',1),
 ('0998811','P15080',1);