use mydb;

create table naruto(
name varchar(25),
power varchar(25)
);

insert into naruto
values ("naruto", "kurama"),
("sasuke", "susano"),
("itachi", "sharingan");

create table bleach(
name varchar(25),
zanpakuto varchar(25)
);

insert into bleach
values ("ichigo", "zangetsu"),
("aizen", "suigetsu"),
("grimmjow", "cero");

select* from naruto
union
select* from bleach;

drop table naruto;
drop table bleach;

select * from employee
union
select* from customer; -- this won't work cz they need similar number of columns

select first_name, last_name from employee
union
select first_name, last_name from customer; -- doesn't allow duplicate values

select first_name, last_name from employee
union all
select first_name, last_name from customer; -- allows duplicate values












