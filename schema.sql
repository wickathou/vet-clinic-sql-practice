-- Day 1
-- Creating database

createdb vet_clinic

psql vet_clinic

create table animals (
  id int,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal(6,4),
  primary key(id));

alter table animals alter column id set not null;

alter table animals alter column id add generated always as identity;

-- Day 2

alter table animals add column species varchar(100) ;
