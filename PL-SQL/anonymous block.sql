-- dummy value anonymous block
set SERVEROUTPUT on;

declare
num1 number(10) :=5;
num2 number(10) :=10;
res number(10);
begin
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
