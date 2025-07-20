select * from book;

select substr('ridika naznin', 1,5) from dual;
select substr('ridika naznin', 5) from dual;

select max(price)
from book;

create or replace function book_price(id in book.book_id%type)
return varchar2 
is
v_book varchar2(200);
begin
select (title || '->' || price) into v_book
from book
where book_id = id;
return v_book;
end;

select book_price(2) from dual;

drop function book_price;


create or replace function book_price
return varchar2 
is
v_book varchar2(2000) := '';
begin
for r in(select title, price from book)
loop
v_book := v_book || r.title || ' price is = ' || r.price || chr(13);
end loop;
return v_book;
end;

select book_price() from dual;

drop function book_price;
