use mydb;

select* from customer
order by last_name desc
limit 2;

select* from customer
limit 1,1; -- first number is offset. limit to one record after the first

select* from customer
limit 1,2;  -- limit to two record after the first















