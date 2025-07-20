-- In SpeedVerse, players participate in competitive racing events across multiple cities such as NeoTokyo, Skyline Bay, Mecha Hills, and Solar Drift. Each player owns multiple cars, tunes their vehicles with parts, and participates in races for rewards and rankings. 
-- Each car:
-- • Can enter multiple races (e.g., “Turbo Rally”, “Skyline Showdown”), and each race involves
-- many cars.
-- • Is equipped with multiple parts (engines, tires, turbos), and each part can be used by multiple
-- cars.
-- • Races may reward parts, and the same part may be a reward in multiple races.
-- Players can:
-- • View their cars and equipped parts
-- • See the races they’ve participated in
-- • Track the parts they’ve won
-- For game analytics and personalization:
-- • Players can select preferred part types (like “Turbo”, “Suspension”, “Tire”)
-- • Players rate each race for challenge and enjoyment after completing it
-- Assume necessary attributes such as timestamps, ratings, and statuses as needed.


-- Player table
CREATE TABLE player (
    id NUMBER PRIMARY KEY,
    username VARCHAR2(50),
    city VARCHAR2(50)
);

drop table player;
drop table car;
drop table part;
drop table race;
drop table preferred_part_type;
drop table race_reward;
drop table car_part;
drop table race_participation;

select * from player;
select * from car;
select * from part;
select * from race;
select * from preferred_part_type;
select * from race_reward;
select * from car_part;
select * from race_participation;

-- Car table
CREATE TABLE car (
    id NUMBER PRIMARY KEY,
    model VARCHAR2(50),
    player_id NUMBER,
    FOREIGN KEY (player_id) REFERENCES player(id)
);

-- Part table
CREATE TABLE part (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    type VARCHAR2(50)
);

-- Race table
CREATE TABLE race (
    id NUMBER PRIMARY KEY,
    title VARCHAR2(50)
);

-- Car_Part table (Many-to-Many between car and part)
CREATE TABLE car_part (
    car_id NUMBER,
    part_id NUMBER,
    PRIMARY KEY (car_id, part_id),
    FOREIGN KEY (car_id) REFERENCES car(id),
    FOREIGN KEY (part_id) REFERENCES part(id)
);

-- Race_Participation table (Which cars took part in which races with ratings)
CREATE TABLE race_participation (
    car_id NUMBER,
    race_id NUMBER,
    rating NUMBER,
    PRIMARY KEY (car_id, race_id),
    FOREIGN KEY (car_id) REFERENCES car(id),
    FOREIGN KEY (race_id) REFERENCES race(id)
);

-- Race_Reward table (Parts awarded for races)
CREATE TABLE race_reward (
    race_id NUMBER,
    part_id NUMBER,
    PRIMARY KEY (race_id, part_id),
    FOREIGN KEY (race_id) REFERENCES race(id),
    FOREIGN KEY (part_id) REFERENCES part(id)
);

-- Preferred_Part_Type table (Player preferences for part types)
CREATE TABLE preferred_part_type (
    player_id NUMBER,
    part_type VARCHAR2(50),
    PRIMARY KEY (player_id, part_type),
    FOREIGN KEY (player_id) REFERENCES player(id)
);

insert into player values (1, 'speedster99', 'dhaka');
insert into player values (2, 'driftking', 'chittagong');
insert into player values (3, 'nightdriver', 'khulna');

insert into car values (101, 'nissan skyline', 1);
insert into car values (102, 'toyota supra', 2);
insert into car values (103, 'mazda rx7', 3);

insert into part values (201, 'turbo booster', 'engine');
insert into part values (202, 'carbon spoiler', 'aero');
insert into part values (203, 'nitro system', 'boost');
insert into part values (204, 'lightweight tires', 'wheels');


insert into race values (301, 'city showdown');
insert into race values (302, 'desert dash');
insert into race values (303, 'midnight sprint');


insert into car_part values (101, 201);
insert into car_part values (101, 202);
insert into car_part values (102, 203);
insert into car_part values (103, 204);


insert into race_participation values (101, 301, 8.7);
insert into race_participation values (102, 302, 9.2);
insert into race_participation values (103, 303, 8.0);
insert into race_participation values (101, 302, 7.5);


insert into race_reward values (301, 203);
insert into race_reward values (302, 204);
insert into race_reward values (303, 202);


insert into preferred_part_type values (1, 'engine');
insert into preferred_part_type values (2, 'boost');
insert into preferred_part_type values (3, 'wheels');


alter table race
add duration number(10,2);

truncate table race;
truncate table race_reward;
truncate table race_participation;

insert into race values (301, 'city showdown', 50.0);
insert into race values (302, 'desert dash', 20.00);
insert into race values (303, 'midnight sprint', 35.56);

insert into race_participation values (101, 301, 8.7);
insert into race_participation values (102, 302, 9.2);
insert into race_participation values (103, 303, 8.0);
insert into race_participation values (101, 302, 7.5);


insert into race_reward values (301, 203);
insert into race_reward values (302, 204);
insert into race_reward values (303, 202);

-- Write a function that takes a race_id as input and returns the required time to complete it in hours and minutes. For every 10 minutes of race time, a 3-minute pit stop is added only if the remaining duration is more than 10 minutes.

create or replace function task1(race_id in race.id%type) 
return number is
v_result number:=0;
v_duration number;
begin
select duration into v_duration
from race
where id = race_id;
while (v_duration>0)
loop
if v_duration>10 then
v_result := v_result+10;
v_duration:= v_duration-10+3;
else
v_result := v_result+v_duration;
v_duration :=0;
end if;
end loop;
return v_result;
end;

select task1(301) from dual;

drop function task1;


