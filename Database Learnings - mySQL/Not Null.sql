use mydb;

create table product(
product_id int,
product_name varchar(25),
price decimal(4,2) not null
);

alter table product
modify price decimal(4,2) not null;

insert into product
values (5, "zoro's bandana", null);

insert into product
values (5, "zoro's bandana", 00.00);

select * from product;