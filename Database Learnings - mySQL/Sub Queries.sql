use mydb;

select * from employee;

select first_name, last_name, (select avg(hourly_pay) from employee) as avg_pay
from employee;

select first_name, last_name, hourly_pay
from employee
where hourly_pay>(select avg(hourly_pay) from employee);

select * from transaction;

select first_name, last_name
from customer
where customer_id in(select distinct customer_id
from transaction
where customer_id is not null);

select first_name, last_name
from customer
where customer_id in(1,3,4); -- same output














