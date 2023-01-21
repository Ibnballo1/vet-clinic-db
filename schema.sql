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

-- Day 4
CREATE TABLE vets (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(250),
  age INT,
  date_of_graduation DATE
);

CREATE TABLE specialization(
  vets_id INT REFERENCES vets(id),
  species_id INT REFERENCES species(id)
);

CREATE TABLE visits (
  animals_id INT REFERENCES animals(id),
  vets_id INT REFERENCES vets(id),
  date_of_visit DATE
);
