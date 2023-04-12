create database diagramdb;

-- Patients

create table patients (
  id serial primary key,
  name varchar(150),
  date_of_birth date
);

-- Medical Histories

create table medical_histories (
  id serial primary key,
  admitted_at timestamp,
  status varchar(100),
  patient_id int,
  constraint fk_patient foreign key (patient_id)
    references patients(id)
);

-- Treatments

create table treatments (
  id serial primary key,
  name varchar(150),
  type varchar(150)
);

-- Join tables - Medical Histories and Treatments

create table history_treatments (
history_id int references medical_histories(id),
treatment_id int references treatments(id));