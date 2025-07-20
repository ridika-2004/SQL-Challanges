select * from book;

create or replace procedure print_book is
cursor c1 is
select title, author, price
from book;
begin
for r in c1
loop
dbms_output.put_line(r.title || r.author || r.price);
end loop;
end;

set SERVEROUTPUT on;
exec print_book();
