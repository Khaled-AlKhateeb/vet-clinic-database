/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2020-01-01';

SELECT name, neutered FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT * FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name = 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species = '';

COMMIT;

SELECT * FROM animals;

BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT multitransactions;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO multitransactions;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals;

SELECT count(name) FROM animals;

SELECT * FROM animals WHERE escape_attempts = 0;

SELECT avg(weight_kg) FROM animals;

SELECT neutered AS isNeutered FROM animals WHERE escape_attempts = (SELECT max(escape_attempts) FROM animals);

SELECT species, min(weight_kg) AS minimumWeight, max(weight_kg) AS maximumWeight FROM animals GROUP BY species;

SELECT species, CAST(avg(escape_attempts) AS decimal(10)) AS averageEscape FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
