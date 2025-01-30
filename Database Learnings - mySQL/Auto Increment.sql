use mydb;

drop table transcations;

create table transaction(
transaction_id int primary key auto_increment,
amount decimal(5,2)
);

select * from transaction;

insert into transaction (amount)
values (4.99);

select * from transaction;

insert into transaction (amount)
values (2.89), (3.88), (4.6);

select * from transaction;

alter table transaction
auto_increment = 1000;

delete from transaction;

select * from transaction;

insert into transaction (amount)
values (2.89), (3.88), (4.6);

select * from transaction;








