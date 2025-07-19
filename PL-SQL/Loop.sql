-- condition defined in while statement
declare
c number :=0;
begin
while (c<5)
loop
dbms_output.put_line(c);
c:=c+1;
end loop;
end;

-- condition inside while block
declare
c number :=0;
begin
while (true)
loop
dbms_output.put_line(c);
c:=c+1;
exit when c>5;
end loop;
end;

-- for loop
declare
c1 number;
begin
for c1 in 2 .. 6
loop
dbms_output.put_line(c1);
end loop;
end;

-- reverse printing
declare
c1 number;
begin
for c1 in reverse 2 .. 6
loop
dbms_output.put_line(c1);
end loop;
end;
