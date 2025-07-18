-- dummy value anonymous block
set SERVEROUTPUT on;

declare
num1 constant number(10) :=5; -- cannot be overridden
num2 number(10) :=10;
res number(10);
begin
-- num1 :=30 will give error because num1 is constant
res :=num1+num2;
dbms_output.put_line('The sum of ' || num1 || ' and ' || num2 || ' is ' || res);
end;

-- user input anonymous block
declare
num1 number(10) :=&num1;
num2 number(10) :=&num2;
res number(10);
begin
res :=num1+num2;
dbms_output.put_line('The sum of ' || num1 || ' and ' || num2 || ' is ' || res);
end;

-- select statement
select 'Hi this is ridika' from dual;





