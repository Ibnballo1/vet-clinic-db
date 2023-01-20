/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOL,
  weight_kg DECIMAL
);

-- Day 2
ALTER TABLE animals
ADD species VARCHAR(100);

-- Day 3
CREATE TABLE OWNERS (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  full_name VARCHAR(250) NOT NULL,
  age INT NOT NULL
);
