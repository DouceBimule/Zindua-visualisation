 CREATE DATABASE School;
 USE School;
 
 CREATE TABLE James(
 student_id INT PRIMARY KEY,
 First_name varchar(100),
 Last_name varchar (100),
 age INT,
 email varchar(255)
 );
 insert into james( Student_id,First_name, Last_Name, age, email)
values
(1, 'john', 'Doe', 20, 'john.doc@example.com'),
(2, 'jane', 'smith', 22, 'jane.smith@example.com'),
(3, 'michael', 'brown', 19, 'michael.brown@example.com')
;
ALTER TABLE James 
 ADD COLUMN EnrollmentDate DATE;

 ALTER TABLE James 
 DROP COLUMN Last_Name;
 ALTER TABLE James 
 MODIFY  email VARCHAR (300);
 