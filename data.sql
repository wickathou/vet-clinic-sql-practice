-- Day 1

insert into animals(name,date_of_birth, weight_kg,neutered,escape_attempts) values ('Agumon','2020-02-03', 10.23,true,0);
insert into animals(name,date_of_birth, weight_kg,neutered,escape_attempts) values 
  ('Gabumon','2018-11-15', 8,true,2),
  ('Pikachu','2021-01-07',15.04,false,1),
  ('Devimon','2017-05-12', 11,true,5);

-- Day 2

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

-- Day 3

begin;
insert into owners (
fullname,age) values
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);
select * from owners;
commit;
select * from owners;

begin;
insert into species (name) values
('Pokemon'),
('Digimon');
select * from species;
commit;
select * from species;

begin;
update animals set species_id=2 where name like '%mon';
select * from animals;
commit;
select * from animals;

begin;
update animals set species_id=1 where species_id is null;
select * from animals;
commit;
select * from animals;

begin;
select * from owners;
update animals set owner_id=1 where name='Agumon' returning *;
update animals set owner_id=2 where name='Gabumon' and name='Pikachu' returning *;
update animals set owner_id=2 where name='Gabumon' or name='Pikachu' returning *;
update animals set owner_id=3 where name='Plantmon' or name='Devimon' returning *;
update animals set owner_id=4 where name='Charmander' or name='Squirtle' or name='Blossom' returning *;
update animals set owner_id=5 where name='Angemon' or name='Boarmon' returning *;
select * from animals;
commit;
select * from animals;