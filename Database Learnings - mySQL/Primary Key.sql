use mydb;

create table transcations(
transaction_id int primary key,
amount decimal (5,2)
);

select * from transcations;

if we already have the table

alter table transcation
add constraint primary key (transaction_id);

insert into transcations
values (1003, 75.70);

select * from transcations;

select amount
from transcations
where transaction_id= 1001;






