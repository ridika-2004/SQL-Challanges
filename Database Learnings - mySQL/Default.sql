use mydb;

select * from product;

insert into product
values (6, "enma", 5.00),
(7, "dragon slayer", 10.00),
(8, "death note", 8.00);

select * from product;

delete from product
where product_id = 5;

create table product(
product_id int,
product_name varchar(25),
price decimal(4,2) default 0
);

we already have a product table

alter table product
alter price set default 0;

insert into product (product_id, product_name)
values (5, "zoro's bandana");

select * from product;

create table transaction(
transaction_id int,
transaction_amount decimal (5,2),
transaction_date datetime default now()
);

insert into transaction (transaction_id, transaction_amount)
values (2, 109.99);

select * from transaction;

drop table transaction;










