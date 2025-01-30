use mydb;

insert into transaction(amount, customer_id)
values (1.00, null);
select*from transaction;

insert into customer(first_name, last_name)
values ("kotaro", "bokuto");
select*from customer;

select *
from transaction inner join customer
on transaction.customer_id = customer.customer_id;

select transaction_id,amount, first_name,last_name
from transaction inner join customer
on transaction.customer_id = customer.customer_id;

select *
from transaction left join customer
on transaction.customer_id = customer.customer_id;

select *
from transaction right join customer
on transaction.customer_id = customer.customer_id;











