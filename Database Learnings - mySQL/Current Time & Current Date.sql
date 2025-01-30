use mydb;

create table test (
mydate date,
mytime time,
mydatetime datetime
);

select * from test;

insert into test
values (current_date(), current_time(), now());

select * from test;

insert into test
values (current_date()+1, null, null);

select * from test;

drop table test;