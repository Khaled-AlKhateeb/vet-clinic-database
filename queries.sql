/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';

SELECT name, date_of_birth from animals WHERE date_of_birth between '2016-01-01' and '2020-01-01';

SELECT name, neutered from animals where neutered = true and escape_attempts < 3;

SELECT * from animals where name in ('Agumon', 'Pikachu');

SELECT name, escape_attempts from animals where weight_kg > 10.5;

SELECT * from animals where neutered = true;

SELECT * from animals where name = 'Gabumon';

SELECT * from animals where weight_kg between 10.4 and 17.3;
