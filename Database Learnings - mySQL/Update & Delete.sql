use mydb;

update employee
set hourly_pay = 20.25, hire_date = "2025-01-30"
where employee_id = 6;

select * from employee;

update employee
set hire_date = null
where employee_id = 6;

select * from employee;

update employee
set hourly_pay = 3.00;

select * from employee;

delete from employee
where employee_id = 6;

select * from employee;













