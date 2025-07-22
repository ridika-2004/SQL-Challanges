create table healthcareprovider(
id number primary key,
name varchar2(200),
speciality varchar2(200),
email varchar2(200)
);

drop table healthcareprovider;

select * from healthcareprovider;

insert into healthcareprovider values (1, 'a', 'ab', 'abgmailcom');
insert into healthcareprovider values (2, 'b', 'ba', 'bagmailcom');
insert into healthcareprovider values (3, 'c', 'ca', 'cagmailcom');
insert into healthcareprovider values (4, 'd', 'da', 'dagmailcom');
insert into healthcareprovider values (5, 'e', 'ea', 'eagmailcom');

create table virtualconsultation(
id number primary key,
patient_id number,
healthcareprovider_id number,
date_ date,
symptomps varchar2(2000),
diagnosis varchar2(2000),
prescription varchar2(2000),
foreign key(patient_id) references healthcareprovider(id),
foreign key(healthcareprovider_id) references patient(id)
);

select * from virtualconsultation;
drop table  virtualconsultation;

insert into virtualconsultation values (1, 1, 5,to_date('2025-07-21', 'YYYY-MM-DD'), 'liver', 'abc', 'abc');
insert into virtualconsultation values (2, 2, 4,to_date('2025-06-21', 'YYYY-MM-DD'), 'lungs', 'abc', 'abc');
insert into virtualconsultation values (3, 3, 3,to_date('2025-05-21', 'YYYY-MM-DD'), 'stomach', 'abc', 'abc');
insert into virtualconsultation values (4, 4, 2,to_date('2025-04-21', 'YYYY-MM-DD'), 'heart', 'abc', 'abc');
insert into virtualconsultation values (5, 5, 1,to_date('2025-03-21', 'YYYY-MM-DD'), 'lungs', 'abc', 'abc');


create table providerfeedback(
id number primary key,
consultation_id number,
rating number,
comments varchar2(2000),
timestamp_ date,
foreign key(consultation_id) references virtualconsultation(id)
);

insert into providerfeedback values (1, 5, 5, 'good', to_date('2025-07-21', 'YYYY-MM-DD'));
insert into providerfeedback values (2, 4, 3, 'ok', to_date('2025-06-21', 'YYYY-MM-DD'));
insert into providerfeedback values (3, 3, 4, 'nice', to_date('2025-05-21', 'YYYY-MM-DD'));
insert into providerfeedback values (4, 2, 1, 'bad', to_date('2025-04-21', 'YYYY-MM-DD'));
insert into providerfeedback values (5, 1, 3, 'ok', to_date('2025-03-21', 'YYYY-MM-DD'));

create table district(
id number primary key,
name varchar2(2000),
region varchar2(2000),
population number
);

select * from district;

insert into district values (1, 'a', 'ax', 100);
insert into district values (2, 'b', 'bx', 200);
insert into district values (3, 'c', 'cx', 300);
insert into district values (4, 'd', 'dx', 400);
insert into district values (5, 'e', 'ex', 500);

create table patient(
id number primary key,
name varchar2(2000),
age number,
contact_number varchar2(200),
gender varchar2(200),
district_id number,
foreign key(district_id) references district(id)
);

insert into patient values (1,'tony stark', 20, '12345', 'male', 1);
insert into patient values (2,'steve rogers', 21, '12345', 'male', 2);
insert into patient values (3,'thanos', 22, '12345', 'male', 1);
insert into patient values (4,'ultron', 23, '12345', 'male', 4);
insert into patient values (5,'star lord', 24, '12345', 'male', 3);


create table medicaldevice(
id number primary key,
device_type varchar2(2000),
manufacturer varchar2(2000),
activation_date varchar2(2000),
assigned_to_patient number,
foreign key(assigned_to_patient) references patient(id)
);

insert into medicaldevice values (1,'a', 'samsung', to_date('2025-07-21', 'YYYY-MM-DD'), 1);
insert into medicaldevice values(2,'a', 'samsung', to_date('2025-06-21', 'YYYY-MM-DD'), 2);
insert into medicaldevice values(3,'a', 'samsung', to_date('2025-05-21', 'YYYY-MM-DD'), 1);
insert into medicaldevice values(4,'a', 'samsung', to_date('2025-04-21', 'YYYY-MM-DD'), 4);
insert into medicaldevice values(5,'a', 'samsung', to_date('2025-03-21', 'YYYY-MM-DD'), 3);

create table devicereading(
id number primary key,
device_id number,
timestamp_ date,
metric_tpye varchar2(2000) check(metric_tpye in ('heart_rate', 'glucose', 'bp')),
value_ number,
foreign key(device_id) references medicaldevice(id)
);

insert into devicereading values (1,2, to_date('2025-07-21', 'YYYY-MM-DD'), 'bp', 2);
insert into devicereading values (2,3, to_date('2025-06-21', 'YYYY-MM-DD'), 'bp', 3);
insert into devicereading values (3,4, to_date('2025-05-21', 'YYYY-MM-DD'), 'bp', 1);
insert into devicereading values (4,5, to_date('2025-04-21', 'YYYY-MM-DD'), 'bp', 6);
insert into devicereading values (5,1, to_date('2025-03-21', 'YYYY-MM-DD'), 'bp', 3);


set SERVEROUTPUT on;
-- 1
create or replace procedure task1(p_id in number) is
cursor c1 is
select id, patient_id, healthcareprovider_id, date_ ,symptomps, diagnosis, prescription
from virtualconsultation
where healthcareprovider_id = p_id;
begin
for r in c1
loop
dbms_output.put_line('id : ' || r.id || ' patient id : ' || r.patient_id || ' healthcare provider id ' || r.healthcareprovider_id || ' date ' || r.date_ || ' symptomps ' || r.symptomps || ' prescription ' || r.prescription);
end loop;
end;

drop procedure task1;

exec task1(1);

--2
create or replace procedure task2 is
v_7_days_before date:= sysdate-7;
cursor c1 is
select md.device_type, dr.timestamp_
from medicaldevice md
join devicereading dr on md.id = dr.device_id;
begin
for r in c1
loop
if r.timestamp_<v_7_days_before then
dbms_output.put_line(r.device_type);
end if;
end loop;
end;

exec task2;

--3
create or replace function task3(pid in patient.id%type) return number is
v_avg number;
begin
select avg(value_) into v_avg
from devicereading dr
join medicaldevice md on md.id = dr.device_id
join patient p on p.id = md.assigned_to_patient;
return v_avg;
end;

select task3(1) from dual;

--4

create or replace procedure task4 is
cursor c is
select count(vc.id), hp.name
from healthcareprovider hp
join  virtualconsultation vc on hp.id = vc.healthcareprovider_id
group by vc.id, hp.name
having count(vc.id)>2;
begin
for r in c
loop
dbms_output.put_line(r.name);
end loop;
end;

exec task4;

--5
create or replace procedure task5 is
cursor c is
select p.id, vc.date_
from patient p
join medicaldevice md on p.id = md.assigned_to_patient
join virtualconsultation vc on p.id = vc.patient_id
where vc.date_<sysdate-30;
begin
for r in c
loop
dbms_output.put_line('patient id is ' || r.id);
end loop;
end;

exec task5;













