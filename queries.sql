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

begin;
update animals set species='digimon' where name like '%mon';
update animals set species='pokemon' where species is null;
select * from animals;
commit;

begin;
delete from animals;
select * from animals;
rollback;

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
