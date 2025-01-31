use mydb;

alter table transaction
add column order_date date;

update transaction
set order_date = "2025-01-31"
where transaction_id = 1004;

update transaction
set order_date = "2025-01-31"
where transaction_id = 1005;

update transaction
set order_date = "2025-01-30"
where transaction_id = 1006;

update transaction
set order_date = "2025-01-30"
where transaction_id = 1007;

update transaction
set order_date = "2025-01-29"
where transaction_id = 1008;

select* from transaction;

select sum(amount), order_date
from transaction
group by order_date;

select max(amount), order_date
from transaction
group by order_date;

select min(amount), order_date
from transaction
group by order_date;

select count(amount), customer_id
from transaction
group by customer_id
having count(amount)>1 and customer_id is not null;













