SELECT * FROM employees ;
-- ข้อ 1 แสดงรายการข้อมูลพนักงานที่ใช้อีเมล Gmail โดยเรียงลำดับชื่อพนักงานจากมากไปน้อย (Z → A)
SELECT UPPER(firstName) AS empName  FROM employees ORDER BY email DESC ;
-- ข้อ 2 แสดงหมายเลขประจำตัวพนักงาน โดยตัดอักขระ 2 ตัวแรกออกไป เช่น 01122, 02233
SELECT SUBSTRING(empNo,3) AS empNo FROM employees ; 
-- ข้อ 3 แสดงชื่อพนักงาน และจำนวนอักขระของชื่อพนักงาน
SELECT firstName,LENGTH(firstName) FROM employees ;
-- ข้อ 4 แสดงรายการข้อมูลพนักงานแผนก AA (รหัสพนักงานขึ้นตนดวย AAxxxxx)โดยเรียงรหัสพนักงานจากนอยไปมาก
SELECT empNo FROM employees WHERE empNo LIKE 'AA%' ORDER BY empNo ASC;
-- ข้อ 5 แสดงรายชื่อเมือง (empAddr) ที่แตกตางกัน (ไมซ้ำ) โดยแสดงตัวอักษร 3 ตัวสุดทายของชื่อเมืองเช่น vor, tle, ood
SELECT DISTINCT SUBSTRING(empaddr,LENGTH(empaddr) - 2) AS "City-Name"  FROM employees ;
-- ข้อ 6 แสดงชื่อเมือง 3 ตัวอักษร และชื่อพนักงาน 3 ตัวอักษร โดยมี '-' คั่นกลาง เช่น Den-Lan
SELECT CONCAT(SUBSTRING(empaddr,1,3),'-',SUBSTRING(firstname,1,3)) FROM employees ORDER BY empaddr DESC;
-- ข้อ 7 แสดงหมายเลขพนักงาน และหมายเลขพนักงานที่มี '-' คั่นระหวางแผนกและเลขลำดับ เช่น AA01122, BB-03344
SELECT CONCAT(SUBSTRING(empNo,0,3),'-',SUBSTRING(empNo,3)) FROM employees ; 
-- ข้อ 8 แสดงนามสกุลพนักงานทั้งหมด โดยตองไมมีนามสกุลซ้ำ
SELECT DISTINCT lastname FROM employees ORDER BY lastname ASC ;
-- ข้อ 9 แสดงหมายเลขพนักงาน ชื่อพนักงาน เงินเดือนพนักงาน (บาท) และเงินเดือนพนักงาน (K)
