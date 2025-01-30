use mydb;

alter table employee
add column job varchar(25) after hourly_pay;

select* from employee;

update employee
set job = "manager"
where employee_id = 6;

update employee
set job = "cashier"
where employee_id = 1;

update employee
set job = "cook"
where employee_id = 2;

update employee
set job = "pilot"
where employee_id = 3;

update employee
set job = "housemaid"
where employee_id = 4;

update employee
set job = "pet"
where employee_id = 5;

select* from employee;

select *
from employee
where hire_date<"2025-01-30" and job = "cook";

select *
from employee
where job="cashier" or job = "cook";

select *
from employee
where not job="manager" and not job="pilot";

select *
from employee
where hire_date between "2024-01-30" and "2024-01-29";

select *
from employee
where job in("cook", "cashier", "manager");

