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

-- Day 4 

begin;

insert into vets
(name, age, date_of_graduation) values
('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness',38,'2008-06-08');

select * from vets;

--  id |       name       | age | date_of_graduation 
-- ----+------------------+-----+--------------------
--   5 | William Tatcher  |  45 | 2000-04-23
--   6 | Maisy Smith      |  26 | 2019-01-17
--   7 | Stephanie Mendez |  64 | 1981-05-04
--   8 | Jack Harkness    |  38 | 2008-06-08
-- (4 rows)

commit;

select * from vets;

--  id |       name       | age | date_of_graduation 
-- ----+------------------+-----+--------------------
--   5 | William Tatcher  |  45 | 2000-04-23
--   6 | Maisy Smith      |  26 | 2019-01-17
--   7 | Stephanie Mendez |  64 | 1981-05-04
--   8 | Jack Harkness    |  38 | 2008-06-08
-- (4 rows)

begin;

insert into specializations
(vet_id,specie_id) values
(5,1),
(7,1),
(7,2),
(8,2);

select * from specializations;
--  vet_id | specie_id 
-- --------+-----------
--       5 |         1
--       7 |         1
--       7 |         2
--       8 |         2
-- (4 rows)

commit;

select * from specializations;
--  vet_id | specie_id 
-- --------+-----------
--       5 |         1
--       7 |         1
--       7 |         2
--       8 |         2
-- (4 rows)


begin;


insert into visits (animal_id,vet_id,date_of_visit) values
(1,5,'2020-5-24'),
(1,7,'2020-07-22'),
(2,8,'2021-02-02'),
(5,6,'2020-01-05'),
(5,6,'2020-3-8'),
(5,6,'2020-03-14'),
(3,7,'2021-05-4'),
(9,8,'2021-2-24'),
(7,6,'2019-12-21'),
(7,5,'2020-8-10'),
(7,6,'2021-4-7'),
(10,7,'2019-9-29'),
(8,8,'2020-10-3'),
(8,8,'2020-11-4'),
(4,6,'2019-1-24'),
(4,6,'2019-5-15'),
(4,6,'2020-2-27'),
(4,6,'2020-8-3'),
(6,7,'2020-5-24'),
(6,5,'2021-1-11');

select * from visits ;
--  vet_id | animal_id | date_of_visit 
-- --------+-----------+---------------
--       5 |         1 | 2020-05-24
--       7 |         1 | 2020-07-22
--       8 |         2 | 2021-02-02
--       6 |         5 | 2020-01-05
--       6 |         5 | 2020-03-08
--       6 |         5 | 2020-03-14
--       7 |         3 | 2021-05-04
--       8 |         9 | 2021-02-24
--       6 |         7 | 2019-12-21
--       5 |         7 | 2020-08-10
--       6 |         7 | 2021-04-07
--       7 |        10 | 2019-09-29
--       8 |         8 | 2020-10-03
--       8 |         8 | 2020-11-04
--       6 |         4 | 2019-01-24
--       6 |         4 | 2019-05-15
--       6 |         4 | 2020-02-27
--       6 |         4 | 2020-08-03
--       7 |         6 | 2020-05-24
--       5 |         6 | 2021-01-11
-- (20 rows)

commit;
select * from visits ;
