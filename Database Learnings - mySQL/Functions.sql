use mydb;

select count(amount) as count
from transaction;

select max(amount) as maximum
from transaction;

select min(amount) as minimum
from transaction;

select avg(amount) as average
from transaction;

select sum(amount) as sum
from transaction;

select concat(first_name," " ,last_name) as full_name
from employee;












