/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name CHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
);

ALTER TABLE animals ADD COLUMN species char(50);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name CHAR(50) NOT NULL,
    age INT NOT NULL,
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name CHAR(50) 
)

ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER TABLE animals DROP COLUMN species;


