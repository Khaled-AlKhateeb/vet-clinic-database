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
id int NOT NULL GENERATED ALWAYS AS identity,
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

