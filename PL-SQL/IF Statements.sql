set serveroutput on;

declare
a boolean:=true;
begin
if a then
dbms_output.put_line('a is true');
else
dbms_output.put_line('a is false');
end if;
end;

-- with elseif
declare
a number(2):=10;
b number(2):=20;
begin
if a>b then
dbms_output.put_line('a>b');
elsif b>a then
dbms_output.put_line('a<b');
else
dbms_output.put_line('a=b');
end if;
end;
