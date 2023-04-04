-- Day 1

insert into animals(name,date_of_birth, weight_kg,neutered,escape_attempts) values ('Agumon','2020-02-03', 10.23,true,0);
insert into animals(name,date_of_birth, weight_kg,neutered,escape_attempts) values 
  ('Gabumon','2018-11-15', 8,true,2),
  ('Pikachu','2021-01-07',15.04,false,1),
  ('Devimon','2017-05-12', 11,true,5);

-- Day 2

alter table animals add column species varchar(100) ;

begin;               
insert into animals(name,date_of_birth, weight_kg,neutered,escape_attempts) values
('Charmander','2020-02-08', -11,false,0),
('Plantmon','2021-11-15',-5.7 ,true,2),
('Squirtle','1993-04-02', -12.13,false,3),
('Angemon','2005-06-12',-45,true,1),
('Boarmon','2005-06-07',20.4,true,7),
('Blossom','1998-10-13',17,true,3),
('Ditto','2022-05-14',22,true,4);
commit;