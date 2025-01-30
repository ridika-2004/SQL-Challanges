use mydb;

select * from employee;

select first_name,last_name
from employee;

select *
from employee
where employee_id =1;

select *
from employee
where first_name = "padme";

select *
from employee
where hourly_pay>=25.00;

select *
from employee
where employee_id != 5;

select *
from employee
where hire_date is null;

select *
from employee
where hire_date is not null;









