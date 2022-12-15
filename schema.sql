-- Table: public.animals

CREATE TABLE animals (
	id integer PRIMARY KEY,
	name varchar (50),
	date_of_birth date,
	escape_attempts integer,
	neutered bool,
	weight_kg decimal,
	species varchar (100)
);

CREATE TABLE owners (
id integer NOT NULL GENERATED ALWAYS AS identity,
full_name varchar (50),
age integer,
PRIMARY KEY (id)
);

CREATE TABLE species (
id int NOT NULL GENERATED ALWAYS AS identity,
name varchar (50),
PRIMARY KEY (id)
);

ALTER TABLE animals ADD id integer NOT NULL GENERATED ALWAYS AS identity;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id integer, ADD owners_id integer;

ALTER TABLE species ADD CONSTRAINT species_pk PRIMARY KEY (id);

ALTER TABLE owners ADD CONSTRAINT owners_pk PRIMARY KEY (id);

CREATE TABLE vets (
id integer NOT NULL GENERATED ALWAYS AS identity,
name varchar (50),
age integer,
date_of_graduation date,
PRIMARY KEY (id)
);

CREATE TABLE specializations (
vet_id integer,
species_id integer,
PRIMARY KEY (vet_id, species_id),
CONSTRAINT vets_pk
FOREIGN KEY (vet_id)
REFERENCES vets(id),
CONSTRAINT species_pk
FOREIGN KEY (species_id)
REFERENCES species(id)
);

CREATE TABLE visits(
id integer NOT NULL GENERATED ALWAYS AS identity,
vet_id integer,
animal_id integer,
date_of_visit DATE,
PRIMARY KEY (id),
CONSTRAINT fk_vets
FOREIGN KEY (vet_id)
REFERENCES vets(id),
CONSTRAINT fk_animals
FOREIGN KEY (animal_id)
REFERENCES animals(id)
);