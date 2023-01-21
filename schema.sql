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
  id int NOT NULL IDENTITY(1,1),
  full_name VARCHAR(250) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE species (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(250) NOT NULL
);

ALTER TABLE animals
ADD PRIMARY KEY(id);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT REFERENCES owners(id);
