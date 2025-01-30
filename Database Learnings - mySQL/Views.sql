use mydb;

select*from employee;

create view employee_attendence as
select first_name, last_name
from employee;

select * from employee_attendence;

drop view employee_attendence;

alter table customer
add column email varchar(20);

update customer
set email = "hinata@gmail.com"
where customer_id = 1;

update customer
set email = "kageyama@gmail.com"
where customer_id = 2;

update customer
set email = "oikawa@gmail.com"
where customer_id = 3;

update customer
set email = "nishinoya@gmail.com"
where customer_id = 4;

update customer
set email = "bokuto@gmail.com"
where customer_id = 5;

select * from customer;

create view customer_email as
select email
from customer;

select * from customer_email;

insert into customer
values (6, "keiji", "akaashi", "2", "akaashi@gmail.com");

select* from customer_email; -- the updated table view still works







