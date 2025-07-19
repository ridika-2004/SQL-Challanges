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

drop procedure square;
