create database lab4;

use lab4;

insert into pokemon(pokemon_id, name, type, hp, attack, defense, speed) values
(1, 'Bulbasaur',' Grass', 45, 49, 49, 45),
(2 ,'Ivysaur' ,'Grass', 60, 62, 63, 60),
(3 ,'Venusaur', 'Grass', 80 ,82, 83, 80),
(4 ,'Charmander', 'Fire', 39, 52, 43, 65),
(5 ,'Charmeleon', 'Fire', 58, 64, 58, 80),
(6 ,'Charizard', 'Fire', 78 ,84, 78, 100),
(7 ,'Squirtle', 'Water', 44, 48, 65, 43),
(8 ,'Wartortle' ,'Water' ,59 ,63 ,80 ,58),
(9 ,'Blastoise' ,'Water' ,79 ,83 ,100 ,78),
(10 ,'Pikachu' ,'Electric', 35, 55, 40, 90),
(11 ,'Raichu' ,'Electric', 60, 90, 55, 110);

insert into trainer(trainer_id, first_name, last_name, city) values
(1 ,'Ash', 'Ketchum', 'Pallet Town'),
(2 ,'Misty','Williams' ,'Cerulean City'),
(3 ,'Brock', 'Harrison', 'Pewter City'),
(4 ,'Gary', 'Oak', 'Pallet Town'),
(5 ,'Erika', 'Green', 'Celadon City');


select distinct type
from pokemon;


select name,attack
from pokemon
where attack between 50 and 80;


select name
from pokemon
where name like 'C%';


select name
from pokemon
where name like '%saur%';


select name
from pokemon
where name like '%____e____%';


select concat(first_name,' ', last_name) as full_name,city
from trainer;


select name,type
from pokemon
order by type asc;


create table Trainer_Pokemon(
trainer_id int,
pokemon_id int,
primary key(trainer_id, pokemon_id),
foreign key(trainer_id) references trainer(trainer_id),
foreign key(pokemon_id) references pokemon(pokemon_id)
);
