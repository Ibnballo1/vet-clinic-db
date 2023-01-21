/*Queries that provide answers to the questions from all projects.*/

-- Day 1

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Day 2
BEGIN WORK;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animalsSET species = 'pokemon'
WHERE name NOT LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO my_savepoint;
UPDATE animals
SET weight_kg = weight_kg * -1;
WHERE weight_kg < 0;
COMMIT;

-- Day 2
-- AGGREGATE FUNCTIONS AND GROUP BY
-- How many animals are there?

SELECT COUNT(name)
FROM animals;

-- How many animals have never tried to escape?

SELECT COUNT(escape_attempts)
FROM animals
WHERE escape_attempts = 0;

-- What is the average weight of animals?

SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?

SELECT neutered, MAX(escape_attempts) AS most_escaped
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?

SELECT species, MIN(weight_kg) AS minimum_wight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

SELECT AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

-- Day 3
-- What animals belong to Melody Pond?
SELECT * FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT name, full_name AS Owners FROM animals
LEFT JOIN owners ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT species.name AS Species, COUNT(animals.name) AS Numb FROM animals
LEFT JOIN species ON animals.species_id = species.id
GROUP BY species;

-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals
LEFT JOIN species ON animals.species_id = species.id
WHERE species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = '0';

-- Who owns the most animals?
SELECT full_name, COUNT(full_name) FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY count DESC LIMIT 1;
