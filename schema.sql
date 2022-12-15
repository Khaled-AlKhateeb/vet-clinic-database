-- Table: public.animals

CREATE TABLE animals 
(
	id integer PRIMARY KEY,
	name varchar (50),
	date_of_birth date,
	escape_attempts integer,
	neutered bool,
	weight_kg decimal,
	species varchar (100)
);