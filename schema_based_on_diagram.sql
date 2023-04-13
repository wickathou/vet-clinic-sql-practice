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


-- Invoices

create table invoices (
  id serial primary key,
  total_amount decimal(10, 2),
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id int,
  constraint fk_medical foreign key (medical_history_id)
    references medical_histories(id)
);

-- Invoice Items

create table invoice_items (
  id serial primary key,
  unit_price decimal(10, 2),
  quantity int,
  total_price decimal(10, 2),
  invoice_id int,
  treatment_id int,
  constraint fk_treatment foreign key (treatment_id)
    references treatments(id)
);


-- Join tables - Medical Histories and Treatments

create table history_treatments (
history_id int references medical_histories(id),
treatment_id int references treatments(id));