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
owners.fullname, animals.name
from owners
left join animals on animals.owner_id = owners.id;

--     fullname     |    name    
-- -----------------+------------
--  Sam Smith       | Agumon
--  Jennifer Orwell | Pikachu
--  Jennifer Orwell | Gabumon
--  Bob             | Plantmon
--  Bob             | Devimon
--  Melody Pond     | Squirtle
--  Melody Pond     | Charmander
--  Melody Pond     | Blossom
--  Dean Winchester | Angemon
--  Dean Winchester | Boarmon
--  Jodie Whittaker | 
-- (11 rows)


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


-- Day 4

-- Who was the last animal seen by William Tatcher?
select
vets.name as vet, animals.name as animal,visits.date_of_visit
from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
where vets.name like 'William%'
order by visits.date_of_visit desc
limit 1;
--        vet       | animal  | date_of_visit 
-- -----------------+---------+---------------
--  William Tatcher | Blossom | 2021-01-11
-- (1 row)


-- How many different animals did Stephanie Mendez see?

select
vets.name,count(visits.*)
from vets
left join visits on vets.id = visits.vet_id
where vets.name like 'Stephanie%'
group by vets.name;
--        name       | count 
-- ------------------+-------
--  Stephanie Mendez |     4
-- (1 row)


-- List all vets and their specialties, including vets with no specialties.

select
vets.name,species.name
from vets
left join specializations on vets.id = specializations.vet_id
left join species on species.id = specializations.specie_id
group by vets.name, species.name;
--        name       |  name   
-- ------------------+---------
--  Jack Harkness    | Digimon
--  Stephanie Mendez | Digimon
--  Stephanie Mendez | Pokemon
--  William Tatcher  | Pokemon
--  Maisy Smith      | 
-- (5 rows)


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

select
vets.name as vet, animals.name as animal,visits.date_of_visit
from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
where date_of_visit between '2020-4-1' and '2020-8-30'
and vets.name like 'Stephanie%';
--        vet        | animal  | date_of_visit 
-- ------------------+---------+---------------
--  Stephanie Mendez | Agumon  | 2020-07-22
--  Stephanie Mendez | Blossom | 2020-05-24
-- (2 rows)


-- What animal has the most visits to vets?

select
animals.name,count(visits.*)
from animals
left join visits on animals.id = visits.animal_id
group by animals.name
order by count desc
limit 1;
--   name   | count 
-- ---------+-------
--  Boarmon |     4
-- (1 row)


-- Who was Maisy Smith's first visit?

select
vets.name as vet, animals.name as animal,visits.date_of_visit
from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
where vets.name like 'Maisy%'
order by visits.date_of_visit
limit 1;
--      vet     | animal  | date_of_visit 
-- -------------+---------+---------------
--  Maisy Smith | Boarmon | 2019-01-24
-- (1 row)


-- Details for most recent visit: animal information, vet information, and date of visit.

select
vets.name as vet, animals.name as animal,visits.date_of_visit
from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
order by visits.date_of_visit desc
limit 1;
--        vet        | animal  | date_of_visit 
-- ------------------+---------+---------------
--  Stephanie Mendez | Devimon | 2021-05-04
-- (1 row)


-- How many visits were with a vet that did not specialize in that animal's species?

select
vets.name as vet, vets.id, specializations.vet_id, animals.name as animal,visits.date_of_visit, species.name, species.id, specializations.specie_id
from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
join species on species.id = animals.species_id
left join specializations on vets.id = specializations.vet_id
where specializations.specie_id != animals.species_id and vets.id != 7
or specializations.specie_id is null;
--        vet       | id | vet_id |   animal   | date_of_visit |  name   | id | specie_id 
-- -----------------+----+--------+------------+---------------+---------+----+-----------
--  William Tatcher |  5 |      5 | Plantmon   | 2020-08-10    | Digimon |  2 |         1
--  William Tatcher |  5 |      5 | Agumon     | 2020-05-24    | Digimon |  2 |         1
--  Jack Harkness   |  8 |      8 | Charmander | 2021-02-24    | Pokemon |  1 |         2
--  Maisy Smith     |  6 |        | Boarmon    | 2020-08-03    | Digimon |  2 |          
--  Maisy Smith     |  6 |        | Boarmon    | 2020-02-27    | Digimon |  2 |          
--  Maisy Smith     |  6 |        | Boarmon    | 2019-05-15    | Digimon |  2 |          
--  Maisy Smith     |  6 |        | Boarmon    | 2019-01-24    | Digimon |  2 |          
--  Maisy Smith     |  6 |        | Plantmon   | 2021-04-07    | Digimon |  2 |          
--  Maisy Smith     |  6 |        | Plantmon   | 2019-12-21    | Digimon |  2 |          
--  Maisy Smith     |  6 |        | Pikachu    | 2020-03-14    | Pokemon |  1 |          
--  Maisy Smith     |  6 |        | Pikachu    | 2020-03-08    | Pokemon |  1 |          
--  Maisy Smith     |  6 |        | Pikachu    | 2020-01-05    | Pokemon |  1 |          
-- (12 rows)


select
vets.name as vet, count(*) from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
join species on species.id = animals.species_id
left join specializations on vets.id = specializations.vet_id
where specializations.specie_id != animals.species_id and vets.id != 7
or specializations.specie_id is null
group by vets.name;
--        vet       | count 
-- -----------------+-------
--  Maisy Smith     |     9
--  William Tatcher |     2
--  Jack Harkness   |     1
-- (3 rows)

select
count(*) from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
join species on species.id = animals.species_id
left join specializations on vets.id = specializations.vet_id
where specializations.specie_id != animals.species_id and vets.id != 7
or specializations.specie_id is null;
--  count 
-- -------
--     12
-- (1 row)

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

select
species.name, count(species.name)
from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
join species on species.id = animals.species_id
left join specializations on vets.id = specializations.vet_id
where vets.name like 'Maisy%'
group by species.name
order by count desc
limit 1;
--   name   | count 
-- ---------+-------
--  Digimon |     6
-- (1 row)

