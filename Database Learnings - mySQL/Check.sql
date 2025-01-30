use mydb;

create table employee(
employee_id int,
first_name varchar(50),
last_name varchar(50),
hourly_pay decimal(5,2),
hire_date date
constraint chk_hourly_pay check (hourly_pay >=12.50)
);

if the table already exists

alter table employee
add constraint chk_hourly_pay check(hourly_pay >=3.00)

select * from employee;

insert into employee
values (6, "darth", "ridika", 10.00, "2025-01-30");

select * from employee;

alter table employee
drop check chk_hourly_pay;







