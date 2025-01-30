use mydb;

create table customer(
customer_id int primary key auto_increment,
first_name varchar(25),
last_name varchar(25)
);

select* from customer;

insert into customer (first_name, last_name)
values ("hinata", "shoyo"),
("kageyama", "tobio"),
("toru", "oikawa"),
("yu", "nishinoya");

select* from customer;

drop table transaction;

create table transaction(
transaction_id int primary key auto_increment,
amount decimal(5,2),
customer_id int,
foreign key(customer_id) references customer(customer_id)
);

select*from transaction;

alter table transaction
drop foreign key transaction_ibfk_1;

alter table transaction
add constraint fk_customer_id
foreign key(customer_id) references customer(customer_id);

delete from transaction;

select * from transaction;

alter table transaction
auto_increment = 1000;

insert into transaction(amount, customer_id)
values (4.99, 3),
(5.45,4),
(5.66, 3),
(10,1);

select* from transaction;
















