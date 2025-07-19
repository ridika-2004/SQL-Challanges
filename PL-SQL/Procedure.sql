select * from book;

set SERVEROUTPUT on;

create or replace procedure find_book(writer in varchar2) is
v_title varchar2(2000);
begin
select title into v_title
from book
where author like '%' || writer || '%';
dbms_output.put_line('book by ' || writer || ' is ' || v_title);
end;

exec find_book('Scott');

drop procedure find_book;


-- with out parameter
create or replace procedure square(n1 in number, x out number) is
begin
x := n1*n1;
dbms_output.put_line(n1 || ' square is ' || x);
end;

variable x number;
exec square(6, :x);

print x;

-- procedure for updating a column of a table
select * from book;

create or replace procedure price_reduce(title_name in varchar2) is
v_price number;
begin
select price into v_price
from book
where title = title_name;
dbms_output.put_line('previous price of '|| title_name || ' is ' || v_price);
update book
set price = price*0.5
where title = title_name;
select price into v_price
from book
where title = title_name;
dbms_output.put_line('current price of '|| title_name || ' is ' || v_price);
end;

exec price_reduce('1984');

--insert through procedure

create or replace procedure book_insert(title1 in varchar2, author1 in varchar2, genre1 in varchar2, price1 in number, published_on1 in varchar2, available1 in char) is
begin
insert into book(title, author, genre, price, published_on, available) values
(title1, author1, genre1, price1, to_date(published_on1, 'yyyy-mm-dd'), available1);
end;

exec book_insert('To Kill a Mockingbird', 'Harper Lee', 'Classic Fiction', 12.99, '1960-07-11', 'Y');



drop procedure square;
