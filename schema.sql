-- Day 1
-- Creating database -> Requires to be connected to the PostgreSQL server with psql

create database vet_clinic

create table animals (
  id serial,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal(6,4),
  primary key(id));

-- Day 2

alter table animals add column species varchar(100) ;

-- Day 3

create table owners(
id serial primary key,
fullname varchar(100),
age int);

select * from owners;

create table species(
id serial primary key,
name varchar(100));

select * from species;

alter table animals drop column species;
alter table animals add column species_id int, add column owner_id int;

select * from animals;

alter table animals                                                  
add constraint species_fk
foreign key (species_id)
references species(id)
on delete cascade;

alter table animals                                                 
add constraint owners_fk
foreign key (owner_id)
references owners(id)
on delete cascade;

-- Day 4

create table vets (
id serial primary key,
name varchar(100),
age int,
date_of_graduation date);

create table specializations (
vet_id int references vets(id),
specie_id int references species(id));

create table visits (
vet_id int references vets(id),
animal_id int references animals(id)
date_of_visit date);

-- Day 1 - pair programming

ALTER TABLE owners ADD COLUMN email VARCHAR(120);