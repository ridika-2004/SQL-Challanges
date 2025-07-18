truncate table book;
-- insert through pl/sql
begin
insert into book (title, author, genre, price, published_on, available)
values ('1984', 'George Orwell', 'Dystopian', 8.50, to_date('1949-06-08', 'yyyy-mm-dd'), 'Y');
end;

select * from book;

truncate table book;
--insert through select statement
begin
insert into book
select book_id,title,author,genre,price,published_on,available 
from book
where title not in ('1984');
end;

select * from book;
-- update query
begin
update book
set title = 'Ninteen eighty four'
where title like '%1984%';
end;

select * from book;



