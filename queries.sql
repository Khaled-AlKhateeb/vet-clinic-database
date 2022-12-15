/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2020-01-01';

SELECT name, neutered FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT * FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name = 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- [X] Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction
BEGIN;
SELECT * FROM animals;
ROLLBACK;
--

-- New transaction
BEGIN;
-- [X] Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-- [X] Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species = '';
-- [X] Commit the transaction.
-- Verify that change was made and persists after commit
COMMIT;
--

SELECT * FROM animals;
-- [X] Delete all recordes
BEGIN;
DELETE FROM animals;
ROLLBACK;
--

-- Inside a transaction:
BEGIN;
-- [X] Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
-- [X] Create a savepoint for the transaction.
SAVEPOINT multitransactions;
-- [X] Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
-- [X] Rollback to the savepoint
ROLLBACK TO multitransactions;
-- [X] Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
-- [X] Commit transaction
COMMIT;
--

-- [X] How many animals are there?
SELECT count(name) FROM animals;

-- [X] How many animals have never tried to escape?
SELECT * FROM animals WHERE escape_attempts = 0;

-- [X] What is the average weight of animals?
SELECT avg(weight_kg) FROM animals;

-- [X] Who escapes the most, neutered or not neutered animals?
SELECT neutered AS isNeutered FROM animals WHERE escape_attempts = (SELECT max(escape_attempts) FROM animals);

-- [X] What is the minimum and maximum weight of each type of animal?
SELECT species, min(weight_kg) AS minimumWeight, max(weight_kg) AS maximumWeight FROM animals GROUP BY species;

-- [X] What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, CAST(avg(escape_attempts) AS decimal(10)) AS averageEscape FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

-- Write queries (using JOIN) to answer the following questions:
-- [X] What animals belong to Melody Pond?
SELECT name AS AnimalName, full_name AS Owner
FROM animals INNER JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- [X] List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name AS AnimalName, species.name AS Species
FROM animals
INNER JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- [X] List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name AS Owner, animals.name AS AnimalName
FROM owners
LEFT JOIN animals
ON owners.id = animals.owners_id;

-- [X] How many animals are there per species?
SELECT COUNT(animals.name) AS AnimalsCount, species.name AS Species
FROM animals
INNER JOIN species
ON animals.species_id = species.id
GROUP BY species.name;

-- [X] List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals
LEFT JOIN owners
ON animals.owners_id = owners.id
LEFT JOIN species
ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';

-- [X] List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals
INNER JOIN owners
ON owners.id = animals.owners_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- [X] Who owns the most animals?
SELECT owners.full_name , COUNT(*)
FROM animals
INNER JOIN owners
ON owners.id = animals.owners_id
GROUP BY owners.full_name
ORDER BY count DESC LIMIT 1;