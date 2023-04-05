select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-31';
select name from animals where escape_attempts < 3 and neutered is true;
select date_of_birth from animals where name in ('Agumon','Pikachu');
select (name,escape_attempts) from animals where weight_kg > 10.5;
select * from animals where neutered is true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

-- Day 2

begin;
update animals set species = 'unspecified';
select * from animals;
rollback;
select * from animals;

begin;
update animals set species='digimon' where name like '%mon';
update animals set species='pokemon' where species is null;
select * from animals;
commit;
select * from animals;

begin;
delete from animals;
select * from animals;
rollback;
select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint sp1;
update animals set weight_kg = weight_kg*(-1);
select * from animals;
rollback to sp1;
select * from animals;
update animals set weight_kg = weight_kg*(-1) where weight_kg < 0;
select * from animals;
commit;
select * from animals;

-- Questions:
-- How many animals are there?
-- Answer: 10
-- Query:
select count(*) from animals;

-- How many animals have never tried to escape?
-- Answer: 2
-- Query:
select count(*) from animals where escape_attempts = 0;

-- What is the average weight of animals?
-- Answer: 15.55
-- Query:
select avg(weight_kg) from animals;

-- Who escapes the most, neutered or not neutered animals?
-- Answer: 7 true, 3 false
-- Query:
select neutered,count(*) from animals group by neutered;

-- What is the minimum and maximum weight of each type of animal?
-- Answer: Pokemon (min:11, max:17), Digimon (min:5.7, max:45)
-- Query:
select species,min(weight_kg),max(weight_kg) from animals group by species;


-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
-- Answer: Pokemon(3), Digimon(Null)
-- Query:
select species,avg(escape_attempts) from animals where date_part('year',date_of_birth) between 1990 and 2000 group by species;


-- Day 3


-- Animals owned by Melody Pond

select
owners.fullname, animals.name
from animals
join owners on animals.owner_id = owners.id
where owners.fullname = 'Melody Pond';

--   fullname   |    name    
-- -------------+------------
--  Melody Pond | Squirtle
--  Melody Pond | Charmander
--  Melody Pond | Blossom
-- (3 rows)


-- Animals who are Pokemon 

select
species.name, animals.name
from animals
join species on animals.species_id = species.id
where species.name = 'Pokemon';

--   name   |    name    
-- ---------+------------
--  Pokemon | Squirtle
--  Pokemon | Charmander
--  Pokemon | Blossom
--  Pokemon | Pikachu
-- (4 rows)


-- Owner's animal count 

select
owners.fullname, count(animals.name)
from owners
left join animals on animals.owner_id = owners.id group by owners.fullname;

--     fullname     | count 
-- -----------------+-------
--  Dean Winchester |     2
--  Bob             |     2
--  Sam Smith       |     1
--  Jodie Whittaker |     0
--  Jennifer Orwell |     2
--  Melody Pond     |     3
-- (6 rows)


-- Count of animals per species 

select
species.name, count(animals.name)
from species
join animals on species.id = animals.species_id group by species.name;

--   name   | count 
-- ---------+-------
--  Pokemon |     4
--  Digimon |     6
-- (2 rows)


-- Digimon owned by Jennifer

select
animals.name, owners.fullname as owner, species.name as specie              
from animals
join owners on animals.owner_id = owners.id
join species on species.id = animals.species_id
where owners.fullname like 'Jennifer%' and species.name= 'Digimon'
group by owners.fullname, animals.name, species.name;

--   name   |      owner      | specie  
-- ---------+-----------------+---------
--  Gabumon | Jennifer Orwell | Digimon
-- (1 row)


-- List of animals owned by Dean, which haven't tried to escape

select                
animals.name, owners.fullname as owner, animals.escape_attempts
from animals
join owners on animals.owner_id = owners.id
where owners.fullname like 'Dean%' and animals.escape_attempts=0;

--  name | owner | escape_attempts 
-- ------+-------+-----------------
-- (0 rows)


-- Verification 
select
animals.name, owners.fullname as owner, animals.escape_attempts
from animals
join owners on animals.owner_id = owners.id
where owners.fullname like 'Dean%' and animals.escape_attempts>0;

--   name   |      owner      | escape_attempts 
-- ---------+-----------------+-----------------
--  Boarmon | Dean Winchester |               7
--  Angemon | Dean Winchester |               1
-- (2 rows)


-- Who owns the most animals

select
owners.fullname, count(animals.name)
into table ownership_count from owners
left join animals on animals.owner_id = owners.id group by owners.fullname;
select * from ownership_count ;

--     fullname     | count 
-- -----------------+-------
--  Dean Winchester |     2
--  Bob             |     2
--  Sam Smith       |     1
--  Jodie Whittaker |     0
--  Jennifer Orwell |     2
--  Melody Pond     |     3
-- (6 rows)

select                         
*
from ownership_count
where count= ( select max(count) from ownership_count);

--   fullname   | count 
-- -------------+-------
--  Melody Pond |     3
-- (1 row)
