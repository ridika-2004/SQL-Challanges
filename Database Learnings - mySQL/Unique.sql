use mydb;

create table product(
product_id int,
product_name varchar(25) unique,
price decimal(4,2)
);

-- in case we forget the unique keyword

-- alter table product
-- add constraint
-- unique (product_name);

select * from product;

insert into product
values (1, "kunai", 20.00),
(2, "zanpakuto", 40.00),
(3, "bungee gum", 10.00),
(4, "devil fruit", 30.00);

select * from product;












