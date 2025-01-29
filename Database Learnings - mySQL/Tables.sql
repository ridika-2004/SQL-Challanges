use mydb;

create table employee(
employee_id int,
first_name varchar(50),
last_name varchar(50),
hourly_pay decimal(5,2),
hire_date date
);

select*from employee;

rename table employee to worker;

rename table worker to employee;

drop table employee;

alter table employee
add phone_number char(10);

select*from employee;

alter table employee
rename column phone_number to email;

select*from employee;

alter table employee
modify column email varchar(50);

alter table employee
modify column email varchar(50)
after last_name;

select*from employee;

alter table employee
drop column email;

select*from employee;













