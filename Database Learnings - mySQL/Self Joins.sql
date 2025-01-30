use mydb;

alter table customer
add refferal_id int;

select* from customer;

update customer
set refferal_id = 1
where customer_id=2;

update customer
set refferal_id = 2
where customer_id=3;

update customer
set refferal_id = 2
where customer_id=4;

select a.customer_id, a.first_name, a.last_name, b.first_name, b.last_name
from customer as a
inner join customer as b
on a.refferal_id = b.customer_id;

select a.customer_id, a.first_name, a.last_name, concat(b.first_name," ",b.last_name) as "reffered by"
from customer as a
inner join customer as b
on a.refferal_id = b.customer_id;

select a.customer_id, a.first_name, a.last_name, concat(b.first_name," ",b.last_name) as "reffered by"
from customer as a
left join customer as b
on a.refferal_id = b.customer_id;

alter table employee
add supervisor_id int;

select* from employee;

update employee
set supervisor_id = 5
where employee_id = 2;

update employee
set supervisor_id = 5
where employee_id = 3;

update employee
set supervisor_id = 5
where employee_id = 4;

update employee
set supervisor_id = 5
where employee_id = 6;

update employee
set supervisor_id = 1
where employee_id = 5;

select* from employee;

select a.first_name, a.last_name, concat(b.first_name, " ", b.last_name) as "reports to"
from employee as a
inner join employee as b
on a.supervisor_id = b.employee_id;

select a.first_name, a.last_name, concat(b.first_name, " ", b.last_name) as "reports to"
from employee as a
left join employee as b
on a.supervisor_id = b.employee_id;

















