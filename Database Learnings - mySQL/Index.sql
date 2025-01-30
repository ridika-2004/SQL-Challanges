use mydb;

select * from customer;

show indexes from customer;

create index last_name_idx
on customer(last_name);

show indexes from customer;

select* from customer
where last_name like "%sho%"; -- faster cz it used btree data structure

create index last_name_first_name_idx
on customer(last_name, first_name);

show indexes from customer;

alter table customer
drop index last_name_idx;

show indexes from customer;

select* from customer
where first_name = "hinata" and last_name = "shoyo";











