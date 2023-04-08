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
