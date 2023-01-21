/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Agumon', date '2020-02-03', 10.23, true, 0),
('Gabumon', date '2018-11-15', 8, true, 2),
('Pikachu', date '2021-01-07', 15.04, false, 1),
('Devimon', date '2017-05-12', 11, true, 5);
('Charmander', '2020-02-08', -11, true, 0), -- Day 2 starts here
('Plantmon', '2021-11-15', -5.7, true, 2),
('Squirtle', '1993-04-02', -12.13, false, 3),
('Angemon', '2005-06-12', -45, true, 1),
('Boarmon', '2005-06-07', -20.4, true, 7),
('Blossom', '1998-10-13', 17, true, 3),
('Ditto', '2022-05-14', 22, true, 4);

-- Day 3
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = '2'
WHERE name LIKE '%mon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Sam Smith') 
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Jennifer Orwell')
WHERE name IN ('Gabumon',  'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');
