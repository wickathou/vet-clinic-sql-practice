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
